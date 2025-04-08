import DiscordBM

enum DiscordCommand: String, CaseIterable {
    case new
    case close
    case closeconfirm

    var description: String {
        switch self {
        case .close:
            "Close the current ticket immediately."
        case .closeconfirm:
            "Request the ticket's owner to close the ticket within a certain amount of hours."
        case .new:
            "Create a new support ticket."
        }
    }

    var options: [ApplicationCommand.Option] {
        switch self {
        case .close:
            [
                .init(
                    type: .string,
                    name: "reason",
                    description: "Reason for closing the ticket")
            ]
        case .closeconfirm:
            [
                .init(
                    type: .string,
                    name: "reason",
                    description: "Reason for closing the ticket"),
                .init(
                    type: .integer,
                    name: "auto_close",
                    description: "Hours after which to automatically close the ticket"),
            ]
        default:
            []
        }
    }
}
