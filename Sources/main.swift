import DiscordBM
import Foundation
import SQLKit
import SQLiteKit

struct Memory {
    let guilds = GuildMemory()
}

let runtimeMemory = Memory()

private let commands = DiscordCommand.allCases.map { command in
    return Payloads.ApplicationCommandCreate(
        name: command.name,
        description: command.description,
        options: command.options,
        default_member_permissions: command.defaultPermissions,
    )
}

private let token = ProcessInfo.processInfo.environment["DISCORD_TOKEN"]
guard let token else {
    fatalError("No token was provided!")
}

private let bot = await BotGatewayManager(
    token: token,
    presence: .init(
        activities: [
            .init(name: "your tickets", type: .watching)
        ],
        status: .online, afk: false
    ),
    intents: [.messageContent]
)

print("Registering commands")
try await bot.client.bulkSetApplicationCommands(payload: commands).guardSuccess()
print("Successfully registered")

await withTaskGroup { group in
    group.addTask {
        await bot.connect()
    }

    group.addTask {
        for await event in await bot.events {
            await EventHandler(event: event, client: bot.client).handleAsync()
        }
    }
}

await bot.disconnect()
