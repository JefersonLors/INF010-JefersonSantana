package database;

public class DataBase {
    private String dataBaseName;
    public DataBase(String dataBaseName){
        this.dataBaseName = dataBaseName;
    }
    public String getDataBaseName(){
        return dataBaseName;
    }

    public DbItem getItemFromDataBase(String itemName){
        return new Item(itemName);
    }
}
