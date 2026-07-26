import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LibraryService implements Searchable {
    private Library library;

    public LibraryService(Library library) {
        this.library = library;
    }


    public void addBook(Book newbook)throws InvalidInputException, DuplicateIdException {


           if (newbook.getId() <= 0) {
               throw new InvalidInputException("Invalid ID");
           }
           for (Book book : library.getBooks()) {

               if (book.getId() == newbook.getId()) {
                   throw new DuplicateIdException("Book", newbook.getId());
               }
           }
           library.getBooks().add(newbook);
           library.getCategories().add(newbook.getCategory());
           System.out.println("Book added ");

    }

    public void removeBook ( int bookId)throws BookNotFoundException  {

        Iterator<Book> iterator = library.getBooks().iterator();
        while (iterator.hasNext()) {
            Book book = iterator.next();
            if (book.getId() == bookId) {
                String category = book.getCategory();
                iterator.remove();
                boolean found = false;
                for (Book b : library.getBooks()) {
                    if (b.getCategory().equalsIgnoreCase(category)) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    library.getCategories().remove(category);
                }
                System.out.println("Book removed");
                return;
            }
        }
        throw new BookNotFoundException(bookId);
    }


    public void listbooks() {
        if (library.getBooks().isEmpty()) {
            System.out.println("no book");
            return;
        }
        for (Book book : library.getBooks()) {
            System.out.println(book);
        }
    }

    public void updateBook(int bookid, String newTitle, int newCopies)throws BookNotFoundException {
        for (Book book : library.getBooks()) {
            if (book.getId() == bookid) {
                book.setTitle(newTitle);
                book.setAvailableCopies(newCopies);
                System.out.println("Book updated successfully");
                return;
            }
        }
        throw new BookNotFoundException(bookid);
    }

    public void addMember(Member member)throws InvalidInputException, DuplicateIdException {

        if(member.getId()<=0){
            throw new InvalidInputException("Invalid ID");

        }

        if (library.getMembers().containsKey(member.getId())) {
            throw new DuplicateIdException("Member", member.getId());
        } else {
            library.getMembers().put(member.getId(), member);
            System.out.println("Member added successfully");
        }


    }

    public void removeMember(int memberid) throws MemberNotFoundException{
        if (library.getMembers().remove(memberid) != null) {
            throw new MemberNotFoundException(memberid);
        } else {
            System.out.println("Member not found");
        }
    }

    public void listmember() {
        if (library.getMembers().isEmpty()) {
            System.out.println("No members");
            return;
        }

        for (Member member : library.getMembers().values()) {
            System.out.println(member);
        }
    }

    @Override
    public List<Book> searchByTitle(String title) {
        List<Book> result = new ArrayList<>();
        
        for (Book book : library.getBooks()) {
            if (book.getTitle().toLowerCase().trim().contains(title.toLowerCase().trim())) {
                result.add(book);
            }
        }
        return result;
    }

    public List<Book> searchByAuthor(String author) {
        List<Book> result = new ArrayList<>();
        for (Book book : library.getBooks()) {
            if (book.getAuthor().toLowerCase().trim().contains(author.toLowerCase().trim())) {
                result.add(book);
            }
        }
        return result;
    }

    @Override
    public List<Book> searchByCategory(String category) {
        List<Book> result = new ArrayList<>();
        for (Book book : library.getBooks()) {
            if (book.getCategory().equalsIgnoreCase(category)) {
                result.add(book);
            }
        }
        return result;
    }


    public void printStatistics() {
        int available=0;
        int borrowed=0;
        for(Book book:library.getBooks()){
            available+=book.getAvailableCopies();
            borrowed+=book.getTotalCopies() -book.getAvailableCopies();
        }
        System.out.println("\n--- Library Statistics ---");
        System.out.println("Total Book Titles: " + library.getBooks().size());
        System.out.println("Total Members: " + library.getMembers().size());
        System.out.println("Total Borrowed Books: " + borrowed);
        System.out.println("Total Available Physical Copies: " + available);
        System.out.println("Categories available: " + library.getCategories().size());
    }
    public void borrowBook(int memberid, int bookid) throws MemberNotFoundException, BookNotFoundException, NoCopiesAvailableException{
        if (!library.getMembers().containsKey(memberid)) {
            throw new MemberNotFoundException(memberid);
        }

        for (Book book : library.getBooks()) {
            if (book.getId() == bookid) {
                if (book.getAvailableCopies() > 0) {
                    book.decreaseCopies();
                    System.out.println("Book borrowed by member: " + memberid);
                } else {
                    throw new NoCopiesAvailableException(bookid);
                }
                return;

            }
        }
        throw new BookNotFoundException(bookid);

    }

    public void returnBook(int bookId) throws BookNotFoundException{
        for (Book book : library.getBooks()) {
            if (book.getId() == bookId) {
                book.increaseCopies();
                System.out.println("Book returned ");
                return;
            }
        }
        throw new BookNotFoundException(bookId);
    }

}
