package br.com.hycode.dev.demo.controller;

import br.com.hycode.dev.demo.model.Rotina;
import br.com.hycode.dev.demo.service.RotinaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@RestController
@RequestMapping("/rotinas")
public class RotinaControllerGeral {


    private final int STO = 60000;

    private final RotinaService service;

    private List<Map<String, Object>> listMapTaskActive;
    private LocalDateTime syncDateTime;

    @Autowired
    public RotinaControllerGeral(RotinaService service) {
        this.service = service;

    }


    @GetMapping("/sync")
    public ResponseEntity<String> sync() {
        List<Rotina> rotinaList = listarRotinasAtivas().getStatusCode() == HttpStatus.OK ? listarRotinasAtivas().getBody(): null;
        if(rotinaList != null){
            List<Map<String, Object>> auxiliar = new ArrayList<>();
            for(Rotina rotina : rotinaList){
                Map<String, Object> rotinaMap = new HashMap<>();
                rotinaMap.put("timetask", rotina.getTimetask());
                rotinaMap.put("id", rotina.getId());
                auxiliar.add(rotinaMap);
            }
            listMapTaskActive = auxiliar;
            syncDateTime = LocalDateTime.now();
            return ResponseEntity.ok().body(syncDateTime.toString());
        }
        return ResponseEntity.badRequest().body("");

    }



    @GetMapping("/update/{id}")
    public ResponseEntity<String> updateRotina(@PathVariable Long id, @RequestBody Rotina rotina){
        return service.updateRotina(id, rotina);
    }

    @GetMapping("/deletar/{id}")
    public ResponseEntity<String> deletarRotina(@PathVariable Long id){
        return service.deleteRotina(id);
    }

    @GetMapping("/listar")
    public ResponseEntity<List<Rotina>> listarRotinas() {
        return service.listarRotinas();
    }

    @GetMapping("/listar/ativas")
    public ResponseEntity<List<Rotina>> listarRotinasAtivas() {
        return service.listarRotinasAtivas();
    }

    @GetMapping("/ativar/{id}")
    public ResponseEntity<String> activeTask(@PathVariable Long id) {
        Optional<Rotina> rotinaOptional = service.getRotina(id);
        if(rotinaOptional.isEmpty()){
            return ResponseEntity.badRequest().body(null);
        }
        rotinaOptional.get().setStatus(false);

        return service.updateRotina(id, rotinaOptional.get());
    }

    @GetMapping("/desativar/{id}")
    public ResponseEntity<String> inactiveTask(@PathVariable Long id) {
        Optional<Rotina> rotinaOptional = service.getRotina(id);
        if(rotinaOptional.isEmpty()){
            return ResponseEntity.badRequest().body(null);
        }
        rotinaOptional.get().setStatus(false);

        return service.updateRotina(id, rotinaOptional.get());
    }

    @GetMapping("/rotina/{id}")
    public ResponseEntity<Rotina> getRotina(@PathVariable Long id){
        Optional<Rotina> rotina = service.getRotina(id);
        if(rotina.isEmpty()){
            return ResponseEntity.badRequest().body(null);
        }
        return ResponseEntity.ok(rotina.get());
    }

    @PostMapping("/criar")
    public ResponseEntity<String> criarRotinas(@RequestBody Rotina rotina) {
        return service.save(rotina);
    }

    @GetMapping("/lasttimesync")
    public LocalDateTime getLastSyncDateTime() {
        return syncDateTime;
    }

    @Scheduled(fixedDelay = STO )
    public void sysRotina() {
        if(listMapTaskActive.isEmpty()){
            return;
        }
        LocalTime now = LocalTime.now();
        System.out.println("local time is " + now);
        for(Map<String, Object> rotinaAtiva : this.listMapTaskActive){
            System.out.println("id "+rotinaAtiva.get("id")+" time task is "+ rotinaAtiva.get("timetask"));
            if(rotinaAtiva.get("timetask") == now){
                //logica
            }
        }
    }





}