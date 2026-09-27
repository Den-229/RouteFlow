export const API_URL = 'http://10.0.2.2:8000/api/v1'; export async function getHealth() { const r = await fetch(API_URL + '/health'); return r.json(); }
