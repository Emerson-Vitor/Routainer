package br.com.hycode.dev.demo.service;

import br.com.hycode.dev.demo.model.Rotina;
import br.com.hycode.dev.demo.repository.RotinaRepository;
import br.com.hycode.dev.demo.utils.RotinaWindows;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class RotinaService {

    private final RotinaRepository repository;

    public RotinaService(RotinaRepository repository) {
        this.repository = repository;
    }

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

    public Optional<Rotina> getRotina(Long id) {
        return repository.findById(id); // Retorna a rotina com o ID especificado, se existir
    }

    public ResponseEntity<String> save(Rotina rotina) {
        repository.save(rotina); // Salva a nova rotina no banco de dados
        return ResponseEntity.ok("Rotina salva com sucesso!");
    }

    public ResponseEntity<List<Rotina>> listarRotinasAtivas() {
        List<Rotina> rotinasAtivas = repository.findByStatusTrue(); // Obtém todas as rotinas ativas
        return ResponseEntity.ok(rotinasAtivas);
    }

    public ResponseEntity<List<Rotina>> listarRotinas() {
        List<Rotina> todasRotinas = repository.findAll(); // Obtém todas as rotinas
        return ResponseEntity.ok(todasRotinas);
    }

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
