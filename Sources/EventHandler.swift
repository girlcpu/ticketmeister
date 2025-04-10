import DiscordBM
import Foundation

struct EventHandler: GatewayEventHandler {
    let event: Gateway.Event
    let client: any DiscordClient

    func onMessageCreate(_ payload: Gateway.MessageCreate) async throws {
        print("<\(payload.author?.tag ?? "[unknown]")> \(payload.content)")
    }

    func onReady(_ payload: Gateway.Ready) async throws {
        print("Gateway connection is ready.")
        print("User = \(payload.user.tag)")

        try await Task.sleep(for: .milliseconds(50))

        client.
    }
}
