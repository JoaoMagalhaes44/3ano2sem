<template>
  <div id="home-layout">
    <SideCardHistComponent id="info-card" />
    <DropMenuBar2 id="menu-bar" @filters-applied="updateFilteredServiceList" />
    <div class="content">
      <ServiceListComponent :displayList="displayList" />
    </div>
  </div>
  <ChatBotComponent />
</template>

<script>


import axios from 'axios';
import { useAuthStore } from '../store/authStore';

import SideCardHistComponent from "../components/SideCardHist.vue"
import DropMenuBar2 from '../components/dropMenusBar2.vue';
import ChatBotComponent from "../components/ChatBot.vue";
import ServiceListComponent from '../components/ServiceListComponent.vue'; 

const JSON_SERVER_URL = 'http://localhost:3000';

export default {
  name: "History",
  components: {
    SideCardHistComponent,
    DropMenuBar2,
    ChatBotComponent,
    ServiceListComponent
  },
  data() {
    return {
      originalServiceList: [], // Lista original de serviços
      displayList: [], // Lista de serviços a ser exibida com ou sem filtros
      authStore: useAuthStore(),
    };
  },
  async mounted() {
    if (this.authStore.user) {
      await this.fetchData();
      this.displayList = [...this.originalServiceList];
    }
    else {
      this.$router.push({ name: 'login' });
    }
  },
  methods: {
    filtraRealizados(serviceList, estado) {
      return serviceList.filter(service => service.estado === estado);
    },
    async fetchData() {
      try {

        const definitionsResponse = await axios.get(`${JSON_SERVER_URL}/service-definitions`)

        this.originalServiceList = this.authStore.user['serviços-realizados'].map(service => ({
          ...service,
          definition: definitionsResponse.data.find(def => def.id === service['service-definitionId'])
        }));

        //Filtra os serviços realizados
        this.originalServiceList = this.filtraRealizados(this.originalServiceList, "realizado");
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    },
    updateFilteredServiceList(filteredServices) {
      this.displayList = filteredServices;
    },
  },
};
</script>


<style scope>
html, body {
  font-family: Inter;
  margin: 0;
  padding: 0;
  height: 100%;
}

#home-layout {
  display: grid;
  height: 100%;
  grid-template-rows: 353px 671px;
  grid-template-columns: 267px 36.8% 44.66%;
  gap: 1px;
  grid-template-areas:
      "info-card menu-bar menu-bar"
      "info-card cont cont";
  overflow: auto;

}

#chat-bot{
  grid-area: chat-bot;
}
#info-card{
  width: 100%;
  height: 100%;
  grid-area: info-card;
}

#menu-bar{
  width: 100%;
  height: 100%;
  grid-area: menu-bar;
}

.content {
  padding: 20px;
  width: 95%;
  grid-area: cont;
}

@media (max-width: 1350px) {
  #home-layout {
    grid-template-columns: 210px 33.8% 44.66%;
  }
  .content{
    padding: 15px;
  }
}

@media (max-width: 1024px) {
  #home-layout {
    grid-template-columns: 160px 33.8% 44.66%;
  }
  .content{
    padding: 5px;
  }
}


@media (max-width: 800px) {
  #home-layout {
    display: grid;
    height: 100%;
    grid-template-columns: 100%;
    grid-template-rows: 150px 46.8% auto;
    gap: 1px;
    grid-template-areas:
    "info-card"
    "menu-bar"
    "cont";
    overflow: auto;
  }
}

</style>