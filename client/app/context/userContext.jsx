"use client"

import { apiClient } from "@/utils/apiClient";
import { useContext, useState, createContext, useEffect } from "react";

const UserContext = createContext();

export const UserProvider = ({ children }) => {

    const [user, setUser] = useState(null);
    const [loading, setLoading] = useState(true);

    async function carregarUsuario() {
        try {
            const token = typeof window !== "undefined" ? localStorage.getItem("carcontrol_token") : null;
            if (!token) {
                setLoading(false);
                return;
            }
            const res = await fetch(apiClient.baseUrl + "/autenticacao/usuario", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${token}`
                },
            })
            if (res.ok) {
                const data = await res.json()
                setUser(data)
            }
        } catch {
            // sem conexao ou nao logado - silencioso
        }
        setLoading(false)
    }

    async function logout() {
        try {
            await apiClient.post("/autenticacao/logout", {})
        } catch { }
        apiClient.removeToken()
        setUser(null)
        window.location.href = "/login"
    }

    useEffect(() => {
        carregarUsuario()
    }, [])

    return (
        <UserContext.Provider value={{ user, setUser, logout }}>
            {loading ? (
                <div style={{
                    minHeight: "100vh",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    flexDirection: "column",
                    gap: "12px",
                    background: "#f8fafc"
                }}>
                    <div style={{
                        width: "40px",
                        height: "40px",
                        border: "4px solid #e5e7eb",
                        borderTop: "4px solid #2563eb",
                        borderRadius: "50%",
                        animation: "spin 0.8s linear infinite"
                    }} />
                    <p style={{ color: "#6b7280", fontSize: "14px" }}>
                        Carregando...
                    </p>
                </div>
            ) : children}
        </UserContext.Provider>
    )
}

export function useUser() {
    return useContext(UserContext)
}