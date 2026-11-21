local DB

local KEYS = {
  "Skill Levels - Options",
  "Professions",
  "Weapons",
  "Show professions",
  "Show weapons",
  "Secondary professions:",
  "Show together",
  "Separate",
  "Hide",
  "Show class skills",
  "Select skills...",
  "Skill Selection",
  "No active skills found",
  "Only learned skills",
  "Separator:",
  "Order:",
  "Professions > Weapons > Secondary",
  "Professions > Secondary > Weapons",
  "Weapons > Professions > Secondary",
  "Weapons > Secondary > Professions",
  "Secondary > Professions > Weapons",
  "Secondary > Weapons > Professions",
  "Layout:",
  "Combined frame (Vertical)",
  "Side-by-side (Columns right)",
  "Separate frames (Free move)",
  "Color ranges (from - to, color)",
  "Add range",
  "Cap reached - train next rank",
  "Maximum reached",
  "Rainbow mode",
  "Animation:",
  "Anim: Off",
  "Anim: Bounce & Glow",
  "Anim: Float Up",
  "Anim: Wave & Pulse",
  "Anim: Sparkle",
  "Anim: Letter Bounce",
  "Anim: Rainbow Flash",
  "Anim: Custom",
  "Edit...",
  "Animation Editor",
  "Arrow bounce",
  "Bounce height",
  "Star glow / sparkle",
  "Glow brightness",
  "Double sparkle",
  "Counter pulse",
  "Letter bounce (+1n)",
  "Letter bounce height",
  "Letter wave speed",
  "Rainbow flash",
  "Rainbow speed",
  "Test animation",
  "Reset editor",
  "Lock position",
  "Level-up counter",
  "Permanent counter",
  "Show maximum",
  "Text outline",
  "Progress bar",
  "Show all weapons",
  "Select weapons...",
  "Weapon Selection",
  "Select all",
  "Deselect all",
  "Show off-hand weapon",
  "Show ranged weapon",
  "Only equipped weapons",
  "Hide in combat",
  "Hide in instances",
  "Font size",
  "Reset session counter",
  "Reset position",
  "Reset all settings",
  "Profession window function not found",
  "Skill window not found",
  "Language",
  "Automatic",
  "Open Options",
  "Configure profession and weapon skill tracking.",
  "Help & Guide",
  "HELP_BODY",
}

local DATA = {
  deDE = {
    "Skill Levels - Optionen", "Berufe", "Waffen",
    "Berufe anzeigen", "Waffen anzeigen",
    "Nebenberufe:", "Gemeinsam anzeigen", "Trennen", "Ausblenden",
    "Klassenfertigkeiten anzeigen",
    "Fertigkeiten auswählen...", "Fertigkeitenauswahl", "Keine aktiven Fertigkeiten gefunden", "Nur erlernte Fertigkeiten",
    "Trennlinie:",
    "Reihenfolge:",
    "Berufe > Waffen > Nebenberufe",
    "Berufe > Nebenberufe > Waffen",
    "Waffen > Berufe > Nebenberufe",
    "Waffen > Nebenberufe > Berufe",
    "Nebenberufe > Berufe > Waffen",
    "Nebenberufe > Waffen > Berufe",
    "Anordnung:",
    "Gemeinsamer Rahmen (Vertikal)",
    "Nebeneinander (Spalten nach rechts)",
    "Getrennte Rahmen (Frei bewegbar)",
    "Farbbereiche (von - bis, Farbe)", "Bereich hinzufügen",
    "Grenze erreicht - Rang lernen", "Maximum erreicht",
    "Regenbogen-Modus", "Animation:",
    "Aus", "Hüpfen & Leuchten", "Aufsteigen", "Welle & Pulsieren", "Funkeln",
    "Buchstaben-Hüpfen", "Regenbogen-Blitz", "Benutzerdefiniert",
    "Edit...", "Animations-Editor",
    "Pfeil-Hüpfen", "Sprunghöhe", "Stern-Leuchten / Funkeln", "Leuchtstärke",
    "Doppel-Funkeln", "Zähler-Pulsieren", "Buchstaben-Hüpfen (+1n)",
    "Buchstaben-Höhe", "Wellentempo", "Regenbogen-Blitz", "Regenbogen-Tempo",
    "Animation testen", "Editor zurücksetzen",
    "Position sperren", "Level-Up-Zähler",
    "Zähler permanent anzeigen", "Maximum anzeigen", "Textumriss", "Fortschrittsbalken",
    "Alle Waffen anzeigen",
    "Waffen auswählen...", "Waffenauswahl", "Alle wählen", "Alle abwählen",
    "Nebenhand-Waffe anzeigen", "Fernkampfwaffe anzeigen", "Nur angelegte Waffe(n)",
    "Im Kampf ausblenden", "In Instanzen ausblenden",
    "Schriftgröße",
    "Session-Zähler zurücksetzen", "Position zurücksetzen", "Alles zurücksetzen",
    "Berufsfenster-Funktion nicht gefunden", "Fertigkeitenfenster nicht gefunden",
    "Sprache", "Automatisch", "Optionen öffnen",
    "Konfiguriere die Anzeige für Berufs- und Waffenfertigkeiten.",
    "Hilfe & Erklärung",
    "|cff66b3ffFarbbereiche & Status:|r\n"
      .. "• |cffffffffFarbbereiche:|r Färbt deinen Skill je nach aktuellem Wert (z. B. 0–150 Grün).\n"
      .. "• |cffffffffGrenze erreicht:|r Warnfarbe, sobald du beim Lehrer den nächsten Rang lernen musst.\n"
      .. "• |cffffffffMaximum erreicht:|r Farbe beim Erreichen der maximalen Stufe (300).\n\n"
      .. "|cff66b3ffBerufe & Klassenfertigkeiten:|r\n"
      .. "• |cffffffffNebenberufe:|r Kochen, Erste Hilfe, Angeln, Gifte und Verständnis gemeinsam anzeigen, als eigenen Block trennen oder ausblenden.\n"
      .. "• |cffffffffKlassenfertigkeiten:|r Zeigt Schlossknacken (Schurke, solange nicht max).\n"
      .. "• |cffffffffFertigkeiten auswählen:|r Wähle gezielt aus deinen aktuell aktiven Berufen/Fertigkeiten.\n\n"
      .. "|cff66b3ffAnzeige & Animation:|r\n"
      .. "• |cffffffffAnimation:|r Effekt beim Skill-Up. Über 'Edit...' lassen sich eigene Effekte kombinieren.\n"
      .. "• |cffffffffMaximum anzeigen:|r Zeigt aktuellen Wert und Rang-Limit an (z. B. 225/300).\n"
      .. "• |cffffffffTextumriss & Balken:|r Fügt eine dunkle Kontur und einen Fortschrittsbalken hinzu.\n"
      .. "• |cffffffffLevel-Up-Zähler:|r Zeigt '+1' nach einem Aufstieg (optional dauerhaft für die Session).\n\n"
      .. "|cff66b3ffWaffen-Filter:|r\n"
      .. "• |cffffffffNur angelegte Waffe(n):|r Zeigt durchgehend genau die aktuell ausgerüsteten Waffen an, ohne sie im Kampf umzuschalten.\n"
      .. "• |cffffffffAlle / Waffen auswählen:|r Zeigt alle oder nur manuell gewählte Waffenarten.\n\n"
      .. "|cff66b3ffAllgemein & Bedienung:|r\n"
      .. "• |cffffffffAnordnung:|r Vertikal untereinander, nebeneinander nach rechts (Spalten) oder komplett frei bewegbar.\n"
      .. "• |cffffffffPosition sperren:|r Fixiert die Anzeige. Linksklick öffnet das Beruf-/Fertigkeitenfenster.",
  },
  frFR = {
    "Skill Levels - Options", "Métiers", "Armes",
    "Afficher les métiers", "Afficher les armes",
    "Métiers secondaires :", "Afficher ensemble", "Séparer", "Masquer",
    "Afficher les compétences de classe",
    "Choisir les compétences...", "Sélection des compétences", "Aucune compétence active trouvée", "Compétences apprises uniquement",
    "Séparateur :",
    "Ordre :",
    "Métiers > Armes > Secondaires",
    "Métiers > Secondaires > Armes",
    "Armes > Métiers > Secondaires",
    "Armes > Secondaires > Métiers",
    "Secondaires > Métiers > Armes",
    "Secondaires > Armes > Métiers",
    "Disposition :",
    "Cadre unique (Vertical)",
    "Côte à côte (Colonnes à droite)",
    "Cadres séparés (Déplacement libre)",
    "Plages de couleurs (de - à, couleur)", "Ajouter une plage",
    "Limite atteinte - apprendre le rang suivant", "Maximum atteint",
    "Mode arc-en-ciel", "Animation :",
    "Désactivée", "Rebond & Éclat", "Élévation", "Onde & Pulsation", "Étincelle",
    "Rebond des lettres", "Flash arc-en-ciel", "Personnalisé",
    "Edit...", "Éditeur d'animations",
    "Rebond de flèche", "Hauteur de rebond", "Éclat / Étincelle", "Luminosité",
    "Double étincelle", "Pulsation compteur", "Rebond des lettres (+1n)",
    "Hauteur lettres", "Vitesse d'onde", "Flash arc-en-ciel", "Vitesse arc-en-ciel",
    "Tester l'animation", "Réinitialiser",
    "Verrouiller la position", "Compteur de niveaux",
    "Compteur permanent", "Afficher le maximum", "Contour du texte", "Barre de progression",
    "Afficher toutes les armes",
    "Choisir les armes...", "Sélection des armes", "Tout cocher", "Tout décocher",
    "Afficher l'arme main gauche", "Afficher l'arme à distance", "Armes équipées uniquement",
    "Masquer en combat", "Masquer en instance",
    "Taille de police",
    "Réinitialiser le compteur de session", "Réinitialiser la position", "Tout réinitialiser",
    "Fonction de la fenêtre des métiers introuvable", "Fenêtre des compétences introuvable",
    "Langue", "Automatique", "Ouvrir les options",
    "Configurer l'affichage des compétences de métiers et d'armes.",
    "Aide & Guide",
    "|cff66b3ffPlages de couleurs :|r\n"
      .. "• |cffffffffPlages :|r Colore la compétence selon son niveau actuel.\n"
      .. "• |cffffffffLimite atteinte :|r Couleur d'alerte lorsqu'un maître doit vous former.\n"
      .. "• |cffffffffMaximum atteint :|r Couleur au niveau maximal (300).\n\n"
      .. "|cff66b3ffMétiers & Classe :|r\n"
      .. "• |cffffffffMétiers secondaires :|r Affiche ensemble, sépare en bloc ou masque Cuisine, Secourisme, Pêche, Poisons et Compréhension.\n"
      .. "• |cffffffffCompétences de classe :|r Suit Crochetage (Voleur, tant que non max).\n"
      .. "• |cffffffffChoisir les compétences :|r Sélectionne individuellement les compétences actives connues.\n\n"
      .. "|cff66b3ffAffichage & Animation :|r\n"
      .. "• |cffffffffAnimation :|r Effet lors d'un gain de point ('Edit...' pour personnaliser).\n"
      .. "• |cffffffffAfficher le maximum :|r Affiche le niveau et le plafond (ex. 225/300).\n"
      .. "• |cffffffffContour & Barre :|r Ajoute un contour au texte et une barre de progression.\n"
      .. "• |cffffffffCompteur :|r Affiche '+1' après un gain (ou en continu durant la session).\n\n"
      .. "|cff66b3ffFiltres d'armes :|r\n"
      .. "• |cffffffffArmes équipées uniquement :|r Affiche uniquement les armes actuellement équipées sans changer en combat.\n"
      .. "• |cffffffffToutes / Choisir :|r Affiche toutes les armes ou une sélection personnalisée.\n\n"
      .. "|cff66b3ffGénéral :|r\n"
      .. "• |cffffffffDisposition :|r Vertical, en colonnes côte à côte vers la droite ou cadres libres.\n"
      .. "• |cffffffffVerrouiller :|r Empêche le déplacement. Clic gauche ouvre la fenêtre de compétences.",
  },
  esES = {
    "Skill Levels - Opciones", "Profesiones", "Armas",
    "Mostrar profesiones", "Mostrar armas",
    "Profesiones secundarias:", "Mostrar juntas", "Separar", "Ocultar",
    "Mostrar habilidades de clase",
    "Elegir habilidades...", "Selección de habilidades", "No se encontraron habilidades activas", "Solo habilidades aprendidas",
    "Separador:",
    "Orden:",
    "Profesiones > Armas > Secundarias",
    "Profesiones > Secundarias > Armas",
    "Armas > Profesiones > Secundarias",
    "Armas > Secundarias > Profesiones",
    "Secundarias > Profesiones > Armas",
    "Secundarias > Armas > Profesiones",
    "Disposición:",
    "Marco combinado (Vertical)",
    "Lado a lado (Columnas a la derecha)",
    "Marcos separados (Movimiento libre)",
    "Rangos de color (desde - hasta, color)", "Añadir rango",
    "Límite alcanzado - aprende el siguiente rango", "Máximo alcanzado",
    "Modo arcoíris", "Animación:",
    "Desactivada", "Rebote y brillo", "Flotar arriba", "Onda y pulso", "Destello",
    "Rebote de letras", "Destello arcoíris", "Personalizado",
    "Edit...", "Editor de animaciones",
    "Rebote de flecha", "Altura de rebote", "Brillo / Destello", "Intensidad de brillo",
    "Doble destello", "Pulso del contador", "Rebote de letras (+1n)",
    "Altura de letras", "Velocidad de onda", "Destello arcoíris", "Velocidad arcoíris",
    "Probar animación", "Reiniciar",
    "Bloquear posición", "Contador de subidas",
    "Contador permanente", "Mostrar máximo", "Contorno del texto", "Barra de progreso",
    "Mostrar todas las armas",
    "Elegir armas...", "Selección de armas", "Seleccionar todo", "Deseleccionar todo",
    "Mostrar arma secundaria", "Mostrar arma a distancia", "Solo armas equipadas",
    "Ocultar en combate", "Ocultar en instancias",
    "Tamaño de fuente",
    "Reiniciar contador de sesión", "Reiniciar posición", "Reiniciar todo",
    "Función de la ventana de profesiones no encontrada", "Ventana de habilidades no encontrada",
    "Idioma", "Automático", "Abrir opciones",
    "Configura el seguimiento de profesiones y habilidades con armas.",
    "Ayuda y Guía",
    "|cff66b3ffRangos de color:|r\n"
      .. "• |cffffffffRangos:|r Colorea la habilidad según su nivel actual.\n"
      .. "• |cffffffffLímite alcanzado:|r Avisa cuando debes aprender el siguiente rango.\n"
      .. "• |cffffffffMáximo alcanzado:|r Color al llegar al nivel máximo (300).\n\n"
      .. "|cff66b3ffProfesiones y Clase:|r\n"
      .. "• |cffffffffProfesiones secundarias:|r Muestra juntas, separa en bloque u oculta Cocina, Primeros auxilios, Pesca, Venenos y Comprensión.\n"
      .. "• |cffffffffHabilidades de clase:|r Rastrea Ganzúa (Pícaro, mientras no esté al máximo).\n"
      .. "• |cffffffffElegir habilidades:|r Elige qué habilidades activas actuales mostrar.\n\n"
      .. "|cff66b3ffVisualización y Animación:|r\n"
      .. "• |cffffffffAnimación:|r Efecto al subir de nivel ('Edit...' para personalizar).\n"
      .. "• |cffffffffMostrar máximo:|r Muestra el nivel actual y el límite (ej. 225/300).\n"
      .. "• |cffffffffContorno y Barra:|r Añade borde al texto y una barra de progreso.\n"
      .. "• |cffffffffContador:|r Muestra '+1' al subir (o de forma permanente en la sesión).\n\n"
      .. "|cff66b3ffFiltros de armas:|r\n"
      .. "• |cffffffffSolo armas equipadas:|r Muestra únicamente las armas equipadas sin cambiar en combate.\n"
      .. "• |cffffffffTodas / Elegir armas:|r Muestra todas o solo las armas marcadas.\n\n"
      .. "|cff66b3ffGeneral:|r\n"
      .. "• |cffffffffDisposición:|r Vertical, columnas a la derecha o marcos libres.\n"
      .. "• |cffffffffBloquear posición:|r Fija los marcos. Clic izquierdo abre las habilidades.",
  },
  itIT = {
    "Skill Levels - Opzioni", "Professioni", "Armi",
    "Mostra professioni", "Mostra armi",
    "Professioni secondarie:", "Mostra insieme", "Separa", "Nascondi",
    "Mostra abilità di classe",
    "Seleziona abilità...", "Selezione abilità", "Nessuna abilità attiva trovata", "Solo abilità apprese",
    "Separatore:",
    "Ordine:",
    "Professioni > Armi > Secondarie",
    "Professioni > Secondarie > Armi",
    "Armi > Professioni > Secondarie",
    "Armi > Secondarie > Professioni",
    "Secondarie > Professioni > Armi",
    "Secondarie > Armi > Professioni",
    "Disposizione:",
    "Riquadro unico (Verticale)",
    "Affiancati (Colonne a destra)",
    "Riquadri separati (Movimento libero)",
    "Intervalli di colore (da - a, colore)", "Aggiungi intervallo",
    "Limite raggiunto - impara il rango successivo", "Massimo raggiunto",
    "Modalità arcobaleno", "Animazione:",
    "Disattivata", "Rimbalzo e bagliore", "Fluttua su", "Onda e impulso", "Scintilla",
    "Rimbalzo lettere", "Flash arcobaleno", "Personalizzato",
    "Edit...", "Editor animazioni",
    "Rimbalzo freccia", "Altezza rimbalzo", "Bagliore / Scintilla", "Luminosità",
    "Doppia scintilla", "Impulso contatore", "Rimbalzo lettere (+1n)",
    "Altezza lettere", "Velocità onda", "Flash arcobaleno", "Velocità arcobaleno",
    "Prova animazione", "Ripristina",
    "Blocca posizione", "Contatore di avanzamenti",
    "Contatore permanente", "Mostra massimo", "Contorno del testo", "Barra di progresso",
    "Mostra tutte le armi",
    "Seleziona armi...", "Selezione armi", "Seleziona tutto", "Deseleziona tutto",
    "Mostra arma secondaria", "Mostra arma a distanza", "Solo armi equipaggiate",
    "Nascondi in combattimento", "Nascondi nelle istanze",
    "Dimensione carattere",
    "Azzera contatore di sessione", "Azzera posizione", "Azzera tutto",
    "Funzione della finestra professioni non trovata", "Finestra abilità non trovata",
    "Lingua", "Automatica", "Apri opzioni",
    "Configura il tracciamento di professioni e abilità con le armi.",
    "Guida e Aiuto",
    "|cff66b3ffIntervalli di colore:|r\n"
      .. "• |cffffffffIntervalli:|r Colora l'abilità in base al livello attuale.\n"
      .. "• |cffffffffLimite raggiunto:|r Avvisa quando devi imparare il grado successivo.\n"
      .. "• |cffffffffMassimo raggiunto:|r Colore al livello massimo (300).\n\n"
      .. "|cff66b3ffProfessioni e Classe:|r\n"
      .. "• |cffffffffProfessioni secondarie:|r Mostra insieme, separa in blocco o nasconde Cucina, Primo Soccorso, Pesca, Veleni e Comprensione.\n"
      .. "• |cffffffffAbilità di classe:|r Traccia Scassinamento (Ladro, finché non al massimo).\n"
      .. "• |cffffffffSeleziona abilità:|r Scegli quali abilità attive attuali mostrare.\n\n"
      .. "|cff66b3ffAspetto e Animazione:|r\n"
      .. "• |cffffffffAnimazione:|r Effetto all'aumento di livello ('Edit...' per personalizzare).\n"
      .. "• |cffffffffMostra massimo:|r Mostra il livello e il limite (es. 225/300).\n"
      .. "• |cffffffffContorno e Barra:|r Aggiunge bordo al testo e barra di avanzamento.\n"
      .. "• |cffffffffContatore:|r Mostra '+1' dopo un aumento (o fisso per la sessione).\n\n"
      .. "|cff66b3ffFiltri armi:|r\n"
      .. "• |cffffffffSolo armi equipaggiate:|r Mostra solo le armi equipaggiate senza cambiarle in combattimento.\n"
      .. "• |cffffffffTutte / Seleziona armi:|r Mostra tutte le armi o solo quelle scelte.\n\n"
      .. "|cff66b3ffGenerale:|r\n"
      .. "• |cffffffffDisposizione:|r Verticale, colonne a destra o riquadri separati.\n"
      .. "• |cffffffffBlocca posizione:|r Blocca i riquadri. Clic sinistro apre le abilità.",
  },
  ptBR = {
    "Skill Levels - Opções", "Profissões", "Armas",
    "Mostrar profissões", "Mostrar armas",
    "Profissões secundárias:", "Mostrar juntas", "Separar", "Ocultar",
    "Mostrar perícias de classe",
    "Selecionar perícias...", "Seleção de perícias", "Nenhuma perícia ativa encontrada", "Apenas perícias aprendidas",
    "Separador:",
    "Ordem:",
    "Profissões > Armas > Secundárias",
    "Profissões > Secundárias > Armas",
    "Armas > Profissões > Secundárias",
    "Armas > Secundárias > Profissões",
    "Secundárias > Profissões > Armas",
    "Secundárias > Armas > Profissões",
    "Layout:",
    "Quadro único (Vertical)",
    "Lado a lado (Colunas à direita)",
    "Quadros separados (Movimento livre)",
    "Intervalos de cor (de - até, cor)", "Adicionar intervalo",
    "Limite atingido - aprenda o próximo grau", "Máximo atingido",
    "Modo arco-íris", "Animação:",
    "Desativada", "Salto e brilho", "Flutuar", "Onda e pulso", "Brilho",
    "Salto de letras", "Brilho arco-íris", "Personalizado",
    "Edit...", "Editor de Animações",
    "Salto da seta", "Altura do salto", "Brilho / Estrela", "Intensidade do brilho",
    "Brilho duplo", "Pulso do contador", "Salto de letras (+1n)",
    "Altura das letras", "Velocidade da onda", "Brilho arco-íris", "Velocidade arco-íris",
    "Testar animação", "Redefinir",
    "Bloquear posição", "Contador de evoluções",
    "Contador permanente", "Mostrar máximo", "Contorno do texto", "Barra de progresso",
    "Mostrar todas as armas",
    "Selecionar armas...", "Seleção de armas", "Marcar tudo", "Desmarcar tudo",
    "Mostrar arma secundária", "Mostrar arma de longo alcance", "Apenas armas equipadas",
    "Ocultar em combate", "Ocultar em instâncias",
    "Tamanho da fonte",
    "Zerar contador da sessão", "Redefinir posição", "Redefinir tudo",
    "Função da janela de profissões não encontrada", "Janela de perícias não encontrada",
    "Idioma", "Automático", "Abrir opções",
    "Configure o acompanhamento de profissões e perícias com armas.",
    "Ajuda e Guia",
    "|cff66b3ffIntervalos de cor:|r\n"
      .. "• |cffffffffIntervalos:|r Colore a perícia conforme o nível atual.\n"
      .. "• |cffffffffLimite atingido:|r Avisa quando você precisa treinar o próximo grau.\n"
      .. "• |cffffffffMáximo atingido:|r Cor ao atingir o nível máximo (300).\n\n"
      .. "|cff66b3ffProfissões e Classe:|r\n"
      .. "• |cffffffffProfissões secundárias:|r Mostra juntas, separa em bloco ou oculta Culinária, Primeiros Socorros, Pesca, Venenos e Compreensão.\n"
      .. "• |cffffffffPerícias de classe:|r Rastreia Arrombamento (Ladino, enquanto não estiver no máximo).\n"
      .. "• |cffffffffSelecionar perícias:|r Escolha quais perícias ativas atuais exibir.\n\n"
      .. "|cff66b3ffExibição e Animação:|r\n"
      .. "• |cffffffffAnimação:|r Efeito ao subir de nível ('Edit...' para personalizar).\n"
      .. "• |cffffffffMostrar máximo:|r Exibe o nível atual e o limite (ex.: 225/300).\n"
      .. "• |cffffffffContorno e Barra:|r Adiciona contorno ao texto e barra de progresso.\n"
      .. "• |cffffffffContador:|r Mostra '+1' ao subir (ou fixo durante a sessão).\n\n"
      .. "|cff66b3ffFiltros de armas:|r\n"
      .. "• |cffffffffApenas armas equipadas:|r Mostra apenas as armas equipadas sem alternar em combate.\n"
      .. "• |cffffffffTodas / Selecionar armas:|r Mostra todas ou apenas as armas escolhidas.\n\n"
      .. "|cff66b3ffGeral:|r\n"
      .. "• |cffffffffLayout:|r Vertical, colunas à direita ou quadros móveis.\n"
      .. "• |cffffffffBloquear posição:|r Trava os quadros. Clique esquerdo abre as perícias.",
  },
  ruRU = {
    "Skill Levels - Настройки", "Профессии", "Оружие",
    "Показать профессии", "Показать оружие",
    "Вспомогательные профессии:", "Показывать вместе", "Разделить", "Скрыть",
    "Показать классовые навыки",
    "Выбрать навыки...", "Выбор навыков", "Активные навыки не найдены", "Только изученные навыки",
    "Разделитель:",
    "Порядок:",
    "Профессии > Оружие > Вспомогательные",
    "Профессии > Вспомогательные > Оружие",
    "Оружие > Профессии > Вспомогательные",
    "Оружие > Вспомогательные > Профессии",
    "Вспомогательные > Профессии > Оружие",
    "Вспомогательные > Оружие > Профессии",
    "Режим:",
    "Общая рамка (Вертикально)",
    "Рядом (Столбцы вправо)",
    "Раздельные рамки (Свободно)",
    "Диапазоны цветов (от - до, цвет)", "Добавить диапазон",
    "Предел достигнут - изучите следующий ранг", "Максимум достигнут",
    "Радужный режим", "Анимация:",
    "Выкл.", "Прыжок и свечение", "Всплытие", "Волна и пульс", "Искры",
    "Прыжок букв", "Радужная вспышка", "Своя",
    "Edit...", "Редактор анимаций",
    "Прыжок стрелки", "Высота прыжка", "Свечение / Искры", "Яркость свечения",
    "Двойная вспышка", "Пульс счётчика", "Прыжок букв (+1n)",
    "Высота букв", "Скорость волны", "Радужная вспышка", "Скорость радуги",
    "Тест анимации", "Сбросить",
    "Закрепить позицию", "Счётчик повышений",
    "Постоянный счётчик", "Показывать максимум", "Контур текста", "Полоса прогресса",
    "Показать все виды оружия",
    "Выбрать оружие...", "Выбор оружия", "Выбрать всё", "Снять всё",
    "Показать левую руку", "Показать дальний бой", "Только экипированное оружие",
    "Скрывать в бою", "Скрывать в подземельях",
    "Размер шрифта",
    "Сбросить счётчик сессии", "Сбросить позицию", "Сбросить всё",
    "Функция окна профессий не найдена", "Окно навыков не найдено",
    "Язык", "Автоматически", "Открыть настройки",
    "Настройка отслеживания профессий и оружейных навыков.",
    "Справка",
    "|cff66b3ffЦветовые диапазоны:|r\n"
      .. "• |cffffffffДиапазоны:|r Окрашивает навык в зависимости от текущего уровня.\n"
      .. "• |cffffffffПредел достигнут:|r Предупреждает, что пора изучить следующий ранг.\n"
      .. "• |cffffffffМаксимум достигнут:|r Цвет при достижении максимума (300).\n\n"
      .. "|cff66b3ffПрофессии и класс:|r\n"
      .. "• |cffffffffВспомогательные профессии:|r Показывает вместе, выделяет в отдельный блок или скрывает Кулинарию, Первую помощь, Рыбную ловлю, Яды и Понимание.\n"
      .. "• |cffffffffКлассовые навыки:|r Отслеживает Взлом замков (Разбойник, пока не максимум).\n"
      .. "• |cffffffffВыбрать навыки:|r Позволяет выбрать конкретные изученные профессии и навыки.\n\n"
      .. "|cff66b3ffОтображение и анимация:|r\n"
      .. "• |cffffffffАнимация:|r Эффект при повышении навыка ('Edit...' для настройки).\n"
      .. "• |cffffffffПоказывать максимум:|r Показывает текущий уровень и предел (напр. 225/300).\n"
      .. "• |cffffffffКонтур и полоса:|r Добавляет обводку текста и полосу прогресса.\n"
      .. "• |cffffffffСчётчик:|r Показывает '+1' после повышения (или постоянно за сессию).\n\n"
      .. "|cff66b3ffФильтры оружия:|r\n"
      .. "• |cffffffffТолько экипированное оружие:|r Показывает только надетое оружие без переключения в бою.\n"
      .. "• |cffffffffВсе / Выбрать оружие:|r Показывает все виды или выбранные вручную.\n\n"
      .. "|cff66b3ffОбщие настройки:|r\n"
      .. "• |cffffffffРежим:|r Вертикально, столбцами вправо или отдельные рамки.\n"
      .. "• |cffffffffЗакрепить позицию:|r Фиксирует рамки. ЛКМ открывает окно навыков.",
  },
  plPL = {
    "Skill Levels - Opcje", "Profesje", "Broń",
    "Pokaż profesje", "Pokaż broń",
    "Profesje drugorzędne:", "Pokaż razem", "Oddziel", "Ukryj",
    "Pokaż umiejętności klasowe",
    "Wybierz umiejętności...", "Wybór umiejętności", "Nie znaleziono aktywnych umiejętności", "Tylko wyuczone umiejętności",
    "Separator:",
    "Kolejność:",
    "Profesje > Broń > Drugorzędne",
    "Profesje > Drugorzędne > Broń",
    "Broń > Profesje > Drugorzędne",
    "Broń > Drugorzędne > Profesje",
    "Drugorzędne > Profesje > Broń",
    "Drugorzędne > Broń > Profesje",
    "Układ:",
    "Wspólna ramka (Pionowo)",
    "Obok siebie (Kolumny w prawo)",
    "Oddzielne ramki (Swobodnie)",
    "Zakresy kolorów (od - do, kolor)", "Dodaj zakres",
    "Osiągnięto limit - naucz się kolejnej rangi", "Osiągnięto maksimum",
    "Tryb tęczowy", "Animacja:",
    "Wyłączona", "Podskok i blask", "Unoszenie", "Fala i puls", "Iskry",
    "Skaczące litery", "Tęczowy błysk", "Własna",
    "Edit...", "Edytor animacji",
    "Podskok strzałki", "Wysokość skoku", "Blask / Iskry", "Jasność blasku",
    "Podwójna iskra", "Puls licznika", "Skaczące litery (+1n)",
    "Wysokość liter", "Prędkość fali", "Tęczowy błysk", "Prędkość tęczy",
    "Testuj animację", "Resetuj",
    "Zablokuj pozycję", "Licznik awansów",
    "Stały licznik", "Pokaż maksimum", "Obrys tekstu", "Pasek postępu",
    "Pokaż wszystkie bronie",
    "Wybierz broń...", "Wybór broni", "Zaznacz wszystko", "Odznacz wszystko",
    "Pokaż broń dodatkową", "Pokaż broń dystansową", "Tylko założona broń",
    "Ukryj w walce", "Ukryj w instancjach",
    "Rozmiar czcionki",
    "Zresetuj licznik sesji", "Zresetuj pozycję", "Zresetuj wszystko",
    "Nie znaleziono funkcji okna profesji", "Nie znaleziono okna umiejętności",
    "Język", "Automatycznie", "Otwórz opcje",
    "Konfiguracja śledzenia profesji i biegłości w broni.",
    "Pomoc i Opis",
    "|cff66b3ffZakresy kolorów:|r\n"
      .. "• |cffffffffZakresy:|r Koloruje umiejętność zależnie od aktualnego poziomu.\n"
      .. "• |cffffffffOsiągnięto limit:|r Ostrzega, gdy trzeba nauczyć się kolejnej rangi.\n"
      .. "• |cffffffffOsiągnięto maksimum:|r Kolor po osiągnięciu poziomu 300.\n\n"
      .. "|cff66b3ffProfesje i Klasa:|r\n"
      .. "• |cffffffffProfesje drugorzędne:|r Pokazuje razem, oddziela jako blok lub ukrywa Gotowanie, Pierwszą pomoc, Wędkarstwo, Trucizny i Zrozumienie.\n"
      .. "• |cffffffffUmiejętności klasowe:|r Śledzi Otwieranie zamków (Łotr, dopóki nie osiągnie maksimum).\n"
      .. "• |cffffffffWybierz umiejętności:|r Wybierz, które aktualne aktywne umiejętności mają być widoczne.\n\n"
      .. "|cff66b3ffWygląd i Animacja:|r\n"
      .. "• |cffffffffAnimacja:|r Efekt przy awansie ('Edit...' pozwala tworzyć własne).\n"
      .. "• |cffffffffPokaż maksimum:|r Wyświetla obecny poziom i limit (np. 225/300).\n"
      .. "• |cffffffffObrys i Pasek:|r Dodaje obrys tekstu oraz pasek postępu.\n"
      .. "• |cffffffffLicznik:|r Pokazuje '+1' po awansie (lub stale w trakcie sesji).\n\n"
      .. "|cff66b3ffFiltry broni:|r\n"
      .. "• |cffffffffTylko założona broń:|r Pokazuje tylko aktualnie założoną broń bez przełączania w walce.\n"
      .. "• |cffffffffWszystkie / Wybierz broń:|r Pokazuje wszystkie lub wybrane typy broni.\n\n"
      .. "|cff66b3ffOgólne:|r\n"
      .. "• |cffffffffUkład:|r Pionowo, kolumny w prawo lub osobne ramki.\n"
      .. "• |cffffffffZablokuj pozycję:|r Blokuje ramki. LPM otwiera okno umiejętności.",
  },
  nlNL = {
    "Skill Levels - Opties", "Beroepen", "Wapens",
    "Beroepen tonen", "Wapens tonen",
    "Secundaire beroepen:", "Samen tonen", "Scheiden", "Verbergen",
    "Klasvaardigheden tonen",
    "Vaardigheden kiezen...", "Vaardighedenselectie", "Geen actieve vaardigheden gevonden", "Alleen geleerde vaardigheden",
    "Scheidingslijn:",
    "Volgorde:",
    "Beroepen > Wapens > Secundair",
    "Beroepen > Secundair > Wapens",
    "Wapens > Beroepen > Secundair",
    "Wapens > Secundair > Beroepen",
    "Secundair > Beroepen > Wapens",
    "Secundair > Wapens > Beroepen",
    "Indeling:",
    "Gecombineerd kader (Verticaal)",
    "Naast elkaar (Kolommen naar rechts)",
    "Aparte kaders (Vrij verplaatsbaar)",
    "Kleurbereiken (van - tot, kleur)", "Bereik toevoegen",
    "Limiet bereikt - leer de volgende rang", "Maximum bereikt",
    "Regenboogmodus", "Animatie:",
    "Uit", "Stuiter & Gloed", "Opzweven", "Golf & Puls", "Vonk",
    "Letter-stuiter", "Regenboogflits", "Aangepast",
    "Edit...", "Animatie-editor",
    "Pijl-stuiter", "Stuiterhoogte", "Stergloed / Vonk", "Gloedsterkte",
    "Dubbele vonk", "Teller-puls", "Letter-stuiter (+1n)",
    "Letterhoogte", "Golfsnelheid", "Regenboogflits", "Regenboogsnelheid",
    "Animatie testen", "Resetten",
    "Positie vergrendelen", "Level-up-teller",
    "Permanente teller", "Maximum tonen", "Tekstomtrek", "Voortgangsbalk",
    "Alle wapens tonen",
    "Wapens kiezen...", "Wapenselectie", "Alles selecteren", "Alles deselecteren",
    "Tweede wapen tonen", "Afstandswapen tonen", "Alleen uitgeruste wapens",
    "Verbergen in gevecht", "Verbergen in instances",
    "Lettergrootte",
    "Sessieteller resetten", "Positie resetten", "Alles resetten",
    "Functie voor beroepenvenster niet gevonden", "Vaardighedenvenster niet gevonden",
    "Taal", "Automatisch", "Opties openen",
    "Configureer de weergave van beroepen en wapenvaardigheden.",
    "Hulp & Uitleg",
    "|cff66b3ffKleurbereiken:|r\n"
      .. "• |cffffffffBereiken:|r Kleurt de vaardigheid op basis van het huidige niveau.\n"
      .. "• |cffffffffLimiet bereikt:|r Waarschuwt wanneer je een nieuwe rang moet leren.\n"
      .. "• |cffffffffMaximum bereikt:|r Kleur bij het maximale niveau (300).\n\n"
      .. "|cff66b3ffBeroepen & Klasse:|r\n"
      .. "• |cffffffffSecundaire beroepen:|r Toont Koken, Eerste hulp, Vissen, Gif en Begrip samen, gescheiden als blok of verborgen.\n"
      .. "• |cffffffffKlasvaardigheden:|r Volgt Slot openbreken (Schurk, zolang niet max).\n"
      .. "• |cffffffffVaardigheden kiezen:|r Kies welke huidige actieve vaardigheden worden getoond.\n\n"
      .. "|cff66b3ffWeergave & Animatie:|r\n"
      .. "• |cffffffffAnimatie:|r Effect bij een skill-up ('Edit...' om zelf in te stellen).\n"
      .. "• |cffffffffMaximum tonen:|r Toont huidig niveau en limiet (bijv. 225/300).\n"
      .. "• |cffffffffTekstomtrek & Balk:|r Voegt een omtrek en voortgangsbalk toe.\n"
      .. "• |cffffffffTeller:|r Toont '+1' na een stijging (of permanent tijdens de sessie).\n\n"
      .. "|cff66b3ffWapenfilters:|r\n"
      .. "• |cffffffffAlleen uitgeruste wapens:|r Toont alleen de uitgeruste wapens zonder tijdens gevechten te wisselen.\n"
      .. "• |cffffffffAlle / Wapens kiezen:|r Toont alle of handmatig gekozen wapens.\n\n"
      .. "|cff66b3ffAlgemeen:|r\n"
      .. "• |cffffffffIndeling:|r Verticaal, kolommen naar rechts of losse kaders.\n"
      .. "• |cffffffffPositie vergrendelen:|r Zet kaders vast. Linksklik opent vaardigheden.",
  },
  svSE = {
    "Skill Levels - Alternativ", "Yrken", "Vapen",
    "Visa yrken", "Visa vapen",
    "Sekundära yrken:", "Visa tillsammans", "Separera", "Dölj",
    "Visa klassfärdigheter",
    "Välj färdigheter...", "Färdighetsval", "Inga aktiva färdigheter hittades", "Endast inlärda färdigheter",
    "Avgränsare:",
    "Ordning:",
    "Yrken > Vapen > Sekundära",
    "Yrken > Sekundära > Vapen",
    "Vapen > Yrken > Sekundära",
    "Vapen > Sekundära > Yrken",
    "Sekundära > Yrken > Vapen",
    "Sekundära > Vapen > Yrken",
    "Layout:",
    "Gemensam ram (Vertikal)",
    "Sida vid sida (Kolumner åt höger)",
    "Separata ramar (Fritt flyttbara)",
    "Färgintervall (från - till, färg)", "Lägg till intervall",
    "Gräns nådd - lär dig nästa rang", "Maximum nått",
    "Regnbågsläge", "Animation:",
    "Av", "Studs & Glöd", "Sväva upp", "Våg & Puls", "Gnista",
    "Bokstavsstuds", "Regnbågsblixt", "Anpassad",
    "Edit...", "Animationsredigerare",
    "Pilstuds", "Studshöjd", "Stjärnglöd / Gnista", "Glödstyrka",
    "Dubbel gnista", "Räknarpuls", "Bokstavsstuds (+1n)",
    "Bokstavshöjd", "Våghastighet", "Regnbågsblixt", "Regnbågshastighet",
    "Testa animation", "Återställ",
    "Lås position", "Nivåökningsräknare",
    "Permanent räknare", "Visa maximum", "Textkontur", "Förloppsindikator",
    "Visa alla vapen",
    "Välj vapen...", "Vapenval", "Markera alla", "Avmarkera alla",
    "Visa sekundärt vapen", "Visa avståndsvapen", "Endast utrustade vapen",
    "Dölj i strid", "Dölj i instanser",
    "Teckenstorlek",
    "Nollställ sessionsräknare", "Återställ position", "Återställ allt",
    "Funktionen för yrkesfönstret hittades inte", "Färdighetsfönstret hittades inte",
    "Språk", "Automatiskt", "Öppna alternativ",
    "Konfigurera spårning av yrken och vapenfärdigheter.",
    "Hjälp & Guide",
    "|cff66b3ffFärgintervall:|r\n"
      .. "• |cffffffffIntervall:|r Färgar färdigheten efter aktuell nivå.\n"
      .. "• |cffffffffGräns nådd:|r Varnar när du måste lära dig nästa rang.\n"
      .. "• |cffffffffMaximum nått:|r Färg vid maximal nivå (300).\n\n"
      .. "|cff66b3ffYrken & Klass:|r\n"
      .. "• |cffffffffSekundära yrken:|r Visar Matlagning, Första hjälpen, Fiske, Gifter och Förståelse tillsammans, separat eller dolt.\n"
      .. "• |cffffffffKlassfärdigheter:|r Spårar Låsdyrkning (Skurk, tills max).\n"
      .. "• |cffffffffVälj färdigheter:|r Välj vilka aktuella aktiva färdigheter som ska visas.\n\n"
      .. "|cff66b3ffVisning & Animation:|r\n"
      .. "• |cffffffffAnimation:|r Effekt vid nivåökning ('Edit...' för att anpassa).\n"
      .. "• |cffffffffVisa maximum:|r Visar aktuell nivå och gräns (t.ex. 225/300).\n"
      .. "• |cffffffffTextkontur & Indikator:|r Lägger till kontur och förloppsindikator.\n"
      .. "• |cffffffffRäknare:|r Visar '+1' efter ökning (eller permanent under sessionen).\n\n"
      .. "|cff66b3ffVapenfilter:|r\n"
      .. "• |cffffffffEndast utrustade vapen:|r Visar endast utrustade vapen utan att byta i strid.\n"
      .. "• |cffffffffAlla / Välj vapen:|r Visar alla eller manuellt valda vapentyper.\n\n"
      .. "|cff66b3ffAllmänt:|r\n"
      .. "• |cffffffffLayout:|r Vertikalt, kolumner åt höger eller separata ramar.\n"
      .. "• |cffffffffLås position:|r Låser ramarna. Vänsterklick öppnar färdighetsfönstret.",
  },
  csCZ = {
    "Skill Levels - Nastavení", "Profese", "Zbraně",
    "Zobrazit profese", "Zobrazit zbraně",
    "Vedlejší profese:", "Zobrazit společně", "Oddělit", "Skrýt",
    "Zobrazit třídní dovednosti",
    "Vybrat dovednosti...", "Výběr dovedností", "Nebyly nalezeny žádné aktivní dovednosti", "Pouze naučené dovednosti",
    "Oddělovač:",
    "Pořadí:",
    "Profese > Zbraně > Vedlejší",
    "Profese > Vedlejší > Zbraně",
    "Zbraně > Profese > Vedlejší",
    "Zbraně > Vedlejší > Profese",
    "Vedlejší > Profese > Zbraně",
    "Vedlejší > Zbraně > Profese",
    "Rozložení:",
    "Společný rám (Svisle)",
    "Vedle sebe (Sloupce doprava)",
    "Oddělené rámy (Volný pohyb)",
    "Barevné rozsahy (od - do, barva)", "Přidat rozsah",
    "Dosažen limit - naučte se další stupeň", "Dosaženo maxima",
    "Duhový režim", "Animace:",
    "Vypnuto", "Odraz a záře", "Vznášení", "Vlna a pulz", "Jiskření",
    "Skákání písmen", "Duhový záblesk", "Vlastní",
    "Edit...", "Editor animací",
    "Odraz šipky", "Výška odrazu", "Záře / Jiskření", "Jas záře",
    "Dvojité jiskření", "Pulz počítadla", "Skákání písmen (+1n)",
    "Výška písmen", "Rychlost vlny", "Duhový záblesk", "Rychlost duhy",
    "Otestovat animaci", "Resetovat",
    "Zamknout pozici", "Počítadlo zlepšení",
    "Trvalé počítadlo", "Zobrazit maximum", "Obrys textu", "Ukazatel postupu",
    "Zobrazit všechny zbraně",
    "Vybrat zbraně...", "Výběr zbraní", "Vybrat vše", "Zrušit výběr",
    "Zobrazit vedlejší zbraň", "Zobrazit zbraň na dálku", "Pouze nasazené zbraně",
    "Skrýt v boji", "Skrýt v instancích",
    "Velikost písma",
    "Resetovat počítadlo relace", "Resetovat pozici", "Resetovat vše",
    "Funkce okna profesí nebyla nalezena", "Okno dovedností nebylo nalezeno",
    "Jazyk", "Automaticky", "Otevřít nastavení",
    "Nastavení sledování profesí a zbraňových dovedností.",
    "Nápověda",
    "|cff66b3ffBarevné rozsahy:|r\n"
      .. "• |cffffffffRozsahy:|r Obarví dovednost podle aktuální úrovně.\n"
      .. "• |cffffffffDosažen limit:|r Upozorní, že je třeba naučit se další stupeň.\n"
      .. "• |cffffffffDosaženo maxima:|r Barva při dosažení úrovně 300.\n\n"
      .. "|cff66b3ffProfese a třída:|r\n"
      .. "• |cffffffffVedlejší profese:|r Zobrazí Vaření, První pomoc, Rybaření, Jedy a Porozumění společně, odděleně nebo je skryje.\n"
      .. "• |cffffffffTřídní dovednosti:|r Sleduje Odemykání zámků (Tulák, dokud není na maximu).\n"
      .. "• |cffffffffVybrat dovednosti:|r Vyberte, které aktuální aktivní dovednosti se mají zobrazit.\n\n"
      .. "|cff66b3ffZobrazení a animace:|r\n"
      .. "• |cffffffffAnimace:|r Efekt při zlepšení dovednosti ('Edit...' pro úpravu).\n"
      .. "• |cffffffffZobrazit maximum:|r Zobrazí aktuální úroveň i limit (např. 225/300).\n"
      .. "• |cffffffffObrys a ukazatel:|r Přidá obrys textu a ukazatel postupu.\n"
      .. "• |cffffffffPočítadlo:|r Zobrazí '+1' po zlepšení (nebo trvale po dobu relace).\n\n"
      .. "|cff66b3ffFiltry zbraní:|r\n"
      .. "• |cffffffffPouze nasazené zbraně:|r Zobrazuje pouze nasazené zbraně bez přepínání v boji.\n"
      .. "• |cffffffffVšechny / Vybrat zbraně:|r Zobrazí všechny nebo ručně vybraně zbraně.\n\n"
      .. "|cff66b3ffObecné:|r\n"
      .. "• |cffffffffRozložení:|r Svisle, sloupce doprava nebo oddělené rámy.\n"
      .. "• |cffffffffZamknout pozici:|r Uzamkne rámy. Levý klik otevře okno dovedností.",
  },
}

local TR_EN_HELP = "|cff66b3ffColor Ranges & Status:|r\n"
  .. "• |cffffffffColor ranges:|r Colors your skill based on its current rank (e.g. 0–150 Green).\n"
  .. "• |cffffffffCap reached:|r Warning color when you must visit a trainer for the next rank.\n"
  .. "• |cffffffffMaximum reached:|r Color once you reach the maximum skill level (300).\n\n"
  .. "|cff66b3ffProfessions & Class Skills:|r\n"
  .. "• |cffffffffSecondary professions:|r Show Cooking, First Aid, Fishing, Poisons, and Comprehension together, separated as a block, or hidden.\n"
  .. "• |cffffffffClass skills:|r Tracks Lockpicking (Rogue, while not maxed).\n"
  .. "• |cffffffffSelect skills:|r Choose individually which of your currently active skills to display.\n\n"
  .. "|cff66b3ffDisplay & Animation:|r\n"
  .. "• |cffffffffAnimation:|r Visual effect on skill-up. Click 'Edit...' to customize effects.\n"
  .. "• |cffffffffShow maximum:|r Displays current rank and cap together (e.g. 225/300).\n"
  .. "• |cffffffffText outline & Bar:|r Adds a dark outline and a progress bar under each row.\n"
  .. "• |cffffffffLevel-up counter:|r Shows '+1' after a skill-up (optionally stays all session).\n\n"
  .. "|cff66b3ffWeapon Filters:|r\n"
  .. "• |cffffffffOnly equipped weapons:|r Shows your currently equipped weapons without switching or hiding them in combat.\n"
  .. "• |cffffffffShow all / Select weapons:|r Shows all weapon skills or only your chosen ones.\n\n"
  .. "|cff66b3ffGeneral & Controls:|r\n"
  .. "• |cffffffffLayout:|r Vertical combined frame, side-by-side columns expanding right, or freely movable frames.\n"
  .. "• |cffffffffLock position:|r Locks frames in place. Left-click any row to open skills/professions."

local PKEYS = {
  "alchemy", "blacksmithing", "enchanting", "engineering", "herbalism",
  "inscription", "jewelcrafting", "leatherworking", "mining", "skinning",
  "tailoring", "cooking", "firstaid", "fishing", "poisons",
  "lockpicking", "comprehension",
}

local SECONDARY_KEYS = {
  cooking = true,
  firstaid = true,
  fishing = true,
  poisons = true,
  comprehension = true,
}

local CLASS_SKILL_KEYS = {
  lockpicking = true,
}

local PDATA = {
  enUS = { "Alchemy", "Blacksmithing", "Enchanting", "Engineering", "Herbalism",
    "Inscription", "Jewelcrafting", "Leatherworking", "Mining", "Skinning",
    "Tailoring", "Cooking", "First Aid", "Fishing", "Poisons",
    "Lockpicking", "Comprehension" },
  deDE = { "Alchemie", "Schmiedekunst", "Verzauberkunst", "Ingenieurskunst", "Kräuterkunde",
    "Inschriftenkunde", "Juwelenschleifen", "Lederverarbeitung", "Bergbau", "Kürschnerei",
    "Schneiderei", "Kochkunst", "Erste Hilfe", "Angeln", "Gifte",
    "Schlossknacken", "Verständnis" },
  frFR = { "Alchimie", "Forge", "Enchantement", "Ingénierie", "Herboristerie",
    "Calligraphie", "Joaillerie", "Travail du cuir", "Minage", "Dépeçage",
    "Couture", "Cuisine", "Premiers soins", "Pêche", "Poisons",
    "Crochetage", "Compréhension" },
  esES = { "Alquimia", "Herrería", "Encantamiento", "Ingeniería", "Botánica",
    "Inscripción", "Joyería", "Peletería", "Minería", "Desuello",
    "Sastrería", "Cocina", "Primeros auxilios", "Pesca", "Venenos",
    "Ganzúa", "Comprensión" },
  itIT = { "Alchimia", "Forgiatura", "Incantamento", "Ingegneria", "Erboristeria",
    "Runografia", "Oreficeria", "Conciatura", "Estrazione", "Scuoiatura",
    "Sartoria", "Cucina", "Primo Soccorso", "Pesca", "Veleni",
    "Scassinamento", "Comprensione" },
  ptBR = { "Alquimia", "Ferraria", "Encantamento", "Engenharia", "Herborismo",
    "Escrivania", "Joalheria", "Couraria", "Mineração", "Esfolamento",
    "Alfaiataria", "Culinária", "Primeiros Socorros", "Pesca", "Venenos",
    "Arrombamento", "Compreensão" },
  ruRU = { "Алхимия", "Кузнечное дело", "Наложение чар", "Инженерное дело", "Травничество",
    "Начертание", "Ювелирное дело", "Кожевничество", "Горное дело", "Снятие шкур",
    "Портняжное дело", "Кулинария", "Первая помощь", "Рыбная ловля", "Яды",
    "Взлом замков", "Понимание" },
  plPL = { "Alchemia", "Kowalstwo", "Zaklinanie", "Inżynieria", "Zielarstwo",
    "Pisarstwo", "Jubilerstwo", "Skórnictwo", "Górnictwo", "Skórowanie",
    "Krawiectwo", "Gotowanie", "Pierwsza pomoc", "Wędkarstwo", "Trucizny",
    "Otwieranie zamków", "Zrozumienie" },
  nlNL = { "Alchemie", "Smeden", "Betoveren", "Ingenieurskunde", "Kruidenkunde",
    "Inscriptie", "Juweliers", "Lederbewerken", "Mijnbouw", "Vilassen",
    "Kleermaken", "Koken", "Eerste hulp", "Vissen", "Gif",
    "Slot openbreken", "Begrip" },
  svSE = { "Alkemi", "Smide", "Förtrollning", "Ingenjörskonst", "Örtkunskap",
    "Inskription", "Juvelerarkonst", "Läderarbete", "Gruvdrift", "Flåning",
    "Skrädderi", "Matlagning", "Första hjälpen", "Fiske", "Gifter",
    "Låsdyrkning", "Förståelse" },
  csCZ = { "Alchymie", "Kovářství", "Očarovávání", "Inženýrství", "Bylinkářství",
    "Inskripce", "Klenotnictví", "Kožedělství", "Hornictví", "Stahování z kůží",
    "Krejčovství", "Vaření", "První pomoc", "Rybaření", "Jedy",
    "Odemykání zámků", "Porozumění" },
}

local WKEYS = {
  "axes", "axes2h", "bows", "guns", "maces", "maces2h", "polearms",
  "swords", "swords2h", "staves", "fist", "daggers", "thrown",
  "crossbows", "wands", "unarmed",
}

local WDATA = {
  enUS = { "Axes", "Two-Handed Axes", "Bows", "Guns", "Maces", "Two-Handed Maces", "Polearms",
    "Swords", "Two-Handed Swords", "Staves", "Fist Weapons", "Daggers", "Thrown",
    "Crossbows", "Wands", "Unarmed" },
  deDE = { "Äxte", "Zweihandäxte", "Bögen", "Schusswaffen", "Streitkolben", "Zweihandstreitkolben", "Stangenwaffen",
    "Schwerter", "Zweihandschwerter", "Stäbe", "Faustwaffen", "Dolche", "Wurfwaffen",
    "Armbrüste", "Zauberstäbe", "Unbewaffnet" },
  frFR = { "Haches", "Haches à deux mains", "Arcs", "Armes à feu", "Masses", "Masses à deux mains", "Armes d'hast",
    "Epées", "Epées à deux mains", "Bâtons", "Armes de pugilat", "Dagues", "Armes de jet",
    "Arbalètes", "Baguettes", "Mains nues" },
  esES = { "Hachas", "Hachas de dos manos", "Arcos", "Armas de fuego", "Mazas", "Mazas de dos manos", "Armas de asta",
    "Espadas", "Espadas de dos manos", "Bastones", "Armas de puño", "Dagas", "Armas arrojadizas",
    "Ballestas", "Varitas", "Sin armas" },
  itIT = { "Asce", "Asce a due mani", "Archi", "Armi da fuoco", "Mazze", "Mazze a due mani", "Armi ad asta",
    "Spade", "Spade a due mani", "Bastoni", "Tirapugni", "Pugnali", "Armi da lancio",
    "Balestre", "Bacchette", "Mani nude" },
  ptBR = { "Machados", "Machados de Duas Mãos", "Arcos", "Armas de Fogo", "Maças", "Maças de Duas Mãos", "Armas de Haste",
    "Espadas", "Espadas de Duas Mãos", "Báculos", "Armas de Punho", "Adagas", "Arremesso",
    "Bestas", "Varinhas", "Desarmado" },
  ruRU = { "Топоры", "Двуручные топоры", "Луки", "Огнестрельное оружие", "Дробящее оружие", "Двуручное дробящее оружие", "Древковое оружие",
    "Мечи", "Двуручные мечи", "Посохи", "Кистевое оружие", "Кинжалы", "Метательное оружие",
    "Арбалеты", "Жезлы", "Рукопашный бой" },
  plPL = { "Topory", "Topory dwuręczne", "Łuki", "Broń palna", "Buławy", "Buławy dwuręczne", "Broń drzewcowa",
    "Miecze", "Miecze dwuręczne", "Kostury", "Broń naręczna", "Sztylety", "Broń miotana",
    "Kusze", "Różdżki", "Walka wręcz" },
  nlNL = { "Bijlen", "Tweehandige bijlen", "Bogen", "Vuurwapens", "Knotsen", "Tweehandige knotsen", "Paalwapens",
    "Zwaarden", "Tweehandige zwaarden", "Staven", "Vuistwapens", "Dolken", "Werpwapens",
    "Kruisbogen", "Toverstokken", "Ongewapend" },
  svSE = { "Yxor", "Tvåhandsyxor", "Bågar", "Skjutvapen", "Spikklubbor", "Tvåhandsspikklubbor", "Stångvapen",
    "Svärd", "Tvåhandssvärd", "Stavar", "Knytnävsvapen", "Dolkar", "Kastvapen",
    "Armborst", "Trollstavar", "Obeväpnad" },
  csCZ = { "Sekery", "Obouruční sekery", "Luky", "Střelné zbraně", "Palcáty", "Obouruční palcáty", "Dřevcové zbraně",
    "Meče", "Obouruční meče", "Hole", "Pěstní zbraně", "Dýky", "Vrhací zbraně",
    "Kuše", "Hůlky", "Beze zbraně" },
}

local LINES = {
  [171] = "alchemy", [164] = "blacksmithing", [333] = "enchanting", [202] = "engineering",
  [182] = "herbalism", [773] = "inscription", [755] = "jewelcrafting", [165] = "leatherworking",
  [186] = "mining", [393] = "skinning", [197] = "tailoring", [185] = "cooking",
  [129] = "firstaid", [356] = "fishing", [40] = "poisons",
  [633] = "lockpicking",
}

local ORDER = { "enUS", "deDE", "frFR", "esES", "itIT", "ptBR", "ruRU", "plPL", "nlNL", "svSE", "csCZ" }
local NAMES = {
  enUS = "English", deDE = "Deutsch", frFR = "Français", esES = "Español", itIT = "Italiano",
  ptBR = "Português", ruRU = "Русский", plPL = "Polski", nlNL = "Nederlands",
  svSE = "Svenska", csCZ = "Čeština",
}
local CLIENT = { enGB = "enUS", esMX = "esES", ptPT = "ptBR" }

local TR = { enUS = { HELP_BODY = TR_EN_HELP } }
TR_EN_HELP = nil
for code, list in pairs(DATA) do
  TR[code] = {}
  for i, key in ipairs(KEYS) do TR[code][key] = list[i] end
end

local PN, PREV, KNOWN_PROFS = {}, {}, {}
for code, list in pairs(PDATA) do
  PN[code] = {}
  for i, key in ipairs(PKEYS) do
    PN[code][key] = list[i]
    PREV[list[i]] = key
    if not CLASS_SKILL_KEYS[key] then
      KNOWN_PROFS[list[i]] = true
    end
  end
end
PREV["Comprehension"] = "comprehension"
PREV["Verständnis"] = "comprehension"
PREV["Lockpicking"] = "lockpicking"
PREV["Poisons"] = "poisons"
PREV["Gifte"] = "poisons"

local WN, WREV = {}, {}
for code, list in pairs(WDATA) do
  WN[code] = {}
  for i, key in ipairs(WKEYS) do
    WN[code][key] = list[i]
    WREV[list[i]] = key
  end
end
WREV["One-Handed Axes"] = "axes"
WREV["Einhandäxte"] = "axes"
WREV["One-Handed Maces"] = "maces"
WREV["Einhandstreitkolben"] = "maces"
WREV["One-Handed Swords"] = "swords"
WREV["Einhandschwerter"] = "swords"
WREV["Épées"] = "swords"
WREV["Épées à deux mains"] = "swords2h"

local function ActiveCode()
  local c = DB and DB.lang
  if not c or c == "auto" then
    local loc = GetLocale()
    c = CLIENT[loc] or loc
  end
  if not TR[c] then c = "enUS" end
  return c
end

local function L(s)
  return TR[ActiveCode()][s] or s
end

local function ProfKey(name, skillLine)
  if skillLine and LINES[skillLine] then return LINES[skillLine] end
  if name and PREV[name] then return PREV[name] end
  if name then
    local low = name:lower()
    if low:find("comprehension") or low:find("verständnis") or low:find("compréhension")
      or low:find("comprensión") or low:find("comprensione") or low:find("compreensão") then
      return "comprehension"
    elseif low:find("lockpick") or low:find("schlossknack") or low:find("crochetage") then
      return "lockpicking"
    elseif low:find("poison") or low:find("gifte") or low:find("veneno") or low:find("velen") then
      return "poisons"
    end
  end
  return nil
end

local function ProfLabel(name, skillLine)
  local key = ProfKey(name, skillLine)
  if key then
    local n = PN[ActiveCode()] and PN[ActiveCode()][key]
    if n then return n end
  end
  return name
end

local function WeaponLabel(name, wkey)
  local key = wkey or WREV[name]
  if key then
    local n = WN[ActiveCode()] and WN[ActiveCode()][key]
    if n then return n end
  end
  return name
end

local WEAPONS = {
  [0]  = { 196,   "axes",      "Axes", "One-Handed Axes", "Äxte", "Einhandäxte" },
  [1]  = { 197,   "axes2h",    "Two-Handed Axes", "Zweihandäxte" },
  [2]  = { 264,   "bows",      "Bows", "Bögen" },
  [3]  = { 266,   "guns",      "Guns", "Schusswaffen" },
  [4]  = { 198,   "maces",     "Maces", "One-Handed Maces", "Streitkolben", "Einhandstreitkolben" },
  [5]  = { 199,   "maces2h",   "Two-Handed Maces", "Zweihandstreitkolben" },
  [6]  = { 200,   "polearms",  "Polearms", "Stangenwaffen" },
  [7]  = { 201,   "swords",    "Swords", "One-Handed Swords", "Schwerter", "Einhandschwerter" },
  [8]  = { 202,   "swords2h",  "Two-Handed Swords", "Zweihandschwerter" },
  [10] = { 227,   "staves",    "Staves", "Stäbe" },
  [13] = { 15590, "fist",      "Fist Weapons", "Faustwaffen" },
  [15] = { 1180,  "daggers",   "Daggers", "Dolche" },
  [16] = { 2567,  "thrown",    "Thrown", "Wurfwaffen" },
  [18] = { 5011,  "crossbows", "Crossbows", "Armbrüste" },
  [19] = { 5009,  "wands",     "Wands", "Zauberstäbe" },
}
local UNARMED = { 203, "unarmed", "Unarmed", "Unbewaffnet" }

local ALL_WEAPON_ORDER = {
  WEAPONS[0], WEAPONS[1], WEAPONS[4], WEAPONS[5], WEAPONS[7], WEAPONS[8],
  WEAPONS[6], WEAPONS[10], WEAPONS[15], WEAPONS[13],
  WEAPONS[2], WEAPONS[3], WEAPONS[18], WEAPONS[16], WEAPONS[19],
  UNARMED,
}

local SLOTS = {
  { slot = 16, opt = nil },
  { slot = 17, opt = "showOff" },
  { slot = 18, opt = "showRanged" },
}

local ANIM_MODES = {
  { id = "none",         key = "Anim: Off" },
  { id = "bounce",       key = "Anim: Bounce & Glow" },
  { id = "float",        key = "Anim: Float Up" },
  { id = "wave",         key = "Anim: Wave & Pulse" },
  { id = "sparkle",      key = "Anim: Sparkle" },
  { id = "letterbounce", key = "Anim: Letter Bounce" },
  { id = "rainbowflash", key = "Anim: Rainbow Flash" },
  { id = "custom",       key = "Anim: Custom" },
}

local SECONDARY_MODES = {
  { id = "together", key = "Show together" },
  { id = "separate", key = "Separate" },
  { id = "hide",     key = "Hide" },
}

local ORDER_MODES = {
  { id = "prof_weapon_sec", key = "Professions > Weapons > Secondary" },
  { id = "prof_sec_weapon", key = "Professions > Secondary > Weapons" },
  { id = "weapon_prof_sec", key = "Weapons > Professions > Secondary" },
  { id = "weapon_sec_prof", key = "Weapons > Secondary > Professions" },
  { id = "sec_prof_weapon", key = "Secondary > Professions > Weapons" },
  { id = "sec_weapon_prof", key = "Secondary > Weapons > Professions" },
}

local ORDER_SEQUENCES = {
  prof_weapon_sec = { "prof", "weapon", "sec" },
  prof_sec_weapon = { "prof", "sec", "weapon" },
  weapon_prof_sec = { "weapon", "prof", "sec" },
  weapon_sec_prof = { "weapon", "sec", "prof" },
  sec_prof_weapon = { "sec", "prof", "weapon" },
  sec_weapon_prof = { "sec", "weapon", "prof" },
}

local LAYOUT_MODES = {
  { id = "vertical", key = "Combined frame (Vertical)" },
  { id = "columns",  key = "Side-by-side (Columns right)" },
  { id = "separate", key = "Separate frames (Free move)" },
}

local DEFAULT_CRAFTER = {
  arrowBounce = true,
  bounceHeight = 10,
  starGlow = true,
  glowAlpha = 1.0,
  doubleSparkle = false,
  counterPulse = true,
  letterBounce = false,
  letterHeight = 6,
  letterSpeed = 7,
  rainbowFlash = false,
  rainbowSpeed = 14,
}

local function AnimModeLabel(id)
  for _, m in ipairs(ANIM_MODES) do
    if m.id == id then return L(m.key) end
  end
  return L("Anim: Bounce & Glow")
end

local function SecondaryModeLabel(id)
  for _, m in ipairs(SECONDARY_MODES) do
    if m.id == id then return L(m.key) end
  end
  return L("Show together")
end

local function OrderLabel()
  local id = (DB and DB.blockOrder) or "prof_weapon_sec"
  for _, m in ipairs(ORDER_MODES) do
    if m.id == id then return L(m.key) end
  end
  return L("Professions > Weapons > Secondary")
end

local function LayoutLabel()
  local id = (DB and DB.layoutMode) or "vertical"
  for _, m in ipairs(LAYOUT_MODES) do
    if m.id == id then return L(m.key) end
  end
  return L("Combined frame (Vertical)")
end

local MAX_SKILL_CAP = 300
local MAX_RANGES = 6
local GAIN_DURATION = 10
local COLUMN_GAP = 22

local SECTION_DEFAULTS = {
  prof = {
    enabled = true,
    secondaryMode = "together",
    showClassSkills = true,
    hiddenProfs = {},
    fontSize = 12,
    animStyle = "bounce",
    crafter = DEFAULT_CRAFTER,
    showCounter = true,
    permCounter = false,
    showMax = false,
    outline = false,
    showBar = false,
    capColor = { 1, 0.3, 0.3 },
    maxColor = { 0.4, 0.8, 1 },
    ranges = {
      { 0, 150, 0.2, 1, 0.2 },
      { 151, 225, 1, 0.9, 0.1 },
      { 226, 299, 1, 0.5, 0 },
    },
  },
  weapon = {
    enabled = true,
    fontSize = 12,
    animStyle = "bounce",
    crafter = DEFAULT_CRAFTER,
    showCounter = true,
    permCounter = false,
    showMax = false,
    outline = false,
    showBar = false,
    showAllWeapons = false,
    onlyLearnedWeapons = true,
    selectedWeapons = {},
    showOff = false,
    showRanged = true,
    activeCombatWeapon = false,
    capColor = { 1, 0.3, 0.3 },
    maxColor = { 0.4, 0.8, 1 },
    ranges = {
      { 0, 150, 0.2, 1, 0.2 },
      { 151, 225, 1, 0.9, 0.1 },
      { 226, 299, 1, 0.5, 0 },
    },
  },
}

local function Copy(v)
  if type(v) ~= "table" then return v end
  local t = {}
  for k, x in pairs(v) do t[k] = Copy(x) end
  return t
end

local lastExpand = 0

local function SpellName(id)
  if C_Spell and C_Spell.GetSpellName then return C_Spell.GetSpellName(id) end
  if GetSpellInfo then return (GetSpellInfo(id)) end
end

local function ItemInstant(id)
  local f = (C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant
  if f then return f(id) end
end

local function NumLines()
  if GetNumSkillLines then return GetNumSkillLines() or 0 end
  if C_SkillInfo and C_SkillInfo.GetNumSkillLines then return C_SkillInfo.GetNumSkillLines() or 0 end
  return 0
end

local function LineInfo(i)
  local r1, r2, r3, r4, r5, r6, r7
  if GetSkillLineInfo then
    r1, r2, r3, r4, r5, r6, r7 = GetSkillLineInfo(i)
  elseif C_SkillInfo and C_SkillInfo.GetSkillLineInfo then
    r1, r2, r3, r4, r5, r6, r7 = C_SkillInfo.GetSkillLineInfo(i)
  end
  if type(r1) == "table" then
    local t = r1
    return t.skillName or t.name or t.skillLineName or t.professionName,
           t.isHeader, t.isExpanded,
           t.skillRank or t.skillLevel or t.rank,
           t.skillMaxRank or t.maxSkillLevel or t.maxRank
  end
  return r1, r2, r3, r4, r7
end

local function ExpandAll()
  if ExpandSkillHeader then
    pcall(ExpandSkillHeader, 0)
  elseif C_SkillInfo and C_SkillInfo.ExpandSkillHeader then
    pcall(C_SkillInfo.ExpandSkillHeader, 0)
  end
end

local function CanExpand()
  return ExpandSkillHeader or (C_SkillInfo and C_SkillInfo.ExpandSkillHeader)
end

local function ScanSkills()
  local skills, weaponSectionSkills, collapsed = {}, {}, false
  local inWeaponHeader = false
  local n = NumLines()
  for i = 1, n do
    local name, isHeader, isExpanded, rank, maxRank = LineInfo(i)
    if name then
      if isHeader then
        if not isExpanded or isExpanded == 0 then collapsed = true end
        local low = name:lower()
        inWeaponHeader = (WEAPON_SKILLS and name == WEAPON_SKILLS)
          or low:find("weapon") ~= nil or low:find("waffen") ~= nil
          or low:find("arme") ~= nil or low:find("оружи") ~= nil
      else
        local info = { rank = rank or 0, max = maxRank or 0 }
        skills[name] = info
        if inWeaponHeader then
          weaponSectionSkills[name] = info
        end
      end
    end
  end
  return skills, weaponSectionSkills, collapsed
end

local function EnsureSkillsScanned(skills, weaponSectionSkills, collapsed)
  if not skills then
    skills, weaponSectionSkills, collapsed = ScanSkills()
  end
  if (collapsed or next(skills) == nil) and CanExpand() and (GetTime() - lastExpand) > 2 then
    lastExpand = GetTime()
    ExpandAll()
    skills, weaponSectionSkills, collapsed = ScanSkills()
  end
  return skills, weaponSectionSkills, collapsed
end

local function FindSkill(skills, def, subType)
  for i = 3, #def do
    if skills[def[i]] then return def[i], skills[def[i]], def[2] end
  end
  local sn = SpellName(def[1])
  if sn and skills[sn] then return sn, skills[sn], def[2] end
  if subType and skills[subType] then return subType, skills[subType], def[2] end
  for _, list in pairs(WDATA) do
    for idx, key in ipairs(WKEYS) do
      if key == def[2] and skills[list[idx]] then
        return list[idx], skills[list[idx]], def[2]
      end
    end
  end
end

local function FindUnarmed(skills, weaponSectionSkills)
  local n, info, k = FindSkill(skills, UNARMED)
  if n then return n, info, k end
  for sname, sinfo in pairs(weaponSectionSkills) do
    local low = sname:lower()
    if low:find("unarmed") or low:find("unbewaffnet") or low:find("mains nues")
      or low:find("sin armas") or low:find("mani nude") or low:find("desarmado")
      or low:find("рукопаш") or low:find("wręcz") or low:find("ongewapend")
      or low:find("obeväpnad") or low:find("beze zbran") then
      return sname, sinfo, "unarmed"
    end
  end
end

local function ResolveSlot(slot, skills, weaponSectionSkills)
  local link = GetInventoryItemLink and GetInventoryItemLink("player", slot)
  local id = GetInventoryItemID("player", slot) or (link and tonumber(link:match("item:(%d+)")))
  if not id then
    if slot == 16 then
      return FindUnarmed(skills, weaponSectionSkills)
    end
    return nil
  end
  local _, _, subType, _, _, classID, subClassID = ItemInstant(id)
  if classID ~= 2 then
    if slot == 16 then
      return FindUnarmed(skills, weaponSectionSkills)
    end
    return nil
  end
  local def = WEAPONS[subClassID]
  if not def then return nil end
  return FindSkill(skills, def, subType)
end

local function GetProfs(skills)
  local list, seenKeys = {}, {}

  local function addProf(name, rank, maxRank, skillLine)
    local pkey = ProfKey(name, skillLine)
    if pkey and seenKeys[pkey] then return end
    if pkey then seenKeys[pkey] = true end
    local isSecondary = (pkey and SECONDARY_KEYS[pkey]) and true or false
    local isClassSkill = (pkey and CLASS_SKILL_KEYS[pkey]) and true or false
    list[#list + 1] = {
      name = name,
      key = pkey,
      rank = rank or 0,
      max = maxRank or 0,
      line = skillLine,
      isSecondary = isSecondary,
      isClassSkill = isClassSkill,
    }
  end

  if GetProfessions and GetProfessionInfo then
    local ok, a, b, c, d, e = pcall(GetProfessions)
    if ok then
      for _, idx in ipairs({ a or false, b or false, c or false, d or false, e or false }) do
        if idx then
          local ok2, name, _, rank, maxRank, _, _, skillLine = pcall(GetProfessionInfo, idx)
          if ok2 and name then
            addProf(name, rank, maxRank, skillLine)
          end
        end
      end
    end
  end

  if #list == 0 and GetNumSkillLines and GetSkillLineInfo then
    local section = false
    for i = 1, GetNumSkillLines() do
      local name, isHeader, _, rank, _, _, maxRank = GetSkillLineInfo(i)
      if isHeader then
        section = (name == TRADE_SKILLS or name == SECONDARY_SKILLS)
      elseif name and (section or KNOWN_PROFS[name]) then
        addProf(name, rank, maxRank, nil)
      end
    end
  end

  if skills then
    local targetKeys = { "poisons", "comprehension", "lockpicking" }
    for _, tkey in ipairs(targetKeys) do
      if not seenKeys[tkey] then
        local foundName, foundInfo
        for sname, sinfo in pairs(skills) do
          if ProfKey(sname) == tkey then
            foundName, foundInfo = sname, sinfo
            break
          end
        end
        if foundName and foundInfo then
          local r = foundInfo.rank or 0
          local m = foundInfo.max or 0
          if tkey ~= "lockpicking" or (m > 0 and r < m) then
            addProf(foundName, r, m, nil)
          end
        end
      end
    end
  end

  return list
end

local function ShouldHideHUD()
  if not DB then return false end
  if DB.hideInCombat and UnitAffectingCombat and UnitAffectingCombat("player") then
    return true
  end
  if DB.hideInInstance and IsInInstance then
    local inInst, instType = IsInInstance()
    if inInst and instType and instType ~= "none" then
      return true
    end
  end
  return false
end

local function RangeColor(cfg, rank)
  for _, r in ipairs(cfg.ranges) do
    if rank >= r[1] and rank <= r[2] then return r[3], r[4], r[5] end
  end
  return 1, 0.82, 0
end

local function RowColor(cfg, rank, maxRank)
  local top = MAX_SKILL_CAP
  if maxRank and maxRank > 0 and maxRank > top then top = maxRank end
  if rank >= top then return unpack(cfg.maxColor) end
  if maxRank and maxRank > 0 and rank >= maxRank then return unpack(cfg.capColor) end
  return RangeColor(cfg, rank)
end

local function Rainbow(h)
  local i = math.floor(h * 6)
  local f = h * 6 - i
  local q = 1 - f
  i = i % 6
  if i == 0 then return 1, f, 0
  elseif i == 1 then return q, 1, 0
  elseif i == 2 then return 0, 1, f
  elseif i == 3 then return 0, q, 1
  elseif i == 4 then return f, 0, 1
  else return 1, 0, q end
end

local function SplitUTF8(str)
  local chars = {}
  local i, len = 1, #str
  while i <= len do
    local b = str:byte(i)
    local step = 1
    if b >= 240 then step = 4
    elseif b >= 224 then step = 3
    elseif b >= 192 then step = 2 end
    chars[#chars + 1] = str:sub(i, i + step - 1)
    i = i + step
  end
  return chars
end

local function AddAlpha(group, from, to, dur, order)
  local a = group:CreateAnimation("Alpha")
  if a.SetFromAlpha then
    a:SetFromAlpha(from); a:SetToAlpha(to)
  else
    a:SetChange(to - from)
  end
  a:SetDuration(dur); a:SetOrder(order)
  return a
end

local function AddMove(group, x, y, dur, order, smooth)
  local t = group:CreateAnimation("Translation")
  t:SetOffset(x, y); t:SetDuration(dur); t:SetOrder(order)
  if smooth then t:SetSmoothing(smooth) end
  return t
end

local function SetupRowAnims(row)
  row.charStrings = {}
  row.charBounce = nil
  row.rainbowFlashActive = false
  row.rainbowFlashSpeed = 1.4
  row.customArrowIdle = false

  row.glow = row:CreateTexture(nil, "OVERLAY")
  row.glow:SetTexture("Interface\\Cooldown\\star4")
  row.glow:SetBlendMode("ADD")
  row.glow:SetVertexColor(0.4, 1, 0.4)
  row.glow:SetPoint("CENTER", row.arrow, "CENTER", 0, 0)
  row.glow:SetAlpha(0)
  row.glow:Hide()

  row.idleBounce = row.arrow:CreateAnimationGroup()
  AddMove(row.idleBounce, 0, 3, 0.7, 1, "IN_OUT")
  AddMove(row.idleBounce, 0, -3, 0.7, 2, "IN_OUT")
  row.idleBounce:SetLooping("REPEAT")

  row.idleWave = row.arrow:CreateAnimationGroup()
  AddMove(row.idleWave, 2, 2, 0.45, 1, "IN_OUT")
  AddMove(row.idleWave, -2, -2, 0.45, 2, "IN_OUT")
  row.idleWave:SetLooping("REPEAT")

  row.idleSparkle = row.glow:CreateAnimationGroup()
  AddAlpha(row.idleSparkle, 0.15, 0.75, 0.55, 1)
  AddAlpha(row.idleSparkle, 0.75, 0.15, 0.55, 2)
  row.idleSparkle:SetLooping("REPEAT")

  row.popBounce = row.arrow:CreateAnimationGroup()
  AddAlpha(row.popBounce, 0, 1, 0.15, 1)
  row.popBounceUp = AddMove(row.popBounce, 0, 10, 0.18, 1, "OUT")
  row.popBounceDown = AddMove(row.popBounce, 0, -10, 0.22, 2, "IN")
  row.popBounce:SetScript("OnFinished", function()
    if row.activeAnim == "bounce" or (row.activeAnim == "custom" and row.customArrowIdle) then
      row.idleBounce:Play()
    end
  end)

  row.popFloat = row.arrow:CreateAnimationGroup()
  AddAlpha(row.popFloat, 0, 1, 0.15, 1)
  AddMove(row.popFloat, 0, 12, 0.55, 1, "OUT")
  AddAlpha(row.popFloat, 1, 0.85, 0.25, 2)
  AddMove(row.popFloat, 0, -12, 0.25, 2, "IN")
  row.popFloat:SetScript("OnFinished", function()
    if row.activeAnim == "float" then row.idleBounce:Play() end
  end)

  row.popWave = row.arrow:CreateAnimationGroup()
  AddAlpha(row.popWave, 0, 1, 0.15, 1)
  AddMove(row.popWave, 6, 4, 0.16, 1, "OUT")
  AddMove(row.popWave, -6, -4, 0.20, 2, "IN")
  row.popWave:SetScript("OnFinished", function()
    if row.activeAnim == "wave" then row.idleWave:Play() end
  end)

  row.flash = row.glow:CreateAnimationGroup()
  row.flashIn = AddAlpha(row.flash, 0, 1, 0.14, 1)
  row.flashOut = AddAlpha(row.flash, 1, 0, 0.55, 2)
  row.flash:SetScript("OnFinished", function()
    row.glow:SetAlpha(0)
    row.glow:Hide()
  end)

  row.sparkle = row.glow:CreateAnimationGroup()
  row.sp1In = AddAlpha(row.sparkle, 0, 1, 0.12, 1)
  row.sp1Out = AddAlpha(row.sparkle, 1, 0.2, 0.18, 2)
  row.sp2In = AddAlpha(row.sparkle, 0.2, 1, 0.14, 3)
  row.sp2Out = AddAlpha(row.sparkle, 1, 0.25, 0.40, 4)
  row.sparkle:SetScript("OnFinished", function()
    if row.activeAnim == "sparkle" then
      row.glow:SetAlpha(1)
      row.glow:Show()
      row.idleSparkle:Play()
    else
      row.glow:SetAlpha(0)
      row.glow:Hide()
    end
  end)

  row.gainPulse = row.gain:CreateAnimationGroup()
  AddAlpha(row.gainPulse, 1, 0.2, 0.12, 1)
  AddAlpha(row.gainPulse, 0.2, 1, 0.25, 2)
end

local function SetBounceHeight(row, h)
  h = h or 10
  row.popBounceUp:SetOffset(0, h)
  row.popBounceDown:SetOffset(0, -h)
end

local function PlayGlowEffect(row, alpha, doubleSparkle)
  alpha = math.max(0.1, math.min(1, alpha or 1))
  row.idleSparkle:Stop()
  row.flash:Stop()
  row.sparkle:Stop()
  row.glow:SetAlpha(1)
  row.glow:Show()
  if doubleSparkle then
    row.sp1In:SetFromAlpha(0); row.sp1In:SetToAlpha(alpha)
    row.sp1Out:SetFromAlpha(alpha); row.sp1Out:SetToAlpha(alpha * 0.2)
    row.sp2In:SetFromAlpha(alpha * 0.2); row.sp2In:SetToAlpha(alpha)
    row.sp2Out:SetFromAlpha(alpha); row.sp2Out:SetToAlpha(row.activeAnim == "sparkle" and (alpha * 0.25) or 0)
    row.sparkle:Play()
  else
    row.flashIn:SetFromAlpha(0); row.flashIn:SetToAlpha(alpha)
    row.flashOut:SetFromAlpha(alpha); row.flashOut:SetToAlpha(0)
    row.flash:Play()
  end
end

local function HideCharStrings(row)
  if row.charStrings then
    for _, fs in ipairs(row.charStrings) do
      fs:Hide()
    end
  end
  row.charBounce = nil
end

local function StopAnims(row)
  row.idleBounce:Stop()
  row.idleWave:Stop()
  row.idleSparkle:Stop()
  row.popBounce:Stop()
  row.popFloat:Stop()
  row.popWave:Stop()
  row.flash:Stop()
  row.sparkle:Stop()
  row.gainPulse:Stop()
  row.glow:SetAlpha(0)
  row.glow:Hide()
  row.rainbowFlashActive = false
  row.customArrowIdle = false
  row.activeAnim = nil
  HideCharStrings(row)
  row.text:SetAlpha(1)
  if row.gain:IsShown() then
    row.gain:SetAlpha(1)
    row.gain:SetTextColor(0.2, 1, 0.2)
  end
end

local measureFS

local function StartLetterBounce(row, fullText, gainText, font, size, flags, r, g, b, height, speed, resetPhase)
  row.text:SetAlpha(0)
  row.gain:SetAlpha(0)
  local labelChars = SplitUTF8(fullText)
  local gainChars = SplitUTF8(gainText)
  local total = #labelChars + #gainChars

  measureFS:SetFont(font, size, flags)

  local prefix = ""
  local x = 0
  for i = 1, #labelChars do
    local ch = labelChars[i]
    local fs = row.charStrings[i]
    if not fs then
      fs = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      row.charStrings[i] = fs
    end
    fs:SetFont(font, size, flags)
    fs:SetText(ch)
    fs:SetTextColor(r, g, b)
    fs.anchorFrame = row.text
    fs.baseX = x
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", row.text, "TOPLEFT", x, 0)
    fs:Show()

    prefix = prefix .. ch
    measureFS:SetText(prefix)
    x = measureFS:GetStringWidth()
  end

  local gainPrefix = ""
  local gx = 0
  for j = 1, #gainChars do
    local idx = #labelChars + j
    local ch = gainChars[j]
    local fs = row.charStrings[idx]
    if not fs then
      fs = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      row.charStrings[idx] = fs
    end
    fs:SetFont(font, size, flags)
    fs:SetText(ch)
    fs:SetTextColor(0.2, 1, 0.2)
    fs.anchorFrame = row.gain
    fs.baseX = gx
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", row.gain, "TOPLEFT", gx, 0)
    fs:Show()

    gainPrefix = gainPrefix .. ch
    measureFS:SetText(gainPrefix)
    gx = measureFS:GetStringWidth()
  end

  for i = total + 1, #row.charStrings do
    row.charStrings[i]:Hide()
  end

  local prevStart = row.charBounce and row.charBounce.startTime
  row.charBounce = {
    count = total,
    labelCount = #labelChars,
    startTime = (resetPhase or not prevStart) and GetTime() or prevStart,
    height = height or 5.5,
    speed = speed or 6.5,
  }
end

local function UpdateLetterBounce(row)
  local cb = row.charBounce
  if not cb then return end
  local elapsed = GetTime() - cb.startTime
  for i = 1, cb.count do
    local fs = row.charStrings[i]
    if fs and fs:IsShown() then
      local phase = (elapsed * cb.speed) - (i * 0.42)
      local yOff = 0
      if phase > 0 then
        local wave = math.sin(phase)
        if wave > 0 then
          yOff = wave * cb.height
        end
      end
      fs:ClearAllPoints()
      fs:SetPoint("TOPLEFT", fs.anchorFrame or row.text, "TOPLEFT", fs.baseX or 0, yOff)
    end
  end
end

local function EnsureIdleAnim(row, style, cr)
  if style == "none" then
    StopAnims(row)
    return
  end
  if row.activeAnim ~= style then
    StopAnims(row)
    row.activeAnim = style
  end
  if style == "wave" then
    if not row.idleWave:IsPlaying() and not row.popWave:IsPlaying() then
      row.idleWave:Play()
    end
  elseif style == "bounce" or style == "float" then
    if not row.idleBounce:IsPlaying() and not row.popBounce:IsPlaying() and not row.popFloat:IsPlaying() then
      row.idleBounce:Play()
    end
  elseif style == "sparkle" then
    if not row.sparkle:IsPlaying() and not row.idleSparkle:IsPlaying() then
      row.glow:SetAlpha(1)
      row.glow:Show()
      row.idleSparkle:Play()
    end
  elseif style == "letterbounce" then
    local r, g, b = row.text:GetTextColor()
    local font, size, flags = row.text:GetFont()
    StartLetterBounce(row, row.text:GetText() or "", row.gain:GetText() or "", font, size, flags, r, g, b, 5.5, 6.5, false)
  elseif style == "rainbowflash" then
    row.rainbowFlashActive = true
    row.rainbowFlashSpeed = 1.4
  elseif style == "custom" and cr then
    row.customArrowIdle = cr.arrowBounce
    if cr.arrowBounce then
      if not row.idleBounce:IsPlaying() and not row.popBounce:IsPlaying() then
        row.idleBounce:Play()
      end
    else
      row.idleBounce:Stop()
    end
    if cr.letterBounce then
      local r, g, b = row.text:GetTextColor()
      local font, size, flags = row.text:GetFont()
      StartLetterBounce(row, row.text:GetText() or "", row.gain:GetText() or "", font, size, flags, r, g, b, cr.letterHeight, cr.letterSpeed, false)
    elseif row.charBounce then
      HideCharStrings(row)
      row.text:SetAlpha(1)
      row.gain:SetAlpha(1)
    end
    row.rainbowFlashActive = cr.rainbowFlash and true or false
    row.rainbowFlashSpeed = (cr.rainbowSpeed or 14) * 0.1
  end
end

local function PlayLevelUp(row, style, firstTime, cr)
  row.arrow:Show()
  row.gain:Show()
  if style == "none" then
    StopAnims(row)
    return
  end
  if row.activeAnim ~= style then
    StopAnims(row)
    row.activeAnim = style
  end

  if style == "bounce" then
    SetBounceHeight(row, 10)
    if firstTime then
      row.idleBounce:Stop()
      row.popBounce:Play()
    else
      row.gainPulse:Stop(); row.gainPulse:Play()
    end
    PlayGlowEffect(row, 1.0, false)
  elseif style == "float" then
    row.idleBounce:Stop()
    row.popFloat:Stop(); row.popFloat:Play()
    row.gainPulse:Stop(); row.gainPulse:Play()
  elseif style == "wave" then
    if firstTime then
      row.idleWave:Stop()
      row.popWave:Play()
    end
    row.gainPulse:Stop(); row.gainPulse:Play()
  elseif style == "sparkle" then
    PlayGlowEffect(row, 1.0, true)
    row.gainPulse:Stop(); row.gainPulse:Play()
  elseif style == "letterbounce" then
    local r, g, b = row.text:GetTextColor()
    local font, size, flags = row.text:GetFont()
    StartLetterBounce(row, row.text:GetText() or "", row.gain:GetText() or "", font, size, flags, r, g, b, 5.5, 6.5, true)
    PlayGlowEffect(row, 1.0, false)
  elseif style == "rainbowflash" then
    row.rainbowFlashActive = true
    row.rainbowFlashSpeed = 1.4
    PlayGlowEffect(row, 1.0, false)
    row.gainPulse:Stop(); row.gainPulse:Play()
  elseif style == "custom" and cr then
    row.customArrowIdle = cr.arrowBounce
    if cr.arrowBounce then
      SetBounceHeight(row, cr.bounceHeight)
      row.idleBounce:Stop()
      row.popBounce:Stop(); row.popBounce:Play()
    else
      row.idleBounce:Stop()
      row.popBounce:Stop()
    end
    if cr.starGlow then
      PlayGlowEffect(row, cr.glowAlpha, cr.doubleSparkle)
    else
      row.flash:Stop(); row.sparkle:Stop(); row.idleSparkle:Stop()
      row.glow:SetAlpha(0); row.glow:Hide()
    end
    if cr.counterPulse and not cr.letterBounce then
      row.gainPulse:Stop(); row.gainPulse:Play()
    else
      row.gainPulse:Stop(); row.gain:SetAlpha(1)
    end
    if cr.letterBounce then
      local r, g, b = row.text:GetTextColor()
      local font, size, flags = row.text:GetFont()
      StartLetterBounce(row, row.text:GetText() or "", row.gain:GetText() or "", font, size, flags, r, g, b, cr.letterHeight, cr.letterSpeed, true)
    else
      HideCharStrings(row)
      row.text:SetAlpha(1)
      row.gain:SetAlpha(1)
    end
    row.rainbowFlashActive = cr.rainbowFlash and true or false
    row.rainbowFlashSpeed = (cr.rainbowSpeed or 14) * 0.1
  end
end

local UpdateAll, RefreshOptions

local tracker = {
  prof   = { last = {}, gains = {}, gainTimes = {} },
  weapon = { last = {}, gains = {}, gainTimes = {} },
}

local function MakeTrackerFrame(name, defaultX, defaultY)
  local f = CreateFrame("Frame", name, UIParent)
  f:SetSize(160, 20)
  f:SetPoint("CENTER", UIParent, "CENTER", defaultX, defaultY)
  f:SetMovable(true)
  f:SetClampedToScreen(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  f:Hide()
  return f
end

local mainFrame    = MakeTrackerFrame("SkillLevelsFrame", 0, 0)
local profFrame    = MakeTrackerFrame("SkillLevelsProfFrame", -120, 30)
local weaponFrame  = MakeTrackerFrame("SkillLevelsWeaponFrame", 40, 30)
local secProfFrame = MakeTrackerFrame("SkillLevelsSecProfFrame", 200, 30)

measureFS = mainFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
measureFS:Hide()

local function AttachDragHandlers(frame, posKey)
  frame:SetScript("OnDragStart", function(self)
    if DB and DB.locked then return end
    self:StartMoving()
  end)
  frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    if not DB then return end
    local p, _, rp, x, y = self:GetPoint()
    DB[posKey] = { p, rp, x, y }
  end)
end

AttachDragHandlers(mainFrame, "pos")
AttachDragHandlers(profFrame, "profPos")
AttachDragHandlers(weaponFrame, "weaponPos")
AttachDragHandlers(secProfFrame, "secPos")

local function OpenProfessions()
  if ToggleProfessionsBook then
    ToggleProfessionsBook()
  elseif ProfessionsBookFrame then
    if ProfessionsBookFrame:IsShown() then ProfessionsBookFrame:Hide() else ProfessionsBookFrame:Show() end
  elseif ToggleSpellBook and BOOKTYPE_PROFESSION then
    ToggleSpellBook(BOOKTYPE_PROFESSION)
  elseif ToggleCharacter then
    ToggleCharacter("SkillFrame")
  else
    print(L("Profession window function not found"))
  end
end

local function OpenSkills()
  if ToggleCharacter then
    ToggleCharacter("SkillFrame")
  else
    print(L("Skill window not found"))
  end
end

local rows = {}

local function ApplyRowColor(row)
  if not row.cfg then return end
  if row.isHovered and not row.isSeparator then
    row.text:SetTextColor(1, 1, 1)
    if row.charBounce and row.charStrings then
      for i = 1, row.charBounce.count do
        local fs = row.charStrings[i]
        if fs then
          if i <= row.charBounce.labelCount then
            fs:SetTextColor(1, 1, 1)
          else
            fs:SetTextColor(0.2, 1, 0.2)
          end
        end
      end
    end
    return
  end
  local r, g, b
  local gr, gg, gb = 0.2, 1, 0.2
  if row.rainbowFlashActive then
    local spd = row.rainbowFlashSpeed or 1.4
    r, g, b = Rainbow((GetTime() * spd + (row.index or 0) * 0.15) % 1)
    gr, gg, gb = Rainbow((GetTime() * spd + 0.35) % 1)
    if row.gain:IsShown() then
      row.gain:SetTextColor(gr, gg, gb)
    end
  elseif DB and DB.rainbow then
    r, g, b = Rainbow((GetTime() * 0.2 + (row.index or 0) * 0.1) % 1)
  else
    r, g, b = RowColor(row.cfg, row.rank or 0, row.maxRank)
  end
  row.text:SetTextColor(r, g, b)
  if row.barFill and row.barFill:IsShown() then
    local br, bg, bb = RowColor(row.cfg, row.rank or 0, row.maxRank)
    if DB and DB.rainbow then
      br, bg, bb = r, g, b
    end
    row.barFill:SetVertexColor(br, bg, bb, 0.9)
  end
  if row.charBounce and row.charStrings then
    for i = 1, row.charBounce.count do
      local fs = row.charStrings[i]
      if fs then
        if i <= row.charBounce.labelCount then
          fs:SetTextColor(r, g, b)
        else
          fs:SetTextColor(gr, gg, gb)
        end
      end
    end
  end
end

local function GetRow(i)
  if rows[i] then return rows[i] end
  local row = CreateFrame("Button", nil, mainFrame)
  row.index = i
  row:SetSize(160, 16)
  row:RegisterForClicks("LeftButtonUp")
  row:RegisterForDrag("LeftButton")
  row:SetScript("OnDragStart", function(self)
    if DB and DB.locked then return end
    local p = self:GetParent()
    if p and p.StartMoving then p:StartMoving() end
  end)
  row:SetScript("OnDragStop", function(self)
    local p = self:GetParent()
    if p and p.StopMovingOrSizing then
      p:StopMovingOrSizing()
      local script = p:GetScript("OnDragStop")
      if script then script(p) end
    end
  end)
  row:SetScript("OnClick", function(self)
    if self.onClick then self.onClick() end
  end)
  row:SetScript("OnEnter", function(self)
    if self.isSeparator then return end
    self.isHovered = true
    ApplyRowColor(self)
  end)
  row:SetScript("OnLeave", function(self)
    self.isHovered = false
    if not self.isSeparator then
      ApplyRowColor(self)
    end
  end)

  row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  row.text:SetPoint("TOPLEFT", row, "TOPLEFT", 0, -1)

  row.barBg = row:CreateTexture(nil, "BACKGROUND")
  row.barBg:SetTexture("Interface\\Buttons\\WHITE8X8")
  row.barBg:SetVertexColor(0, 0, 0, 0.55)
  row.barBg:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 0, 1)
  row.barBg:SetHeight(2)
  row.barBg:Hide()

  row.barFill = row:CreateTexture(nil, "ARTWORK")
  row.barFill:SetTexture("Interface\\Buttons\\WHITE8X8")
  row.barFill:SetVertexColor(0.2, 1, 0.2, 0.9)
  row.barFill:SetPoint("LEFT", row.barBg, "LEFT", 0, 0)
  row.barFill:SetHeight(2)
  row.barFill:Hide()

  row.arrow = row:CreateTexture(nil, "OVERLAY")
  row.arrow:SetTexture("Interface\\Buttons\\Arrow-Up-Up")
  row.arrow:SetVertexColor(0.2, 1, 0.2)
  row.arrow:SetPoint("LEFT", row.text, "RIGHT", 4, 0)
  row.arrow:Hide()

  row.gain = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  row.gain:SetPoint("LEFT", row.arrow, "RIGHT", 2, 0)
  row.gain:SetTextColor(0.2, 1, 0.2)
  row.gain:Hide()

  SetupRowAnims(row)
  rows[i] = row
  return row
end

local animDriver = CreateFrame("Frame")
local rbTimer, expTimer = 0, 0
animDriver:SetScript("OnUpdate", function(_, elapsed)
  if not DB then return end

  for _, row in ipairs(rows) do
    if row:IsShown() and not row.isSeparator and row.charBounce then
      UpdateLetterBounce(row)
    end
  end

  rbTimer = rbTimer + elapsed
  if rbTimer >= 0.03 then
    rbTimer = 0
    for _, row in ipairs(rows) do
      if row:IsShown() and not row.isSeparator and row.cfg and (DB.rainbow or row.rainbowFlashActive) then
        ApplyRowColor(row)
      end
    end
  end

  expTimer = expTimer + elapsed
  if expTimer >= 0.25 then
    expTimer = 0
    local now = GetTime()
    local expired = false
    for secKey, tr in pairs(tracker) do
      local cfg = DB[secKey]
      if cfg and not cfg.permCounter and next(tr.gains) then
        for name, t in pairs(tr.gainTimes) do
          if now - t >= GAIN_DURATION then
            tr.gains[name] = nil
            tr.gainTimes[name] = nil
            expired = true
          end
        end
      end
    end
    if expired then UpdateAll() end
  end
end)

local function CollectProfEntries(cfg, skills)
  local list = GetProfs(skills)
  local primary, secondary, tracked = {}, {}, {}
  local secMode = cfg.secondaryMode or "together"
  local showClass = cfg.showClassSkills ~= false
  local hidden = cfg.hiddenProfs or {}

  for _, p in ipairs(list) do
    tracked[p.name] = { rank = p.rank, max = p.max }
    local idKey = p.key or p.name
    local include = true
    if hidden[idKey] or hidden[p.name] then
      include = false
    elseif p.isClassSkill and not showClass then
      include = false
    elseif p.isSecondary and secMode == "hide" then
      include = false
    end

    if include then
      local entry = {
        name = p.name,
        label = ProfLabel(p.name, p.line),
        rank = p.rank,
        max = p.max,
        isClassSkill = p.isClassSkill,
      }
      if p.isSecondary and secMode == "separate" then
        secondary[#secondary + 1] = entry
      else
        primary[#primary + 1] = entry
      end
    end
  end
  return primary, secondary, tracked
end

local function HasAnySelectedWeapon(sel)
  if type(sel) ~= "table" then return false end
  for _, v in pairs(sel) do
    if v then return true end
  end
  return false
end

local function CollectWeaponEntries(cfg, skills, weaponSectionSkills)
  local entries, seen = {}, {}

  if cfg.showAllWeapons and not cfg.activeCombatWeapon then
    for _, def in ipairs(ALL_WEAPON_ORDER) do
      local name, info, wkey = FindSkill(skills, def)
      if name and not seen[name] then
        seen[name] = true
        entries[#entries + 1] = {
          name = name,
          label = WeaponLabel(name, wkey),
          rank = info.rank,
          max = info.max,
        }
      end
    end
  elseif HasAnySelectedWeapon(cfg.selectedWeapons) and not cfg.activeCombatWeapon then
    for _, def in ipairs(ALL_WEAPON_ORDER) do
      if cfg.selectedWeapons[def[2]] then
        local name, info, wkey = FindSkill(skills, def)
        if name and not seen[name] then
          seen[name] = true
          entries[#entries + 1] = {
            name = name,
            label = WeaponLabel(name, wkey),
            rank = info.rank,
            max = info.max,
          }
        end
      end
    end
  else
    for _, s in ipairs(SLOTS) do
      if not s.opt or cfg[s.opt] then
        local name, info, wkey = ResolveSlot(s.slot, skills, weaponSectionSkills)
        if name and not seen[name] then
          seen[name] = true
          entries[#entries + 1] = {
            name = name,
            label = WeaponLabel(name, wkey),
            rank = info.rank,
            max = info.max,
          }
        end
      end
    end
  end

  return entries, skills
end

local function TrackSection(secKey, allTracked, now)
  local cfg = DB[secKey]
  local tr = tracker[secKey]
  if not cfg.permCounter then
    for name, t in pairs(tr.gainTimes) do
      if now - t >= GAIN_DURATION then
        tr.gains[name] = nil
        tr.gainTimes[name] = nil
      end
    end
  end
  for name, info in pairs(allTracked) do
    local before = tr.gains[name] or 0
    if tr.last[name] and info.rank > tr.last[name] then
      tr.gains[name] = before + (info.rank - tr.last[name])
      tr.gainTimes[name] = now
    end
    tr.last[name] = info.rank
  end
end

local function HideAllHUD()
  for _, r in ipairs(rows) do
    r.isHovered = false
    StopAnims(r)
    r:Hide()
  end
  mainFrame:Hide()
  profFrame:Hide()
  weaponFrame:Hide()
  secProfFrame:Hide()
end

function UpdateAll()
  if not DB then return end
  local now = GetTime()

  local skills, weaponSectionSkills = EnsureSkillsScanned()

  local profPrimary, profSecondary, profTracked = CollectProfEntries(DB.prof, skills)
  local weaponEntries, weaponTracked = CollectWeaponEntries(DB.weapon, skills, weaponSectionSkills)

  TrackSection("prof", profTracked, now)
  TrackSection("weapon", weaponTracked, now)

  if ShouldHideHUD() then
    HideAllHUD()
    return
  end

  local showProf = DB.prof.enabled and (#profPrimary > 0)
  local showSec = DB.prof.enabled and (#profSecondary > 0)
  local showWeapon = DB.weapon.enabled and (#weaponEntries > 0)

  if not showProf and not showSec and not showWeapon then
    HideAllHUD()
    return
  end

  local font = GameFontNormal:GetFont()
  local shown = 0

  local function renderEntry(parentFrame, secKey, e, xOffset, yOffset, maxW)
    local cfg = DB[secKey]
    local tr = tracker[secKey]
    shown = shown + 1
    local row = GetRow(shown)
    row:SetParent(parentFrame)
    row.isSeparator = false
    row.secKey = secKey
    row.skillName = e.name
    row.skillLabel = e.label
    row.cfg = cfg
    row.rank = e.rank
    row.maxRank = e.max
    row.onClick = (secKey == "prof" and not e.isClassSkill) and OpenProfessions or OpenSkills

    local size = cfg.fontSize
    local flags = cfg.outline and "OUTLINE" or ""
    local showBar = cfg.showBar and true or false
    local h = size + (showBar and 7 or 4)

    row.text:SetFont(font, size, flags)
    row.gain:SetFont(font, size, flags)
    row.arrow:SetSize(size, size)
    row.glow:SetSize(size * 3.2, size * 3.2)

    row.arrow:ClearAllPoints()
    row.arrow:SetPoint("LEFT", row.text, "RIGHT", 4, 0)
    row.gain:ClearAllPoints()
    row.gain:SetPoint("LEFT", row.arrow, "RIGHT", 2, 0)

    if cfg.showMax and e.max > 0 then
      row.text:SetText(e.label .. ": " .. e.rank .. "/" .. e.max)
    else
      row.text:SetText(e.label .. ": " .. e.rank)
    end

    local textWidth = row.text:GetStringWidth() + 4

    if showBar then
      local denom = (e.max and e.max > 0) and e.max or MAX_SKILL_CAP
      local pct = math.max(0, math.min(1, e.rank / denom))
      local barW = math.max(24, textWidth - 4)
      row.barBg:SetWidth(barW)
      row.barBg:Show()
      row.barFill:SetWidth(math.max(1, barW * pct))
      row.barFill:Show()
    else
      row.barBg:Hide()
      row.barFill:Hide()
    end

    ApplyRowColor(row)

    local g = tr.gains[e.name]
    local indicatorReserve = cfg.showCounter and (size + 26) or 0
    local totalWidth = textWidth + indicatorReserve
    if g and cfg.showCounter then
      local changed = not row.gain:IsShown() or row.lastShownGain ~= g
      row.gain:SetText("+" .. g)
      if changed then
        PlayLevelUp(row, cfg.animStyle or "bounce", (row.lastShownGain or 0) == 0, cfg.crafter)
      else
        row.arrow:Show()
        row.gain:Show()
        EnsureIdleAnim(row, cfg.animStyle or "bounce", cfg.crafter)
      end
      row.lastShownGain = g
      local actualWidth = textWidth + size + (row.gain:GetStringWidth() or 12) + 8
      if actualWidth > totalWidth then totalWidth = actualWidth end
    else
      row.arrow:Hide()
      row.gain:Hide()
      row.lastShownGain = nil
      StopAnims(row)
    end

    if totalWidth > maxW then maxW = totalWidth end

    row:ClearAllPoints()
    row:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", xOffset, -yOffset)
    row:SetSize(textWidth, h)
    row:Show()
    return yOffset + h, maxW
  end

  local function renderSeparator(parentFrame, xOffset, yOffset, maxW)
    local sepStr = DB.separatorText or "--------"
    if not DB.showSeparator or sepStr == "" then return yOffset, maxW end

    shown = shown + 1
    local sep = GetRow(shown)
    sep:SetParent(parentFrame)
    sep.isSeparator = true
    sep.isHovered = false
    sep.cfg = nil
    sep.onClick = nil
    sep.lastShownGain = nil
    StopAnims(sep)
    sep.barBg:Hide()
    sep.barFill:Hide()
    sep.arrow:Hide()
    sep.gain:Hide()

    local size = math.min(DB.prof.fontSize, DB.weapon.fontSize)
    local flags = (DB.prof.outline or DB.weapon.outline) and "OUTLINE" or ""
    local h = size + 2

    sep.text:SetFont(font, size, flags)
    sep.text:SetText(sepStr)
    sep.text:SetTextColor(0.65, 0.65, 0.65)

    local w = sep.text:GetStringWidth() + 4
    if w > maxW then maxW = w end

    sep:ClearAllPoints()
    sep:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", xOffset, -yOffset)
    sep:SetSize(w, h)
    sep:Show()
    return yOffset + h, maxW
  end

  local blockData = {
    prof   = { active = showProf,   secKey = "prof",   entries = profPrimary,   frame = profFrame },
    sec    = { active = showSec,    secKey = "prof",   entries = profSecondary, frame = secProfFrame },
    weapon = { active = showWeapon, secKey = "weapon", entries = weaponEntries, frame = weaponFrame },
  }

  local seq = ORDER_SEQUENCES[DB.blockOrder or "prof_weapon_sec"] or ORDER_SEQUENCES.prof_weapon_sec
  local layout = DB.layoutMode or "vertical"

  if layout == "separate" then
    mainFrame:Hide()
    for _, key in ipairs({ "prof", "sec", "weapon" }) do
      local bd = blockData[key]
      if bd.active then
        local yOff, maxW = 0, 60
        for _, e in ipairs(bd.entries) do
          yOff, maxW = renderEntry(bd.frame, bd.secKey, e, 0, yOff, maxW)
        end
        bd.frame:SetSize(maxW, math.max(16, yOff))
        bd.frame:Show()
      else
        bd.frame:Hide()
      end
    end
  elseif layout == "columns" then
    profFrame:Hide()
    secProfFrame:Hide()
    weaponFrame:Hide()

    local xOffset = 0
    local maxH = 16
    local activeCount = 0

    for _, key in ipairs(seq) do
      local bd = blockData[key]
      if bd.active then
        if activeCount > 0 then
          xOffset = xOffset + COLUMN_GAP
        end
        local yOff, colW = 0, 40
        for _, e in ipairs(bd.entries) do
          yOff, colW = renderEntry(mainFrame, bd.secKey, e, xOffset, yOff, colW)
        end
        xOffset = xOffset + colW
        if yOff > maxH then maxH = yOff end
        activeCount = activeCount + 1
      end
    end

    mainFrame:SetSize(math.max(60, xOffset), maxH)
    mainFrame:Show()
  else
    profFrame:Hide()
    secProfFrame:Hide()
    weaponFrame:Hide()

    local yOffset, maxTextWidth = 0, 60
    local activeCount = 0

    for _, key in ipairs(seq) do
      local bd = blockData[key]
      if bd.active then
        if activeCount > 0 then
          yOffset, maxTextWidth = renderSeparator(mainFrame, 0, yOffset, maxTextWidth)
        end
        for _, e in ipairs(bd.entries) do
          yOffset, maxTextWidth = renderEntry(mainFrame, bd.secKey, e, 0, yOffset, maxTextWidth)
        end
        activeCount = activeCount + 1
      end
    end

    mainFrame:SetSize(maxTextWidth, math.max(16, yOffset))
    mainFrame:Show()
  end

  for i = shown + 1, #rows do
    rows[i].isHovered = false
    StopAnims(rows[i])
    rows[i].barBg:Hide()
    rows[i].barFill:Hide()
    rows[i]:Hide()
  end
end

local opt, profSelWin, weaponSelWin, crafterWin, helpWin
local crafterSecKey = "prof"
local activeTab = "prof"
local tabs = {}
local texts = {}
local globalChecks = {}

local function Reg(obj, key)
  texts[#texts + 1] = { obj = obj, key = key }
end

local function ApplyModernWindowStyle(frame, bgAlpha)
  if not frame then return end
  if BackdropTemplateMixin and not frame.SetBackdrop then
    Mixin(frame, BackdropTemplateMixin)
  end
  if frame.SetBackdrop then
    frame:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 16, edgeSize = 16,
      insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(0.07, 0.08, 0.11, bgAlpha or 0.97)
    frame:SetBackdropBorderColor(0.35, 0.42, 0.55, 1)
  end
end

local function MakeSectionCard(parent, w, h, anchorPoint, relFrame, relPoint, x, y)
  local card = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  card:SetSize(w, h)
  card:SetPoint(anchorPoint, relFrame, relPoint, x, y)
  card:SetFrameLevel(math.max(1, parent:GetFrameLevel() + 1))
  if BackdropTemplateMixin and not card.SetBackdrop then
    Mixin(card, BackdropTemplateMixin)
  end
  if card.SetBackdrop then
    card:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 12, edgeSize = 12,
      insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    card:SetBackdropColor(0.11, 0.13, 0.18, 0.9)
    card:SetBackdropBorderColor(0.28, 0.34, 0.45, 0.9)
  end
  return card
end

local function ApplyModernDropdownStyle(frame)
  if not frame then return end
  if BackdropTemplateMixin and not frame.SetBackdrop then
    Mixin(frame, BackdropTemplateMixin)
  end
  if frame.SetBackdrop then
    frame:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 14, edgeSize = 14,
      insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    frame:SetBackdropColor(0.08, 0.09, 0.13, 0.98)
    frame:SetBackdropBorderColor(0.42, 0.50, 0.65, 1)
  end
end

local function StyleModernButton(btn, isAccent)
  if not btn or btn.modernStyled then return end
  btn.modernStyled = true
  if BackdropTemplateMixin and not btn.SetBackdrop then
    Mixin(btn, BackdropTemplateMixin)
  end
  for _, reg in ipairs({ btn:GetRegions() }) do
    if reg and reg:GetObjectType() == "Texture" then
      reg:SetTexture(nil)
      reg:Hide()
    end
  end
  if btn.SetBackdrop then
    btn:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 12, edgeSize = 12,
      insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
  end
  btn.isAccent = isAccent
  function btn:UpdateVisualState(hovered)
    if not self.SetBackdropColor then return end
    if not self:IsEnabled() then
      if self.isTab then
        self:SetBackdropColor(0.20, 0.27, 0.40, 1)
        self:SetBackdropBorderColor(0.48, 0.68, 0.98, 1)
      else
        self:SetBackdropColor(0.10, 0.11, 0.14, 0.65)
        self:SetBackdropBorderColor(0.22, 0.25, 0.32, 0.65)
      end
    elseif hovered then
      self:SetBackdropColor(0.22, 0.28, 0.40, 1)
      self:SetBackdropBorderColor(0.55, 0.74, 1, 1)
    elseif self.isAccent then
      self:SetBackdropColor(0.16, 0.23, 0.36, 0.95)
      self:SetBackdropBorderColor(0.38, 0.56, 0.85, 0.95)
    else
      self:SetBackdropColor(0.14, 0.17, 0.23, 0.95)
      self:SetBackdropBorderColor(0.30, 0.36, 0.48, 0.95)
    end
  end
  btn:HookScript("OnEnter", function(self) self:UpdateVisualState(true) end)
  btn:HookScript("OnLeave", function(self) self:UpdateVisualState(false) end)
  btn:HookScript("OnEnable", function(self) self:UpdateVisualState(false) end)
  btn:HookScript("OnDisable", function(self) self:UpdateVisualState(false) end)
  btn:UpdateVisualState(false)
end

local function StyleModernEditBox(eb)
  if not eb or eb.modernStyled then return end
  eb.modernStyled = true
  for _, reg in ipairs({ eb:GetRegions() }) do
    if reg and reg:GetObjectType() == "Texture" then
      reg:SetTexture(nil)
      reg:Hide()
    end
  end
  if BackdropTemplateMixin and not eb.SetBackdrop then
    Mixin(eb, BackdropTemplateMixin)
  end
  if eb.SetBackdrop then
    eb:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 10, edgeSize = 10,
      insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    eb:SetBackdropColor(0.05, 0.06, 0.09, 0.98)
    eb:SetBackdropBorderColor(0.32, 0.38, 0.50, 1)
  end
  eb:HookScript("OnEditFocusGained", function(self)
    if self.SetBackdropBorderColor then
      self:SetBackdropBorderColor(0.50, 0.74, 1, 1)
    end
  end)
  eb:HookScript("OnEditFocusLost", function(self)
    if self.SetBackdropBorderColor then
      self:SetBackdropBorderColor(0.32, 0.38, 0.50, 1)
    end
  end)
end

local function PickColor(r, g, b, callback)
  local function onChange()
    callback(ColorPickerFrame:GetColorRGB())
  end
  if ColorPickerFrame.SetupColorPickerAndShow then
    ColorPickerFrame:SetupColorPickerAndShow({
      r = r, g = g, b = b, hasOpacity = false,
      swatchFunc = onChange,
      cancelFunc = function() callback(r, g, b) end,
    })
  else
    ColorPickerFrame.hasOpacity = false
    ColorPickerFrame.opacityFunc = nil
    ColorPickerFrame.previousValues = { r, g, b }
    ColorPickerFrame.func = onChange
    ColorPickerFrame.cancelFunc = function() callback(r, g, b) end
    ColorPickerFrame:SetColorRGB(r, g, b)
    ColorPickerFrame:Hide()
    ColorPickerFrame:Show()
  end
end

local function MakeSwatch(parent)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(22, 22)
  if BackdropTemplateMixin and not b.SetBackdrop then
    Mixin(b, BackdropTemplateMixin)
  end
  if b.SetBackdrop then
    b:SetBackdrop({
      bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
      edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
      tile = true, tileSize = 10, edgeSize = 10,
      insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    b:SetBackdropColor(0.2, 1, 0.2, 1)
    b:SetBackdropBorderColor(0.50, 0.58, 0.72, 1)
    function b:SetRGB(r, g, bl)
      self:SetBackdropColor(r, g, bl, 1)
    end
  else
    b.fill = b:CreateTexture(nil, "ARTWORK")
    b.fill:SetPoint("TOPLEFT", 2, -2)
    b.fill:SetPoint("BOTTOMRIGHT", -2, 2)
    b.fill:SetTexture("Interface\\Buttons\\WHITE8X8")
    function b:SetRGB(r, g, bl) self.fill:SetVertexColor(r, g, bl) end
  end
  b:SetScript("OnEnter", function(self)
    if self.SetBackdropBorderColor then self:SetBackdropBorderColor(0.90, 0.95, 1, 1) end
  end)
  b:SetScript("OnLeave", function(self)
    if self.SetBackdropBorderColor then self:SetBackdropBorderColor(0.50, 0.58, 0.72, 1) end
  end)
  return b
end

local function MakeNumBox(parent, w)
  local e = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
  e:SetSize(w, 22)
  e:SetAutoFocus(false)
  e:SetMaxLetters(4)
  e:SetNumeric(true)
  e:SetJustifyH("CENTER")
  e:SetScript("OnEscapePressed", function(s) s:ClearFocus() end)
  e:SetScript("OnEnterPressed", function(s) s:ClearFocus() end)
  StyleModernEditBox(e)
  return e
end

local function MakeTextBox(parent, w, maxChars)
  local e = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
  e:SetSize(w, 22)
  e:SetAutoFocus(false)
  e:SetMaxLetters(maxChars or 24)
  e:SetJustifyH("CENTER")
  e:SetScript("OnEscapePressed", function(s) s:ClearFocus() end)
  e:SetScript("OnEnterPressed", function(s) s:ClearFocus() end)
  StyleModernEditBox(e)
  return e
end

local function MakeLabel(parent, key, x, y, template)
  local fs = parent:CreateFontString(nil, "OVERLAY", template or "GameFontHighlight")
  fs:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
  fs:SetText(L(key))
  fs:SetTextColor(0.92, 0.95, 1)
  Reg(fs, key)
  return fs
end

local function MakeSectionHeading(parent, key, x, y)
  local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  fs:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
  fs:SetText(L(key))
  fs:SetTextColor(0.55, 0.80, 1)
  Reg(fs, key)
  return fs
end

local function MakeButton(parent, key, x, y, w, onClick, raw, isAccent)
  local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  b:SetSize(w, 23)
  b:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
  if raw then
    b:SetText(key)
  elseif key then
    b:SetText(L(key))
    Reg(b, key)
  end
  b:SetScript("OnClick", onClick)
  StyleModernButton(b, isAccent)
  return b
end

local function LangList()
  local t = { "auto" }
  for _, c in ipairs(ORDER) do t[#t + 1] = c end
  return t
end

local function LangLabel(code)
  if code == "auto" or not NAMES[code] then return L("Automatic") end
  return NAMES[code]
end

local function CloseAllDropdowns()
  if not opt then return end
  if opt.langList then opt.langList:Hide() end
  if opt.orderList then opt.orderList:Hide() end
  if opt.layoutList then opt.layoutList:Hide() end
  for _, t in pairs(tabs) do
    if t.page and t.page.animList then t.page.animList:Hide() end
    if t.page and t.page.secList then t.page.secList:Hide() end
  end
end

local function AttachPreviewWidget(parent, secKeyGetter, x, y)
  local prev = CreateFrame("Frame", nil, parent)
  prev:SetSize(165, 22)
  prev:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)

  prev.text = prev:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  prev.text:SetPoint("LEFT", prev, "LEFT", 0, 0)
  prev.text:SetText("Alchemy: 225")
  prev.text:SetTextColor(1, 0.9, 0.1)

  prev.arrow = prev:CreateTexture(nil, "OVERLAY")
  prev.arrow:SetTexture("Interface\\Buttons\\Arrow-Up-Up")
  prev.arrow:SetVertexColor(0.2, 1, 0.2)
  prev.arrow:SetSize(12, 12)
  prev.arrow:SetPoint("LEFT", prev.text, "RIGHT", 4, 0)

  prev.gain = prev:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  prev.gain:SetPoint("LEFT", prev.arrow, "RIGHT", 2, 0)
  prev.gain:SetTextColor(0.2, 1, 0.2)
  prev.gain:SetText("+1")

  SetupRowAnims(prev)
  prev.glow:SetSize(38, 38)

  local timer = 0
  prev:SetScript("OnUpdate", function(self, elapsed)
    if not DB then return end
    local sk = secKeyGetter()
    local cfg = DB[sk]
    local style = cfg.animStyle or "bounce"
    if self.charBounce then
      UpdateLetterBounce(self)
    end
    if self.rainbowFlashActive then
      local spd = self.rainbowFlashSpeed or 1.4
      local r, g, b = Rainbow((GetTime() * spd) % 1)
      local gr, gg, gb = Rainbow((GetTime() * spd + 0.35) % 1)
      self.text:SetTextColor(r, g, b)
      self.gain:SetTextColor(gr, gg, gb)
      if self.charBounce and self.charStrings then
        for i = 1, self.charBounce.count do
          local fs = self.charStrings[i]
          if fs then
            if i <= self.charBounce.labelCount then
              fs:SetTextColor(r, g, b)
            else
              fs:SetTextColor(gr, gg, gb)
            end
          end
        end
      end
    end
    timer = timer + elapsed
    if timer >= 2.2 then
      timer = 0
      self:Trigger(false)
    end
  end)

  function prev:Trigger(resetWave)
    local sk = secKeyGetter()
    local cfg = DB[sk]
    local style = cfg.animStyle or "bounce"
    local sampleText = sk == "weapon" and (WeaponLabel("Swords", "swords") .. ": 225") or (ProfLabel("Alchemy", 171) .. ": 225")
    self.text:SetText(sampleText)
    self.text:SetTextColor(1, 0.9, 0.1)
    self.gain:SetText("+1")
    self.gain:SetTextColor(0.2, 1, 0.2)
    if style == "none" then
      StopAnims(self)
      self.arrow:Show()
      self.gain:Show()
    elseif style == "letterbounce" or (style == "custom" and cfg.crafter and cfg.crafter.letterBounce) then
      if resetWave == false then
        EnsureIdleAnim(self, style, cfg.crafter)
      else
        PlayLevelUp(self, style, true, cfg.crafter)
      end
    else
      PlayLevelUp(self, style, true, cfg.crafter)
    end
  end

  return prev
end

local function AnchorRightOfOptions(win)
  win:ClearAllPoints()
  if opt and opt:IsShown() then
    win:SetPoint("TOPLEFT", opt, "TOPRIGHT", 8, 0)
  else
    win:SetPoint("CENTER", UIParent, "CENTER", 310, 0)
  end
end

local function AnchorLeftOfOptions(win)
  win:ClearAllPoints()
  if opt and opt:IsShown() then
    win:SetPoint("TOPRIGHT", opt, "TOPLEFT", -8, 0)
  else
    win:SetPoint("CENTER", UIParent, "CENTER", -300, 0)
  end
end

local function AddHeaderDivider(parent, y)
  local line = parent:CreateTexture(nil, "ARTWORK")
  line:SetTexture("Interface\\Buttons\\WHITE8X8")
  line:SetVertexColor(0.42, 0.62, 0.95, 0.65)
  line:SetHeight(1)
  line:SetPoint("TOPLEFT", parent, "TOPLEFT", 18, y)
  line:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -18, y)
  return line
end

local function BuildHelpWindow()
  if helpWin then return end
  helpWin = CreateFrame("Frame", "SkillLevelsHelp", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  helpWin:SetSize(410, 500)
  helpWin:SetFrameStrata("FULLSCREEN_DIALOG")
  helpWin:SetMovable(true)
  helpWin:EnableMouse(true)
  helpWin:SetClampedToScreen(true)
  helpWin:RegisterForDrag("LeftButton")
  helpWin:SetScript("OnDragStart", helpWin.StartMoving)
  helpWin:SetScript("OnDragStop", helpWin.StopMovingOrSizing)
  ApplyModernWindowStyle(helpWin, 0.98)

  local close = CreateFrame("Button", nil, helpWin, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", helpWin, "TOPRIGHT", -4, -4)

  helpWin.title = helpWin:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  helpWin.title:SetPoint("TOPLEFT", 18, -16)
  helpWin.title:SetTextColor(0.60, 0.84, 1)
  AddHeaderDivider(helpWin, -40)

  local bodyCard = MakeSectionCard(helpWin, 374, 434, "TOPLEFT", helpWin, "TOPLEFT", 18, -48)

  helpWin.body = bodyCard:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  helpWin.body:SetPoint("TOPLEFT", bodyCard, "TOPLEFT", 12, -12)
  helpWin.body:SetWidth(350)
  helpWin.body:SetJustifyH("LEFT")
  helpWin.body:SetJustifyV("TOP")
  helpWin.body:SetSpacing(3)
  helpWin.body:SetTextColor(0.90, 0.93, 0.98)

  function helpWin:Refresh()
    self.title:SetText("Skill Levels - " .. L("Help & Guide"))
    self.body:SetText(L("HELP_BODY"))
    local textH = self.body:GetStringHeight() or 380
    local cardH = math.max(240, math.ceil(textH + 28))
    bodyCard:SetHeight(cardH)
    self:SetHeight(cardH + 66)
  end

  helpWin:Hide()
end

local function ToggleHelpWindow()
  BuildHelpWindow()
  if helpWin:IsShown() then
    helpWin:Hide()
  else
    if crafterWin and crafterWin:IsShown() then crafterWin:Hide() end
    AnchorRightOfOptions(helpWin)
    helpWin:Refresh()
    helpWin:Show()
  end
end

local function BuildCrafterWindow()
  if crafterWin then return end
  crafterWin = CreateFrame("Frame", "SkillLevelsCrafter", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  crafterWin:SetSize(372, 434)
  crafterWin:SetFrameStrata("FULLSCREEN_DIALOG")
  crafterWin:SetMovable(true)
  crafterWin:EnableMouse(true)
  crafterWin:SetClampedToScreen(true)
  crafterWin:RegisterForDrag("LeftButton")
  crafterWin:SetScript("OnDragStart", crafterWin.StartMoving)
  crafterWin:SetScript("OnDragStop", crafterWin.StopMovingOrSizing)
  ApplyModernWindowStyle(crafterWin, 0.98)

  local close = CreateFrame("Button", nil, crafterWin, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", crafterWin, "TOPRIGHT", -4, -4)

  crafterWin.title = crafterWin:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  crafterWin.title:SetPoint("TOPLEFT", 18, -16)
  crafterWin.title:SetTextColor(0.60, 0.84, 1)
  AddHeaderDivider(crafterWin, -40)

  local prevCard = MakeSectionCard(crafterWin, 336, 32, "TOPLEFT", crafterWin, "TOPLEFT", 18, -46)
  crafterWin.preview = AttachPreviewWidget(prevCard, function() return crafterSecKey end, 12, -5)

  local function getCr()
    return DB[crafterSecKey].crafter
  end

  local function applyCustomChange(resetWave)
    DB[crafterSecKey].animStyle = "custom"
    for _, r in ipairs(rows) do
      if r:IsShown() and r.cfg == DB[crafterSecKey] and r.activeAnim ~= "custom" then
        StopAnims(r)
      end
    end
    crafterWin:Refresh()
    crafterWin.preview:Trigger(resetWave)
    if tabs[crafterSecKey] and tabs[crafterSecKey].page.animPreview then
      tabs[crafterSecKey].page.animPreview:Trigger(resetWave)
    end
    RefreshOptions()
    UpdateAll()
  end

  crafterWin.checks = {}
  local function addCrCheck(key, field, x, y)
    local cb = CreateFrame("CheckButton", nil, crafterWin, "UICheckButtonTemplate")
    cb:SetSize(22, 22)
    cb:SetPoint("TOPLEFT", crafterWin, "TOPLEFT", x, y)
    cb.label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cb.label:SetPoint("LEFT", cb, "RIGHT", 3, 0)
    cb.label:SetWidth(290)
    cb.label:SetJustifyH("LEFT")
    cb.label:SetTextColor(0.92, 0.95, 1)
    cb.key = key
    cb.field = field
    cb:SetScript("OnClick", function(self)
      getCr()[field] = self:GetChecked() and true or false
      applyCustomChange(true)
    end)
    crafterWin.checks[#crafterWin.checks + 1] = cb
    return cb
  end

  crafterWin.sliders = {}
  local function addCrStepper(key, field, y, minV, maxV, stepV, fmtFn)
    local row = CreateFrame("Frame", nil, crafterWin)
    row:SetSize(320, 22)
    row:SetPoint("TOPLEFT", crafterWin, "TOPLEFT", 38, y)
    row.lbl = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    row.lbl:SetPoint("LEFT", row, "LEFT", 0, 0)
    row.lbl:SetWidth(235)
    row.lbl:SetJustifyH("LEFT")
    row.lbl:SetTextColor(0.85, 0.90, 0.98)

    local minus = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    minus:SetSize(24, 20)
    minus:SetPoint("LEFT", row.lbl, "RIGHT", 4, 0)
    minus:SetText("-")
    StyleModernButton(minus)
    minus:SetScript("OnClick", function()
      local cr = getCr()
      cr[field] = math.max(minV, math.min(maxV, (cr[field] or minV) - stepV))
      applyCustomChange(false)
    end)

    local plus = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    plus:SetSize(24, 20)
    plus:SetPoint("LEFT", minus, "RIGHT", 4, 0)
    plus:SetText("+")
    StyleModernButton(plus)
    plus:SetScript("OnClick", function()
      local cr = getCr()
      cr[field] = math.max(minV, math.min(maxV, (cr[field] or minV) + stepV))
      applyCustomChange(false)
    end)

    row.key = key
    row.field = field
    row.fmtFn = fmtFn
    crafterWin.sliders[#crafterWin.sliders + 1] = row
    return row
  end

  addCrCheck("Arrow bounce", "arrowBounce", 18, -86)
  addCrStepper("Bounce height", "bounceHeight", -110, 2, 24, 2, function(v) return v .. " px" end)

  addCrCheck("Star glow / sparkle", "starGlow", 18, -138)
  addCrStepper("Glow brightness", "glowAlpha", -162, 0.1, 1.0, 0.1, function(v) return math.floor(v * 100 + 0.5) .. "%" end)
  addCrCheck("Double sparkle", "doubleSparkle", 34, -186)

  addCrCheck("Counter pulse", "counterPulse", 18, -214)

  addCrCheck("Letter bounce (+1n)", "letterBounce", 18, -242)
  addCrStepper("Letter bounce height", "letterHeight", -266, 1, 16, 1, function(v) return v .. " px" end)
  addCrStepper("Letter wave speed", "letterSpeed", -290, 1, 15, 1, function(v) return tostring(v) end)

  addCrCheck("Rainbow flash", "rainbowFlash", 18, -318)
  addCrStepper("Rainbow speed", "rainbowSpeed", -342, 1, 30, 2, function(v) return tostring(v) end)

  crafterWin.testBtn = MakeButton(crafterWin, "Test animation", 18, -390, 162, function()
    applyCustomChange(true)
  end, false, true)

  crafterWin.resetBtn = MakeButton(crafterWin, "Reset editor", 192, -390, 162, function()
    DB[crafterSecKey].crafter = Copy(DEFAULT_CRAFTER)
    applyCustomChange(true)
  end)

  function crafterWin:Refresh()
    local secName = crafterSecKey == "weapon" and L("Weapons") or L("Professions")
    self.title:SetText(L("Animation Editor") .. " (" .. secName .. ")")
    self.testBtn:SetText(L("Test animation"))
    self.resetBtn:SetText(L("Reset editor"))
    local cr = getCr()
    for _, cb in ipairs(self.checks) do
      cb.label:SetText(L(cb.key))
      cb:SetChecked(cr[cb.field] and true or false)
    end
    for _, st in ipairs(self.sliders) do
      local val = cr[st.field]
      st.lbl:SetText(L(st.key) .. ": |cff88c4ff" .. st.fmtFn(val) .. "|r")
    end
  end

  crafterWin:Hide()
end

local function OpenCrafterFor(secKey)
  crafterSecKey = secKey
  BuildCrafterWindow()
  if helpWin and helpWin:IsShown() then helpWin:Hide() end
  AnchorRightOfOptions(crafterWin)
  crafterWin:Refresh()
  crafterWin:Show()
  crafterWin.preview:Trigger(true)
end

local function BuildAnimDropdown(page, secKey)
  local itemH = 21
  local list = CreateFrame("Frame", nil, page, BackdropTemplateMixin and "BackdropTemplate" or nil)
  list:SetSize(210, #ANIM_MODES * itemH + 12)
  list:SetPoint("BOTTOMLEFT", page.animBtn, "TOPLEFT", 0, 3)
  list:SetFrameStrata("FULLSCREEN_DIALOG")
  list:EnableMouse(true)
  ApplyModernDropdownStyle(list)
  list:Hide()

  page.animItems = {}
  for i, m in ipairs(ANIM_MODES) do
    local it = CreateFrame("Button", nil, list)
    it:SetSize(198, itemH)
    it:SetPoint("TOPLEFT", list, "TOPLEFT", 6, -6 - (i - 1) * itemH)
    it:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    it.text = it:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    it.text:SetPoint("LEFT", it, "LEFT", 8, 0)
    it.mode = m
    it:SetScript("OnClick", function()
      local c = DB[secKey]
      c.animStyle = m.id
      list:Hide()
      for _, r in ipairs(rows) do
        if r:IsShown() and r.cfg == c then StopAnims(r) end
      end
      if page.animPreview then
        page.animPreview:Trigger(true)
      end
      if m.id == "custom" then
        OpenCrafterFor(secKey)
      end
      RefreshOptions()
      UpdateAll()
    end)
    page.animItems[i] = it
  end

  page.animList = list
end

local function BuildSecondaryDropdown(page)
  local itemH = 21
  local list = CreateFrame("Frame", nil, page, BackdropTemplateMixin and "BackdropTemplate" or nil)
  list:SetSize(210, #SECONDARY_MODES * itemH + 12)
  list:SetPoint("TOPLEFT", page.secBtn, "BOTTOMLEFT", 0, -3)
  list:SetFrameStrata("FULLSCREEN_DIALOG")
  list:EnableMouse(true)
  ApplyModernDropdownStyle(list)
  list:Hide()

  page.secItems = {}
  for i, m in ipairs(SECONDARY_MODES) do
    local it = CreateFrame("Button", nil, list)
    it:SetSize(198, itemH)
    it:SetPoint("TOPLEFT", list, "TOPLEFT", 6, -6 - (i - 1) * itemH)
    it:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    it.text = it:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    it.text:SetPoint("LEFT", it, "LEFT", 8, 0)
    it.mode = m
    it:SetScript("OnClick", function()
      DB.prof.secondaryMode = m.id
      list:Hide()
      RefreshOptions()
      UpdateAll()
    end)
    page.secItems[i] = it
  end

  page.secList = list
end

local function BuildProfSelectorWindow()
  if profSelWin then return end
  profSelWin = CreateFrame("Frame", "SkillLevelsProfSelector", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  profSelWin:SetSize(340, 260)
  profSelWin:SetFrameStrata("FULLSCREEN_DIALOG")
  profSelWin:SetMovable(true)
  profSelWin:EnableMouse(true)
  profSelWin:SetClampedToScreen(true)
  profSelWin:RegisterForDrag("LeftButton")
  profSelWin:SetScript("OnDragStart", profSelWin.StartMoving)
  profSelWin:SetScript("OnDragStop", profSelWin.StopMovingOrSizing)
  ApplyModernWindowStyle(profSelWin, 0.98)

  local close = CreateFrame("Button", nil, profSelWin, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", profSelWin, "TOPRIGHT", -4, -4)

  profSelWin.title = profSelWin:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  profSelWin.title:SetPoint("TOPLEFT", 18, -16)
  profSelWin.title:SetTextColor(0.60, 0.84, 1)
  AddHeaderDivider(profSelWin, -40)

  local listCard = MakeSectionCard(profSelWin, 304, 150, "TOPLEFT", profSelWin, "TOPLEFT", 18, -48)

  profSelWin.emptyLbl = listCard:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  profSelWin.emptyLbl:SetPoint("CENTER", listCard, "CENTER", 0, 0)
  profSelWin.emptyLbl:SetTextColor(0.70, 0.75, 0.85)
  profSelWin.emptyLbl:Hide()

  profSelWin.checks = {}
  profSelWin.activeItems = {}

  profSelWin.selAllBtn = MakeButton(profSelWin, "Select all", 18, -210, 146, function()
    for k in pairs(DB.prof.hiddenProfs) do DB.prof.hiddenProfs[k] = nil end
    profSelWin:Refresh()
    UpdateAll()
    RefreshOptions()
  end, false, true)

  profSelWin.deselAllBtn = MakeButton(profSelWin, "Deselect all", 176, -210, 146, function()
    for _, item in ipairs(profSelWin.activeItems) do
      DB.prof.hiddenProfs[item.idKey] = true
    end
    profSelWin:Refresh()
    UpdateAll()
    RefreshOptions()
  end)

  function profSelWin:Refresh()
    self.title:SetText(L("Skill Selection"))
    self.selAllBtn:SetText(L("Select all"))
    self.deselAllBtn:SetText(L("Deselect all"))
    self.emptyLbl:SetText(L("No active skills found"))

    local skills = EnsureSkillsScanned()
    local list = GetProfs(skills)
    for k in pairs(self.activeItems) do self.activeItems[k] = nil end

    for idx, p in ipairs(list) do
      local idKey = p.key or p.name
      self.activeItems[idx] = {
        idKey = idKey,
        rawName = p.name,
        label = ProfLabel(p.name, p.line),
        rank = p.rank,
        max = p.max,
      }

      local cb = self.checks[idx]
      if not cb then
        cb = CreateFrame("CheckButton", nil, listCard, "UICheckButtonTemplate")
        cb:SetSize(22, 22)
        cb:SetPoint("TOPLEFT", listCard, "TOPLEFT", 10, -10 - (idx - 1) * 26)
        cb.label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        cb.label:SetPoint("LEFT", cb, "RIGHT", 4, 0)
        cb.label:SetWidth(256)
        cb.label:SetJustifyH("LEFT")
        cb.label:SetTextColor(0.92, 0.95, 1)
        self.checks[idx] = cb
      end

      cb.idKey = idKey
      cb.rawName = p.name
      local rankTxt = (p.max and p.max > 0) and (p.rank .. "/" .. p.max) or tostring(p.rank)
      cb.label:SetText(ProfLabel(p.name, p.line) .. " |cff88c4ff(" .. rankTxt .. ")|r")
      local isHidden = DB.prof.hiddenProfs[idKey] or DB.prof.hiddenProfs[p.name]
      cb:SetChecked(not isHidden)
      cb:SetScript("OnClick", function(btn)
        if btn:GetChecked() then
          DB.prof.hiddenProfs[btn.idKey] = nil
          DB.prof.hiddenProfs[btn.rawName] = nil
        else
          DB.prof.hiddenProfs[btn.idKey] = true
        end
        UpdateAll()
        RefreshOptions()
      end)
      cb:Show()
    end

    for i = #list + 1, #self.checks do
      self.checks[i]:Hide()
    end

    local count = #list
    if count == 0 then
      self.emptyLbl:Show()
    else
      self.emptyLbl:Hide()
    end

    local cardH = math.max(54, count * 26 + 18)
    listCard:SetHeight(cardH)
    self.selAllBtn:ClearAllPoints()
    self.selAllBtn:SetPoint("TOPLEFT", self, "TOPLEFT", 18, -58 - cardH)
    self.deselAllBtn:ClearAllPoints()
    self.deselAllBtn:SetPoint("TOPLEFT", self, "TOPLEFT", 176, -58 - cardH)
    self:SetHeight(cardH + 98)
  end

  profSelWin:Hide()
end

local function BuildWeaponSelectorWindow()
  if weaponSelWin then return end
  weaponSelWin = CreateFrame("Frame", "SkillLevelsWeaponSelector", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  weaponSelWin:SetSize(364, 376)
  weaponSelWin:SetFrameStrata("FULLSCREEN_DIALOG")
  weaponSelWin:SetMovable(true)
  weaponSelWin:EnableMouse(true)
  weaponSelWin:SetClampedToScreen(true)
  weaponSelWin:RegisterForDrag("LeftButton")
  weaponSelWin:SetScript("OnDragStart", weaponSelWin.StartMoving)
  weaponSelWin:SetScript("OnDragStop", weaponSelWin.StopMovingOrSizing)
  ApplyModernWindowStyle(weaponSelWin, 0.98)

  local close = CreateFrame("Button", nil, weaponSelWin, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", weaponSelWin, "TOPRIGHT", -4, -4)

  weaponSelWin.title = weaponSelWin:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  weaponSelWin.title:SetPoint("TOPLEFT", 18, -16)
  weaponSelWin.title:SetTextColor(0.60, 0.84, 1)
  weaponSelWin.title:SetText(L("Weapon Selection"))
  AddHeaderDivider(weaponSelWin, -40)

  weaponSelWin.onlyLearnedCb = CreateFrame("CheckButton", nil, weaponSelWin, "UICheckButtonTemplate")
  weaponSelWin.onlyLearnedCb:SetSize(22, 22)
  weaponSelWin.onlyLearnedCb:SetPoint("TOPLEFT", weaponSelWin, "TOPLEFT", 18, -46)
  weaponSelWin.onlyLearnedCb.label = weaponSelWin.onlyLearnedCb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  weaponSelWin.onlyLearnedCb.label:SetPoint("LEFT", weaponSelWin.onlyLearnedCb, "RIGHT", 4, 0)
  weaponSelWin.onlyLearnedCb.label:SetTextColor(0.92, 0.95, 1)
  weaponSelWin.onlyLearnedCb:SetScript("OnClick", function(self)
    DB.weapon.onlyLearnedWeapons = self:GetChecked() and true or false
    weaponSelWin:Refresh()
  end)

  local gridCard = MakeSectionCard(weaponSelWin, 328, 244, "TOPLEFT", weaponSelWin, "TOPLEFT", 18, -74)

  weaponSelWin.checks = {}
  weaponSelWin.visibleKeys = {}
  for idx, def in ipairs(ALL_WEAPON_ORDER) do
    local wkey = def[2]
    local cb = CreateFrame("CheckButton", nil, gridCard, "UICheckButtonTemplate")
    cb:SetSize(22, 22)
    cb.label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cb.label:SetPoint("LEFT", cb, "RIGHT", 3, 0)
    cb.label:SetWidth(130)
    cb.label:SetJustifyH("LEFT")
    cb.label:SetTextColor(0.92, 0.95, 1)
    cb.wkey = wkey
    cb.def = def
    cb:SetScript("OnClick", function(self)
      DB.weapon.selectedWeapons[wkey] = self:GetChecked() and true or false
      UpdateAll()
      RefreshOptions()
    end)
    weaponSelWin.checks[idx] = cb
  end

  weaponSelWin.selAllBtn = MakeButton(weaponSelWin, "Select all", 18, -330, 158, function()
    for _, wkey in ipairs(weaponSelWin.visibleKeys) do
      DB.weapon.selectedWeapons[wkey] = true
    end
    weaponSelWin:Refresh()
    UpdateAll()
    RefreshOptions()
  end, false, true)

  weaponSelWin.deselAllBtn = MakeButton(weaponSelWin, "Deselect all", 188, -330, 158, function()
    for k in pairs(DB.weapon.selectedWeapons) do DB.weapon.selectedWeapons[k] = nil end
    weaponSelWin:Refresh()
    UpdateAll()
    RefreshOptions()
  end)

  function weaponSelWin:Refresh()
    self.title:SetText(L("Weapon Selection"))
    self.onlyLearnedCb.label:SetText(L("Only learned skills"))
    self.onlyLearnedCb:SetChecked(DB.weapon.onlyLearnedWeapons and true or false)
    self.selAllBtn:SetText(L("Select all"))
    self.deselAllBtn:SetText(L("Deselect all"))

    local skills = EnsureSkillsScanned()
    local hasSkillData = next(skills) ~= nil
    local onlyLearned = (DB.weapon.onlyLearnedWeapons and hasSkillData) and true or false
    for k in pairs(self.visibleKeys) do self.visibleKeys[k] = nil end

    local shownIdx = 0
    for _, cb in ipairs(self.checks) do
      local learnedName = hasSkillData and FindSkill(skills, cb.def) or true
      if not onlyLearned or learnedName then
        shownIdx = shownIdx + 1
        self.visibleKeys[shownIdx] = cb.wkey
        local col = (shownIdx - 1) % 2
        local rowIdx = math.floor((shownIdx - 1) / 2)
        cb:ClearAllPoints()
        cb:SetPoint("TOPLEFT", gridCard, "TOPLEFT", 10 + col * 158, -10 - rowIdx * 28)
        cb.label:SetText(WeaponLabel(cb.wkey, cb.wkey))
        cb:SetChecked(DB.weapon.selectedWeapons[cb.wkey] and true or false)
        cb:Show()
      else
        cb:Hide()
      end
    end

    local rowsCount = math.max(1, math.ceil(shownIdx / 2))
    local cardH = rowsCount * 28 + 18
    gridCard:SetHeight(cardH)
    self.selAllBtn:ClearAllPoints()
    self.selAllBtn:SetPoint("TOPLEFT", self, "TOPLEFT", 18, -84 - cardH)
    self.deselAllBtn:ClearAllPoints()
    self.deselAllBtn:SetPoint("TOPLEFT", self, "TOPLEFT", 188, -84 - cardH)
    self:SetHeight(cardH + 124)
  end

  weaponSelWin:Hide()
end

local function BuildOrderDropdown()
  local itemH = 21
  local list = CreateFrame("Frame", nil, opt, BackdropTemplateMixin and "BackdropTemplate" or nil)
  list:SetSize(336, #ORDER_MODES * itemH + 12)
  list:SetPoint("BOTTOMLEFT", opt.orderBtn, "TOPLEFT", 0, 3)
  list:SetFrameStrata("FULLSCREEN_DIALOG")
  list:EnableMouse(true)
  ApplyModernDropdownStyle(list)
  list:Hide()

  opt.orderItems = {}
  for i, m in ipairs(ORDER_MODES) do
    local it = CreateFrame("Button", nil, list)
    it:SetSize(324, itemH)
    it:SetPoint("TOPLEFT", list, "TOPLEFT", 6, -6 - (i - 1) * itemH)
    it:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    it.text = it:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    it.text:SetPoint("LEFT", it, "LEFT", 8, 0)
    it.mode = m
    it:SetScript("OnClick", function()
      DB.blockOrder = m.id
      list:Hide()
      RefreshOptions()
      UpdateAll()
    end)
    opt.orderItems[i] = it
  end

  opt.orderList = list
end

local function BuildLayoutDropdown()
  local itemH = 21
  local list = CreateFrame("Frame", nil, opt, BackdropTemplateMixin and "BackdropTemplate" or nil)
  list:SetSize(336, #LAYOUT_MODES * itemH + 12)
  list:SetPoint("BOTTOMLEFT", opt.layoutBtn, "TOPLEFT", 0, 3)
  list:SetFrameStrata("FULLSCREEN_DIALOG")
  list:EnableMouse(true)
  ApplyModernDropdownStyle(list)
  list:Hide()

  opt.layoutItems = {}
  for i, m in ipairs(LAYOUT_MODES) do
    local it = CreateFrame("Button", nil, list)
    it:SetSize(324, itemH)
    it:SetPoint("TOPLEFT", list, "TOPLEFT", 6, -6 - (i - 1) * itemH)
    it:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    it.text = it:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    it.text:SetPoint("LEFT", it, "LEFT", 8, 0)
    it.mode = m
    it:SetScript("OnClick", function()
      DB.layoutMode = m.id
      list:Hide()
      RefreshOptions()
      UpdateAll()
    end)
    opt.layoutItems[i] = it
  end

  opt.layoutList = list
end

local function BuildSectionPage(parent, secKey, isWeapon)
  local page = CreateFrame("Frame", nil, parent)
  page:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -78)
  page:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 232)
  page:SetFrameLevel(parent:GetFrameLevel() + 2)
  page.checks = {}
  page.rangeRows = {}

  local function cfg() return DB[secKey] end

  local function addCheck(container, key, field, x, y, maxW)
    local cb = CreateFrame("CheckButton", nil, container, "UICheckButtonTemplate")
    cb:SetSize(22, 22)
    cb:SetPoint("TOPLEFT", container, "TOPLEFT", x, y)
    cb.label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cb.label:SetPoint("LEFT", cb, "RIGHT", 4, 0)
    cb.label:SetWidth(maxW or 200)
    cb.label:SetJustifyH("LEFT")
    cb.label:SetWordWrap(true)
    cb.label:SetTextColor(0.92, 0.95, 1)
    cb.label:SetText(L(key))
    Reg(cb.label, key)
    cb.field = field
    cb:SetScript("OnClick", function(self)
      local c = cfg()
      c[field] = self:GetChecked() and true or false
      if field == "permCounter" and c.permCounter then
        local now = GetTime()
        for name in pairs(tracker[secKey].gains) do
          tracker[secKey].gainTimes[name] = now
        end
      end
      UpdateAll()
      RefreshOptions()
    end)
    page.checks[#page.checks + 1] = cb
    return cb
  end

  addCheck(page, isWeapon and "Show weapons" or "Show professions", "enabled", 22, -4, 420)

  local colorCard = MakeSectionCard(page, 484, 276, "TOPLEFT", page, "TOPLEFT", 18, -32)

  MakeSectionHeading(colorCard, "Color ranges (from - to, color)", 12, -10)

  for i = 1, MAX_RANGES do
    local rr = CreateFrame("Frame", nil, colorCard)
    rr:SetSize(456, 24)
    rr:SetPoint("TOPLEFT", colorCard, "TOPLEFT", 12, -32 - (i - 1) * 26)

    rr.from = MakeNumBox(rr, 50)
    rr.from:SetPoint("LEFT", rr, "LEFT", 0, 0)
    local dash = rr:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dash:SetText("-")
    dash:SetTextColor(0.85, 0.90, 1)
    dash:SetPoint("LEFT", rr.from, "RIGHT", 8, 0)
    rr.to = MakeNumBox(rr, 50)
    rr.to:SetPoint("LEFT", dash, "RIGHT", 8, 0)
    rr.sw = MakeSwatch(rr)
    rr.sw:SetPoint("LEFT", rr.to, "RIGHT", 14, 0)
    rr.del = CreateFrame("Button", nil, rr, "UIPanelButtonTemplate")
    rr.del:SetSize(22, 22)
    rr.del:SetText("x")
    rr.del:SetPoint("LEFT", rr.sw, "RIGHT", 12, 0)
    StyleModernButton(rr.del)

    local function commit()
      local rg = cfg().ranges[i]
      if not rg then return end
      local a, b = tonumber(rr.from:GetText()), tonumber(rr.to:GetText())
      if a and b then
        if a > b then a, b = b, a end
        rg[1], rg[2] = a, b
      end
      RefreshOptions(); UpdateAll()
    end
    rr.from:SetScript("OnEditFocusLost", commit)
    rr.to:SetScript("OnEditFocusLost", commit)
    rr.sw:SetScript("OnClick", function()
      local rg = cfg().ranges[i]
      if not rg then return end
      PickColor(rg[3], rg[4], rg[5], function(r, g, b)
        rg[3], rg[4], rg[5] = r, g, b
        rr.sw:SetRGB(r, g, b)
        UpdateAll()
      end)
    end)
    rr.del:SetScript("OnClick", function()
      table.remove(cfg().ranges, i)
      RefreshOptions(); UpdateAll()
    end)
    page.rangeRows[i] = rr
  end

  page.add = MakeButton(colorCard, "Add range", 12, -190, 230, function()
    local ranges = cfg().ranges
    local n = #ranges
    if n >= MAX_RANGES then return end
    local from = n > 0 and (ranges[n][2] + 1) or 0
    ranges[n + 1] = { from, from + 74, 1, 1, 1 }
    RefreshOptions(); UpdateAll()
  end, false, true)

  page.capSw = MakeSwatch(colorCard)
  page.capSw:SetPoint("TOPLEFT", colorCard, "TOPLEFT", 12, -220)
  MakeLabel(colorCard, "Cap reached - train next rank", 42, -224)
  page.capSw:SetScript("OnClick", function()
    local c = cfg().capColor
    PickColor(c[1], c[2], c[3], function(r, g, b)
      cfg().capColor = { r, g, b }; page.capSw:SetRGB(r, g, b); UpdateAll()
    end)
  end)

  page.maxSw = MakeSwatch(colorCard)
  page.maxSw:SetPoint("TOPLEFT", colorCard, "TOPLEFT", 12, -248)
  MakeLabel(colorCard, "Maximum reached", 42, -252)
  page.maxSw:SetScript("OnClick", function()
    local c = cfg().maxColor
    PickColor(c[1], c[2], c[3], function(r, g, b)
      cfg().maxColor = { r, g, b }; page.maxSw:SetRGB(r, g, b); UpdateAll()
    end)
  end)

  local displayCard = MakeSectionCard(page, 484, isWeapon and 236 or 240, "TOPLEFT", page, "TOPLEFT", 18, -316)

  MakeSectionHeading(displayCard, "Animation:", 12, -12)
  page.animBtn = MakeButton(displayCard, "", 96, -8, 152, function()
    local wasShown = page.animList:IsShown()
    CloseAllDropdowns()
    if not wasShown then page.animList:Show() end
  end, true)
  BuildAnimDropdown(page, secKey)

  page.editAnimBtn = MakeButton(displayCard, "Edit...", 252, -8, 56, function()
    CloseAllDropdowns()
    OpenCrafterFor(secKey)
  end, false, true)

  page.animPreview = AttachPreviewWidget(displayCard, function() return secKey end, 316, -8)

  addCheck(displayCard, "Show maximum",      "showMax",     10,  -40, 200)
  addCheck(displayCard, "Text outline",      "outline",     10,  -66, 200)
  addCheck(displayCard, "Progress bar",      "showBar",     10,  -92, 200)

  addCheck(displayCard, "Level-up counter",  "showCounter", 244, -40, 220)
  addCheck(displayCard, "Permanent counter", "permCounter", 244, -66, 220)

  local yCursor = -124
  if isWeapon then
    addCheck(displayCard, "Only equipped weapons", "activeCombatWeapon", 244, -92, 220)
    page.allWeaponsCb = addCheck(displayCard, "Show all weapons", "showAllWeapons", 10, -118, 200)
    page.selectWeaponsBtn = MakeButton(displayCard, "Select weapons...", 244, -118, 226, function()
      BuildWeaponSelectorWindow()
      if weaponSelWin:IsShown() then
        weaponSelWin:Hide()
      else
        if profSelWin and profSelWin:IsShown() then profSelWin:Hide() end
        AnchorLeftOfOptions(weaponSelWin)
        weaponSelWin:Refresh()
        weaponSelWin:Show()
      end
    end, false, true)
    page.rangedCb = addCheck(displayCard, "Show ranged weapon",   "showRanged", 10,  -144, 200)
    page.offCb    = addCheck(displayCard, "Show off-hand weapon", "showOff",    244, -144, 220)
    yCursor = -178
  else
    addCheck(displayCard, "Show class skills", "showClassSkills", 244, -92, 220)
    MakeSectionHeading(displayCard, "Secondary professions:", 12, -124)
    page.secBtn = MakeButton(displayCard, "", 190, -120, 280, function()
      local wasShown = page.secList:IsShown()
      CloseAllDropdowns()
      if not wasShown then page.secList:Show() end
    end, true)
    BuildSecondaryDropdown(page)

    page.selectProfsBtn = MakeButton(displayCard, "Select skills...", 12, -148, 458, function()
      BuildProfSelectorWindow()
      if profSelWin:IsShown() then
        profSelWin:Hide()
      else
        if weaponSelWin and weaponSelWin:IsShown() then weaponSelWin:Hide() end
        AnchorLeftOfOptions(profSelWin)
        profSelWin:Refresh()
        profSelWin:Show()
      end
    end, false, true)
    yCursor = -182
  end

  page.fontLabel = MakeSectionHeading(displayCard, "Font size", 12, yCursor)
  local function changeFont(d)
    local c = cfg()
    c.fontSize = math.max(8, math.min(32, c.fontSize + d))
    UpdateAll(); RefreshOptions()
  end
  MakeButton(displayCard, "-", 412, yCursor + 4, 26, function() changeFont(-1) end, true)
  MakeButton(displayCard, "+", 442, yCursor + 4, 26, function() changeFont(1) end, true)

  MakeButton(displayCard, "Reset session counter", 12, yCursor - 28, 458, function()
    for k in pairs(tracker[secKey].gains) do tracker[secKey].gains[k] = nil end
    for k in pairs(tracker[secKey].gainTimes) do tracker[secKey].gainTimes[k] = nil end
    UpdateAll()
  end)

  function page:Refresh()
    local c = cfg()
    for i, rr in ipairs(self.rangeRows) do
      local rg = c.ranges[i]
      if rg then
        rr:Show()
        rr.from:SetText(tostring(rg[1]))
        rr.to:SetText(tostring(rg[2]))
        rr.sw:SetRGB(rg[3], rg[4], rg[5])
      else
        rr:Hide()
      end
    end
    if #c.ranges >= MAX_RANGES then self.add:Disable() else self.add:Enable() end
    self.capSw:SetRGB(unpack(c.capColor))
    self.maxSw:SetRGB(unpack(c.maxColor))
    self.animBtn:SetText(AnimModeLabel(c.animStyle) .. "  v")
    for _, it in ipairs(self.animItems) do
      local txt = L(it.mode.key)
      if it.mode.id == c.animStyle then
        it.text:SetText("|cff66b3ff" .. txt .. "|r")
      else
        it.text:SetText(txt)
      end
    end
    if self.secBtn and self.secItems then
      self.secBtn:SetText(SecondaryModeLabel(c.secondaryMode) .. "  v")
      for _, it in ipairs(self.secItems) do
        local txt = L(it.mode.key)
        if it.mode.id == (c.secondaryMode or "together") then
          it.text:SetText("|cff66b3ff" .. txt .. "|r")
        else
          it.text:SetText(txt)
        end
      end
    end
    for _, cb in ipairs(self.checks) do
      cb:SetChecked(c[cb.field])
    end
    if self.offCb and self.rangedCb then
      local customSelected = HasAnySelectedWeapon(c.selectedWeapons)
      if c.activeCombatWeapon then
        if self.allWeaponsCb then self.allWeaponsCb:Disable(); self.allWeaponsCb.label:SetAlpha(0.45) end
        self.selectWeaponsBtn:Disable()
        self.offCb:Enable(); self.offCb.label:SetAlpha(1)
        self.rangedCb:Enable(); self.rangedCb.label:SetAlpha(1)
      elseif c.showAllWeapons then
        if self.allWeaponsCb then self.allWeaponsCb:Enable(); self.allWeaponsCb.label:SetAlpha(1) end
        self.selectWeaponsBtn:Disable()
        self.offCb:Disable(); self.offCb.label:SetAlpha(0.45)
        self.rangedCb:Disable(); self.rangedCb.label:SetAlpha(0.45)
      elseif customSelected then
        if self.allWeaponsCb then self.allWeaponsCb:Enable(); self.allWeaponsCb.label:SetAlpha(1) end
        self.selectWeaponsBtn:Enable()
        self.offCb:Disable(); self.offCb.label:SetAlpha(0.45)
        self.rangedCb:Disable(); self.rangedCb.label:SetAlpha(0.45)
      else
        if self.allWeaponsCb then self.allWeaponsCb:Enable(); self.allWeaponsCb.label:SetAlpha(1) end
        self.selectWeaponsBtn:Enable()
        self.offCb:Enable(); self.offCb.label:SetAlpha(1)
        self.rangedCb:Enable(); self.rangedCb.label:SetAlpha(1)
      end
    end
    self.fontLabel:SetText(L("Font size") .. ": |cffffffff" .. c.fontSize .. "|r")
  end

  return page
end

local function BuildLangDropdown()
  local list = LangList()
  local itemH = 21

  opt.langList = CreateFrame("Frame", nil, opt, BackdropTemplateMixin and "BackdropTemplate" or nil)
  opt.langList:SetSize(458, #list * itemH + 12)
  opt.langList:SetPoint("BOTTOMLEFT", opt.langBtn, "TOPLEFT", 0, 3)
  opt.langList:SetFrameStrata("FULLSCREEN_DIALOG")
  opt.langList:EnableMouse(true)
  ApplyModernDropdownStyle(opt.langList)
  opt.langList:Hide()

  opt.langItems = {}
  for i, code in ipairs(list) do
    local it = CreateFrame("Button", nil, opt.langList)
    it:SetSize(446, itemH)
    it:SetPoint("TOPLEFT", opt.langList, "TOPLEFT", 6, -6 - (i - 1) * itemH)
    it:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    it.text = it:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    it.text:SetPoint("LEFT", it, "LEFT", 8, 0)
    it.code = code
    it:SetScript("OnClick", function()
      DB.lang = code
      opt.langList:Hide()
      RefreshOptions()
      if profSelWin and profSelWin:IsShown() then profSelWin:Refresh() end
      if weaponSelWin and weaponSelWin:IsShown() then weaponSelWin:Refresh() end
      if crafterWin and crafterWin:IsShown() then crafterWin:Refresh() end
      if helpWin and helpWin:IsShown() then helpWin:Refresh() end
      UpdateAll()
    end)
    opt.langItems[i] = it
  end
end

local function SelectTab(key)
  CloseAllDropdowns()
  activeTab = key
  for k, t in pairs(tabs) do
    if k == key then
      t.page:Show()
      t.btn:Disable()
      t.btn:SetNormalFontObject("GameFontHighlight")
      if t.page.animPreview then
        t.page.animPreview:Trigger(true)
      end
    else
      t.page:Hide()
      t.btn:Enable()
      t.btn:SetNormalFontObject("GameFontNormal")
    end
  end
  if crafterWin and crafterWin:IsShown() then
    crafterSecKey = key
    AnchorRightOfOptions(crafterWin)
    crafterWin:Refresh()
    crafterWin.preview:Trigger(true)
  end
  opt:SetHeight(key == "weapon" and 860 or 864)
end

local function ResetPosition()
  DB.pos = nil
  DB.profPos = nil
  DB.weaponPos = nil
  DB.secPos = nil
  mainFrame:ClearAllPoints()
  mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
  profFrame:ClearAllPoints()
  profFrame:SetPoint("CENTER", UIParent, "CENTER", -120, 30)
  weaponFrame:ClearAllPoints()
  weaponFrame:SetPoint("CENTER", UIParent, "CENTER", 40, 30)
  secProfFrame:ClearAllPoints()
  secProfFrame:SetPoint("CENTER", UIParent, "CENTER", 200, 30)
end

local function BuildOptions()
  if opt then return end
  opt = CreateFrame("Frame", "SkillLevelsOptions", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
  opt:SetSize(520, 864)
  opt:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
  opt:SetFrameStrata("DIALOG")
  opt:SetMovable(true)
  opt:EnableMouse(true)
  opt:EnableKeyboard(true)
  opt:SetPropagateKeyboardInput(true)
  opt:SetClampedToScreen(true)
  opt:RegisterForDrag("LeftButton")
  opt:SetScript("OnDragStart", opt.StartMoving)
  opt:SetScript("OnDragStop", opt.StopMovingOrSizing)
  opt:SetScript("OnKeyDown", function(self, key)
    if key == "ESCAPE" then
      self:SetPropagateKeyboardInput(false)
      if helpWin and helpWin:IsShown() then
        helpWin:Hide()
      elseif crafterWin and crafterWin:IsShown() then
        crafterWin:Hide()
      elseif profSelWin and profSelWin:IsShown() then
        profSelWin:Hide()
      elseif weaponSelWin and weaponSelWin:IsShown() then
        weaponSelWin:Hide()
      else
        self:Hide()
      end
    else
      self:SetPropagateKeyboardInput(true)
    end
  end)
  opt:SetScript("OnHide", function()
    CloseAllDropdowns()
    if profSelWin then profSelWin:Hide() end
    if weaponSelWin then weaponSelWin:Hide() end
    if crafterWin then crafterWin:Hide() end
    if helpWin then helpWin:Hide() end
  end)
  ApplyModernWindowStyle(opt, 0.98)
  opt:Hide()

  local close = CreateFrame("Button", nil, opt, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", opt, "TOPRIGHT", -4, -4)

  local helpBtn = CreateFrame("Button", nil, opt, "UIPanelButtonTemplate")
  helpBtn:SetSize(24, 22)
  helpBtn:SetPoint("RIGHT", close, "LEFT", -2, 0)
  helpBtn:SetText("?")
  StyleModernButton(helpBtn, true)
  helpBtn:SetScript("OnClick", ToggleHelpWindow)

  local titleFs = MakeLabel(opt, "Skill Levels - Options", 18, -16, "GameFontNormalLarge")
  titleFs:SetTextColor(0.60, 0.84, 1)
  AddHeaderDivider(opt, -40)

  local profTabBtn = MakeButton(opt, "Professions", 18, -48, 238, function()
    SelectTab("prof"); RefreshOptions()
  end)
  profTabBtn.isTab = true
  local weaponTabBtn = MakeButton(opt, "Weapons", 264, -48, 238, function()
    SelectTab("weapon"); RefreshOptions()
  end)
  weaponTabBtn.isTab = true

  tabs.prof = {
    btn = profTabBtn,
    page = BuildSectionPage(opt, "prof", false),
  }
  tabs.weapon = {
    btn = weaponTabBtn,
    page = BuildSectionPage(opt, "weapon", true),
  }

  local footerCard = MakeSectionCard(opt, 484, 214, "BOTTOMLEFT", opt, "BOTTOMLEFT", 18, 16)

  local function addGlobalCheck(key, field, x, y, maxW)
    local cb = CreateFrame("CheckButton", nil, footerCard, "UICheckButtonTemplate")
    cb:SetSize(22, 22)
    cb:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", x, y)
    cb.label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    cb.label:SetPoint("LEFT", cb, "RIGHT", 4, 0)
    cb.label:SetWidth(maxW or 200)
    cb.label:SetJustifyH("LEFT")
    cb.label:SetWordWrap(true)
    cb.label:SetTextColor(0.92, 0.95, 1)
    cb.label:SetText(L(key))
    Reg(cb.label, key)
    cb.field = field
    cb:SetScript("OnClick", function(self)
      DB[field] = self:GetChecked() and true or false
      UpdateAll()
    end)
    globalChecks[#globalChecks + 1] = cb
    return cb
  end

  addGlobalCheck("Rainbow mode", "rainbow", 10, 182, 430)
  addGlobalCheck("Hide in combat", "hideInCombat", 10, 156, 200)
  addGlobalCheck("Hide in instances", "hideInInstance", 244, 156, 220)

  local layoutLbl = footerCard:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  layoutLbl:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 14, 130)
  layoutLbl:SetTextColor(0.55, 0.80, 1)
  layoutLbl:SetText(L("Layout:"))
  Reg(layoutLbl, "Layout:")

  opt.layoutBtn = CreateFrame("Button", nil, footerCard, "UIPanelButtonTemplate")
  opt.layoutBtn:SetSize(336, 22)
  opt.layoutBtn:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 134, 126)
  StyleModernButton(opt.layoutBtn)
  opt.layoutBtn:SetScript("OnClick", function()
    local wasShown = opt.layoutList:IsShown()
    CloseAllDropdowns()
    if not wasShown then opt.layoutList:Show() end
  end)
  BuildLayoutDropdown()

  local orderLbl = footerCard:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  orderLbl:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 14, 102)
  orderLbl:SetTextColor(0.55, 0.80, 1)
  orderLbl:SetText(L("Order:"))
  Reg(orderLbl, "Order:")

  opt.orderBtn = CreateFrame("Button", nil, footerCard, "UIPanelButtonTemplate")
  opt.orderBtn:SetSize(336, 22)
  opt.orderBtn:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 134, 98)
  StyleModernButton(opt.orderBtn)
  opt.orderBtn:SetScript("OnClick", function()
    local wasShown = opt.orderList:IsShown()
    CloseAllDropdowns()
    if not wasShown then opt.orderList:Show() end
  end)
  BuildOrderDropdown()

  local sepCb = CreateFrame("CheckButton", nil, footerCard, "UICheckButtonTemplate")
  sepCb:SetSize(22, 22)
  sepCb:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 10, 70)
  sepCb.label = sepCb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  sepCb.label:SetPoint("LEFT", sepCb, "RIGHT", 4, 0)
  sepCb.label:SetTextColor(0.92, 0.95, 1)
  sepCb.label:SetText(L("Separator:"))
  Reg(sepCb.label, "Separator:")
  sepCb.field = "showSeparator"
  sepCb:SetScript("OnClick", function(self)
    DB.showSeparator = self:GetChecked() and true or false
    RefreshOptions()
    UpdateAll()
  end)
  globalChecks[#globalChecks + 1] = sepCb

  opt.sepBox = MakeTextBox(footerCard, 110, 24)
  opt.sepBox:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 122, 70)
  opt.sepBox:SetScript("OnEditFocusLost", function(self)
    DB.separatorText = self:GetText() or ""
    UpdateAll()
  end)
  opt.sepBox:SetScript("OnTextChanged", function(self, userInput)
    if userInput then
      DB.separatorText = self:GetText() or ""
      UpdateAll()
    end
  end)

  addGlobalCheck("Lock position", "locked", 244, 70, 210)

  local resetPosBtn = CreateFrame("Button", nil, footerCard, "UIPanelButtonTemplate")
  resetPosBtn:SetSize(224, 23)
  resetPosBtn:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 12, 40)
  resetPosBtn:SetText(L("Reset position"))
  Reg(resetPosBtn, "Reset position")
  StyleModernButton(resetPosBtn)
  resetPosBtn:SetScript("OnClick", ResetPosition)

  local resetAllBtn = CreateFrame("Button", nil, footerCard, "UIPanelButtonTemplate")
  resetAllBtn:SetSize(224, 23)
  resetAllBtn:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 246, 40)
  resetAllBtn:SetText(L("Reset all settings"))
  Reg(resetAllBtn, "Reset all settings")
  StyleModernButton(resetAllBtn)
  resetAllBtn:SetScript("OnClick", function()
    local keepLang = DB.lang
    for k in pairs(DB) do DB[k] = nil end
    DB.lang = keepLang
    DB.locked = false
    DB.rainbow = false
    DB.hideInCombat = false
    DB.hideInInstance = false
    DB.layoutMode = "vertical"
    DB.showSeparator = true
    DB.separatorText = "--------"
    DB.blockOrder = "prof_weapon_sec"
    DB.prof = Copy(SECTION_DEFAULTS.prof)
    DB.weapon = Copy(SECTION_DEFAULTS.weapon)
    ResetPosition()
    if profSelWin then profSelWin:Refresh() end
    if weaponSelWin then weaponSelWin:Refresh() end
    if crafterWin then crafterWin:Refresh() end
    if helpWin then helpWin:Refresh() end
    UpdateAll()
    RefreshOptions()
  end)

  opt.langBtn = CreateFrame("Button", nil, footerCard, "UIPanelButtonTemplate")
  opt.langBtn:SetSize(458, 23)
  opt.langBtn:SetPoint("BOTTOMLEFT", footerCard, "BOTTOMLEFT", 12, 10)
  StyleModernButton(opt.langBtn, true)
  opt.langBtn:SetScript("OnClick", function()
    local wasShown = opt.langList:IsShown()
    CloseAllDropdowns()
    if not wasShown then opt.langList:Show() end
  end)
  BuildLangDropdown()

  SelectTab("prof")
end

function RefreshOptions()
  if not opt then return end
  for _, t in ipairs(texts) do t.obj:SetText(L(t.key)) end
  for _, t in pairs(tabs) do t.page:Refresh() end
  for _, cb in ipairs(globalChecks) do cb:SetChecked(DB[cb.field]) end

  local curLayout = DB.layoutMode or "vertical"
  opt.layoutBtn:SetText(LayoutLabel() .. "  v")
  for _, it in ipairs(opt.layoutItems) do
    local txt = L(it.mode.key)
    if it.mode.id == curLayout then
      it.text:SetText("|cff66b3ff" .. txt .. "|r")
    else
      it.text:SetText(txt)
    end
  end

  local curOrder = DB.blockOrder or "prof_weapon_sec"
  opt.orderBtn:SetText(OrderLabel() .. "  v")
  if curLayout == "separate" then
    opt.orderBtn:Disable()
  else
    opt.orderBtn:Enable()
  end
  for _, it in ipairs(opt.orderItems) do
    local txt = L(it.mode.key)
    if it.mode.id == curOrder then
      it.text:SetText("|cff66b3ff" .. txt .. "|r")
    else
      it.text:SetText(txt)
    end
  end

  if not opt.sepBox:HasFocus() then
    opt.sepBox:SetText(DB.separatorText or "--------")
  end
  if DB.showSeparator and curLayout == "vertical" then
    opt.sepBox:Enable()
    opt.sepBox:SetAlpha(1)
  else
    opt.sepBox:Disable()
    opt.sepBox:SetAlpha(0.5)
  end

  opt.langBtn:SetText(L("Language") .. ": " .. LangLabel(DB.lang) .. "  v")
  for _, it in ipairs(opt.langItems) do
    local txt = LangLabel(it.code)
    if it.code == DB.lang then
      it.text:SetText("|cff66b3ff" .. txt .. "|r")
    else
      it.text:SetText(txt)
    end
  end
end

local function ToggleOptions(forceShow)
  if not opt then BuildOptions() end
  if forceShow or not opt:IsShown() then
    RefreshOptions()
    opt:Show()
    opt:Raise()
  else
    opt:Hide()
  end
end

local blizzRegistered = false

local function RegisterBlizzardOptions()
  if blizzRegistered then return end
  blizzRegistered = true

  local panel = CreateFrame("Frame", "SkillLevelsBlizzPanel", UIParent)
  panel.name = "Skill Levels"

  local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  title:SetPoint("TOPLEFT", 16, -16)
  title:SetText("Skill Levels")

  local desc = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
  desc:SetText(L("Configure profession and weapon skill tracking."))

  local openBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
  openBtn:SetSize(220, 28)
  openBtn:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -18)
  openBtn:SetText(L("Open Options"))
  StyleModernButton(openBtn, true)
  openBtn:SetScript("OnClick", function()
    if SettingsPanel and SettingsPanel:IsShown() then
      SettingsPanel:Hide()
    end
    if InterfaceOptionsFrame and InterfaceOptionsFrame:IsShown() then
      InterfaceOptionsFrame:Hide()
    end
    ToggleOptions(true)
  end)

  panel:SetScript("OnShow", function()
    desc:SetText(L("Configure profession and weapon skill tracking."))
    openBtn:SetText(L("Open Options"))
  end)

  if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
    local category = Settings.RegisterCanvasLayoutCategory(panel, "Skill Levels")
    Settings.RegisterAddOnCategory(category)
  elseif InterfaceOptions_AddCategory then
    InterfaceOptions_AddCategory(panel)
  end
end

local function EnsureDefaults(target, defaults)
  for k, v in pairs(defaults) do
    if target[k] == nil then target[k] = Copy(v) end
  end
end

local function RestoreFramePos(frame, pos)
  if pos then
    frame:ClearAllPoints()
    frame:SetPoint(pos[1], UIParent, pos[2], pos[3], pos[4])
  end
end

local function Init()
  if DB then return end
  SkillLevelsDB = SkillLevelsDB or {}
  DB = SkillLevelsDB
  if DB.lang == nil then DB.lang = "auto" end
  if DB.locked == nil then DB.locked = false end
  if DB.rainbow == nil then
    DB.rainbow = (DB.prof and DB.prof.rainbow) or (DB.weapon and DB.weapon.rainbow) or false
  end
  if DB.hideInCombat == nil then DB.hideInCombat = false end
  if DB.hideInInstance == nil then DB.hideInInstance = false end
  if DB.layoutMode == nil then
    DB.layoutMode = DB.separateFrames and "separate" or "vertical"
  end
  if DB.showSeparator == nil then DB.showSeparator = true end
  if DB.separatorText == nil then DB.separatorText = "--------" end
  if DB.blockOrder == nil then
    DB.blockOrder = DB.weaponsFirst and "weapon_prof_sec" or "prof_weapon_sec"
  end
  DB.prof = DB.prof or {}
  DB.weapon = DB.weapon or {}
  EnsureDefaults(DB.prof, SECTION_DEFAULTS.prof)
  EnsureDefaults(DB.weapon, SECTION_DEFAULTS.weapon)
  DB.prof.crafter = DB.prof.crafter or {}
  DB.weapon.crafter = DB.weapon.crafter or {}
  EnsureDefaults(DB.prof.crafter, DEFAULT_CRAFTER)
  EnsureDefaults(DB.weapon.crafter, DEFAULT_CRAFTER)
  RestoreFramePos(mainFrame, DB.pos)
  RestoreFramePos(profFrame, DB.profPos)
  RestoreFramePos(weaponFrame, DB.weaponPos)
  RestoreFramePos(secProfFrame, DB.secPos)
end

local eventFrame = CreateFrame("Frame")
for _, ev in ipairs({
  "PLAYER_LOGIN", "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA",
  "SKILL_LINES_CHANGED", "CHAT_MSG_SKILL", "TRADE_SKILL_LIST_UPDATE",
  "PLAYER_EQUIPMENT_CHANGED", "UNIT_INVENTORY_CHANGED", "PLAYER_LEVEL_UP",
  "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED",
}) do
  pcall(eventFrame.RegisterEvent, eventFrame, ev)
end

eventFrame:SetScript("OnEvent", function(_, event, arg1)
  Init()
  if event == "UNIT_INVENTORY_CHANGED" and arg1 ~= "player" then return end
  if event == "PLAYER_LOGIN" then
    ExpandAll()
    pcall(RegisterBlizzardOptions)
  end

  UpdateAll()
  if profSelWin and profSelWin:IsShown() then profSelWin:Refresh() end
  if weaponSelWin and weaponSelWin:IsShown() then weaponSelWin:Refresh() end
  if event == "PLAYER_LEVEL_UP" and C_Timer and C_Timer.After then
    C_Timer.After(1.5, UpdateAll)
  end
end)

SLASH_SKILLLEVELS1 = "/sl"
SLASH_SKILLLEVELS2 = "/skilllevels"
SlashCmdList["SKILLLEVELS"] = function(msg)
  Init()
  msg = (msg or ""):lower()
  if msg == "reset" then
    ResetPosition()
    return
  end
  ToggleOptions()
end
