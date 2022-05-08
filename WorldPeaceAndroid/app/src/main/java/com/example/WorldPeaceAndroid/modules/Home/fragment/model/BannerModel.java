package com.example.WorldPeaceAndroid.modules.Home.fragment.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BannerModel {

    /**
     * 0：url，1：app 功能
     * */
    private int type;

    private String img;

    /**
     * url或功能名
     * */
    private String url;
}
