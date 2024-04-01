import database.DataBase;
import database.DbItem;
import transactions.DeadlockTransaction;
import transactions.NoDeadlockTransaction;

import java.util.concurrent.TimeUnit;

public class SGBD {
    public static void main(String[] args) throws InterruptedException {
        //executeSerialSchedule();
        //executeConcurrentScheduleWithNoDeadLockPrevention();
        executeConcurrentScheduleWithDeadLockPrevention();
    }

    public static void executeSerialSchedule(){
        System.out.println("Executing serial schedule...");

        DataBase dataBase =  new DataBase("PostgresSql");
        DbItem itemA = dataBase.getItemFromDataBase("item A");
        DbItem itemB = dataBase.getItemFromDataBase("item B");

        Thread transaction1 = new DeadlockTransaction(1, itemA, itemB);
        Thread transaction2 = new DeadlockTransaction(2, itemB, itemA, transaction1);

        transaction1.start();
        transaction2.start();
    }

    public static void executeConcurrentScheduleWithNoDeadLockPrevention(){
        System.out.println("Executing concurrent schedule with no deadlock prevention...");

        DataBase dataBase =  new DataBase("PostgresSql");
        DbItem itemA = dataBase.getItemFromDataBase("item A");
        DbItem itemB = dataBase.getItemFromDataBase("item B");

        Thread transaction1 = new DeadlockTransaction(1, itemA, itemB);
        Thread transaction2 = new DeadlockTransaction(2, itemB, itemA);

        transaction1.start();
        transaction2.start();
    }

    public static void executeConcurrentScheduleWithDeadLockPrevention() throws InterruptedException {
        System.out.println("Executing concurrent schedule with deadlock prevention...");

        DataBase dataBase =  new DataBase("PostgresSql");
        DbItem itemA = dataBase.getItemFromDataBase("item A");
        DbItem itemB = dataBase.getItemFromDataBase("item B");

        Thread transaction1 = new NoDeadlockTransaction(1, itemA, itemB);
        Thread transaction2 = new NoDeadlockTransaction(2, itemB, itemA);

        transaction2.start();

        TimeUnit.MILLISECONDS.sleep(30);

        transaction1.start();
    }
}