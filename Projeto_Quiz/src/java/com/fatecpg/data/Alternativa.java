package com.fatecpg.data;

import br.com.fatecpg.helpers.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Alternativa {
    private Integer _id;
    private String _texto;
    private boolean _correta;
    private int _questaoId;
    
    // ------ CONSTRUTORES --------------
    public Alternativa(String texto, boolean correta, int questionId) {
        this._texto = texto;
        this._correta = correta;
        this._questaoId = questionId;
    }

    public Alternativa(Integer id, String texto, boolean correta, int questionId) {
        this._id = id;
        this._texto = texto;
        this._correta = correta;
        this._questaoId = questionId;
    }

    // ###### GETTERS E SETTERS #######
    public int getId() {
        return _id;
    }

    public String getTexto() {
        return _texto;
    }

    public void setTexto(String texto) {
        this._texto = texto;
    }

    public boolean isCorreta() {
        return _correta;
    }

    public void setCorreta(boolean correta) {
        this._correta = correta;
    }

    public int getQuestaoId() {
        return _questaoId;
    }

    public void setQuestaoId(int _questaoId) {
        this._questaoId = _questaoId;
    }

    //####### OPERAÇÕES NO BANCO #######
    // ------- CREATE ---------------------
    // Insere o registro no banco de dados de acordo com os atributos do objeto
    public boolean store() throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            try {
                Statement statement = connection.createStatement();
                String SQL = String.format("INSERT INTO ALTERNATIVA(TEXTO, CORRECT, QUESTAO_ID) VALUES('%s', %b, %d)", this._texto, this._correta, this._questaoId);

                statement.execute(SQL, Statement.RETURN_GENERATED_KEYS);

                ResultSet rs = statement.getGeneratedKeys();

                if (rs.next()) {
                    this._id = rs.getInt(1);
                }

                rs.close();

                if (this._id != null) {
                    return true;
                }
            } catch (SQLException ex) {
                throw ex;
            }
            connection.close();
        }
        return false;
    }
}