package com.fatecpg.data;

public class Questao {
    private int id;
    private String texto;
    //opcoes
    
    public Questao(int id, String texto) {
        this.setId(id);
        this.setTexto(texto);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
    
}
