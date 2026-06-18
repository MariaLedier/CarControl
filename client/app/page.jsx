"use client"

import { useRouter } from "next/navigation"
import Image from "next/image"

export default function Home() {
  const router = useRouter()

  const features = [
    { icon: "⛽", title: "Abastecimento", desc: "Registre abastecimentos com controle de KM, litros, consumo médio e forma de pagamento." },
    { icon: "🔧", title: "Manutenção", desc: "Gerencie ordens de serviço, itens de manutenção, oficinas e histórico por veículo." },
    { icon: "🔄", title: "Troca de Pneus", desc: "Controle rodízios, substituições e o ciclo de vida de cada pneu por posição." },
    { icon: "👥", title: "Gestão de Usuários", desc: "Administre perfis de acesso e vincule cada registro ao responsável pela operação." },
    { icon: "⭐", title: "Qualidade de Pneus", desc: "Acompanhe desgaste, desempenho e qualidade dos pneus em uso na frota." },
    { icon: "📊", title: "Relatórios", desc: "Gere relatórios de abastecimento, manutenção e pneus com filtros por período." },
  ]

  return (
    <div style={s.page}>

      {/* NAVBAR */}
      <nav style={s.nav}>
        <div style={s.navLogo}>
          <Image src="/logo.png" alt="CarControl" width={140} height={50} priority style={{ objectFit: "contain", height: "auto" }} />
        </div>
        <div style={s.navRight}>
          <a href="#features" style={s.navLink}>Funcionalidades</a>
          <button onClick={() => router.push("/login")} style={s.navBtn}>Entrar →</button>
        </div>
      </nav>

      {/* HERO */}
      <section style={s.hero}>
        <div style={s.heroBadge}>Sistema de Gestão de Frotas</div>
        <h1 style={s.heroTitle}>
          Controle total<br />
          <span style={s.heroHighlight}>da sua frota</span>
        </h1>
        <p style={s.heroSub}>
          CarControl reúne em um só lugar abastecimento, manutenção, pneus e relatórios — tudo integrado para uma gestão eficiente.
        </p>
        <div style={s.heroBtns}>
          <button onClick={() => router.push("/login")} style={s.btnPrimary}>
            Acessar o Sistema →
          </button>
          <a href="#features" style={s.btnSecondary}>Ver funcionalidades</a>
        </div>

        <div style={s.stats}>
          {[{ v: "6+", l: "Módulos" }, { v: "3", l: "Relatórios" }, { v: "✓", l: "Controle total" }].map(x => (
            <div key={x.l} style={s.statItem}>
              <div style={s.statV}>{x.v}</div>
              <div style={s.statL}>{x.l}</div>
            </div>
          ))}
        </div>
      </section>

      {/* FEATURES */}
      <section id="features" style={s.section}>
        <h2 style={s.secTitle}>Tudo que sua frota precisa</h2>
        <p style={s.secSub}>Módulos integrados para uma gestão completa e eficiente</p>
        <div style={s.grid}>
          {features.map(f => (
            <div key={f.title} style={s.card}>
              <div style={s.cardIcon}>{f.icon}</div>
              <h3 style={s.cardTitle}>{f.title}</h3>
              <p style={s.cardDesc}>{f.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      <section style={s.cta}>
        <div style={s.ctaInner}>
          <h2 style={s.ctaTitle}>Pronto para começar?</h2>
          <p style={s.ctaSub}>Acesse o sistema e comece a gerenciar sua frota agora mesmo.</p>
          <button onClick={() => router.push("/login")} style={s.ctaBtn}>
            Entrar no CarControl →
          </button>
        </div>
      </section>

      {/* FOOTER */}
      <footer style={s.footer}>
        <Image src="/logo.png" alt="CarControl" width={100} height={36} style={{ objectFit: "contain", height: "auto", filter: "brightness(0) invert(1)", opacity: 0.6 }} />
        <p style={s.footerTxt}>Controle · Gestão · Confiança</p>
      </footer>

      {/* RESPONSIVE STYLES */}
      <style>{`
        @media (max-width: 640px) {
          .hero-title { font-size: 38px !important; }
          .hero-btns { flex-direction: column !important; align-items: stretch !important; }
          .hero-btns a, .hero-btns button { text-align: center !important; }
          .features-grid { grid-template-columns: 1fr !important; }
          .nav-link { display: none !important; }
          .stats-row { gap: 24px !important; }
        }
      `}</style>
    </div>
  )
}

const s = {
  page: { minHeight: "100vh", background: "#0f172a", color: "#f1f5f9", fontFamily: "'Segoe UI', sans-serif" },

  nav: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    padding: "16px 32px", borderBottom: "1px solid rgba(255,255,255,0.07)",
    position: "sticky", top: 0, background: "rgba(15,23,42,0.96)",
    backdropFilter: "blur(12px)", zIndex: 100,
  },
  navLogo: { display: "flex", alignItems: "center" },
  navRight: { display: "flex", alignItems: "center", gap: "20px" },
  navLink: { color: "#94a3b8", textDecoration: "none", fontSize: "14px", fontWeight: "500" },
  navBtn: {
    background: "#2563eb", color: "#fff", border: "none", padding: "9px 18px",
    borderRadius: "8px", fontSize: "14px", fontWeight: "700", cursor: "pointer",
  },

  hero: {
    textAlign: "center", padding: "80px 20px 70px", maxWidth: "760px", margin: "0 auto",
  },
  heroBadge: {
    display: "inline-block", background: "rgba(37,99,235,0.18)", color: "#60a5fa",
    border: "1px solid rgba(37,99,235,0.35)", borderRadius: "20px",
    padding: "5px 16px", fontSize: "12px", fontWeight: "600", marginBottom: "24px", letterSpacing: "0.5px",
  },
  heroTitle: {
    fontSize: "52px", fontWeight: "900", lineHeight: "1.15", margin: "0 0 20px", color: "#f1f5f9",
    className: "hero-title",
  },
  heroHighlight: { color: "#3b82f6" },
  heroSub: { fontSize: "16px", color: "#94a3b8", lineHeight: "1.7", margin: "0 auto 36px", maxWidth: "520px" },
  heroBtns: {
    display: "flex", gap: "14px", justifyContent: "center", flexWrap: "wrap",
    marginBottom: "56px", className: "hero-btns",
  },
  btnPrimary: {
    background: "linear-gradient(135deg, #2563eb, #1d4ed8)", color: "#fff",
    border: "none", padding: "14px 28px", borderRadius: "10px",
    fontSize: "15px", fontWeight: "700", cursor: "pointer",
    boxShadow: "0 6px 20px rgba(37,99,235,0.4)",
  },
  btnSecondary: {
    background: "rgba(255,255,255,0.07)", color: "#cbd5e1",
    border: "1px solid rgba(255,255,255,0.12)", padding: "14px 28px",
    borderRadius: "10px", fontSize: "15px", fontWeight: "600",
    cursor: "pointer", textDecoration: "none", display: "inline-block",
  },
  stats: { display: "flex", justifyContent: "center", gap: "40px", borderTop: "1px solid rgba(255,255,255,0.07)", paddingTop: "36px" },
  statItem: { textAlign: "center" },
  statV: { fontSize: "30px", fontWeight: "900", color: "#3b82f6" },
  statL: { fontSize: "12px", color: "#64748b", marginTop: "4px", fontWeight: "500" },

  section: { padding: "72px 20px", background: "#0f172a" },
  secTitle: { fontSize: "32px", fontWeight: "800", textAlign: "center", marginBottom: "10px", color: "#f1f5f9" },
  secSub: { fontSize: "15px", color: "#64748b", textAlign: "center", marginBottom: "48px" },
  grid: {
    display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))",
    gap: "20px", maxWidth: "1100px", margin: "0 auto",
  },
  card: {
    background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.08)",
    borderRadius: "16px", padding: "26px",
  },
  cardIcon: { fontSize: "32px", marginBottom: "14px" },
  cardTitle: { fontSize: "17px", fontWeight: "700", marginBottom: "8px", color: "#e2e8f0" },
  cardDesc: { fontSize: "13px", color: "#64748b", lineHeight: "1.7", margin: 0 },

  cta: { padding: "72px 20px", background: "rgba(37,99,235,0.08)", borderTop: "1px solid rgba(37,99,235,0.15)" },
  ctaInner: { textAlign: "center", maxWidth: "560px", margin: "0 auto" },
  ctaTitle: { fontSize: "30px", fontWeight: "800", marginBottom: "12px", color: "#f1f5f9" },
  ctaSub: { fontSize: "15px", color: "#94a3b8", marginBottom: "32px" },
  ctaBtn: {
    background: "linear-gradient(135deg, #2563eb, #1d4ed8)", color: "#fff",
    border: "none", padding: "16px 36px", borderRadius: "12px",
    fontSize: "16px", fontWeight: "700", cursor: "pointer",
    boxShadow: "0 8px 24px rgba(37,99,235,0.35)",
  },

  footer: {
    borderTop: "1px solid rgba(255,255,255,0.06)", padding: "32px 20px",
    background: "#080f1f", textAlign: "center",
  },
  footerTxt: { fontSize: "12px", color: "#334155", marginTop: "10px" },
}
