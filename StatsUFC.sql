CREATE TABLE Categorie (
    idCategorie NUMBER,
    nomCategorie VARCHAR2(100),
    poidsMaxKg REAL,
    CONSTRAINT pk_categorie PRIMARY KEY(idCategorie),
    CONSTRAINT ck_nomCategorie CHECK ( nomCategorie IS NOT NULL)
);

CREATE TABLE Combattant (
    idCombattant NUMBER,
    nom VARCHAR2(50),
    prenom VARCHAR2(50),
    surnom VARCHAR2(100),
    pays VARCHAR2(100),
    dateNaissance date,
    tailleCm number,
    idCategorie number,
    CONSTRAINT pk_combattant PRIMARY KEY(idCombattant),
    CONSTRAINT fk_combattant_categorie FOREIGN KEY(idCategorie)
                            REFERENCES Categorie(idCategorie),
    CONSTRAINT ck_nom CHECK ( nom IS NOT NULL ),
    CONSTRAINT ck_prenom CHECK ( prenom IS NOT NULL )
);

CREATE TABLE Evenement (
    idEvenement NUMBER,
    nomEvenement VARCHAR(100),
    pays VARCHAR2(100),
    ville VARCHAR2(100),
    salle VARCHAR2(100),
    dateEvenement date,
    CONSTRAINT pk_evenement PRIMARY KEY(idEvenement),
    CONSTRAINT ck_nomEvenement CHECK ( nomEvenement IS NOT NULL )
);

CREATE TABLE Arbitre (
    idArbitre NUMBER,
    nomArbitre VARCHAR2(50),
    prenomArbitre VARCHAR2(50),
    CONSTRAINT pk_arbitre PRIMARY KEY(idArbitre),
    CONSTRAINT ck_nomArbitre CHECK ( nomArbitre IS NOT NULL )
);

CREATE TABLE Combat (
    idCombat NUMBER,
    methode VARCHAR2,
    roundFin NUMBER,
    tempsFin VARCHAR2,
    titreEnJeu NUMBER      DEFAULT 0 NOT NULL,
    idEvenement NUMBER      NOT NULL,
    idCategorie NUMBER     NOT NULL,
    idArbitre NUMBER    NOT NULL,
    CONSTRAINT pk_combat PRIMARY KEY(idCombat),
    CONSTRAINT fk_combat_evenement FOREIGN KEY(idEvenement)
                        REFERENCES Evenement(idEvenement),
    CONSTRAINT fk_combat_categorie FOREIGN KEY(idCategorie)
                        REFERENCES Categorie(idCategorie),
    CONSTRAINT fk_combat_arbitre FOREIGN KEY(idArbitre)
                        REFERENCES Arbitre(idArbitre),
    CONSTRAINT ck_titreEnJeu CHECK ( titreEnJeu in ('oui','non'))
);
    
