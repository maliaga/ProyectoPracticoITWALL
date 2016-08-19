package com.marioaliaga.springmvc.service;



import com.itwall.model.PersonaDTO;
import com.itwall.service.PersonaService;
import com.itwall.service.impl.PersonaServiceImpl;
import com.marioaliaga.springmvc.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{


    private PersonaService serv = new PersonaServiceImpl();
	
	private static List<User> users;

	public List<User> findAllUsers(){

		List<User> users = new ArrayList<User>();

        List<PersonaDTO> per = serv.findAll();

			for(PersonaDTO p : per){
				User u = new User();
				u.setId(p.getIdPersona());
				u.setUsername(p.getpNombre());
				u.setAddress(p.getpDireccion());
				u.setTelefono(p.getpNumTelefono());
				u.setEmail(p.getpImail());

				users.add(u);
			}


		return users;
	}
	
	public User findById(long id) {
        User u = null;
        PersonaDTO p = new PersonaDTO();
        p.setIdPersona((int) id);


			p = serv.findById(p);

            if(null != p){
                u = new User();
                u.setId(p.getIdPersona());
                u.setUsername(p.getpNombre());
                u.setAddress(p.getpDireccion());
                u.setTelefono(p.getpNumTelefono());
                u.setEmail(p.getpImail());
            }


		return u;
	}
	
	public User findByName(String name) {
		for(User user : users){
			if(user.getUsername().equalsIgnoreCase(name)){
				return user;
			}
		}
		return null;
	}
	
	public void saveUser(User user) {
		PersonaDTO p = new PersonaDTO();
        p.setIdPersona((int) user.getId());
        p.setpNombre(user.getUsername());
        p.setpDireccion(user.getAddress());
        p.setpNumTelefono(user.getTelefono());
        p.setpImail(user.getEmail());

        serv.createPersona(p);

	}

	public void updateUser(User user) {


            PersonaDTO p = new PersonaDTO();
            p.setIdPersona((int) user.getId());
            p.setpNombre(user.getUsername());
            p.setpDireccion(user.getAddress());
            p.setpNumTelefono(user.getTelefono());
            p.setpImail(user.getEmail());

			Integer resp = serv.updateById(p);


	}

	public void deleteUserById(long id) {
		PersonaDTO p = new PersonaDTO();
        p.setIdPersona((int) id);


			serv.deleteById(p);


	}

	public boolean isUserExist(User user) {
		return findByName(user.getUsername())!=null;
	}
	
	public void deleteAllUsers(){
		users.clear();
	}

}
