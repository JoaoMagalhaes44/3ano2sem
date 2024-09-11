<template>
    <div class="history-card">
      <div class="info-row">
        <div class="info-item">
            <h1>Cliente:</h1>
            <h2>{{ clientName(clientData) }}</h2>
        </div>
        <div class="info-item">
            <h1>Matrícula:</h1>
            <h2>{{ service.vehicleId }}</h2>
        </div>
        <div class="info-item">
            <h1>Designação:</h1>
            <h2>{{ service.descrição }}</h2>
        </div>
        <div class="info-item">
            <h1>Data de Chegada:</h1>
            <h2>{{ formatArrivalDate(service.chegada.ano, service.chegada.mes, service.chegada.dia) }}</h2>
        </div>
        <button class="details-button" @click="navigateToService"                                     
                                      @mouseover="isHovered = true"
                                      @mouseout="isHovered = false"
                                      :class="{ 'button-hovered': isHovered }">
        Detalhes</button>
      </div>
    </div>
</template>
  
  <script>
  import axios from 'axios';

  const JSON_SERVER_URL = 'http://localhost:3000';

  import { useFromStore } from '../store/fromStore';

  export default {
    name: 'HistoryList',
    props: {
      service: {
        type: Object,
        required: true
      }
    },
    data () {
      return {
        clientData: {},
        isHovered: false,
        fromStore: useFromStore()
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      formatArrivalDate(ano, mes, dia) {
          // Converter para números inteiros
          ano = parseInt(ano);
          mes = parseInt(mes) - 1; // Ajustar o índice do mês (subtrair 1)

          // Criar um objeto Date
          const date = new Date(ano, mes, dia);

          // Verificar se a data é válida
          if (isNaN(date.getTime())) {
          return 'Data inválida';
          } else {
          // Acrescenta um 0 à esquerda se necessário
          // Formatar a data no formato desejado (DD/MM/YYYY HH:mm:ss)
          const formattedDate = [
              ('0' + dia).slice(-2),   // Dia com zero à esquerda
              ('0' + (mes + 1)).slice(-2), // Mês com zero à esquerda
              ano
          ].join('/')

          return formattedDate;
          }
      },
      async fetchData() {
        try {
          //Necessário aceder às informações do veículo para conseguir saber o nome do cliente
          const vehicleResponse = await this.fetchVehicleData(this.service.vehicleId);
          const vehicleData = vehicleResponse.data;

          const clientid = vehicleData.clientId;
          const clientResponse = await this.fetchClientData(clientid);
          this.clientData = clientResponse.data;
  
        } catch (error) {
          console.error('Error fetching data:', error);
        }
      },
      async fetchVehicleData(vehicleID) {
        const response = await axios.get(`${JSON_SERVER_URL}/vehicles/` + vehicleID);
        return response;
      },
      async fetchClientData(clientID) {
        const response = await axios.get(`${JSON_SERVER_URL}/clients/` + clientID);
        return response;
      },
      clientName(data) {
        return data.nome
      },
      navigateToService() {
        this.fromStore.from = false;
        this.$router.push({ name: 'service', params: { serviceID: this.service.id } });
      }
    }
  };
  </script>
  
  <style scoped>
  .history-card {
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
    font-size: 18px;
    font-family: 'inter',sans-serif;
    font-weight: normal;
    color: #6F6A6A;
    margin-bottom: 5px;
  }
  
  .info-item h2 {
    font-size: 18px;
    font-family: 'inter',sans-serif;
    font-weight: normal;
    color: #000000;
    margin-top: 0;
  }
  
  .details-button {
    width: 120px;
    height: 40px;
    background-color: #1e56a0;
    color: #ffffff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px; /* Adicionar margem acima do botão */
  }
  .button-hovered {
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3); 
}

  @media (max-width: 1350px) {
    .history-card {
       padding: 15px
    }
    .info-item h1 {
      font-size: 16px;
    }
    .info-item h2 {
      font-size: 16px;
    }
    .details-button {
      width: 90px;
      font-size: 14px;
    }
  }
</style>