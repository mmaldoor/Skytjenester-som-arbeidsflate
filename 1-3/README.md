# Cloud

Når vi snakker om *Cloud computing* så blir det ofte nevnt forskjellige typer distribusjonsmodeller som blir benyttet for å utrulle skytjenester. Det blir ofte forvirring rundt disse distribusjonsmodellene og hvordan blir de brukt. Men før vi går inn på disse distribusjonsmodellene så vil jeg snakke litt om hva "Cloud" computing er, og hva som må til for at en løsning skal betraktes som "cloud" computing. I denne besvarelsen så kommer betegnelsene "sky" og "cloud" til å brukes om hverandre, og bety det samme.

I følge *National Institute of Standards and Technology "NIST"*, må sky som tjeneste ha 5 forskjellige kriterier for å defineres som sky.

1. ### Resource pooling

    Denne betegnelsen beskriver "betjener-klient" forhold mellom en IT-infrastruktur og forbrukere av resursene som denne infrastrukturen tilbyr.

2. ### On-demand

    Disse resursene og tjenestene som infrastrukturen tilbyr må være tilgjengelige for brukerne slik at de kan starte/stoppe resursen/tjenesten on-demand.

3. ### Broad Network Access

    Det må finnes en nettverksinfrastruktur som kobler tjenestene til alle vedkommende klienter.

4. ### Elasticity

    Skyen som tilbys må kunne skalere resursene den tilbyr etter behov.  


5. ### Measured Services

    Man må kunne måle bruken av tjenesten som skyen tilbyr så man kan tilpasse sine behov for infrastruktur (i tilfelle av Privat som vi skal beskrive seinere), eller begrense sine forbruk av tjenester og resurser. 


Nå når vi har forstått hva sky er, så kan vi fortsette videre til distribusjonsmodellene som ble nevnt innledningsvis. 
Det er tre typer distribusjonsmodeller som alle har sine fordeler og ulemper, og hver av dem blir ofte valgt basert på organisasjonens behov og økonomi. Disse er *Private cloud*, *Public Cloud* og en blanding av disse to sistnevnte *Hybrid cloud*.

- **Public Cloud** 

     Denne type sky bruker tjenester og infrastruktur som tilbys av en ekstern leverandør. Klienten leier resurser eller tjenester, og betaler for tjenesten over tid. Dette betyr at klienten ikke eier noe av infrastrukturen, og dermed heller  ikke trenger å vedlikeholde/oppdatere dem.

    ### Fordeler 
    1. Høy skalerbarhet 

        Store leverandører som Microsoft og amazon har veldig store datasentre med kraftige datamaskiner. I tillegg så har de implementert dynamiske mekanismer for tildeling av resurser som gjør at man kan skalere opp resursene nesten umiddelbart.

    2. Kostnadsreduksjon

        Fordi man slipper å kjøpe de dyre infrastrukturene selv så sparer man innkjøpskostnadene.

    3. Katastrofegjenoppretting

        Store Cloudleverandører som Microsoft tilbyr Katastrofegjenoppretting ved at data-ene blir distribuert over flere lokasjoner. 

    4. Pålitelighet og fleksibilitet

        Klienten kan enkelt legge til/slette resurser eller tjenester ved bruk av et grensesnitt eller en terminal.

    5. Sikkerhet

        Bedrifter som tilbyr Skytjeneste har ansvaret for sikkerhetsoppdateringer ved oppdagelse av sårbarheter. I tillegg har store skyleverandører som microsoft sine data beskyttet med kryptering og andre utstyr som for eksempel "intrusion detection"
        I tillegg så har fasilitetene deres høy grad av sikkerhet hvor de blir overvåket, og bare de det gjelder kan komme seg inn.

        

    ### Ulemper
        
    Til tross for alle disse fordelene, så har offentlige skyer sine ulemper som kan gjør at en bedrift går for en anne type skyløsning. Det kan for eksempel være lovverk som sier at de må ha dataene sine lagret lokalt. Andre typer ulemper kan være restriksjoner av visse typer applikasjoner eller operativsystemer spm gjør at de kjøper infrastrukturen selv for å kontrollere dette.



- **Privat Cloud** 
    Denne typen sky gir omtrent samme fordeler som en offentlig sky. Den skiller seg fra offentlig sky ved at infrastrukturen og resursene er dedikert til en eller flere utvalgte kunder og ikke er for offentligheten (I de fleste tilfeller eid av organisasjonen). Dette betyr at organisasjonen er ansvarlige og har mer kontroll over hardware og software som blir brukt. 

    ### Fordeler 
    Som det ble nevnt tidligere, private skyer har mange av den offentlige skyens fordeler, men i tillegg har de også fleksibiliteten og sikkerheten av en on-prem infrastruktur. Mange organisasjoner velge denne typen på grunn av lokale lovverk som public skyen ikke imøtekommer, som for eksempel tilgangskontroll eller hvor dataen vil lagres, noe som tvinger dem til å kjøpe infrastrukturen selv for å møte disse reguleringskravene.
    I tillegg gir privat sky større kontroll over hardware og software som blir brukt.

    ### Ulemper 
    Den største ulempen med privat sky er at det er kostbart å kjøpe og vedlikeholde infrastrukturen selv, noe som kan være vanskelig for små bedrifter. Andre ulemper kan være mangel på ekspertise eller teknologier som skyleverandøren besitter, som kan gi mer sikkerhet og ytelse.


- **Hybrid Cloud**

    Som navnet tilsier, er denne en blanding mellom en privat og offentlig sky. Med denne skyen kobler organisasjoner sine privat skyer sammen med den offentlige for å danne en forent sky.

    Denne typen bærer fordelene av begge verdener som gjør det tiltalende for organisasjoner å velge hvilken type sky å bruke for hvilken type scenario. For eksempel det kan være at organisasjonen vil balanserer belastningen mellom begge sky, eller lagre sine sensitive data i privat sky og resten av forretnings data og applikasjoner i en offentlig sky. 

<br>


# Everything as a service


### Infrastructure as a service *IaaS*

Iaas tilbyr data-infrastruktur tilgjengelig som en virtualized tjeneste for brukere. Denne tjenesten inkluderer Servere, nettverk og data storage. De fleste tjenesteleverandører som tilbyr Iaas vedlikeholder resurser og infrastruktur selv. Sluttbrukere derimot er ansvarlige for data, applikasjoner, operativsystemer og innstillinger de kjører på denne infrastrukturen. Iaas er egnet til [system administratorer](https://en.wikipedia.org/wiki/System_administrator), altså bedrifter som vil ha infrastrukturen til å installere sine applikasjoner og data på. Eksempler på denne type tjeneste er Microsoft Azure eller Amazon web services *AWS*


### Platform as a service *PaaS*

Pass tilbyr alt av det som IaaS tilbyr, men den har i tillegg et operativsystem, runtime, webserver og database installert på forhånd. Disse tjenestene tilbys i en virtualized miljø som gjør at sluttbrukere kan kjøre og kompilere programmeringskoder enklere og raskere. Pass er egnet for utviklere som vil ha et enkelt og raskt utviklingsmiljø uten å bekymre seg for den underliggende infrastrukturen eller installasjonen av utviklingsverktøy og software. Eksempler på denne type tjeneste er AWS Elastic Beanstalk.

### Software as a service *SaaS*

Saas er en on demand service av applikasjon-software for sluttbrukere. I motsetting til typiske kjøpt applikasjoner, så er saas applikasjoner plattformuavhengig og dermed trenger man ikke å installere appen for benytte den, man trenger kun en internet tilkobling. Alle de underliggende resursene blir administrert og forvaltet av tjenesteleverandøren, og tjenesteforburkerne er kun ansvarlig for dataene sine som de bruker i den applikasjonen de benytter, og innstillinger den tilbyr. SaaS er egnet for folk generelt, og alle kan benytte seg av den typen tjeneste når de vil, og det er oftest tilgjengelig i en web browser. Eksempler på denne typen er Microsoft onedrive og Google docs.


# Ansettelsesprosessen  

Før ansettelsen, burde det ha blitt implementert noen sikkerhetstrukturer og innstillinger som bidrar til sikkerheten og effekten til brukeradministrasjonen. 
Først bør vi sikre at MFA er aktivert for denne brukeren. Alle tenant som ble laget etter 2019 har "Default security" aktivert, som innebærer at MFA er aktivert for alle by default. Med dersom organisasjonen vil gjøre unntak for noen brukere så kan de lage en sikkerhets gruppe for MFA.

Det kan lages noen sikkerhetgrupper som gir rettigheter for alle eller deler av brukere i organisasjonen med dynamisk innmelding. Ved å gjøre dette så slipper man å huske på å gi disse rettigheter for hver eneste bruker, eller fjerne disse rettighetene ved oppsigelsen. Det vil si at hvis man vil gi visse rettigheter til brukerne så er det bare å lage brukeren med de rette attributter så er han innmeldt i gruppa som er egnet for denne brukeren. For eksempel en gruppe for å gi "self-service password reset" *SSPR* rettighet for alle brukere som er medlemmer i tenanten.

Grupper for avdelingen vedkommende skal jobbe i skulle være klare før opprettelsen av brukerkontoen slik at brukeren får arve rettigheter og lisenser egnet for den avdelingen han vil jobbe i, gjerne med dynamisk innmelding også. Eksempler på disse gruppene er en m365 gruppe som vil gjøre det mulig for avdelingsmedlemmene å samarbeide. En sikkerhetsgruppe med visse lisenser og rettigheter som er egnet for avdelingen brukeren vil jobbe i. Og dersom vedkommende blir tildelt en administrativ rolle for den avdeling så er det lurt å ha klart en gruppe med tildelt administrativeroller for admins for den avdelingen. 

Deretter lager man en bruker for vedkommende registrert med alle de nødvendige opplysingene som fornavn, etternavn, telefonnummer, avdelingsnavn etc. Passord burde bli formidlet på en sikker måte, gjerne kryptert dersom det skal gjøres gjennom internett. Den ansatte bør deretter bli tvunget til å endre passord ved første innlogging med mfa og krav om et komplekst passord (Implementert av "security defaults").

## Referanser

https://www.vescudero.net/2021/09/NIST-5-criteria-for-cloud-services.html
https://www.techopedia.com/definition/29545/resource-pooling
https://www.spiceworks.com/tech/cloud/articles/what-is-broad-network-access/#:~:text=Broad%20network%20access%20is%20the,resources%20across%20these%20diverse%20platforms.
https://wisdomplexus.com/blogs/pros-cons-public-cloud/
https://www.ibm.com/cloud/learn/introduction-to-private-cloud
https://lazyadmin.nl/office-365/best-practice-to-secure-office-365/
https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults

Teksthefter fra forelesningene