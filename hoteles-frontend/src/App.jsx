import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomeComponent from './components/HomeComponent';
import HotelComponent from './components/HotelComponent';
import HabitacionComponent from './components/HabitacionComponent';
import HabitacionesHotelComponent from './components/HabitacionesHotelComponent';
import FooterComponent from './components/FooterComponent';
import HeaderComponent from './components/HeaderComponent';
import './App.css';

function App() {
  
  return (
    <>
      <Router>
        <HeaderComponent />
        <Routes>
          <Route path="/" element={<HomeComponent />} />
           <Route path="/hotel" element={<HotelComponent />} />
           <Route path="/habitacion/:hotelId" element={<HabitacionComponent />} />
           <Route path="/habitaciones-hotel/:hotelId" element={<HabitacionesHotelComponent />} />
        </Routes>
      </Router>
      <FooterComponent />
    </>
  )
}

export default App
