import DiscordBM

@main
struct Ticketmeister {
    static func main() async throws {
        let bot = await BotGatewayManager(
            token: TODO("Token not implemented"),
            presence: .init(
                activities: [.init(name: "your tickets", type: .watching)], status: .online,
                afk: false),
            intents: [.messageContent, .guildMembers]
        )

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
    }
}
