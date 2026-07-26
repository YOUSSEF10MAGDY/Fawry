public abstract class Person {
   private String name;
   private String email;

public  Person(String name,String email)throws IllegalArgumentException{
    if (name.isBlank()){
        throw new IllegalArgumentException("fill the Name field");
    } else if (email.isBlank()) {
        throw new IllegalArgumentException("fill the Email field");

    }
    this.email=email;
    this.name=name;
}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
