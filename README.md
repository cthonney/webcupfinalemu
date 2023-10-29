# Nom du Projet
Plateforme pour cartographier et informer sur des catastrophes naturelles.

## Table des Matières
- [Technologie](#technologie)
- [Base de Données](#base-de-données)
- [Performances](#performances)
- [Fonctionnalités](#fonctionnalités)
- [Sécurité](#sécurité)
- [UI/UX](#uiux)

## Technologie
- **Serveur**: Phusion Passenger + cPanel
- **Hébergement**: Hodi host
- **Langages**: Ruby 3.1.4, Rails 7.0.8
- **JS Framework**: Stimulus
- **JS Management**: `importmap-rails`

## Base de Données
- SQLite3

## Performances
- Utilisation de ressources < 1GB d'espace disque

## Fonctionnalités
- Connexion à l'API Webcup.fr pour les données en temps réel
- Cartographie des catastrophes via Mapbox
- Tâches en arrière-plan pour:
  - Stockage des données
  - Géocodage des coordonnées en adresses
- Alertes proactives via Twilio pour SMS et WhatsApp

## Sécurité
- Authentification robuste via Devise
- Protection anti-bot avec Recaptcha

## UI/UX
- Design personnalisé avec utilisation minimale de Bootstrap
- Prétraitement CSS via Sass

 
