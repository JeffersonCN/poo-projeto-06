package com.fatecpg.data;

import java.util.Date;

public class Partida {
    private int id;
    private int pontuacao;
    private Date data;
    //questao ou opcao?
    
    public Partida(int id, int pontuacao, Date data) {
        this.setId(id);
        this.setPontuacao(pontuacao);
        this.setData(data);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
    
    
}
