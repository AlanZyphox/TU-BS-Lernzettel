#set text(font: "Inter", size: 1.25em)
#set grid(column-gutter: 1em, row-gutter: 1em)
#set page(margin: 4em)
#set quote(block: true) // actually show attribution in quotes
#show link: underline

#align(center, text([Software Engineering], weight: "bold", size: 16pt))

#outline()

// apparently the outline header is a heading and so this must be here
#show heading.where(level: 1): content => [#pagebreak();#content]

= Virtuelle Maschinen

== Semantische Lücke

#quote(
    [
        The difference between the complex operations performed by high-level language constructs and the simple ones provided by computer instruction sets.

        It was in an attempt to try to close this gap that computer architects designed increasingly complex instruction set computers.
    ],
    attribution: [https://hyperdictionary.com/computing/semantic-gap],
)

Schließen der semantischen Lücke durch #link(<Interpreter>, [Interpreter]) und #link(<Compiler>, [Compiler])

== Multiplexer und Virtualisierer

- Angebot einer erweiterten Maschinenschnittstelle (teilinterpretierte virtuelle Maschine $E_3$) für Programme / Anwender
- Durchgabe des Befehlssatzes der Hardware ($E_2$) und Erweiterung um weitere Syscalls
- Virtualisierung (Mehrbenutzerbetrieb) der Ressourcen der Hardware (Prozesse, Speicher, IO-Geräte,...)
- Isolierung der virtuellen Hardwareressourcen durch räumliche und zeitliche Schutzmechanismen voneinander (Mehrbenutzerbetrieb)
- Repräsentation der virtuellen Hardwareressourcen durch grundlegenden Konzepte (Abstraktionen) eines Betriebssystems
    - Prozess (Adressraum & Fäden): virtueller Computer
    - Datei: virtuelles Peripheriegerät

#image("Multiplexing.png")

=== Schutzmechanismen

- horizontale Isolation: Prozesse mit jeweils eigenem Adressraum und Fäden
- vertikale Isolation: Aufteilung in Benutzer- und Systemmodus
    - Benutzermodus:
        - spezieller CPU-Modus
        - Interpretation von $E_2$ Anweisungen vom Betriebssystem anstatt Durchgabe
        - Manipulation von Adressräumen -> räumliche Isolation, Speicher
        - Manipulation der Unterbrechungsbehandlung -> zeitliche Isolation, CPU
    - Systemmodus:
        - Verfügbarkeit aller $E_2$ Anweisungen

- Anwenderprozesse immer im Nutzermodus
- Systemdienste (teilweise) im Systemmodus

== Ebenen

Jede Ebene wird durch einen spezifischen Prozessor implementiert

Ebene n:
- virtuelle Maschine $M_n$ mit Maschinensprache $S_n$
- Programme in $S_n$ werden von einem auf einer tieferen Maschine laufenden Interpreter gedeutet oder in Programme tieferer Maschinen übersetzt

Ebene 0:
- Programme in $S_0$ werden direkt von der Hardware ausgeführt

Überetzung und Interpretation als Techniken zur Ausführung von Programmen (auch in Kombination)

== Interpreter <Interpreter>

#underline([Softwareprozessor])

Transformation eines Programms in Quellsprache in semantisch äquivalente Form einer Zielsprache

== Compiler <Compiler>

#underline([Hard-, Firm-, oder Softwareprozessor])

Direkte Ausführung von Programmen

Gegebenfalls Vorübersetzung durch einen Kompiler für günstige Repräsentation der Programme

== Maschinenmodell

- *Speicher & Objekte*: Wie kann man Daten ablegen und wieder aufrufen?
- *Befehle & Operationen*: Wie kann man Daten miteinander kombinieren?
-> Implementation durch einen "Prozessor" (#link(<Interpreter>, [Interpreter]) oder #link(<Compiler>, [Compiler]))

= Aufgabenteilung

#align(center, [
    Anwendungen

    #sym.arrow.b System Calls

    Betribssystem-Server\
    Betribssystem-Kern

    #sym.arrow.t Interrupts

    Hardware
])

== Anwendungen

"Userland"

Bereitstellung von weitergehenden Diensten, Programmen, und Bibliotheken zur Verwendung und Steuerung des Betriebssystems durch Nutzer

- Bibliotheken
- Dienste
- Shells
- Utilities

== Betribssystem-Server

Erweiterung der Abstraktionen und Bereitstellung von Strategien zur Verwaltung und Zuteilung der (virtuellen) Hardwareressourcen and Benutzer und Prozesse

- Prozessverwaltung
- Dateisysteme (VFS)
- Speicherverwaltung
- Gerätesteuerung

== Betribssystem-Kern

Steuerung der grundlegenden Mechanismen für Multiplexing und Isolation der Hardwareressourcen

- Prozessfäden
- Signale & IPC
- Synchronisation
- Adressräume Speicher
- Gerätezugriff
