package com.fatecpg.data;

public class Questao {
    private int id;
    private String texto;
    private boolean correta;

    public Questao(int id, String texto, boolean correta) {
        this.setId(id);
        this.setTexto(texto);
        this.setCorreta(correta);
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

    public boolean isCorreta() {
        return correta;
    }

    public void setCorreta(boolean correta) {
        this.correta = correta;
    }

    
}