-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

-- Users

INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (1, 'Security', 'tytuł 1', 'opis zadania 1', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (2, 'Cloud', 'tytuł 2', 'opis zadania 2', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (3, 'Security', 'tytuł 3', 'opis zadania 3', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (4, 'Cloud', 'tytuł 4', 'opis zadania 4', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (5, 'Frontend', 'tytuł 5', 'opis zadania 5', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (6, 'Security', 'tytuł 6', 'opis zadania 6', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (7, 'Cloud', 'tytuł 7', 'opis zadania 7', current_timestamp);
INSERT INTO tasks (id, chapter, title, description, creation_date) VALUES (8, 'Storage', 'tytuł 8', 'opis zadania 8', current_timestamp);

-- ACL

-- id - identyfikator rekordu
-- principal - wskazuje, czy jest to użytkownik (principal), czy rola (authority)
-- sid - nazwa użytkownika lub roli

INSERT INTO acl_sid (id, principal, sid) VALUES
(1, 0, 'ROLE_TASK'),
(2, 1, 'admin'),
(3, 1, 'user1'),
(4, 1, 'user2');

-- id - identyfikator rekordu
-- class - pełna nazwa klasy, która ma być zabezpieczona

INSERT INTO acl_class (id, class) VALUES
(1, 'com.consdata.task.model.Task');

-- id - identyfikator rekordu
-- object_id_class - klucz obcy do zabezpieczanej klasy (do rekordu z tabeli: acl_class)
-- object_id_identity - identyfikator konkretnego obiektu
-- parent_object - określa obiekt nadrzędny w stosunku do zabezpieczanego obiektu
-- owner_sid - klucz obcy do właściciela zabezpieczanej klasy (do rekordu z tabeli: acl_sid)
-- entries_inheriting - wskazuje, czy wpisy (w acl_entry) z obiektu nadrzędnego mają być dziedziczone

INSERT INTO acl_object_identity (id, object_id_class, object_id_identity, parent_object, owner_sid, entries_inheriting) VALUES
(1, 1, 1, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 1, właścicielem jest admin
(2, 1, 3, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 3, właścicielem jest admin
(3, 1, 6, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 6, właścicielem jest admin
(4, 1, 2, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 2, właścicielem jest admin
(5, 1, 4, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 4, właścicielem jest admin
(6, 1, 5, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 5, właścicielem jest admin
(7, 1, 7, NULL, 2, 0), -- Klasa Task, Obiekt klasy Task id = 7, właścicielem jest admin
(8, 1, 8, NULL, 2, 0); -- Klasa Task, Obiekt klasy Task id = 8, właścicielem jest admin

-- id - identyfikator rekordu
-- acl_object_identity - klucz obcy do "object identity" (do rekordu z tabeli: acl_object_identity)
-- ace_order - określa kolejność bieżącego wpisu
-- sid - klucz obcy do SID'a (użytkwonika/roli) dla którego jest przydzielone uprawnienie (do rekordu z tabeli: acl_sid)
-- mask - maska bitowa, która reprezentuje uprawnienie (READ = 1, WRITE = 2, CREATE = 4, DELETE = 8, ADMINISTRATION = 16)
-- granting - wartość reprezentująca przyznanie lub odmowę
-- audit_success/audit_failure - pola na potrzeby audytu

INSERT INTO acl_entry (id, acl_object_identity, ace_order, sid, mask, granting, audit_success, audit_failure) VALUES
(1, 1, 1, 3, 1, 1, 1, 0), -- object identity = 1, przypisz READ do użytkownika user1
(2, 2, 1, 3, 1, 1, 1, 0), -- object identity = 2, przypisz READ do użytkownika user1
(3, 3, 1, 3, 1, 1, 1, 0), -- object identity = 3, przypisz READ do użytkownika user1
(4, 4, 1, 4, 1, 1, 1, 0), -- object identity = 2, przypisz READ do użytkownika user2
(5, 5, 1, 4, 1, 1, 1, 0), -- object identity = 7, przypisz READ do użytkownika user2
(6, 6, 1, 4, 1, 1, 1, 0), -- object identity = 4, przypisz READ do użytkownika user2
(7, 7, 1, 4, 1, 1, 1, 0), -- object identity = 5, przypisz READ do użytkownika user2
(8, 8, 1, 4, 1, 1, 1, 0); -- object identity = 8, przypisz READ do użytkownika user2

-- (READ = 1, WRITE = 2, CREATE = 4, DELETE = 8, ADMINISTRATION = 16)
