package com.example.WorldPeaceAndroid.modules.Home.fragment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DeviceModel implements Serializable {

    private String name;
    private String mac;
    private String rssi;
}
