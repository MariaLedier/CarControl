import '../public/template/css/sb-admin-2.min.css';
import '../public/template/css/fontawesome-free/css/all.min.css'
import { Nunito } from "next/font/google";
import "./globals.css";
import { Toaster } from 'react-hot-toast';
import { UserProvider } from '@/app/context/userContext.jsx';

const nunito = Nunito({ subsets: ['latin'] })

export const metadata = {
  title: "CarControl",
  description: "Controle de Frotas — Controle · Gestão · Confiança",
  icons: {
    icon: "/logo.png",
    apple: "/logo.png",
  },
  viewport: "width=device-width, initial-scale=1",
};

export default function RootLayout({ children }) {
  return (

    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="/template/js/jquery.min.js"></script>
        <script src="/template/js/bootstrap.bundle.min.js"></script>
        <script src="/template/js/sb-admin-2.min.js"></script>
      </head>
      <body>
        <UserProvider>
          <Toaster />
          {children}
        </UserProvider>

      </body>
    </html>

  );
}
