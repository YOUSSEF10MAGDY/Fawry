
void main() {

    List<String> Students = new ArrayList<>();
    Students.add("Ahmed");
    Students.add("Mohamed");
    Students.add("Sara");
    Students.remove("Ahmed");
    for (int i = 0; i < Students.size(); i++) {
        System.out.println(Students.get(i));
    }
    if(Students.equals("Sara")){
        System.out.println("true");
    }else {
        System.out.println("false");
    }


}
