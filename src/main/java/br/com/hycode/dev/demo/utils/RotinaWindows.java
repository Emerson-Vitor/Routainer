package br.com.hycode.dev.demo.utils;

import br.com.hycode.dev.demo.model.Rotina;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;

public class RotinaWindows implements RotinaSistemaOperacional {

    @Override
    public void criarExecutavel(List<String> comandos, String batchFileName) {
        String batchFilePath = System.getProperty("user.dir") + File.separator + batchFileName;
        try (BufferedWriter writer = Files.newBufferedWriter(Path.of(batchFilePath), StandardCharsets.UTF_8)) {
            writer.write("@echo off");
            writer.newLine();
            for (String cmd : comandos) {
                writer.write(" " + cmd);
                writer.newLine();
            }
            writer.write("echo.");
            writer.newLine();
            writer.write("del \"%~f0\"");
        } catch (IOException e) {
            throw new RuntimeException("Erro ao criar arquivo batch: " + e.getMessage(), e);
        }
    }

    @Override
    public String executarRotina(Rotina rotina) {
        StringBuilder output = new StringBuilder();
        try {
            String batchFileName = rotina.getName() + ".bat";
            criarExecutavel(rotina.getCommands(), batchFileName);
            String batchFilePath = System.getProperty("user.dir") + File.separator + batchFileName;

            ProcessBuilder processBuilder = new ProcessBuilder(batchFilePath);
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
            // Deletar o arquivo batch após a execução
            try {
                Files.deleteIfExists(Path.of(System.getProperty("user.dir") + File.separator + rotina.getName() + ".bat"));
            } catch (IOException e) {
                // Se não for possível excluir o arquivo, apenas imprima a exceção
                e.printStackTrace();
            }
        }

        return output.toString();
    }

    public static void main(String[] args) {
        // Criando uma instância de Rotina para teste
        Rotina rotina = new Rotina();

        rotina.setName("Teste");
        rotina.setCommands(Arrays.asList("echo Hello World!", "dir"));

        // Criando uma instância de RotinaWindows
        RotinaWindows rotinaWindows = new RotinaWindows();

        // Executando a rotina e imprimindo o resultado
        String resultado = rotinaWindows.executarRotina(rotina);
        System.out.println(resultado);
    }
}
