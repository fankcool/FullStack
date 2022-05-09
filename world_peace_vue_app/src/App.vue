<template>
  <Lgoin v-if="!isLogin" @loginSuccess="loginSuccess" />
</template>

<script>
import Lgoin from '@/modules/login/Login.vue'

export default {
  name: 'App',
  components: {
    Lgoin
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

  /* 解决iOS微信放大字体后的页面混乱问题 */
  /* -webkit-text-size-adjust: 100% !important;
  -moz-text-size-adjust: 100% !important;
  text-size-adjust: 100% !important; */
}
</style>
