package com.idat.proyecto.service;

import lombok.RequiredArgsConstructor;
import com.idat.proyecto.model.Rol;
import com.idat.proyecto.repository.RolRepository;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class RolService {

    private RolRepository repository;
    
    public RolService(RolRepository rolRepository) {
        this.repository = rolRepository;
    }

    public Rol buscarPorId(Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Rol no encontrado"));
    }

    public Rol guardarRol(Rol rol) {
        rol.setId(null);
        return repository.save(rol);
    }

    public List<Rol> listarRols() {
        return repository.findAll();
    }

    public void eliminarRol(Integer id) {
        Rol rol = buscarPorId(id);
        repository.delete(rol);
    }

    public Rol actualizarRol(Integer id, Rol datos) {
        Rol Rol = buscarPorId(id);
        Rol.setNombre(datos.getNombre());
        return repository.save(Rol);
    }
}
