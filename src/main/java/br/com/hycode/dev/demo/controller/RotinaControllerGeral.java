package br.com.hycode.dev.demo.controller;

import br.com.hycode.dev.demo.model.Rotina;
import br.com.hycode.dev.demo.service.RotinaService;
import br.com.hycode.dev.demo.utils.RotinaLinux;
import br.com.hycode.dev.demo.utils.RotinaWindows;
import jakarta.persistence.*;
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


    private final int STO_MIN = 60000;
    private final int STO_DAY = 86400000;
    private final RotinaService service;

    private List<Map<String, Object>> listMapTaskActive;
    private LocalDateTime syncDateTime;

    @Autowired
    public RotinaControllerGeral(RotinaService service) {
        this.service = service;

    }

    @Scheduled(fixedDelay = STO_DAY )
    @GetMapping("/sync")
    public ResponseEntity<String> sync() {
        List<Rotina> rotinaList = listarRotinasAtivas().getStatusCode() == HttpStatus.OK ? listarRotinasAtivas().getBody(): null;
        if(rotinaList != null){
            List<Map<String, Object>> auxiliar = new ArrayList<>();
            for(Rotina rotina : rotinaList){
                if(rotina.getId() != 404){
                Map<String, Object> rotinaMap = new HashMap<>();
                rotinaMap.put("timetask", rotina.getTimetask());
                rotinaMap.put("id", rotina.getId());
                auxiliar.add(rotinaMap);

                }
            }
            listMapTaskActive = auxiliar;
            syncDateTime = LocalDateTime.now();
            return ResponseEntity.ok().body(syncDateTime.toString());
        }
        return ResponseEntity.badRequest().body("");

    }



    @PostMapping("/update/{id}")
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

    @Scheduled(fixedDelay = STO_MIN )
    public void sysRotina() {
        if(listMapTaskActive == null) {
            return;
        }
        LocalTime now = LocalTime.now();
        System.out.println("local time is " + now);
        for(Map<String, Object> rotinaAtiva : this.listMapTaskActive){
            LocalTime timeTask = (LocalTime) rotinaAtiva.get("timetask");
            System.out.println("id "+rotinaAtiva.get("id")+" time task is "+ rotinaAtiva.get("timetask"));
            if (now.getHour() == timeTask.getHour() && now.getMinute() == timeTask.getMinute()) {
                System.out.println("funcionou");
                Optional<Rotina> rotinaOptional = service.getRotina((Long) rotinaAtiva.get("id"));
                if(rotinaOptional.isPresent()){
                    if(rotinaOptional.get().getOperationalSystem().equals("windows")){
                        RotinaWindows rotinaWindows = new RotinaWindows();
                        String resultado = rotinaWindows.executarRotina(rotinaOptional.get());
                        System.out.println("executado rotina "+rotinaOptional.get().getName()+" as "+ now +" os resultados foram \n" + resultado);

                    }
                    if(rotinaOptional.get().getOperationalSystem().equals("linux")){
                        RotinaLinux rotinaLinux = new RotinaLinux();
                        String resultado = rotinaLinux.executarRotina(rotinaOptional.get());
                        System.out.println("executado rotina "+rotinaOptional.get().getName()+" as "+ now +" os resultados foram \n" + resultado);
                    }
                }
            }
        }
    }


    @PostMapping("/Singlecommand")
    public ResponseEntity<String> comandoUnico(Map<String, String> commands) {
        String operationalSystem = commands.get("operationalsystem");
        List<String> comandos = Collections.singletonList(commands.get("commands"));

        Rotina rotina = new Rotina();
        rotina.setName("unitaria");
        rotina.setCommands(comandos);
        rotina.setDescription("rotina unitaria");
        rotina.setOperationalSystem(operationalSystem);


        if (operationalSystem.equals("windows")) {
            RotinaWindows rotinaWindows = new RotinaWindows();
            String resultado = rotinaWindows.executarRotina(rotina);
            return ResponseEntity.ok(resultado);
        }
        if (operationalSystem.equals("linux")) {
            RotinaLinux rotinaLinux = new RotinaLinux();
            String resultado = rotinaLinux.executarRotina(rotina);
            return ResponseEntity.ok(resultado);
        }
        return ResponseEntity.badRequest().body("invalid operational system");
    }








}
