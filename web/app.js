function triggerReroute() {
    const map = document.getElementById('map-status');
    map.style.background = '#fef2f2';
    map.style.color = '#991b1b';
    map.innerHTML = '🚨 Embouteillage Détecté sur Boulevard Lagunaire ! Recalcul de l\'itinéraire en cours...';

    setTimeout(() => {
        map.style.background = '#ecfdf5';
        map.style.color = '#065f46';
        map.innerHTML = '⚡ Nouveau Trajet Optimisé via Échangeur Nord : ETA préservé (15 min) — Gain CO2 : +3.2 kg';
    }, 1200);
}
