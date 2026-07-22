import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class Library {
    private ArrayList<Book> books;
    private HashMap<Integer,Member> members;
    private HashSet<String> categories;

    public Library() {
        books = new ArrayList<>();
        members = new HashMap<>();
        categories = new HashSet<>();
    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public HashMap<Integer, Member> getMembers() {

        return members;
    }

    public HashSet<String> getCategories() {

        return categories;
    }

}