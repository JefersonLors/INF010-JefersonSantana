package database;

import java.time.LocalDateTime;

public interface DbItem {
    boolean isLocked();
    void lock();
    void unLock();
}
