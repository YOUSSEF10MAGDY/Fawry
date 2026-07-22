public class Member extends Person{
    private int id;
    public Member(int id,String name,String email){

        super(name,email);

        if(id<=0) {
            throw new IllegalArgumentException("Invalid ID");
        }
        this.id=id;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Member [ID=" + id + ", Name=" + getName() + ", Email=" + getEmail() + "]";
    }
}
