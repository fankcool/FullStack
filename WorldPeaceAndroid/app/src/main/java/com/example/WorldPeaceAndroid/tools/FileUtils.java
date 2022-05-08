package com.example.WorldPeaceAndroid.tools;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import com.example.WorldPeaceAndroid.modules.BaseActivity;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileUtils {

    /**
     * 写文本文件
     * 在Android系统中，文件保存在 /data/data/PACKAGE_NAME/files 目录下
     */
    public static void write(Context context, String fileName, String content) {

        if (content == null) content = "";

        try {
            FileOutputStream fos = context.openFileOutput(fileName, Context.MODE_APPEND);
            fos.write(content.getBytes());

            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取文本文件
     */
    public static String read(Context context, String fileName) {
        try {
            FileInputStream in = context.openFileInput(fileName);
            return readInStream(in);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    private static String readInStream(FileInputStream inStream) {
        try {
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[512];
            int length = -1;
            while ((length = inStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, length);
            }

            outStream.close();
            inStream.close();
            return outStream.toString();
        } catch (IOException e) {
            Log.i("FileTest", e.getMessage());
        }
        return null;
    }

    public static boolean deleteFile(Context context, String fileName) {

        File file = new File(context.getFilesDir() + "/" + fileName);

        if (file.exists() == false) {
            Log.e("FileUtils deleteFile", "文件不存在");
            return false;
        }

        file.delete();
        return true;
    }

    public static File createFile(String folderPath, String fileName) {
        File destDir = new File(folderPath);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }
        return new File(folderPath, fileName + fileName);
    }

    /**
     * 向手机写图片
     */
    public static boolean writeImage(Context context, Bitmap bitmap, String fileName) {

        boolean success = false;

        FileOutputStream fos = null;

        try {
            fos = context.openFileOutput(fileName, Context.MODE_PRIVATE);
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
            success = true;
        } catch (FileNotFoundException e) {
            BaseActivity.baseToast(context, e.getMessage());
        } finally {
            if (fos != null) {
                try {
                    fos.flush();
                    fos.close();
                } catch (IOException e) {
                    BaseActivity.baseToast(context, e.getMessage());
                }
            }
        }

        return success;
    }

    public static Bitmap readImage(Context context, String fileName) {

        FileInputStream fis;

        Bitmap bitmap = null;

        try {
            fis = context.openFileInput(fileName);
            bitmap = BitmapFactory.decodeStream(fis);
            fis.close();
        } catch (Exception e) {
            BaseActivity.baseToast(context, e.getMessage());
        }

        return bitmap;
    }

    /**
     * 根据文件绝对路径获取文件名
     */
    public static String getFileName(String filePath) {
        if (StringUtils.isBlank(filePath)) return "";
        return filePath.substring(filePath.lastIndexOf(File.separator) + 1);
    }

    /**
     * 根据文件的绝对路径获取文件名但不包含扩展名
     */
    public static String getFileNameNoFormat(String filePath) {
        if (StringUtils.isBlank(filePath)) {
            return "";
        }
        int point = filePath.lastIndexOf('.');
        return filePath.substring(filePath.lastIndexOf(File.separator) + 1, point);
    }

    /**
     * 获取文件扩展名
     */
    public static String getFileFormat(String fileName) {
        if (StringUtils.isBlank(fileName)) return "";

        int point = fileName.lastIndexOf('.');
        return fileName.substring(point + 1);
    }

    /**
     * 获取文件大小
     */
    public static long getFileSize(String filePath) {
        long size = 0;

        File file = new File(filePath);
        if (file != null && file.exists()) {
            size = file.length();
        }
        return size;
    }

    /**
     * 获取文件大小
     */
    public static String getFileSize(long size) {
        if (size <= 0) return "0";
        java.text.DecimalFormat df = new java.text.DecimalFormat("##.##");
        float temp = (float) size / 1024;
        if (temp >= 1024) {
            return df.format(temp / 1024) + "M";
        } else {
            return df.format(temp) + "K";
        }
    }

    public static byte[] toBytes(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int ch;
        while ((ch = in.read()) != -1) {
            out.write(ch);
        }
        byte buffer[] = out.toByteArray();
        out.close();
        return buffer;
    }
}