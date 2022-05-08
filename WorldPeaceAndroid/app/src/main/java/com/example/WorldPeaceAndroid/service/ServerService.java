package com.example.WorldPeaceAndroid.service;

public class ServerService {

    private static final boolean isRelease = false;

    public enum ResponseCode {

        SUCCESS("0"),
        UNAUTHORIZED("-1");

        private final String code;

        ResponseCode(final String code) {
            this.code = code;
        }

        @Override
        public String toString() {
            return code;
        }
    }

    private static final String DEBUG = "http://192.168.0.100:";
    private static final String RELEASE = "http://39.106.100.225:";

    private enum ServerType {

        UserCenter_Debug(DEBUG + "8081/"),
        UserCenter_Release(RELEASE + "8081/");

        private final String text;

        ServerType(final String text) {
            this.text = text;
        }

        @Override
        public String toString() {
            return text;
        }
    }

    public static String UserCenter = isRelease ? ServerType.UserCenter_Release.toString() : ServerType.UserCenter_Debug.toString();
}
