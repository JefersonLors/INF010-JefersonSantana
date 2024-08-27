package transactions;

import database.DbItem;

public abstract class Transaction extends Thread{
    protected static long id = 0;
    protected DbItem mainDbItem;
    protected DbItem secondaryDbItem;
    public abstract long getId();
}
