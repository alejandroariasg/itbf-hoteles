import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/logo.jpg'; // reemplaza con la ruta de tu logo

function HeaderComponent() {
  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
      <div className="container-fluid">
        <ul className="navbar-nav me-auto mb-2 mb-lg-0">
          <li className="nav-item">
            <Link className="nav-link" to="/">Inicio</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/hotel">Registrar Hotel</Link>
          </li>
        </ul>
        <div className="d-flex align-items-center">
          <span className="text-white me-3">Gestión de Hoteles ITBF</span>
          <img src={logo} alt="Logo" style={{ height: '40px' }} />
        </div>
      </div>
    </nav>
  );
}

export default HeaderComponent;