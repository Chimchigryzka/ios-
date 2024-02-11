class Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author
    }

    let title: String
    let author: String
    let year: Int
    let pageCount: Int

    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }

    func displayBookInfo() {
        print("Book Information:")
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book]

    init() {
        self.books = []
    }

 func addBookFromConsole() {       
    print("Enter the title of the book:") 
        guard let title = readLine(), !title.isEmpty else {            
        print("Invalid input. Please enter a valid title.") 
            return        } 
        print("Enter the author of the book:") 
        guard let author = readLine(), !author.isEmpty else {            
        print("Invalid input. Please enter a valid author.") 
            return 
        } 
        print("Enter the publication year of the book:")        
        guard let yearInput = readLine(), let year = Int(yearInput), year > 0 else { 
            print("Invalid input. Please enter a valid year.")           
            return 
        } 
        print("Enter the page count of the book:")        
        guard let pageCountInput = readLine(), let pageCount = Int(pageCountInput), pageCount > 0 else { 
            print("Invalid input. Please enter a valid page count.")            
            return 
        } 
        let newBook = Book(title: title, author: author, year: year, pageCount: pageCount)        
        addBook(book: newBook) 
    } 
    
    func findBook() {        
    print("Choose search criteria:") 
        print("1. Search by Title")        
        print("2. Search by Author") 
        guard let choiceInput = readLine(), let choice = Int(choiceInput) else { 
            print("Invalid choice. Please enter a valid number.")            
            return 
        } 
        switch choice {        
        case 1: 
            print("Enter the title to search:") 
            guard let searchTitle = readLine(), !searchTitle.isEmpty else {               
            print("Invalid input. Please enter a valid title.") 
                return            } 
                
            searchBooks(by: \Book.title, value: searchTitle)        
            case 2: 
            print("Enter the author to search:")            
            guard let searchAuthor = readLine(), !searchAuthor.isEmpty else { 
                print("Invalid input. Please enter a valid author.")                
                return 
            }            
            searchBooks(by: \Book.author, value: searchAuthor) 
        default:            
        print("Invalid choice. Please choose 1 or 2.") 
        }    
        
    }


    private func searchBooks<T: Equatable>(by keyPath: KeyPath<Book, T>, value: T) {
        let foundBooks = books.filter { $0[keyPath: keyPath] == value }

        if foundBooks.isEmpty {
            print("No books found with the specified criteria.")
        } else {
            for book in foundBooks {
                book.displayBookInfo()
                print("----------")
            }
        }
    }

    func addBook(book: Book) {
        books.append(book)
        print("Book '\(book.title)' added to the library.")
    }

    func removeBook(book: Book) {
        if let index = books.firstIndex(where: { $0 == book }) {
            books.remove(at: index)
            print("Book '\(book.title)' removed from the library.")
        } else {
            print("Book not found in the library.")
        }
    }

    func displayLibraryInfo() {
        print("Library Information:")
        if books.isEmpty {
            print("No books in the library.")
        } else {
            for book in books {
                book.displayBookInfo()
                print("----------")
            }
        }
    }
}

// Example usage with user input
let library = Library()

while true {
    print("Choose an option:")
    print("1. Add a book")
    print("2. Find a book")
    print("3. Display Library Information")
    print("4. Exit")

    guard let choiceInput = readLine(), let choice = Int(choiceInput) else {
        print("Invalid choice. Please enter a valid number.")
        continue
    }

    switch choice {
    case 1:
        library.addBookFromConsole()
    case 2:
        library.findBook()
    case 3:
        library.displayLibraryInfo()
    case 4:
        print("Exiting the program.")
        break
    default:
        print("Invalid choice. Please choose 1, 2, 3, or 4.")
    }
}
