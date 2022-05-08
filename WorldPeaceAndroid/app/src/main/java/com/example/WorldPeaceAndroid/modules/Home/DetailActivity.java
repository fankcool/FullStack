package com.example.WorldPeaceAndroid.modules.Home;

import android.os.Bundle;

import androidx.annotation.Nullable;

import com.example.WorldPeaceAndroid.R;
import com.example.WorldPeaceAndroid.modules.BaseActivity;

import butterknife.OnClick;

public class DetailActivity extends BaseActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setContentView(R.layout.activity_detail);
        super.onCreate(savedInstanceState);

        initView();
    }

    @OnClick(R.id.img)
    public void imgBtn() {
        progressHUD.showInfoWithStatus("img");
    }

    @OnClick(R.id.save)
    public void saveBtn() {
        toast("save btn click");
    }

    private void initView() {
        goBack();
    }
}
