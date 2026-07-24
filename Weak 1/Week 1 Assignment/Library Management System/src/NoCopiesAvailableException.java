public class NoCopiesAvailableException extends Exception {
    public NoCopiesAvailableException(int bookId) {


        super("No available copies for book ID: " + bookId);
    }
}
