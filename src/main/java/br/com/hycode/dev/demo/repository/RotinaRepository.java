package br.com.hycode.dev.demo.repository;

import br.com.hycode.dev.demo.model.Rotina;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RotinaRepository extends JpaRepository<Rotina, Long> {
    List<Rotina> findByStatus(boolean status);
}
