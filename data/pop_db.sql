-----------------------------------------------------
-- Utilisateur
-----------------------------------------------------
INSERT INTO utilisateur (id_user, nom_user, mail_user, mdp) VALUES
(1, 'Alice Dupont', 'alice@example.com', 'mdpAlice123'),
(2, 'Bob Martin', 'bob@example.com', 'mdpBob123'),
(3, 'Claire Leroy', 'claire@example.com', 'mdpClaire123'),
(4, 'David Lopez', 'david@example.com', 'mdpDavid123');


-----------------------------------------------------
-- Activite
-----------------------------------------------------
INSERT INTO activite (
    id_activite, titre, description, date_activite, lieu,
    duree, distance, sport, detail_sport, id_user
) VALUES
(1, 'Footing matin', 'Course dans le parc', '2025-01-15 07:00:00', 'Parc Montsouris', 0.75, 8.5, 'course', 'Footing leger', 1),
(2, 'Course du soir', 'Entrainement fractionne', '2025-02-05 19:30:00', 'Quais de Seine', 0.67, 9.2, 'course', 'Fractionne 30/30', 1),
(3, 'Natation piscine', 'Entrainement crawl', '2025-01-22 12:15:00', 'Piscine municipale', 0.83, 2.0, 'natation', 'Crawl', 3),
(4, 'Natation endurance', 'Longue seance en piscine', '2025-02-07 18:00:00', 'Piscine Georges Vallerey', 1.17, 3.0, 'natation', 'Endurance crawl/dos', 3),
(5, 'Sortie cyclisme', 'Balade avec denivele', '2025-02-09 09:00:00', 'Bois de Vincennes', 2.33, 55.0, 'cyclisme', 'Route endurance', 2),
(6, 'Randonnee montagne', 'Randonnee en foret de Fontainebleau', '2025-02-15 08:30:00', 'Fontainebleau', 4.0, 12.5, 'randonnee', 'Marche en groupe', 4);


-----------------------------------------------------
-- Commentaire
-----------------------------------------------------
INSERT INTO commentaire (id_comment, contenu, id_user, id_activite) VALUES
(1, 'Bravo pour ton footing !', 2, 1),
(2, 'Super rythme sur ta course, bravo !', 2, 4),
(3, 'Bonne nage, tu progresses !', 4, 3),
(4, 'Belle seance, ca donne envie !', 1, 4),
(5, '55 km, impressionnant !', 4, 5),
(6, 'Fontainebleau est magnifique, je veux venir la prochaine fois.', 3, 6);


-----------------------------------------------------
-- Like
-----------------------------------------------------
INSERT INTO liker (id_like, id_user, id_activite) VALUES
(1, 2, 1),  -- Bob like footing d'Alice
(2, 3, 2),  -- Claire like la course d'Alice
(3, 2, 3),  -- Bob like la natation de Claire
(4, 1, 4),  -- Alice like la sortie velo de Bob
(5, 2, 5);  -- Bob like la randonnee de David


-----------------------------------------------------
-- Suivi
-----------------------------------------------------
INSERT INTO suivi (id_suiveur, id_suivi) VALUES
(1, 2),  -- Alice suit Bob
(2, 3),  -- Bob suit Claire
(3, 1),  -- Claire suit Alice
(4, 1),  -- David suit Alice
(1, 3),  -- Alice suit Claire
(2, 1),  -- Bob suit Alice
(3, 4),  -- Claire suit David
(4, 2);  -- David suit Bob
