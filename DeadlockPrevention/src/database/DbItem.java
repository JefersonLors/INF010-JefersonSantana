package database;

import transactions.Transaction;

import java.time.LocalDateTime;

public interface DbItem {
    boolean isReadLocked();
    boolean isWriteLocked();
    String read(Transaction transaction);
    void write(Transaction transaction, String content);
    boolean read_lock(Transaction transaction);
    boolean write_lock(Transaction transaction);
    boolean isLocked();
    void unLock(Transaction transaction);

    String getPosition();
}
