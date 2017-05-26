package com.fatecpg.data;

public class Perfil {
    private int id;
    private String papel;

    public Perfil(int id, String papel) {
        this.setId(id);
        this.setPapel(papel);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }
    
}
