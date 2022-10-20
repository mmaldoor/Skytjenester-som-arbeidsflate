## Oppgave 1 – Caseoppgave - Teori (70 %)

Bedriften CyberDyne Systemes skal starte sin skyreise ved å starte med Microsoft 365. De ansatte skal naturligvis ha sine egne private adresser. Bedriften består av følgende avdelinger:

HR – for demoformål: 2 ansatte

IT – for demoformål: 2 ansatte

Developer – for demoformål: 2 ansatte


Bedriften skal ha en felles gruppe for hver av avdelingene med Teams-rom SharePoint site, samt en felles gruppe for alle ansatte.
Alle i bedriften skal kunne booke følgende møterom(husk tiden det tar å opprette rom):

Tank

Genisys

Som alltid er det viktig å tenke sikkerhet, både om en er on-prem og i sky. Ta stilling til hvilke sikkerhetstiltak, som et minimum, som bør vurderes/implementeres for bedriften i M365.
Vis gjerne med noen print screen der det er hensiktsmessig og gir merverdi til besvarelsen.


## Oppgave 2 - Praktisk (30 %)

Lage et script som kan utføre oppgavene som blir etterspurt i oppgavebeskrivelsen ovenfor. Scriptet trenger ikke være et sammenhengende script som kjøres fra start til slutt, men inneholde flere deler, som for eksempel opprettelse av brukere etc.
Her er det viktig å tenke fleksibilitet og unngå hardkoding av informasjon som gjør at en må endre mye for å kunne bruke scriptet ved annen input.


# CyberDyne

## Introduksjon 

I dette dokumentet så skal jeg del opp konfigurasjonen av cyberdyn microsoft 365 i flere avsnitt. Hver avsnitt skal omhandle hovedelementer som ble etterspurt i oppgave teksten, og hver avsnitt skal diskutere konfigurasjon av det elementet det omhandle, i tillegg til å søkelys på minimumkravet til sikkerheten. Deretter skal det drøftes minimum sikkerheten til hele Tenantet. Vær oppmerksom på at powershell konfigurasjon som skal skrives seinere vil ikke dekke alt som skal drøftes, men kun hovedkonfigurasjoner. 


## Avdelinger

Siden
Ettersom microsoft tillater å lage en m365 gruppe med både dynamisk tildeling av medlemmer og mail enabled, så valgt jeg å lage 

