import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import API_URL from '../config/api';

const HotelComponent = () => {

    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        nombre: '',
        direccion: '',
        ciudad: '',
        nit: '',
        numero_habitaciones: '',
    });

    const [error, setError] = useState('');
    const [success, setSuccess] = useState('');    

    // Maneja los cambios en los campos del formulario
    // Actualiza el estado del formulario con los valores ingresados por el usuario
    // Utiliza el operador spread para mantener los valores existentes y actualizar solo el campo modificado
    // El evento 'e' se utiliza para obtener el nombre del campo y su valor
    // Se utiliza el atributo 'name' de los inputs para identificar qué campo se está modific
    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value,
        });
    };

    // Maneja el envío del formulario
    // Realiza una solicitud POST a la API para registrar el hotel con los datos del formulario
    // Si la solicitud es exitosa, muestra un mensaje de éxito y limpia el formulario
    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setSuccess('');

        try {
            await axios.post(`${API_URL}/hoteles`, formData);
            setSuccess('Hotel registrado exitosamente');

            // Limpiar formulario
            setFormData({
                nombre: '',
                direccion: '',
                ciudad: '',
                nit: '',
                numero_habitaciones: '',
            });
        } catch (err) {
            console.error(err);
            if (err.response && err.response.data && err.response.data.errors) {
                setError(JSON.stringify(err.response.data.errors));
            }else {
                setError('Error al registrar el hotel');
            }
        }
    };


    return (
        <div className="container mt-4">
            <h1>Registrar Nuevo Hotel</h1>

            {error && <div className="alert alert-danger">{error}</div>}
            {success && <div className="alert alert-success">{success}</div>}

            <form onSubmit={handleSubmit}>
                <div className="mb-3">
                    <label className="form-label">Nombre</label>
                    <input
                        type="text"
                        name="nombre"
                        className="form-control"
                        value={formData.nombre}
                        onChange={handleChange}
                        required
                    />
                </div>

                <div className="mb-3">
                    <label className="form-label">Dirección</label>
                    <input
                        type="text"
                        name="direccion"
                        className="form-control"
                        value={formData.direccion}
                        onChange={handleChange}
                        required
                    />
                </div>

                <div className="mb-3">
                    <label className="form-label">Ciudad</label>
                    <input
                        type="text"
                        name="ciudad"
                        className="form-control"
                        value={formData.ciudad}
                        onChange={handleChange}
                        required
                    />
                </div>

                <div className="mb-3">
                    <label className="form-label">NIT</label>
                    <input
                        type="text"
                        name="nit"
                        className="form-control"
                        value={formData.nit}
                        onChange={handleChange}
                        required
                    />
                </div>

                <div className="mb-3">
                    <label className="form-label">Número de Habitaciones</label>
                    <input
                        type="number"
                        name="numero_habitaciones"
                        className="form-control"
                        value={formData.numero_habitaciones}
                        onChange={handleChange}
                        required
                        min="1"
                    />
                </div>
                <div style={{textAlign: 'center'}}>
                    <button type="submit" className="btn btn-primary">Registrar Hotel</button>
                    <button type="button" className="btn btn-secondary ms-2" onClick={() => navigate('/')}>
                    Volver
                    </button>
                </div>
            </form>
        </div>
    )
}

export default HotelComponent;