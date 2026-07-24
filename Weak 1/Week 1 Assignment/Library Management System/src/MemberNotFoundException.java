public class MemberNotFoundException extends Exception {
    public MemberNotFoundException(int memberId) {

        super("No member found with ID: " + memberId);
    }
}
