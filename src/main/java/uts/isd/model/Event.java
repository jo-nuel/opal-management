package uts.isd.model;

import java.util.Date;

public class Event {
    private int id;
    private String name;
    private String category;
    private String description;
    private Date date;
    private String location;

    public Event(int id, String name, String category, String description, Date date, String location) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.date = date;
        this.location = location;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
}
