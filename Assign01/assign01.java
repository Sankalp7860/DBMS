import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class assign01 {

    public static void main(String[] args) {
        // String filePath = "./instructor.txt";  
        String filePath = "./department.txt";  
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            reader.readLine();

            // Q1
            // System.out.println("Names of all instructors:");
            // while ((line = reader.readLine()) != null) {
            //     String[] values = line.split(", ");
            //     String instructorName = values[1]; 
            //     System.out.println(instructorName);
            // }

            // Q2
            // System.out.println("Department names of all instructors:");
            // while ((line = reader.readLine()) != null) {
            //     String[] values = line.split(", ");
            //     String departmentName = values[2]; 
            //     System.out.println(departmentName);
            // }


            // Q3
            // Set<String> uniqueDepartments = new HashSet<>();

            // while ((line = reader.readLine()) != null) {
            //     String[] values = line.split(", ");
            //     String departmentName = values[2]; 
            //     uniqueDepartments.add(departmentName);
            // }

            // for (String department : uniqueDepartments) {
            //     System.out.println(department);
            // }

            // Q4
            // System.out.println("Names of Comp. Sci. instructors with salary > 70000:");
            // while ((line = reader.readLine()) != null) {
            //     String[] values = line.split(", ");
            //     String departmentName = values[2]; 
            //     int salary = Integer.parseInt(values[3]); 
            //     if ("Comp. Sci.".equals(departmentName) && salary > 70000) {
            //         String instructorName = values[1]; 
            //         System.out.println(instructorName);
            //     }
            // }

            // Q5
            System.out.println("Names of all departments:");
            Set<String> allDepartments = new HashSet<>();

            while ((line = reader.readLine()) != null) {
                String[] values = line.split(", ");
                String departmentName = values[0]; 
                allDepartments.add(departmentName);
            }
            for (String department : allDepartments) {
                System.out.println(department);
            }

            // Q6
            Map<String, Integer> departmentBudgets = new HashMap<>();

            while ((line = reader.readLine()) != null) {
                String[] values = line.split(", ");
                String departmentName = values[0]; 
                int budget = Integer.parseInt(values[2]); 

                departmentBudgets.put(departmentName, budget);
            }

            int maxBudget = departmentBudgets.values().stream().max(Integer::compareTo).orElse(0);

            System.out.println("Names of departments with the maximum budget:");

            Set<String> departmentsWithMaxBudget = new HashSet<>();

            for (Map.Entry<String, Integer> entry : departmentBudgets.entrySet()) {
                if (entry.getValue() == maxBudget) {
                    departmentsWithMaxBudget.add(entry.getKey());
                }
            }

            for (String department : departmentsWithMaxBudget) {
                System.out.println(department);
            }


        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
