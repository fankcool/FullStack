package com.example.WorldPeaceAndroid.modules;

import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.bigkoo.svprogresshud.SVProgressHUD;

public class BaseFragment extends Fragment {

    protected String TAG;

    protected SVProgressHUD progressHUD;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        progressHUD = new SVProgressHUD(getActivity());

        TAG = this.getClass().toString();
    }

    protected void toast(String text) {
        toast(text, Toast.LENGTH_SHORT);
    }

    protected void toast(String text, int duration) {
        BaseActivity.baseToast(this.getActivity(), text, duration);
    }
}
