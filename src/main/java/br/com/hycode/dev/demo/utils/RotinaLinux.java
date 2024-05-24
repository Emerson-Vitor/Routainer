package br.com.hycode.dev.demo.utils;

import br.com.hycode.dev.demo.model.Rotina;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;

public class RotinaLinux implements RotinaSistemaOperacional {

    @Override
    public void criarExecutavel(List<String> comandos, String shellFileName) {
        String shellFilePath = System.getProperty("user.dir") + File.separator + shellFileName;
        try (BufferedWriter writer = Files.newBufferedWriter(Path.of(shellFilePath), StandardCharsets.UTF_8)) {
            writer.write("#!/bin/bash");
            writer.newLine();
            for (String cmd : comandos) {
                writer.write(cmd);
                writer.newLine();
            }
            writer.write("echo");
        } catch (IOException e) {
            throw new RuntimeException("Erro ao criar arquivo shell: " + e.getMessage(), e);
        }
    }

    @Override
    public String executarRotina(Rotina rotina) {
        StringBuilder output = new StringBuilder();
        try {
            String shellFileName = rotina.getName() + ".sh";
            criarExecutavel(rotina.getCommands(), shellFileName);
            String shellFilePath = System.getProperty("user.dir") + File.separator + shellFileName;

            ProcessBuilder processBuilder = new ProcessBuilder("bash", shellFilePath);
            Process process = processBuilder.start();

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    output.append(line).append("\n");
                }
            }

            int exitCode = process.waitFor();
            output.append("Exit Code: ").append(exitCode);
        } catch (IOException | InterruptedException e) {
            return "Erro ao executar o comando: " + e.getMessage();
        } finally {
            // Deletar o arquivo shell após a execução
            try {
                Files.deleteIfExists(Path.of(System.getProperty("user.dir") + File.separator + rotina.getName() + ".sh"));
            } catch (IOException e) {
                // Se não for possível excluir o arquivo, apenas imprima a exceção
                e.printStackTrace();
            }
        }

        return output.toString();
    }

    // Testes
//    public static void main(String[] args) {
//        // Criando uma instância de Rotina para teste
//        Rotina rotina = new Rotina();
//        rotina.setName("Teste");
//        rotina.setCommands(Arrays.asList("echo Hello World!", "ls"));
//
//        // Criando uma instância de RotinaLinux
//        RotinaLinux rotinaLinux = new RotinaLinux();
//
//        // Executando a rotina e imprimindo o resultado
//        String resultado = rotinaLinux.executarRotina(rotina);
//        System.out.println(resultado);
//    }
}
