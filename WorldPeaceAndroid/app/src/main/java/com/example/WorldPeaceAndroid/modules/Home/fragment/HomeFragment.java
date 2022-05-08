package com.example.WorldPeaceAndroid.modules.Home.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.WorldPeaceAndroid.R;
import com.example.WorldPeaceAndroid.customUI.AlertDialog;
import com.example.WorldPeaceAndroid.modules.BaseFragment;
import com.example.WorldPeaceAndroid.modules.Home.DetailActivity;

import butterknife.ButterKnife;
import butterknife.OnClick;
import butterknife.Unbinder;

public class HomeFragment extends BaseFragment {

    private Unbinder unbinder;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.activity_home_fragment_home, null);

        unbinder = ButterKnife.bind(this, view); // fragment 使用 ButterKnife

        initView().initData();

        return view;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();

        unbinder.unbind();
    }

    @OnClick(R.id.success)
    public void successBtn() {
        progressHUD.showInfoWithStatus("success");
    }

    @OnClick(R.id.fail)
    public void failBtn() {
        new AlertDialog(getActivity()).builder()
                .setTitle("标题")
                .setMsg("消息内容消息内容消息内容")
                .setPositiveButton("确定", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                    }
                }).show();
    }

    @OnClick(R.id.push)
    public void pushBtn() {
        startActivity(new Intent(getActivity(), DetailActivity.class));
    }

    private void initData() {
    }

    private HomeFragment initView() {
        return this;
    }
}
