package com.example.WorldPeaceAndroid.customUI;

import android.app.Dialog;
import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.example.WorldPeaceAndroid.R;

public class AlertDialog {

    private Context context;
    private Dialog dialog;
    private ConstraintLayout constraintLayout;
    private TextView titleTextView;
    private TextView contentTextView;
    private TextView cancel;
    private TextView confirm;
    private Display display;
    private boolean showTitle = false;
    private boolean showMsg = false;
    private boolean showPosBtn = false;
    private boolean showNegBtn = false;

    public AlertDialog(Context context) {
        this.context = context;
        WindowManager windowManager = (WindowManager) context
                .getSystemService(Context.WINDOW_SERVICE);
        display = windowManager.getDefaultDisplay();
    }

    public AlertDialog builder() {
        // 获取Dialog布局
        View view = LayoutInflater.from(context).inflate(
                R.layout.alert_dialog, null);

        // 获取自定义Dialog布局中的控件
        constraintLayout = view.findViewById(R.id.alert_dialog);
        titleTextView = view.findViewById(R.id.title);
        titleTextView.setVisibility(View.GONE);
        contentTextView = view.findViewById(R.id.content);
        contentTextView.setVisibility(View.GONE);
        cancel = view.findViewById(R.id.btn_neg);
        cancel.setVisibility(View.GONE);
        confirm =  view.findViewById(R.id.btn_pos);
        confirm.setVisibility(View.GONE);

        // 定义Dialog布局和参数
        dialog = new Dialog(context, R.style.AlertDialogStyle);
        dialog.setContentView(view);

        // 调整dialog背景大小
        constraintLayout.setLayoutParams(new FrameLayout.LayoutParams((int) (display
                .getWidth() * 0.8), WindowManager.LayoutParams.WRAP_CONTENT));

        return this;
    }

    public AlertDialog setTitle(String title) {
        showTitle = true;
        if ("".equals(title)) {
            titleTextView.setText("标题");
        } else {
            titleTextView.setText(title);
        }
        return this;
    }

    public AlertDialog setMsg(String msg) {
        showMsg = true;
        if ("".equals(msg)) {
            contentTextView.setText("内容");
        } else {
            contentTextView.setText(msg);
        }
        return this;
    }

    public AlertDialog setCancelable(boolean cancel) {
        dialog.setCancelable(cancel);
        return this;
    }

    public AlertDialog setPositiveButton(String text, final View.OnClickListener listener) {
        showPosBtn = true;
        if ("".equals(text)) {
            confirm.setText("确定");
        } else {
            confirm.setText(text);
        }
        confirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onClick(v);
                dialog.dismiss();
            }
        });
        return this;
    }

    public AlertDialog setNegativeButton(String text, final View.OnClickListener listener) {
        showNegBtn = true;
        if ("".equals(text)) {
            cancel.setText("取消");
        } else {
            cancel.setText(text);
        }
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onClick(v);
                dialog.dismiss();
            }
        });
        return this;
    }

    private void setLayout() {
        if (!showTitle && !showMsg) {
            titleTextView.setText("提示");
            titleTextView.setVisibility(View.VISIBLE);
        }

        if (showTitle) {
            titleTextView.setVisibility(View.VISIBLE);
        }

        if (showMsg) {
            contentTextView.setVisibility(View.VISIBLE);
        }

        if (!showPosBtn && !showNegBtn) {
            confirm.setText("确定");
            confirm.setVisibility(View.VISIBLE);
            confirm.setBackgroundResource(R.drawable.alert_dialog_selector);
            confirm.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                }
            });
        }

        if (showPosBtn && showNegBtn) {
            confirm.setVisibility(View.VISIBLE);
            cancel.setVisibility(View.VISIBLE);
        }

        if (showPosBtn && !showNegBtn) {
            confirm.setVisibility(View.VISIBLE);

            DisplayMetrics dm = new DisplayMetrics();
            display.getRealMetrics(dm);

            ConstraintLayout.LayoutParams layoutParams = (ConstraintLayout.LayoutParams) confirm.getLayoutParams();
            layoutParams.leftMargin = (int) dm.density * 50;
            confirm.setLayoutParams(layoutParams);
        }

        if (!showPosBtn && showNegBtn) {
            cancel.setVisibility(View.VISIBLE);
        }
    }

    public void show() {
        setLayout();
        dialog.show();
    }
}
