import DiscordBM

struct EventHandler: GatewayEventHandler {
    let event: Gateway.Event
    let client: any DiscordClient

    func onMessageCreate(_ payload: Gateway.MessageCreate) async throws {
        print(payload.content)
    }

    func onReady(_ payload: Gateway.Ready) async throws {
        print("Gateway connection is ready.")
        print("User = \(payload.user.tag)")
    }
}
