package com.example.WorldPeaceAndroid.modules.Home.fragment.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OpsModel {

    private int img;
    private String title;
    private OpsType opsType;

    public enum OpsType {

        CompositionCorrection("作文批改"),
        MyNotes("我的笔记"),
        MyComposition("我的作文"),
        Whiteboard("电子白板"),
        AIPractise("AI练字");

        private final String name;

        OpsType(final String name) {
            this.name = name;
        }

        @Override
        public String toString() {
            return name + "";
        }
    }
}
