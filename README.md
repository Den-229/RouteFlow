# RouteFlow — Gestion Logistique, Tournées & Suivi GPS Temps Réel

RouteFlow est une plateforme complète pour l'optimisation des livraisons, le dispatching, l'assignation de chauffeurs et le suivi temps réel.

## Architecture
- **Web Next.js/HTML5** : Dashboard logistique, carte temps réel, planificateur de tournées.
- **Backend Laravel 11 API** : API `/api/v1/`, WebSockets, calcul d'ETA, géolocalisation.
- **Mobile React Native** : Feuille de route livreur, GPS, scan QR, signature électronique.

## Database Tables
`users`, `drivers`, `vehicles`, `customers`, `orders`, `delivery_stops`, `routes`, `route_events`, `locations`, `proofs`, `incidents`.
