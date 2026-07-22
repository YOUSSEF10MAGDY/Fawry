import java.util.LinkedHashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        int[] numbers = {5, 2, 1, 5, 7, 2, 8, 1};
        Set<Integer> rd=new LinkedHashSet<>();
        for (int i = 0; i < numbers.length; i++) {
            rd.add(numbers[i]);
        }
        System.out.println(rd);
    }
}