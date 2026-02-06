#set text(font: "Inter")
#set grid(column-gutter: 1em, row-gutter: 1em)

#align(center, text([Software Engineering], weight: "bold", size: 16pt))

#outline()

// apparently the outline header is a heading and so this must be here
#show heading.where(level: 1): content => [#pagebreak();#content]

= Software

== Charakteristiken

+ keine Ersatzteile
+ kein Verschleiß
+ Alterung
+ schwer zu messen
+ immateriel
+ abstrakt (keine physischen Gesetze)
+ häufige Anpassungen
+ leichtere Anpassung als Hardware

== Kategorien

- Freeware
- Kommerziel
- Open Source
- Closed Source
- UI/API
- System Software
- Application Software

== Code Smells

- Magic Numbers
- Magic Strings
- Duplicate Code
- Shotgun Surgery
    - eine Änderung erzwingt Änderung an anderen Stellen
- Long Method
- Long Parameter List

== Version Control Service (VCS)

#table(
    columns: (1fr, 1fr, 1fr),
    table.header([], [Centralized (CVCS)], [Dezentralized (DVCS)]),
    [Beispiel], [SVN], [Git],
    [Speicherort], [Server], [Lokal + Server mit Historie],
    [Arbeit ohne Netzwerkverbindung], [keine Commits], [lokale Commits],
    [Geschwindigkeit, Sicherheit], [langsam (Netzwerkverbindung benötigt)], [schneller (lokale Backups)],
)

= Testing

== White-Box

- Code bekannt

== Black-Box

- Code unbekannt

== Teststufen

=== Komponententest

Testen von kleinere Komponenten

- Isolierte Funktionen und Klassen

=== Integrationstest

Testen von Zusammenspiel mehrerer Komponenten

- z.B. DB und Service

=== Systemtest

Testen von System gegen Anforderungen

=== Abnahmetest

Prüfung mit Kunde (Stakeholder) ob System Use-Case erfüllt und abnahmefähig ist

= Graphen

== Kontrollflussgraph

=== Zweigüberdeckung

Ablauf aller Kanten

=== Anweisungsüberdeckung

Ablauf aller Knoten

= Lehman's Law of Software

+ Continuous Change
+ Increasing Complexity
+ Self Regulation
+ Conservation of organizational stability
+ Conservation of familiarity
+ Continuous growth
+ Declining quality
+ Feedbakc system

= Software Development Practices

== DevOps

- Dev + Ops
    - Automatisierung bauen, testen, betreiben

== CI/CD

- CI: automatisches Bauen und Testen
- CD: Deployment per Knopfdruch bis in Production

== Configuration Management

Reproduzierbare und standartisierte Infrastruktur und Einstellungen

= Softwareentwicklungsmodelle

== Wasserfallmodell

#let lr = sym.arrow.l.r

#grid(
    columns: 2,
    [], [Requirements Analysis],
    lr, [System and Software Design],
    lr, [Implementation and Unit Testing],
    lr, [Integration and System Testing],
    lr, [Operation and Maintenance],
)

Geeignet für:
- eingebettete Systeme
- große Softwaresysteme
- sicherheitskritische Systeme

Vorteile:
- Einfach zu verstehen und zu Überwachen
- Gut für gemeinsame Entwicklung von Software und kostspieliger Hardware
- Gleiches Modell für Hard- und Software nutzbar

Nachteile:
- Probleme in einer Phase haben Auswirkungen auf folgenden Phasen
- Phasen können nicht parallel bearbeitet werden
- Änderungen in vorherigen Phasen schwer möglich

= Risk- und People Management

== Risk Management

Systematisches Erkennung, Bewertung, und Steuerung von Risiken im Projekt

== People Management

Führung, Motivation, Koordination, Kommunikation, und Weiterentwicklung der Projektmitglieder

- Respekt
- Inklusion
- Ehrlichkeit

= Anforderungen

== Lastenheft

Beschreibung von Anforderungen an das System aus Sicht der Stakeholder

== Pflichtenheft

Beschreibung aus technischer Sicht, wie und womit der Auftragnehmer die Anforderungen umsetzt

== Funktionale Anforderungen

"Was tut das System"

Beispiele:
- Warenkorb
- Bestellung auslösen, Bestellbestätigung
- RBAC
- Registrierung, Einloggen von Nutzern

== Nicht-Funktionale Anforderungen

Beispiele:
- Leistung
- Verfügbarkeit
- Sicherheit
- Skalierbarkeit
- Zuverlässigkeit
- Nutzbarkeit
- Wartbarkeit
- Portability
- Compliance

== Anforderungsmanagement

#grid(
    columns: (1fr, 1em, 1fr, 1em, 1fr, 1em, 1fr),
    align(center, [*Ermittlung*]),
    [->],
    align(center, [*Analyse*]),
    [->],
    align(center, [*Spezifikation*]),
    [->],
    align(center, [*Validierung*]),

    [
        Sammeln von Anforderungen
        - Workshops
        - Interviews
    ],
    [],
    [
        Verstehen, Strukurierung, Analysieren von Anforderungen
        Finden von Unklarheiten
    ],
    [],
    [
        Dokumentationen von Anforderungen
    ],
    [],
    [
        Prüfung von Anforderungen auf Vollständigkeit und Testbarkeit mit Stakeholdern
    ],
)

= Design

== Software Design

- Lösungsentwurf im Codenahen Bereich
- Klassen, Module, Datenstruktur, API's,...

== Architecture Design

- Entwurf der Systemstruktur
- Komponenten, Services, Datenfluss, Tech-Stack, Leistung, Sicherheit,...

== Conway's Law

Die Struktur einer Software spiegelt die Kommunikations- und Teamstruktur wieder

Beispiel:
- Teams: Frontend - Backend - DB
- Softwarestruktur: Frontend - Backend - DB

== Architekturmuster

- Client-Server
- Peer-To-Peer
- Layered Architecture

== Entwurfsmuster

- Erzeugungsmuster
    - Objekterzeugung
- Strukturmuster
    - Klassenstruktur
- Verhaltensmuster
    - Interaktion und Verantwortlichkeit von Objekten
