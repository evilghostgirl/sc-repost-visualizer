import Vue from 'vue'
import App from './App.vue'
import NwImg from 'nw-img-vue';

Vue.config.productionTip = false
Vue.use(NwImg);

new Vue({
  render: h => h(App),
}).$mount('#app')
