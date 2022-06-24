var searcher = Searcher()

var text = "aaBaaaBaaBaaBaaaBa"
let pattern = "aaBaaBaaaBa"

example(of: "Поиск \"\(pattern)\" в \"\(text)\"") {
    if let position = searcher.find(pattern, in: text) {
        print("Найдено:", position)
    } else {
        print("Не найдено")
    }
}

text = "sdfxg346sdgfdsgaaBaf💩aaBaaBaaBaaaBasdfsf234gfsdfdf😎"

example(of: "Поиск \"\(pattern)\" в \"\(text)\"") {
    if let position = searcher.find(pattern, in: text) {
        print("Найдено:", position)
    } else {
        print("Не найдено")
    }
}

text = "sdfxg346sdgfdsgaaBaf💩aaBaaBaa💩💩BaaaBasdfsf234gfsdfdf🤪"

example(of: "Поиск \"\(pattern)\" в \"\(text)\"") {
    if let position = searcher.find(pattern, in: text) {
        print("Найдено:", position)
    } else {
        print("Не найдено")
    }
}
