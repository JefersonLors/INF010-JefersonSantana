package database;

import java.time.LocalDateTime;

public class Item implements DbItem{
    private final String content;
    private boolean isLocked = false;
    private LocalDateTime lastUpdateDateTime;

    public Item( String content ){
        this.content = content;
    }

    @Override
    public String toString(){
        return this.content;
    }

    @Override
    public boolean isLocked() {
        return this.isLocked;
    }

    @Override
    public void lock() {
        this.isLocked = true;
    }

    @Override
    public void unLock() {
        this.isLocked = false;
    }
}
