package com.marioaliaga.service;

import java.util.List;

import com.marioaliaga.model.User;


public interface UserService {
	
	User findById(long id); 					// findById
	
	User findByName(String name);				// No será ocupado en el proyecto
	
	void saveUser(User user);					// createPersona
	
	void updateUser(User user);					// updateById
	
	void deleteUserById(long id);				// deleteById

	List<User> findAllUsers(); 					// findAll
	
	void deleteAllUsers(); 						// No será ocupado en el proyecto

	public boolean isUserExist(User user);		// No será ocupado en el proyecto
	
}
