import { defineStore } from 'pinia';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null,
    isAuthenticated: false
  }),
  actions: {
    login(userData) {
      if (!this.isAuthenticated) { 
        this.user = userData;
        this.isAuthenticated = true;
      }
    },
    logout() {
      if (this.isAuthenticated) {
        this.user = null;
        this.isAuthenticated = false;
      }
    },
    addService(service) {
      if (this.isAuthenticated) {
        this.user['serviços-realizados'].push(service);
      }
    }
  }
});
