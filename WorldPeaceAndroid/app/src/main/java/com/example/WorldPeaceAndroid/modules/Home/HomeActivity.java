package com.example.WorldPeaceAndroid.modules.Home;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.example.WorldPeaceAndroid.modules.BaseActivity;
import com.example.WorldPeaceAndroid.modules.Home.fragment.HomeFragment;
import com.example.WorldPeaceAndroid.modules.Home.fragment.MineFragment;
import com.example.WorldPeaceAndroid.modules.Home.fragment.ShopFragment;
import com.example.WorldPeaceAndroid.modules.Home.fragment.SquareFragment;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import com.example.WorldPeaceAndroid.R;

import java.util.ArrayList;
import java.util.List;

public class HomeActivity extends BaseActivity {

    private MenuItem lastItem;

    private HomeFragment homeFragment;
    private SquareFragment squareFragment;
    private ShopFragment shopFragment;
    private MineFragment mineFragment;

    private FragmentManager fragmentManager;
    private FragmentTransaction fragmentTransaction;

    private List<Fragment> fragmentList = new ArrayList();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setContentView(R.layout.activity_home);
        super.onCreate(savedInstanceState);

        initView();
    }

    private void hideOthersFragment(Fragment showFragment, boolean add, boolean ops) {

        this.fragmentTransaction = fragmentManager.beginTransaction();

        if (add) {
            fragmentTransaction.add(R.id.fragmentView, showFragment);
        }

        if (ops) {
            for (Fragment fragment : fragmentList) {
                if (showFragment.equals(fragment)) {
                    fragmentTransaction.show(fragment);
                } else {
                    fragmentTransaction.hide(fragment);
                }
            }
        }

        this.fragmentTransaction.commit();
    }

    private void initNavigationView() {

        BottomNavigationView navigation = findViewById(R.id.navigation);
        navigation.setItemIconTintList(null);

        this.lastItem = navigation.getMenu().getItem(0);

//        navigation.setLabelVisibilityMode(LabelVisibilityMode.LABEL_VISIBILITY_LABELED); // 三个以上不显示文字的问题
        navigation.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {

            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {

                if (lastItem != item) {
                    lastItem = item;

                    switch (item.getItemId()) {
                        case R.id.tabBar_home:
                            hideOthersFragment(homeFragment, false, true);
                            break;
                        case R.id.tabBar_square:
                            hideOthersFragment(squareFragment, false, true);
                            break;
                        case R.id.tabBar_shop:
                            hideOthersFragment(shopFragment, false, true);
                            break;
                        case R.id.tabBar_mine:
                            hideOthersFragment(mineFragment, false, true);
                            break;
                    }
                    return true;
                }

                return false;
            }
        });
    }

    private void initFragments() {

        this.fragmentManager = getSupportFragmentManager();
        this.fragmentTransaction = fragmentManager.beginTransaction();

        this.homeFragment = new HomeFragment();
        this.fragmentList.add(homeFragment);

        this.squareFragment = new SquareFragment();
        this.fragmentList.add(squareFragment);
        this.hideOthersFragment(squareFragment, true, false);

        this.shopFragment = new ShopFragment();
        this.fragmentList.add(shopFragment);
        this.hideOthersFragment(shopFragment, true, false);

        this.mineFragment = new MineFragment();
        this.fragmentList.add(mineFragment);
        this.hideOthersFragment(mineFragment, true, false);

        this.hideOthersFragment(homeFragment, true, true); // 设置首页为默认页
    }

    private void initView() {

        initNavigationView();

        initFragments();
    }
}
