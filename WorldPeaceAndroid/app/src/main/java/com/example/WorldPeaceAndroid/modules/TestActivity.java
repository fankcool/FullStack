package com.example.WorldPeaceAndroid.modules;

import android.os.Bundle;
import android.widget.GridView;

import androidx.annotation.Nullable;

import com.example.WorldPeaceAndroid.R;

import butterknife.BindView;

public class TestActivity extends BaseActivity {

    @BindView(R.id.gridView) GridView gridView;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setContentView(R.layout.activity_test);
        super.onCreate(savedInstanceState);

        initView();
    }

    private void initView() {

        goBack();
    }
}
