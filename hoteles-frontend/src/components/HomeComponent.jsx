import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import API_URL from '../config/api';

const HomeComponent = () => {

    const [hoteles, setHoteles] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    
    const navigate = useNavigate();

    // Obtener hoteles al cargar el componente
    useEffect(() => {
        obtenerHoteles();
    }, []);
    
    // Función para obtener los hoteles
    // Se utiliza axios para hacer una solicitud GET a la API
    // y se actualiza el estado de hoteles, loading y error según la respuesta
    // Si hay un error, se captura y se actualiza el estado de error
    // Finalmente, se establece loading en false para indicar que la carga ha finalizado
    // Si la respuesta es exitosa, se actualiza el estado de hoteles con los datos
    // obtenidos de la API
    const obtenerHoteles = async () => {
        try {
            const response = await axios.get(`${API_URL}/hoteles`);
            setHoteles(response.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setError('Error al cargar los hoteles');
            setLoading(false);
        }
    };

    const irAHotel = () => {
        navigate('/hotel');
    };

    const irAHabitacion = (hotelId) => {
        navigate(`/habitacion/${hotelId}`);
    };

    const verHabitacionesHotel = (hotelId) => {
        navigate(`/habitaciones-hotel/${hotelId}`);
    };
    
    return (
        <div className="container mt-4">
            <h1>Hoteles Registrados</h1>

            {loading && <p>Cargando hoteles...</p>}
            {error && <div className="alert alert-danger">{error}</div>}

            {!loading && !error && (
                <table className="table table-striped">
                    <thead className="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Dirección</th>
                            <th>Ciudad</th>
                            <th>NIT</th>
                            <th>Número Habitaciones</th>
                             <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        {(!hoteles || hoteles.length === 0) ? (
                            <tr>
                                <td colSpan="7" className="text-center">No hay hoteles registrados.</td>
                            </tr>
                        ) : (
                            hoteles.map((hotel) => (
                                <tr key={hotel.id}>
                                    <td>{hotel.id}</td>
                                    <td>{hotel.nombre}</td>
                                    <td>{hotel.direccion}</td>
                                    <td>{hotel.ciudad}</td>
                                    <td>{hotel.nit}</td>
                                    <td>{hotel.numero_habitaciones}</td>
                                    <td>
                                        <div className="d-flex flex-wrap gap-2">
                                            <button
                                                className="btn btn-success btn-sm"
                                                onClick={() => irAHabitacion(hotel.id)}
                                            >
                                                Registrar Habitación
                                            </button>
                                            <button
                                                className="btn btn-info btn-sm"
                                                onClick={() => verHabitacionesHotel(hotel.id)}
                                            >
                                                Ver Habitaciones
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            )}
            <button className="btn btn-info mb-5" onClick={irAHotel}>
                Registrar Nuevo Hotel
            </button>
        </div>
    )
}

export default HomeComponent;