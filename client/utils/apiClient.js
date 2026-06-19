import toast from "react-hot-toast";

const TOKEN_KEY = "carcontrol_token";

export class ApiClient {

    static instance = null
    baseUrl = "https://carcontrol-backend.onrender.com"

    constructor() {
        if(ApiClient.instance != null) {
            throw new Error("ApiClient já foi instanciado!!!")
        }
    }

    static getInstance() {
        if(ApiClient.instance == null) {
            ApiClient.instance = new ApiClient();
        }
        return ApiClient.instance;
    }

    getHeaders() {
        const headers = { "Content-Type": "application/json" };
        const token = typeof window !== "undefined" ? localStorage.getItem(TOKEN_KEY) : null;
        if (token) headers["Authorization"] = `Bearer ${token}`;
        return headers;
    }

    setToken(token) {
        if (typeof window !== "undefined") {
            localStorage.setItem(TOKEN_KEY, token);
        }
    }

    removeToken() {
        if (typeof window !== "undefined") {
            localStorage.removeItem(TOKEN_KEY);
        }
    }

    async get(endpoint) {
        const response = await fetch(this.baseUrl + endpoint, {
            method: "GET",
            headers: this.getHeaders(),
        })
        return await this.checarResposta(response);
    }

    async post(endpoint, body) {
        try {
            const response = await fetch(this.baseUrl + endpoint, {
                method: "POST",
                headers: this.getHeaders(),
                body: JSON.stringify(body)
            })
            return await this.checarResposta(response);
        } catch (err) {
            throw err;
        }
    }

    async put(endpoint, body) {
        const response = await fetch(this.baseUrl + endpoint, {
            method: "PUT",
            headers: this.getHeaders(),
            body: JSON.stringify(body)
        })
        return await this.checarResposta(response);
    }

    async delete(endpoint) {
        const response = await fetch(this.baseUrl + endpoint, {
            method: "DELETE",
            headers: this.getHeaders()
        })
        return await this.checarResposta(response);
    }

    async patch(endpoint, body) {
        const response = await fetch(this.baseUrl + endpoint, {
            method: "PATCH",
            headers: this.getHeaders(),
            body: JSON.stringify(body)
        })
        return await this.checarResposta(response);
    }

    async postFormData(endpoint, body) {
        const headers = {};
        const token = typeof window !== "undefined" ? localStorage.getItem(TOKEN_KEY) : null;
        if (token) headers["Authorization"] = `Bearer ${token}`;
        const response = await fetch(this.baseUrl + endpoint, {
            method: "POST",
            headers,
            body: body
        })
        return await this.checarResposta(response);
    }

    async checarResposta(response) {
        if(response.ok) {
            const json = await response.json();
            return json;
        }
        else{
            let resposta = await response.json();
            console.log(`Erro ao realizar requisição! HTTP Status: ${response.status}`)
            if(response.status != 401) {
                if(resposta.msg) {
                    toast.error(resposta.msg);
                }
                else{
                    toast.error(`Erro ao realizar requisição! HTTP Status: ${response.status}`);
                }
            }
        }
    }
}

export const apiClient = ApiClient.getInstance();
