package com.example.WorldPeaceAndroid.modules.Login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import com.example.WorldPeaceAndroid.R;
import com.example.WorldPeaceAndroid.modules.BaseActivity;
import com.example.WorldPeaceAndroid.modules.Home.HomeActivity;

import butterknife.BindView;

public class LoginActivity extends BaseActivity {

    @BindView(R.id.agreement_btn)
    ImageView agreementBtn;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setContentView(R.layout.activity_login);
        super.onCreate(savedInstanceState);
    }

    public void click(View view) {
        int id = view.getId();
        switch (id) {
            case R.id.one_key_login:
//                if (agreementBtn.isSelected() == false) {
//                    toast("请勾选底部服务条款");
//                    return;
//                }

                Intent intent = new Intent(this, HomeActivity.class);
                startActivity(intent);
                break;
            case R.id.phone_login:
                if (agreementBtn.isSelected() == false) {
                    toast("请勾选底部服务条款");
                    return;
                }

                break;
            case R.id.agreement_btn:
                agreementBtn.setSelected(!agreementBtn.isSelected());
                break;
            case R.id.agreement_operator_btn:
                toast("运营商条款协议");
                break;
            case R.id.agreement_user_btn:
                toast("用户注册协议");
                break;
            case R.id.agreement_privacy_btn:
                toast("隐私政策协议");
                break;
        }
    }
}
