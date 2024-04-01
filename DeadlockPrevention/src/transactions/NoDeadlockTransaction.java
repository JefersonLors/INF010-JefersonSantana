package transactions;

import database.DbItem;

import java.time.LocalDateTime;

public class NoDeadlockTransaction extends Thread{
    private DbItem mainDbItem;
    private DbItem secondaryDbItem;
    private long transactionNumber;
    public NoDeadlockTransaction(long transactionNumber, DbItem mainDbItem, DbItem secondayDbItem){
        this.mainDbItem = mainDbItem;
        this.secondaryDbItem = secondayDbItem;
        this.transactionNumber = transactionNumber;
    }
    public void run() {
        try {
            System.out.println("\t -> Transaction " + this.transactionNumber + " initialized (" + LocalDateTime.now() + ")");
            System.out.println("\t\t > [T" + this.transactionNumber + "] checking item availability...");

            if (!mainDbItem.isLocked() && !secondaryDbItem.isLocked()) {
                System.out.println("\t\t > [T" + this.transactionNumber + "] items available.");

                System.out.println("\t\t > [T" + this.transactionNumber + "] locking: " + this.mainDbItem);
                this.mainDbItem.lock();

                System.out.println("\t\t > [T" + this.transactionNumber + "] locking: " + this.secondaryDbItem);
                this.secondaryDbItem.lock();

                System.out.println("\t\t > [T" + this.transactionNumber + "] trying acess item: " + this.mainDbItem);
                synchronized (mainDbItem) {
                    System.out.println("\t\t > [T" + this.transactionNumber + "] reading item: " + this.mainDbItem);
                    System.out.println("\t\t > [T" + this.transactionNumber + "] processing");
                    Thread.sleep(500);
                    System.out.println("\t\t > [T" + this.transactionNumber + "] writting item: " + this.mainDbItem);

                    System.out.println("\t\t > [T" + this.transactionNumber + "] trying acess item: " + this.secondaryDbItem);
                    synchronized (secondaryDbItem) {
                        System.out.println("\t\t > [T" + this.transactionNumber + "] reading item: " + this.secondaryDbItem);
                        System.out.println("\t\t > [T" + this.transactionNumber + "] processing");
                        Thread.sleep(500);
                        System.out.println("\t\t > [T" + this.transactionNumber + "] writting item: " + this.secondaryDbItem);
                    }
                    System.out.println("\t\t > [T" + this.transactionNumber + "] unlocking: " + this.mainDbItem);
                    this.mainDbItem.unLock();

                    System.out.println("\t\t > [T" + this.transactionNumber + "] unlocking: " + this.secondaryDbItem);
                    this.secondaryDbItem.unLock();
                }
                System.out.println("\t <- Transaction " + this.transactionNumber + " finished (" + LocalDateTime.now() + ")");
            }else{
                System.out.println("\t <- [T" + this.transactionNumber + "] Ops! Locked item. Waiting for trying again(" + LocalDateTime.now() + ")");
                Thread.sleep(2000);
                System.out.println("\t -> [T" + this.transactionNumber + "] Ops! trying execute again(" + LocalDateTime.now() + ")");
                run();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
