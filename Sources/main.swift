import DiscordBM
import Foundation

guard let token = ProcessInfo.processInfo.environment["DISCORD_TOKEN"] else {
    fatalError("No token was provided!")
}

let bot = await BotGatewayManager(
    token: token,
    presence: .init(
        activities: [.init(name: "your tickets", type: .watching)], status: .online,
        afk: false),
    intents: [.messageContent]
)

let commands = DiscordCommand.allCases.map { command in
    return Payloads.ApplicationCommandCreate(
        name: command.name,
        description: command.description,
        options: command.options,
        default_member_permissions: command.defaultPermissions,
    )
}

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
