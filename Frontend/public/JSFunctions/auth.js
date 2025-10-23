// Guardar datos de sesión después del login
function guardarSesion(usuario) {
    const datosSesion = {
        id: usuario.id,
        nombre: usuario.nombre,
        email: usuario.email,
        rol: usuario.rol,
        loginTime: new Date().toISOString()
    };
    
    localStorage.setItem('usuarioLogueado', JSON.stringify(datosSesion));
}

// Verificar si hay sesión activa al cargar la página
function verificarSesion() {
    const sesion = localStorage.getItem('usuarioLogueado');
    if (sesion) {
        return JSON.parse(sesion);
    }
    return null;
}

// Cerrar sesión
function cerrarSesion() {
    localStorage.removeItem('usuarioLogueado');
    window.location.href = 'login.html';
}



guardarSesion(usuario);