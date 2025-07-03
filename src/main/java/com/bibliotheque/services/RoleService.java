package com.bibliotheque.services;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bibliotheque.models.Role;
import com.bibliotheque.repositories.RoleRepository;
@Service
public class RoleService {

    private final RoleRepository roleRepository;

    @Autowired
    public RoleService(RoleRepository role){
        this.roleRepository = role;
    }

    public List<Role> findAll(){
        return this.roleRepository.findAll();
    }

    public Optional<Role> findById(Integer id){
        return this.roleRepository.findById(id);
    }
    
    
}
