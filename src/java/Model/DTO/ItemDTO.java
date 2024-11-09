/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DTO;

/**
 *
 * @author dat20
 */
public class ItemDTO {
    private int id;
    private String name;
    private String image;
    private double price;
    private boolean available;
    private int kindId;

    public ItemDTO(int id, String name, String image, double price, boolean status, int kindId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.available = status;
        this.kindId = kindId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
    
    

    public String getAvailable() {
        return available ? "Còn hàng":"Hết hàng";
    }

    public int getKindId() {
        return kindId;
    }

    public String getKind() {
        if(kindId == 1) return "Đồ Uống";
        else return "Đồ ăn";
    }
    
    public void setKindId(int kindId) {
        this.kindId = kindId;
    }
    
}
