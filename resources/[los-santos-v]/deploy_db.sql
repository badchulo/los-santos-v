START TRANSACTION;
SET AUTOCOMMIT = 0;

CREATE TABLE Players (
	PlayerID varchar(50) NOT NULL,
	LoginTime INT UNSIGNED DEFAULT NULL,
	SkinModel varchar(50) NOT NULL DEFAULT 'u_m_y_baygor',
	Weapons MEDIUMTEXT DEFAULT NULL,
	Kills INT UNSIGNED NOT NULL DEFAULT 0,
	Deaths INT UNSIGNED NOT NULL DEFAULT 0,
	Cash INT UNSIGNED NOT NULL DEFAULT 0,
	Experience INT UNSIGNED NOT NULL DEFAULT 0,
	Prestige INT UNSIGNED NOT NULL DEFAULT 0,
	Banned TINYINT(1) NOT NULL DEFAULT 0,
	BanExpiresDate INT DEFAULT NULL,
	PatreonTier INT UNSIGNED DEFAULT NULL,
	Moderator INT UNSIGNED DEFAULT NULL,
	PRIMARY KEY (PlayerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE Reports (
	PlayerID varchar(50) NOT NULL,
	Total INT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (PlayerID),
	FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;