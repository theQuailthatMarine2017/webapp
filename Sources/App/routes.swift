import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("welcome") { req in
        return "Welome Back"
    }
    
    router.post(Item.self, at: "item/create") {req, data -> String in
        
        return "You Posted \(data.product) \(data.price) \(data.available)"
    }
    
    router.get("items") { req -> Item in
        
        return Item(product: "5 Inch Weave", price: 30000, available: true)
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}

struct Item: Content {
    
    let product: String
    let price: Int
    let available: Bool
    
}


