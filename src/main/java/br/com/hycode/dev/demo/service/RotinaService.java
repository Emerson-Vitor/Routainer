package br.com.hycode.dev.demo.service;

import br.com.hycode.dev.demo.model.Rotina;
import br.com.hycode.dev.demo.repository.RotinaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class RotinaService {

    private final RotinaRepository repository;

    public RotinaService(RotinaRepository repository) {
        this.repository = repository;
    }

    @Transactional
    public ResponseEntity<String> updateRotina(Long id, Rotina rotina) {
        Optional<Rotina> rotinaOptional = repository.findById(id);
        if (rotinaOptional.isPresent()) {
            rotina.setId(id); // Assegura que o ID da rotina está correto
            repository.save(rotina); // Atualiza a rotina no banco de dados
            return ResponseEntity.ok("Rotina atualizada com sucesso!");
        } else {
            return ResponseEntity.notFound().build(); // Rotina não encontrada
        }
    }

    @Transactional(readOnly = true)
    public Optional<Rotina> getRotina(Long id) {
        return repository.findById(id); // Retorna a rotina com o ID especificado, se existir
    }

    @Transactional
    public ResponseEntity<String> save(Rotina rotina) {
        repository.save(rotina); // Salva a nova rotina no banco de dados
        return ResponseEntity.ok("Rotina salva com sucesso!");
    }

    @Transactional(readOnly = true)
    public ResponseEntity<List<Rotina>> listarRotinasAtivas() {
        List<Rotina> rotinasAtivas = repository.findByStatus(true); // Obtém todas as rotinas ativas
        return ResponseEntity.ok(rotinasAtivas);
    }

    @Transactional(readOnly = true)
    public ResponseEntity<List<Rotina>> listarRotinas() {
        List<Rotina> todasRotinas = repository.findAll(); // Obtém todas as rotinas
        return ResponseEntity.ok(todasRotinas);
    }

    @Transactional
    public ResponseEntity<String> deleteRotina(Long id) {
        Optional<Rotina> rotinaOptional = repository.findById(id);
        if (rotinaOptional.isPresent()) {
            repository.deleteById(id); // Remove a rotina com o ID especificado
            return ResponseEntity.ok("Rotina deletada com sucesso!");
        } else {
            return ResponseEntity.notFound().build(); // Rotina não encontrada
        }
    }
}
