public class Book {
    private int id;
    private String title;
    private String author;
    private String category;
    private int availableCopies;
    private int totalCopies;

    public Book(int id,String title,String author,
                String category,int availableCopies){

        if(id<=0) {
            throw new IllegalArgumentException("Invalid ID");
        }
        if(author.isBlank()) {
            throw new IllegalArgumentException("Invalid author");
        }

        if(category.isBlank()) {
            throw new IllegalArgumentException("Invalid category");
        }
        if(title.isBlank()) {
            throw new IllegalArgumentException("Invalid title");
        }
        if(availableCopies<0) {
            throw new IllegalArgumentException("Invalid copies");
        }
        this.id=id;
        this.title=title;
        this.author=author;
        this.category=category;
        this.availableCopies=availableCopies;
        this.totalCopies=availableCopies;
    }
    public void decreaseCopies() {
        if (availableCopies > 0) {
            availableCopies--;
        }
    }

    public void increaseCopies() {
        if (availableCopies < totalCopies) {
            availableCopies++;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {

        if(id<=0){
            System.out.println("Invalid ID");
            return;
        }
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        if(title.isBlank()){

        System.out.println("Invalid title");

        return;

    }
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(int availableCopies) {
        if(availableCopies<0) {
            System.out.println("Invalid copies");
            return;
        }
            this.availableCopies = availableCopies;
    }
    public int getTotalCopies(){
        return totalCopies;
    }
    @Override
    public String toString  () {
        return "Book [ID=" + id + ", Title=" + title + ", Author=" + author +
                ", Category=" + category + ", Copies=" + availableCopies + "]";
    }
}
