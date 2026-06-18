import mysql from 'mysql2'

export default class Database {

    #conexao;

    get conexao() { return this.#conexao; } set conexao(conexao) { this.#conexao = conexao; }

    constructor() {

        this.#conexao = mysql.createPool({
            host: 'b7i1t3z2cc2hwsvk8auy-mysql.services.clever-cloud.com',
            user: 'u08giqjtpyy2rbl6',
            password: 'BXZ7a9004qzYppFfEe0e',
            database: 'b7i1t3z2cc2hwsvk8auy',
            port: 3306,
            waitForConnections: true,
            connectionLimit: 10,
            ssl: { rejectUnauthorized: false }
        });
    }

    AbreTransacao() {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query("START TRANSACTION", function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results);
            });
        })
    }

    Rollback() {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query("ROLLBACK", function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results);
            });
        })
    }

    Commit() {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query("COMMIT", function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results);
            });
        })
    }

    ExecutaComando(sql, valores) {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query(sql, valores, function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results);
            });
        })
    }

    ExecutaComandoNonQuery(sql, valores) {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query(sql, valores, function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results.affectedRows > 0);
            });
        })
    }

    ExecutaComandoLastInserted(sql, valores) {
        var cnn = this.#conexao;
        return new Promise(function (res, rej) {
            cnn.query(sql, valores, function (error, results, fields) {
                if (error)
                    rej(error);
                else
                    res(results.insertId);
            });
        })
    }

}


