/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DTO;

/**
 *
 * @author dat20
 */
import java.sql.Timestamp;
public class ManagerAccountDTO {
    private int accountId;
    private String username;
    private String password;
    private String email;
    private String gender;
    private String phone;
    private String image;
    private Timestamp createdAt;
    private int status;

    public ManagerAccountDTO(int accountId, String username, String password, String email, String gender, String phone, String image, Timestamp createdAt, int status) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.image = image;
        this.createdAt = createdAt;
        this.status = status;
    }

    public ManagerAccountDTO() {
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
