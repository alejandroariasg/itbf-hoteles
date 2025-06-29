import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';
import API_URL from '../config/api';

const HabitacionComponent = () => {
    const { hotelId } = useParams();
    const navigate = useNavigate();

    const [tiposHabitacion, setTiposHabitacion] = useState([]);
    const [acomodaciones, setAcomodaciones] = useState([]);
    const [selectedTipoHabitacion, setSelectedTipoHabitacion] = useState('');
    const [selectedAcomodacion, setSelectedAcomodacion] = useState('');
    const [cantidad, setCantidad] = useState('');
    
    const [error, setError] = useState('');
    const [success, setSuccess] = useState('');
    const [hotelNombre, setHotelNombre] = useState('');
    
    // Obtener nombre del hotel al cargar el componente
    useEffect(() => {
        obtenerNombreHotel();
    }, []);

    // Obtener tipos de habitación al cargar el componente
    useEffect(() => {
        obtenerTiposHabitacion();
    }, []);

    /* Obtener nombre del hotel al cargar el componente */
    const obtenerNombreHotel = async () => {
        try {
            const response = await axios.get(`${API_URL}/hoteles/${hotelId}`);
            setHotelNombre(response.data.nombre);
        } catch (err) {
            console.error(err);
        }
    };
    
    /* Obtener tipos de habitación desde la API */
    const obtenerTiposHabitacion = async () => {
        try {
            const response = await axios.get(`${API_URL}/tipos-habitacion`);
            setTiposHabitacion(response.data);
        } catch (err) {
            console.error(err);
            setError('Error al cargar los tipos de habitación');
        }
    };

    /* Obtener acomodaciones según el tipo de habitación seleccionado */
    const obtenerAcomodaciones = async (tipoHabitacionId) => {
        try {
            const response = await axios.get(`${API_URL}/tipo-habitacion/${tipoHabitacionId}/acomodaciones`);
            setAcomodaciones(response.data);
        } catch (err) {
            console.error(err);
            setError('Error al cargar las acomodaciones');
        }
    };

    /* Manejar cambio en el select de tipo de habitación */
    const handleTipoHabitacionChange = (e) => {
        const tipoId = e.target.value;
        setSelectedTipoHabitacion(tipoId);
        setSelectedAcomodacion('');
        
        if (tipoId) {
            obtenerAcomodaciones(tipoId);
        } else {
            setAcomodaciones([]);
        }
    };

    /* Manejar envío del formulario */
    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setSuccess('');

        const data = {
            hotel_id: hotelId,
            tipo_habitacion_id: selectedTipoHabitacion,
            acomodacion_id: selectedAcomodacion,
            cantidad: cantidad,
        };

        try {
            await axios.post(`${API_URL}/habitaciones`, data);
            setSuccess('Habitación registrada exitosamente');

            // Limpiar formulario
            setSelectedTipoHabitacion('');
            setSelectedAcomodacion('');
            setCantidad('');

        } catch (err) {
            if (err.response && err.response.data && err.response.data.errors) {
                const errores = err.response.data.errors;
                // Convertir errores a un array de strings para mostrarlos
                const mensajes = [];
                for (const key in errores) {
                    if (Array.isArray(errores[key])) {
                        errores[key].forEach((mensaje) => mensajes.push(mensaje));
                    }
                }
                setError(mensajes);
            }else {
                setError(['Error al registrar la habitación']);
            }
        }
    };

    return (
        <div className="container mt-4">
            <h1>Registrar Habitación para Hotel {hotelNombre}</h1>

            {error && (
                <div className="alert alert-danger">
                    <ul className="mb-0">
                    {error.map((errMsg, index) => (
                        <li key={index}>{errMsg}</li>
                    ))}
                    </ul>
                </div>
            )}
            {success && <div className="alert alert-success">{success}</div>}

            <form onSubmit={handleSubmit}>
                {/* Tipo Habitación */}
                <div className="mb-3">
                    <label className="form-label">Tipo de Habitación</label>
                    <select
                        className="form-select"
                        value={selectedTipoHabitacion}
                        onChange={handleTipoHabitacionChange}
                        required
                    >
                        <option value="">Seleccione un tipo de habitación</option>
                            {tiposHabitacion.map((tipo) => (
                        <option key={tipo.id} value={tipo.id}>
                            {tipo.nombre}
                        </option>
                        ))}
                    </select>
                </div>

                {/* Acomodación */}
                <div className="mb-3">
                    <label className="form-label">Tipo de Acomodación</label>
                    <select
                        className="form-select"
                        value={selectedAcomodacion}
                        onChange={(e) => setSelectedAcomodacion(e.target.value)}
                        required
                        disabled={!acomodaciones.length}
                    >
                        <option value="">Seleccione una acomodación</option>
                            {acomodaciones.map((acom) => (
                        <option key={acom.id} value={acom.id}>
                            {acom.nombre}
                        </option>
                        ))}
                    </select>
                </div>

                {/* Cantidad */}
                <div className="mb-3">
                    <label className="form-label">Cantidad</label>
                    <input
                        type="number"
                        className="form-control"
                        value={cantidad}
                        onChange={(e) => setCantidad(e.target.value)}
                        required
                        min="1"
                    />
                </div>
                <div style={{textAlign: 'center'}}>         
                    <button type="submit" className="btn btn-primary">Registrar Habitación</button>
                    <button type="button" className="btn btn-secondary ms-2" onClick={() => navigate('/')}>
                        Volver
                    </button>
                </div>
            </form>
        </div>
    )
}
export default HabitacionComponent;