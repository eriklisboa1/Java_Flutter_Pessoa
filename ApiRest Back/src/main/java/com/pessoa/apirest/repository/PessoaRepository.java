package com.pessoa.apirest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pessoa.apirest.models.Pessoa;

public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

}
