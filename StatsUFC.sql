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