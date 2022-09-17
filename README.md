# Skytjenester-som-arbeidsflate

## Oppgave 1 - Teori (50 %)

> 1. Når vi snakker om sky, nevner vi ofte forskjellige utrullingsmodeller (deployment) og tjenestemodeller (service). Hvilke utrullingsmodeller er det snakk om, og hva er forskjellen på disse modellene? Er det noen fordeler og eller ulemper ved noen av disse?

> 2. I de senere årene har det meste kommet «as-a-Service», og Anything (eller Everything) as-a-Service (XaaS) er et generelt, samlebegrep som refererer til levering av alt som en tjeneste. Den anerkjenner det store antallet produkter, verktøy og teknologier som leverandører nå leverer til brukere som en tjeneste over internett i stedet for å levere tjenesten lokalt eller on-prem i en bedrift. I introduksjonsleksjonen snakker vi om IaaS, PaaS og SaaS og hva de representerer. Oppsummer kort hva de forskjellige tjenestemodellene er for noe, og er det noen senario hvor enkelte egner seg bedre enn andre?

> 3. I en typisk bedrift i dag vil det både ansettes nye og avsluttes ansattforhold. I den forbindelse er det ofte tilknyttet en del prosesser som må kjøres igjennom før vedkommende kan komme i gang med sin nye bruker og få tilgang til det vedkommende skal jobbe med / ha tilgang på. Forklar kort hva som typisk må gjøres / kjøres igjennom for en nyansettelse. Her er det viktig å tenkte på både gruppetilhørighet, MFA, opprettelse av passord etc. En kan godt benytte et flytdiagram om en ønsker det for å vise hva som skjer og hvem som gjør hva.

I følge 

## svar på 1.1

Når vi snakker om *Cloud computing* så blir det ofte nevnt forskjellige typer distribusjonsmodeller som blir benyttet for å utrulle skytjenester. Det blir ofte forvirring med disse distribusjonsmodeller og hvordan blir de brukt. Men før vi dykke inni disse distribusjonsmodeller så vil jeg snakke litt om hva er "Cloud" computing. Og hva må det til for at en løsning skal betraktes som "cloud" computing. I denne besvarelsen så skal betegnelsene "sky" og "cloud" som vil bety det samme.

I følge til *National Institute of Standards and Technology "NIST"*, sky som en tjeneste må ha 5 forskjellige kriterier for å kunne definere denne tjenesten som sky.

1. ### Resource pooling

    Denne betegnelsen beskriver "betjener-klient" forhold mellom en IT-infrastruktur og forbrukere av ressursene som denne infrastrukturen tilbyr.

2. ### On-demand

    Disse ressurser og tjenester som infrastrukturen tilbyr må være tilgjengelige for brukerne slik at de kan start/stope ressursen/tjenesten on-demand.

3. ### Broad Network Access

    Det må finnes en nettverksinfrastruktur som koble tjenestene til alle vedkommende klienter.

4. ### Elasticity

    Skyen som tilbys må kunne skalere ressursene den tilbyr etter behov.  


5. ### Measured Services

    Man må kunne måle bruken av tjenesten som skyen tilbyr så man kan tilpasse sine behov av infrastruktur (i tilfelle av Privat som vi skal beskrive seinere), eller begrense sine forbruk av tjenester og ressurs. 


Nå når vi har forstått hva er skyen, så kan vi fortsette videre til distribusjonsmodellene vi nevnt innledningsvis. 
Det er tre typer distribusjonsmodeller som hver har sine fordeler og ulemper, og hver av dem ofte blir valgt basert på organisasjonens behov og økonomi. Disse er *Private cloud*, *Public Cloud* og blanding av disse to siste nevnt *Hybrid cloud*.

- Public Cloud 

     Denne type skyen bruker en tjenester og infrastruktur som tilbys av en ekstern leverandør. Klienten leie ressurs eller tjenester, og betaler for tjenesten over tid. Dette betyr at klienten eier ingenting av infrastrukturen, og dermed trenger de ikke å vedlikeholde/oppdatere dem heller.

    ### Fordeler 
    1. Høy skalerbarhet 

        Store leverandører som Microsoft og amazon har veldig store data sentere med kraftige data maskiner. I tillegg så har de implementert dynamiske mekanismer av tildeling av ressurs som gjør at man kan skalere opp ressursene nesten umiddelbart.

    2. Kostnadsreduksjon

        Siden man slipper å kjøpe de dyre infrastruktur selv så sparer man innkjøpskostnadene.

    3. Katastrofegjenoppretting

        Store Cloud som Microsoft tilbyr Katastrofegjenoppretting ved at data-ene blir distribuert over flere lokasjoner. 

    4. Pålitelighet

        Klienten kan enkelt legge til/slette ressurs eller tjenester ved bruk av en grensesnitt eller terminal.
    5. Sikkerhet

        Skytjenestetilbydere har ansvaret for sikkerhetsoppdateringer ved oppdagelse av sårbarheter. I tillegg til store skyleverandører som microsoft har sine data beskyttet med kryptering og andre utstyr som "intrusion detection"
        I tillegg så har sine fasiliteter høy grad av sikkerhet hvor de blir overvåket, og bare de som gjelder kan komme seg inn.

        

    ### Ulemper
        
    Til tross for alle disse fordelene, så har offentlig sky sine ulemper som kan gjør at en bedrift går for en anne type skyløsning som for eksempel lovverk som sier at de må ha data-ene sine lagret lokalt. Andre type ulemper kan være restriksjoner av vis typer applikasjoner eller operativsystemer spm gjør at de kjøper infrastrukturen selv for å kontrollere dette.

- Privat Cloud – Dette betyr å bygge og vedlikeholde infrastruktur på deres egen.

- Hybrid Cloud – Dette betyr å bruke en kombinasjon av offentlig og private skyløsninger.





## Referanser

https://www.vescudero.net/2021/09/NIST-5-criteria-for-cloud-services.html
https://www.techopedia.com/definition/29545/resource-pooling

https://www.spiceworks.com/tech/cloud/articles/what-is-broad-network-access/#:~:text=Broad%20network%20access%20is%20the,resources%20across%20these%20diverse%20platforms.

https://wisdomplexus.com/blogs/pros-cons-public-cloud/