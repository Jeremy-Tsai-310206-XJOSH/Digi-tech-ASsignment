PRAGMA foreign_keys = ON;

CREATE TABLE items (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	price REAL,
	weight REAL,
	stock INTEGER
);
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	password TEXT,
	email TEXT,
	phone TEXT,
	address TEXT,
	credit_card TEXT
);
CREATE TABLE purchases (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER,
	item_id INTEGER,
	FOREIGN KEY (user_id)
	    REFERENCES users (id)
	        ON UPDATE NO ACTION
	        ON DELETE NO ACTION
	FOREIGN KEY (item_id)
	    REFERENCES items(id)
	        ON UPDATE NO ACTION
	        ON DELETE NO ACTION
);

INSERT INTO items(name) VALUES ("Computer"), ("Phones"), ("Headphones"),("Watches");
INSERT INTO users(name, password, email, phone, address, credit_card) VALUES ("Bob", "tigerbob123", "bobscot@hotmail.com", "0493285934
", "1497 Hillside Street", "VISA, 4556004243430446, 7/2028, 441"), ("Ben", "benjamin125", "benboud@gmail.com", "0429384203", "3490 Pride Avenue", "MASTERCARD, 5148993138717226, 11/2025, 906"), ("Jack", "dragon943", "jackbox32@gmail.com", "0492385023", "197 Spruce Drive", "AMEX, 378427217548816, 3/2024, 180"), ("Adam", "adamname124", "adamthebest@hotmail.com", "0492587303", "1641 Lee Avenue", "VISA, 4916262269035284, 9/2023, 484"), ("Josh", "starwars012", "joshsmiths@hotmail.com", "0419342935", "1082 Charles Street", "VISA, 4916546246877523, 12/2026, 275");
INSERT INTO purchases(user_id, item_id) VALUES (3, 3), (2, 3),(1, 1), (4,2),(2,4),(1,3),(3,2),(5,4) ;


SELECT * FROM items;
SELECT * FROM users;
SELECT * FROM purchases;

SELECT users.name User, items.name Item FROM purchases
	JOIN users
	ON purchases.user_id = users.id
	JOIN items
	ON purchases.item_id = items.id;
