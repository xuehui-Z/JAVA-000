package java0.conc0303;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 本周作业：（必做）思考有多少种方式，在main函数启动一个新线程或线程池，
 * 异步运行一个方法，拿到这个方法的返回值后，退出主线程？
 * 写出你的方法，越多越好，提交到github。
 *
 * 一个简单的代码参考：
 */
public class Homework03 {
    
    public static void main(String[] args) throws InterruptedException, ExecutionException, BrokenBarrierException {
        
        long start=System.currentTimeMillis();
        // 在这里创建一个线程或线程池，
        // 异步执行 下面方法

        int result = 0; //这是得到的返回值
        result = function7();

        // 确保  拿到result 并输出
        System.out.println("异步计算结果为："+result);
        System.out.println("使用时间："+ (System.currentTimeMillis()-start) + " ms");
        
        // 然后退出main线程
    }

    public static int function1() {
        AtomicInteger result = new AtomicInteger();
        new Thread(()-> {
            result.set(sum());
        },"Fun1").start();
        while (result.get() ==0) {}
        return result.get();
    }

    public static int function2() throws InterruptedException {
        AtomicInteger result = new AtomicInteger();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        new Thread(()-> {
            result.set(sum());
            countDownLatch.countDown();
        },"Fun2").start();
        countDownLatch.await();
        return result.get();
    }

    public static int function3() throws InterruptedException, ExecutionException {
        FutureTask<Integer> task = new FutureTask<>(()->sum());
        new Thread(task,"Fun3").start();
        return task.get();
    }

    public static int function4() throws InterruptedException, ExecutionException {
        //创建线程池
        ExecutorService executorService = Executors.newSingleThreadExecutor();

        //提交任务到线程池
        Future<Integer> future = executorService.submit(()->sum());
        executorService.shutdown();

        return future.get();
    }

    public static int function5() throws InterruptedException {
        final Semaphore semaphore = new Semaphore(0);
        AtomicInteger result = new AtomicInteger();
        new Thread(() -> {
            result.set(sum());
            semaphore.release();
        }).start();

        semaphore.acquire();

        return result.get();
    }

    public static int function6() throws InterruptedException {
        AtomicInteger result = new AtomicInteger();
        new Thread(() -> {
            synchronized (result) {
                result.set(sum());
                result.notifyAll();
            }
        },"Fun6").start();

        synchronized (result) {
            result.wait();
            return result.get();
        }
    }

    public static int function7() throws BrokenBarrierException, InterruptedException {
        AtomicInteger result = new AtomicInteger();

        final CyclicBarrier cyclicBarrier = new CyclicBarrier(2);
        new Thread(() -> {
            result.set(sum());
            try {
                cyclicBarrier.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }
        },"Fun7").start();
        cyclicBarrier.await();
        return result.get();
    }



    public static int sum() {
        System.out.println("执行任务的线程：" + Thread.currentThread().getName());
        return fibo(36);
    }

    public static int fibo(int a) {
        if ( a < 2) 
            return 1;
        return fibo(a-1) + fibo(a-2);
    }
}
