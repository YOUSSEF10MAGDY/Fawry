public class DuplicateIdException extends Exception {
    public DuplicateIdException(String entityType, int id) {


        super(entityType + " ID already exists: " + id);
    }
}
