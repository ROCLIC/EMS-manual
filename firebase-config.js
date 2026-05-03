// Configuración de Firebase para EMS Manual
// REEMPLAZA estos valores con los de tu consola de Firebase (Configuración del proyecto > Tus apps)
const firebaseConfig = {
  apiKey: "TU_API_KEY",
  authDomain: "TU_PROYECTO.firebaseapp.com",
  databaseURL: "https://TU_PROYECTO.firebaseio.com",
  projectId: "TU_PROYECTO",
  storageBucket: "TU_PROYECTO.appspot.com",
  messagingSenderId: "TU_SENDER_ID",
  appId: "TU_APP_ID"
};

// Exportar configuración si es necesario o simplemente dejarla global para index.html
if (typeof window !== 'undefined') {
    window.firebaseConfig = firebaseConfig;
}
