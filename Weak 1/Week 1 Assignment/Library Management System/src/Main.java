import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args)  {

        Library library = new Library();
        LibraryService service = new LibraryService(library);
        Scanner scanner = new Scanner(System.in);
        boolean isRunning = true;

try {
    service.addBook(new Book(101, "Java Basics", "John", "Programming", 3));
    service.addBook(new Book(102, "Algorithms", "Sara", "Computer Science", 2));
    service.addMember(new Member(1, "Ahmed", "ahmed@email.com"));


} catch (InvalidInputException | DuplicateIdException e) {
    System.out.println("Startup data error: " + e.getMessage());
}

        while (isRunning) {
            System.out.println("\n=== Library Management System ===");
            System.out.println("1. Add a book");
            System.out.println("2. Remove a   book");
            System.out.println("3. update book ");
            System.out.println("4. List books (Sorted Alphabetically)");
            System.out.println("5. Add a Member");
            System.out.println("6. remove a Member");
            System.out.println("7. List Members");
            System.out.println("8. Borrow a book");
            System.out.println("9. Return a bbook");
            System.out.println("10. Search book by Title");
            System.out.println("11. Search book by Author");
            System.out.println("12. Search book by Category");
            System.out.println("13. Show Statistics");
            System.out.println("0. Exit");
            System.out.print("Enter your choice: ");

            try {
                int choice = scanner.nextInt();
                scanner.nextLine();

                switch (choice) {
                    case 1:
                        System.out.print("Enter Book ID: ");
                            int bookId = scanner.nextInt();


                        scanner.nextLine();
                        System.out.print("Enter Title: ");
                        String title = scanner.nextLine();
                        System.out.print("Enter Author: ");
                        String author = scanner.nextLine();
                        System.out.print("Enter Category: ");
                        String category = scanner.nextLine();
                        System.out.print("Enter Available Copies: ");
                        int copies = scanner.nextInt();

                        service.addBook(new Book(bookId, title, author, category, copies));

                        break;

                    case 2:
                        System.out.print("Enter Book ID to remove: ");
                        int bId = scanner.nextInt();
                        service.removeBook(bId);
                        break;
                    case 3:
                        System.out.print("Enter Book id to update: ");
                        int upid =scanner.nextInt();
                        System.out.print("Enter updatedTitle: ");
                        String uptitle = scanner.nextLine();
                        System.out.print("Enter a number of Copies: ");
                        int upcopies = scanner.nextInt();
                        service.updateBook(upid,uptitle,upcopies);
                        break;


                    case 4:
                        System.out.println("\nList of Books (Sorted Alphabetically):");
                        List<Book> books = library.getBooks();
                        books.sort((b1, b2) -> b1.getTitle().compareToIgnoreCase(b2.getTitle()));
                        service.listbooks();
                        break;

                    case 5:
                        System.out.print("Enter Member ID: ");
                        int memberId = scanner.nextInt();
                        scanner.nextLine();
                        System.out.print("Enter Member Name: ");
                        String name = scanner.nextLine();
                        System.out.print("Enter Member Email: ");
                        String email = scanner.nextLine();
                        Person newMember = new Member(memberId, name, email);
                        service.addMember((Member) newMember);
                        break;

                    case 6:
                        System.out.print("Enter member id to remove: ");
                        int mId = scanner.nextInt();
                        service.removeMember(mId);
                        break;

                    case 7:
                        System.out.println("\nList of Members:");
                        service.listmember();
                        break;

                    case 8:
                        System.out.print("Enter Member ID: ");
                        int bMemberId = scanner.nextInt();
                        System.out.print("Enter Book ID: ");
                        int bBookId = scanner.nextInt();
                        service.borrowBook(bMemberId, bBookId);
                        break;

                    case 9:
                        System.out.print("Enter Book ID to return: ");
                        int rBookId = scanner.nextInt();
                        service.returnBook(rBookId);
                        break;

                    case 10:
                        System.out.print("Enter Title to search: ");
                        String searchTitle = scanner.nextLine();

                        List<Book> foundBooks = service.searchByTitle(searchTitle);

                        if (foundBooks.isEmpty()) {
                            System.out.println("No books found with that title");
                        } else {
                            System.out.println("\nSearch Results:");
                            for (Book b : foundBooks) {
                                System.out.println(b);
                            }
                        }
                        break;


                    case 11:
                        System.out.print("Enter Author to search: ");
                        String searchAuthor = scanner.nextLine();
                        List<Book> authorBooks = service.searchByAuthor(searchAuthor);

                        if (authorBooks.isEmpty()) {
                            System.out.println("No books found for that author");
                        } else {

                            System.out.println("\nSearch Results:");
                            for (Book b : authorBooks) {
                                System.out.println(b);
                            }
                        }
                        break;


                    case 12:
                        System.out.print("Enter Category to search: ");
                        String searchCategory = scanner.nextLine();

                        List<Book> categoryBooks = service.searchByCategory(searchCategory);

                        if (categoryBooks.isEmpty()) {
                            System.out.println("No books found in that category");
                        } else {

                            System.out.println("\nSearch Results:");
                            for (Book b : categoryBooks) {
                                System.out.println(b);
                            }
                        }
                        break;


                    case 13:
                        service.printStatistics();
                        break;


                    case 0:
                        System.out.println("Exiting System........");
                        isRunning = false;
                        break;

                    default:
                        System.out.println(" Invalid choice. Please enter a number between 0 and 11.");                }
            } catch (InputMismatchException e) {
                System.out.println("Invalid input Please enter numbers only where expected. System recovered without crashing.");
                scanner.nextLine();
            } catch (BookNotFoundException | MemberNotFoundException | DuplicateIdException
                     | InvalidInputException | NoCopiesAvailableException e) {
                System.out.println("An unexpected error occurred: " + e.getMessage());
            }
        }


    }
}