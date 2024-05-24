package br.com.hycode.dev.demo.utils;

import br.com.hycode.dev.demo.model.Rotina;

import java.util.List;

public interface RotinaSistemaOperacional {
    public void criarExecutavel( List<String> comandos, String batchFilePath);

    public String executarRotina(Rotina rotina);
}
