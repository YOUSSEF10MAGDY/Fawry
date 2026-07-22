import java.util.LinkedHashMap;
import java.util.Map;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        String sentence = "Java is great Java Collections are powerful Java is easy";
        String[] words = sentence.split(" ");
        Map<String, Integer> wordcount = new LinkedHashMap<>();
        for (String word : words) {
            wordcount.put(word, wordcount.getOrDefault(word, 0) + 1);
        }
        for (Map.Entry<String, Integer> entry : wordcount.entrySet()) {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }
    }
}