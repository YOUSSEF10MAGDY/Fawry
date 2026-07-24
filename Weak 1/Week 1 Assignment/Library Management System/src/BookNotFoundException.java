public class BookNotFoundException extends Exception {
    public BookNotFoundException(int bookId) {

        super("No book found with ID: " + bookId);
    }
}
