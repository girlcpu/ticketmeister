import DiscordModels
import SQLKit

struct GuildMemory {
    let map: [Int64: Guild] = [:]

    func add(_ guild: Guild) {}
    func remove(by id: GuildSnowflake) {}
}

struct Guild: Codable {
    let id: GuildSnowflake
    let name: String

    init(id: Int64, name: String) {
        self.id = GuildSnowflake.init(String(id))
        self.name = name
    }
}
