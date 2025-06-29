import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';
import API_URL from '../config/api';

const HabitacionesHotelComponent = () => {
    const { hotelId } = useParams();
    const navigate = useNavigate();

    const [habitaciones, setHabitaciones] = useState([]);
    const [hotelNombre, setHotelNombre] = useState('');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');

    // Obtener habitaciones al cargar el componente
    useEffect(() => {
        obtenerHabitaciones();
    }, []);

    // Obtener nombre del hotel al cargar el componente
    useEffect(() => {
        obtenerNombreHotel();
    }, []);

    // Función para obtener las habitaciones del hotel
    const obtenerHabitaciones = async () => {
        try {
            const response = await axios.get(`${API_URL}/hotels/${hotelId}/habitaciones`);
            setHabitaciones(response.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setError('Error al cargar las habitaciones');
            setLoading(false);
        }
    };

    // Obtener nombre del hotel al cargar el componente
    const obtenerNombreHotel = async () => {
        try {
            const response = await axios.get(`${API_URL}/hoteles/${hotelId}`);
            setHotelNombre(response.data.nombre);
        } catch (err) {
            console.error(err);
        }
    };

    const volverHome = () => {
        navigate('/');
    };

    return(
        <div className="container mt-5">
            <h1>Habitación registradas para el hotel {hotelNombre}</h1>

            {loading && <p>Cargando habitaciones...</p>}
            {error && <div className="alert alert-danger">{error}</div>}

            {!loading && !error && (
            <table className="table table-striped">
                <thead className="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Habitación</th>
                        <th>Acomodación</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    {habitaciones.length === 0 ? (
                    <tr>
                        <td colSpan="4" style={{textAlign: 'center'}}>No hay habitaciones registradas para este hotel.</td>
                    </tr>
                    ) : (
                    habitaciones.map((habitacion) => (
                        <tr key={habitacion.id}>
                            <td>{habitacion.id}</td>
                            <td>{habitacion.tipo_habitacion_nombre}</td>
                            <td>{habitacion.acomodacion_nombre}</td>
                            <td>{habitacion.cantidad}</td>
                        </tr>
                    ))
                    )}
                </tbody>
            </table>
            )}
            <button className="btn btn-secondary mb-3" onClick={volverHome}>
                Volver
            </button>
        </div>
    )
}

export default HabitacionesHotelComponent;