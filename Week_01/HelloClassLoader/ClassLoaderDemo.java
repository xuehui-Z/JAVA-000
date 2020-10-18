import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;

public class ClassLoaderDemo extends ClassLoader{
    /**
     * 指定Class文件，返回其类
     * @param path
     * @return
     */
    public Class<?> findClass(String path) {
        byte[] classBit = file2Bytes(path);
        System.out.println(new BigInteger(1, classBit).toString(16));
        return defineClass("Hello",classBit,0,classBit.length);
    }

    /**
     * 读取文件，返回其字节码
     * @param filePath
     * @return
     */
    private byte[] file2Bytes(String filePath) {
        byte[] buffer = null;
        FileInputStream fis = null;
        ByteArrayOutputStream bos = null;
        try {
            fis = new FileInputStream(new File(filePath));
            bos = new ByteArrayOutputStream(1024);
            byte[] b = new byte[1];
            byte[] restoreBytes = new byte[1];
            byte b255 = (byte) 255;
            int n;
            while ((n = fis.read(b)) != -1) {
                // 转码
                restoreBytes[0] = (byte) (b255 - b[0]);
                bos.write(restoreBytes, 0, n);
            }
            buffer = bos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer;
    }
}

class TestClassLoad {
    //测试方法
    public static void main(String[] args) {
        // xlass文件作为参数
        String classPath = args[0];
        ClassLoaderDemo demo = new ClassLoaderDemo();
        try {
            Class helloClass = demo.findClass(classPath);
            Method method = helloClass.getMethod("hello");
            //调用方法
            method.invoke(helloClass.newInstance());
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}