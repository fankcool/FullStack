package com.example.WorldPeaceAndroid.modules;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.bigkoo.svprogresshud.SVProgressHUD;
import com.example.WorldPeaceAndroid.R;

import butterknife.ButterKnife;

public class BaseActivity extends AppCompatActivity {

    protected String TAG;

    protected ImageView backImg;

    protected Context baseContext;

    protected SVProgressHUD progressHUD;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getWindow().setNavigationBarColor(getResources().getColor(R.color.white, getTheme()));
        getWindow().setStatusBarColor(getResources().getColor(R.color.white, getTheme()));
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);

        progressHUD = new SVProgressHUD(this);

        TAG = this.getClass().toString();

        ButterKnife.bind(this);

        baseContext = this;
    }

    protected void goBack(View view) {
        view.setOnClickListener(listener);
    }

    protected void goBack() {
        backImg = this.findViewById(R.id.back);
        if (backImg != null) {
            backImg.setOnClickListener(listener);
        }
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            backClick();
        }
    };

    private void backClick() {
        this.finish();
    }

    protected void toast(String text) {
        toast(text, Toast.LENGTH_SHORT);
    }

    protected void toast(String text, int duration) {
        baseToast(this, text, duration);
    }

    public static void baseToast(Context ctx, String text) {
        baseToast(ctx, text, Toast.LENGTH_SHORT);
    }

    public static void baseToast(Context ctx, String text, int duration) {
        Toast toast = Toast.makeText(ctx, text, duration);
        toast.setText(text); // 解决toast带项目名问题
        toast.show();
    }
}
