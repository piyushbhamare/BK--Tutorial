import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateDataExample {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/wt";
        String username = "root";
        String password = "root";
        String selectSql = "SELECT * FROM Students WHERE id = ?";  
        String updateSql = "UPDATE Students SET age = ? WHERE id = ?";  

        Scanner scanner = new Scanner(System.in);

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement selectStatement = connection.prepareStatement(selectSql);
             PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {

            boolean continueInput = true;
            
            while (continueInput) {
                System.out.print("Enter student id to update: ");
                int id = scanner.nextInt();
                System.out.print("Enter new age: ");
                int newAge = scanner.nextInt();
                scanner.nextLine();

                selectStatement.setLong(1, id);
                ResultSet resultSet = selectStatement.executeQuery();

                if (resultSet.next()) { 
                    updateStatement.setInt(1, newAge);
                    updateStatement.setLong(2, id);
                    int rowsAffected = updateStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("Student data updated successfully!");
                    } else {
                        System.out.println("No changes made. Please check the data.");
                    }
                } else {
                    System.out.println("No student found with the id: " + id);
                }

                System.out.print("Do you want to update another student? (yes/no): ");
                String response = scanner.nextLine().trim().toLowerCase();
                if (response.equals("no")) {
                    continueInput = false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            scanner.close();
        }
    }
}
