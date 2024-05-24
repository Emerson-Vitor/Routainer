package br.com.hycode.dev.demo.repository;

import br.com.hycode.dev.demo.model.Rotina;

import java.util.List;

public interface RotinaRepository extends AbstractRepository<Rotina, Long>{
    List<Rotina> findByStatusTrue();
}
