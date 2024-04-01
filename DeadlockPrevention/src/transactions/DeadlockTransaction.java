package transactions;

import database.DbItem;

import java.time.LocalDateTime;
public class DeadlockTransaction extends Thread{
    private DbItem mainDbItem;
    private DbItem secondaryDbItem;
    private long transactionNumber;
    private Thread transactionJoin;
    public DeadlockTransaction(long transactionNumber, DbItem mainDbItem, DbItem secondayDbItem){
        this.mainDbItem = mainDbItem;
        this.secondaryDbItem = secondayDbItem;
        this.transactionNumber = transactionNumber;
    }
    public DeadlockTransaction(long transactionNumber, DbItem mainDbItem, DbItem secondayDbItem, Thread transactionJoin){
        this.mainDbItem = mainDbItem;
        this.secondaryDbItem = secondayDbItem;
        this.transactionNumber = transactionNumber;
        this.transactionJoin = transactionJoin;
    }
    public void run() {
        try {
            if( this.transactionJoin != null ) {
                this.transactionJoin.join();
            }

            System.out.println("\t -> Transaction " + this.transactionNumber + " initialized (" + LocalDateTime.now() + ")");
            System.out.println("\t\t > [T" + this.transactionNumber + "] trying acess item: " + this.mainDbItem);
            synchronized (this.mainDbItem) {
                System.out.println("\t\t > [T" + this.transactionNumber + "] reading item: " + this.mainDbItem);
                System.out.println("\t\t > [T" + this.transactionNumber + "] processing");
                Thread.sleep(500);
                System.out.println("\t\t > [T" + this.transactionNumber + "] writting item: " + this.mainDbItem);

                System.out.println("\t\t > [T" + this.transactionNumber + "] trying acess item: " + this.secondaryDbItem);
                synchronized (this.secondaryDbItem) {
                    System.out.println("\t\t > [T" + this.transactionNumber + "] reading item: " + this.secondaryDbItem);
                    System.out.println("\t\t > [T" + this.transactionNumber + "] processing");
                    Thread.sleep(500);
                    System.out.println("\t\t > [T" + this.transactionNumber + "] writting item: " + this.secondaryDbItem);
                }
            }
            System.out.println("\t <- Transaction " + this.transactionNumber + " finished (" + LocalDateTime.now() + ")");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
