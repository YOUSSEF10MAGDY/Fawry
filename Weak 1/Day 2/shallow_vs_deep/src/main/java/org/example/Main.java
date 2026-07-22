package org.example;

class Course {
    String CourseName;
    Course(String name){
        this.CourseName=name;
    }
}
class Student {
    String name;
    Course course;

    public Student(String name, String CourseName) {
        this.name = name;
        this.course = new Course(CourseName);
    }

    // shalow copy
    public Student(Student original) {
        this.name = original.name;
        this.course = original.course;
    }

    // deep copy
    public Student(Student original, boolean isdeep) {
        this.name = original.name;
        this.course = new Course(original.course.CourseName);
    }
}
public class Main {
    static void main(String[] args) {
        Student student1 = new Student("youssef", "math");
        Student ShallowStudent = new Student(student1);
        Student DeepStudent = new Student(student1, true);
        ShallowStudent.course.CourseName = "Physics";
        DeepStudent.course.CourseName = "Bio";

        System.out.println(student1.name+"'s Course is " + student1.course.CourseName);
        System.out.println(ShallowStudent.course.CourseName);
        System.out.println(DeepStudent.course.CourseName);

    }
}
