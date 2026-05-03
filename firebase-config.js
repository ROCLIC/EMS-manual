// Configuración de Firebase para EMS Manual con Firestore
// Credenciales de la aplicación base-ems
const firebaseConfig = {
  apiKey: "AIzaSyCyhzS4DNTraa0ALKpnncJC85sVA4vvmYQ",
  authDomain: "base-ems.firebaseapp.com",
  projectId: "base-ems",
  storageBucket: "base-ems.firebasestorage.app",
  messagingSenderId: "1029573637298",
  appId: "1:1029573637298:web:58dc8391bda7f1f13f45ab",
  measurementId: "G-SQXQN52J67"
};

// Exportar configuración si es necesario o simplemente dejarla global para index.html
if (typeof window !== 'undefined') {
    window.firebaseConfig = firebaseConfig;
}

// NOTA: La aplicación usa Firestore (Cloud Firestore)
// Los documentos se guardan en la colección "usuarios" con la estructura:
// usuarios/{uid}/documentos/{categoría}/{documento}
