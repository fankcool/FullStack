package com.example.WorldPeaceAndroid.tools;

import android.graphics.Bitmap;

import java.nio.ByteBuffer;

public class BitmapUtils {

    public static byte[] getBytesFromBitmap(Bitmap bitmap) {

        int bytes = bitmap.getByteCount();

        ByteBuffer buffer = ByteBuffer.allocate(bytes);

        bitmap.copyPixelsFromBuffer(buffer);

        return buffer.array();
    }

    public static Bitmap getBitmapFromBytes(byte[] bytes, int width, int height) {

        Bitmap stitchBmp= Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);

        stitchBmp.copyPixelsFromBuffer(ByteBuffer.wrap(bytes));

        return stitchBmp;
    }
}
