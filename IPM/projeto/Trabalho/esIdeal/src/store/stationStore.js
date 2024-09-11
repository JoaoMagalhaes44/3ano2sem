import { defineStore } from 'pinia';

export const useStationStore = defineStore('station', {
  state: () => ({
    station: null,
  }),
  actions: {
    login(userData) {
        this.station = userData;
    },
    logout() {
        this.station = null;
    },
  },
});