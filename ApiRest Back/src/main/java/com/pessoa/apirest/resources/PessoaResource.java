package com.pessoa.apirest.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pessoa.apirest.models.Pessoa;
import com.pessoa.apirest.repository.PessoaRepository;

@RestController
@RequestMapping(value = "/api")
public class PessoaResource {

    @Autowired
    PessoaRepository pessoaRepository;

    @GetMapping("/pessoa")
    public List<Pessoa> litaPessoas() {
        return pessoaRepository.findAll();
    }

    @PostMapping("/pessoa")
    public Pessoa salvPessoa(@RequestBody Pessoa pessoa) {
        return pessoaRepository.save(pessoa);
    }

    @DeleteMapping("/pessoa")
    public void deletaPessoa(@RequestBody Pessoa pessoa) {
        pessoaRepository.delete(pessoa);
    }
}
