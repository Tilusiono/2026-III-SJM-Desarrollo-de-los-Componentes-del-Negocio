package com.idat.proyecto.controller;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import com.idat.proyecto.model.Rol;
import com.idat.proyecto.service.RolService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor 
@RequestMapping("/api/rol")
public class RolController {

    private RolService service;

    @PostMapping
    public Rol nuevoRol(@RequestBody Rol Rol) {
        return service.guardarRol(Rol);
    }

    @GetMapping
    public List<Rol> listarRols() {
        return service.listarRols();
    }

    @GetMapping("/{id}")
    public Rol buscarRolPorId(@PathVariable Integer id) {
        return service.buscarPorId(id);
    }

    @PutMapping("/{id}")
    public Rol actualizarRol(@PathVariable Integer id, @RequestBody Rol Rol) {
        return service.actualizarRol(id, Rol);
    }

    @DeleteMapping("/{id}")
    public void eliminarRol(@PathVariable Integer id) {
        service.eliminarRol(id);
    }
}
