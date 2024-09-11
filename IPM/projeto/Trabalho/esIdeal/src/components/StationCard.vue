<template>
  <div class="stations-card">
    <div class="info-row">
      <div class="info-item">
        <h1>Designação:</h1>
        <h2>{{ station.nome }}</h2>
      </div>
      <div class="info-item">
        <h1>Código:</h1>
        <h2>{{ station.id }}</h2>
      </div>
      <div class="info-item">
        <h1>Especialização:</h1>
        <h2>{{ especializacaoDescricao }}</h2>
      </div>
      <button class="details-button" @click="navigateToService"
                                      @mouseover="isHovered = true"
                                      @mouseout="isHovered = false"
                                      :class="{ 'button-hovered': isHovered }"
      >Entrar</button>
    </div>
  </div>
</template>

<script>
import { useAuthStore } from '../store/authStore';

export default {
  name: 'StationCard',
  data() {
      return {
        authStore: useAuthStore(),
        isHovered: false
      }
  },
  props: {
    station: {
      type: Object,
      required: true
    }
  },
  methods: {
    navigateToService() {
      this.$router.push({ name: 'home', params: { stationID: this.station.id } });
    }
  },
  computed: {
    especializacaoDescricao() {
      const especialidade = this.station.especialidade;
      if (especialidade === 'geral') {
        return 'Todo o tipo de veículos';
      } else if (especialidade === 'combustao') {
        return 'Motores a combustão';
      } else if (especialidade === 'eletrico') {
        return 'Motores elétricos';
      } else {
        return 'Especialização não especificada';
      }
    }
  }
};
</script>

<style scoped>
.stations-card {
  display: flex;
  flex-direction: row;
  padding: 20px;
  background-color: #ffffff;
  border-width: 1px;
  border-style: solid;
  width: 95.7%; /* Ocupa 100% da largura disponível */
}

.info-row {
  display: flex;
  gap: 20px;
  width: 100%; /* Ocupa 100% da largura disponível */
}

.info-item {
  flex: 1; /* Distribui espaço igualmente entre os itens */
}

.info-item h1 {
  font-family: 'inter',sans-serif;
  font-size: 18px;  
  color: #6F6A6A;
  font-weight: normal;
  margin-bottom: 5px;
}

.info-item h2 {
  font-family: 'inter',sans-serif;
  font-size: 18px;
  font-weight: normal;
  color: #000000;
  margin-top: 0;
}

.details-button {
  width: 120px;
  height: 40px;
  font-size: 16px;
  font-weight: bold;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px; /* Adicionar margem acima do botão */
  border: none;
  background-color: #1e56a0;
  color: #ffffff;
}
.button-hovered {
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3); 
}

@media (max-width: 1350px) {
  .stations-card {
    padding: 15px;
  }
  .info-item h1,
  .info-item h2 {
    font-size: 16px;
  }
  .details-button {
    width: 90px;
    font-size: 14px;
    border: none;
  }
}

@media (max-width: 1024px) {
  .stations-card {
    padding: 15px;
  }
  .info-item h1,
  .info-item h2 {
    font-size: 14px;
  }
  .details-button {
    width: 90px;
    font-size: 14px;
    border: none;
  }
}

@media (max-width: 800px) {
  .stations-card {
    padding: 15px;
  }
  .info-item h1,
  .info-item h2 {
    font-size: 13px;
  }
  .details-button {
    width: 80px;
    font-size: 13px;
    border: none;
  }
}
</style>
