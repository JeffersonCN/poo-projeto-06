package com.fatecpg.data;

import br.com.fatecpg.helpers.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class Partida {

    private Integer _id;
    private Integer _pontuacao;
    private Date _data;
    private Integer _usuarioId;

    // ### CONSTRUTORES ###
    public Partida(Integer _id, Integer _pontuacao, Date _data, Integer _usuarioId) {
        this._id = _id;
        this._pontuacao = _pontuacao;
        this._data = _data;
        this._usuarioId = _usuarioId;
    }

    public Partida(Integer _pontuacao, Date _data, Integer _usuarioId) {
        this._pontuacao = _pontuacao;
        this._data = _data;
        this._usuarioId = _usuarioId;
    }

    // ### GETTERS E SETTERS ###
    public Integer getId() {
        return _id;
    }

    public Integer getPontuacao() {
        return _pontuacao;
    }

    public void setPontuacao(Integer _pontuacao) {
        this._pontuacao = _pontuacao;
    }

    public Date getData() {
        return _data;
    }

    public void setData(Date _data) {
        this._data = _data;
    }

    public Integer getUsuarioId() {
        return _usuarioId;
    }

    public void setUsuarioId(Integer _usuarioId) {
        this._usuarioId = _usuarioId;
    }

    // ### OPERAÇÕES NO BANCO ###
    // ------- CREATE ---------------------
    // Insere o registro no banco de dados de acordo com os atributos do objeto
    public boolean store() throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            try {
                Statement statement = connection.createStatement();
                String SQL = String.format(
                        "INSERT INTO PARTIDA(PONTUACAO, DT_PARTIDA, USUARIO_ID) VALUES('%d', %t, %d)",
                        this._pontuacao, this._data, this._usuarioId);

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

    // ------- READ -----------------------
    // Busca uma partida pelo ID
    public static Partida find(Integer id) throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement pstatement = connection.prepareStatement(String.format("SELECT * FROM PARTIDA WHERE ID = ?"));
            pstatement.setInt(1, id);

            try (ResultSet result = pstatement.executeQuery()) {
                if (result.next()) {
                    return new Partida(
                            result.getInt("ID"),
                            result.getInt("PONTUACAO"),
                            result.getDate("DT_PARTIDA"),
                            result.getInt("USUARIO_ID")
                    );
                }
            } catch (Exception ex) {
                System.out.println("Erro ao consultar a Partida: " + ex.getMessage());
            }

            connection.close();
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return null;
    }

    // Retorna todas as partidas
    public static ArrayList<Partida> all() throws SQLException {
        ArrayList<Partida> alternativas = new ArrayList<>();

        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery("SELECT * FROM PARTIDA");

            while (result.next()) {
                alternativas.add(new Partida(
                        result.getInt("ID"),
                        result.getInt("PONTUACAO"),
                        result.getDate("DT_PARTIDA"),
                        result.getInt("USUARIO_ID")
                ));
            }
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return alternativas;
    }

    // Retorna todas partidas de um usuário informado pelo ID
    public static ArrayList<Partida> all(int usuarioId) throws SQLException {
        ArrayList<Partida> alternativas = new ArrayList<>();

        try (Connection connection = ConnectionFactory.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery("SELECT * FROM PARTIDA WHERE USUARIO_ID = " + usuarioId);

            while (result.next()) {
                alternativas.add(new Partida(
                        result.getInt("ID"),
                        result.getInt("PONTUACAO"),
                        result.getDate("DT_PARTIDA"),
                        result.getInt("USUARIO_ID")
                ));
            }
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return alternativas;
    }

    // ------- UPDATE ---------------------
    // Atualiza o registro no banco de acordo com as modificações feitas no objeto
    public boolean update() throws SQLException {
        try {
            int linhasAlteradas = 0;
            try (Connection connection = ConnectionFactory.getConnection()) {
                String SQL = String.format(
                        "UPDATE PARTIDA SET PONTUACAO = '%d', DT_PARTIDA = %t, USUARIO_ID = %d WHERE ID = %d",
                        this._pontuacao,
                        this._data,
                        this._usuarioId,
                        this._id
                );

                try (Statement statement = connection.createStatement()) {
                    linhasAlteradas = statement.executeUpdate(SQL);
                } catch (Exception ex) {
                    System.out.println("Erro ao atualizar Partida: " + ex.getMessage());
                }
            }

            return linhasAlteradas > 0;
        } catch (SQLException ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }
        return false;
    }

    // ------- DELETE ---------------------
    // Remove registro do banco de dados
    public boolean delete() throws SQLException {
        try (Connection connection = ConnectionFactory.getConnection()) {
            try (PreparedStatement pstatement = connection.prepareStatement("DELETE FROM PARTIDA WHERE ID = ?")) {
                pstatement.setInt(1, this._id);
                pstatement.execute();
            } catch (Exception ex) {
                System.out.println("Erro ao excluir a Partida: " + ex.getMessage());
            }

            connection.close();

            if (Partida.find(this._id) == null) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return false;
    }
    
    // ### RELACIONAMENTOS ###
    public boolean registrarAlternativaEscolhida(int alternativaId) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            try (PreparedStatement pstatement = connection.prepareStatement("INSERT INTO ALTERNATIVA_PARTIDA(ALTERNATIVA_ID, PARTIDA_ID) VALUES(?, ?)")) {
                pstatement.setInt(1, alternativaId);
                pstatement.setInt(2, this._id);
                pstatement.execute();
                
                pstatement.close();
                connection.close();
                
                return true;
            } catch (Exception ex) {
                System.out.println("Erro ao registrar a resposta: " + ex.getMessage());
            }
            
            connection.close();
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return false;
    }
    
    public ArrayList<Alternativa> getAlternativasEscolhidas() {
        ArrayList<Alternativa> alternativas = null;
        
        try (Connection connection = ConnectionFactory.getConnection()) {
            try (PreparedStatement pstatement = connection.prepareStatement("SELECT ALTERNATIVA_ID FROM ALTERNATIVA_PARTIDA WHERE PARTIDA_ID = ?")) {
                pstatement.setInt(1, this._id);
                pstatement.execute();
                
                ResultSet result = pstatement.getResultSet();
                
                alternativas = new ArrayList<>();
                
                if(result.next()) {
                    alternativas.add(new Alternativa(
                            result.getString("TEXTO"), 
                            result.getBoolean("CORRETA"),
                            result.getInt("QUESTAO_ID")
                    ));
                }
                
                pstatement.close();
                connection.close();
            } catch (Exception ex) {
                System.out.println("Erro ao consultar as respostas: " + ex.getMessage());
            }
        } catch (Exception ex) {
            System.out.println("Erro ao obter conexão com o banco de dados: " + ex.getMessage());
        }

        return alternativas;
    }
    
    public void calculaPontuacao() {
        ArrayList<Alternativa> alternativas = this.getAlternativasEscolhidas();
        this._pontuacao = 0;
        
        for(Alternativa alternativa : alternativas) {
            this._pontuacao += alternativa.isCorreta() ? 1 : 0;
        }
    }
}
