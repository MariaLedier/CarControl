import { NextResponse } from 'next/server'

export function middleware(request) {
    // Verificacao de autenticacao feita no cliente via userContext
    // O cookie ou token localStorage é verificado pelo userContext
    return NextResponse.next()
}

export const config = {
    matcher: ['/dashboard/:path*']
}
