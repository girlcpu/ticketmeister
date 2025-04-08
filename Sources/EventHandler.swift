import DiscordBM

struct EventHandler: GatewayEventHandler {
    let event: Gateway.Event
    let client: any DiscordClient

    func onMessageCreate(_ payload: Gateway.MessageCreate) async throws {
        print(payload.content)
    }
}
