GRANT ALL PRIVILEGES ON *.* TO 'demo-user'@'%';
GRANT SUPER ON *.* TO 'demo-user'@'%';

create schema logging;

CREATE TABLE if not exists logging.clicks (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    userId varchar(50) DEFAULT NULL,
    action varchar(128) DEFAULT NULL,
    device json DEFAULT NULL,
    isApp tinyint(1) DEFAULT NULL,
    insertDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id,insertDate)
    );

insert into logging.clicks(id, userId, action, device, isApp) values
        (1, '1', 'LOGIN', '{"type": "PC", "model": "MacOS", "vendor": "Apple"}', 0),
        (2, '1', 'NAVIGATION', '{"type": "PC", "model": "MacOS", "vendor": "Apple"}', 0),
        (3, '1', 'PAYMENT', '{"type": "PC", "model": "MacOS", "vendor": "Apple"}', 0),
        (11, '2', 'LOGIN', '{"type": "PC", "model": "MacOS", "vendor": "Apple"}', 0),
        (12, '3', 'LOGIN', '{"type": "PC", "model": "MacOS", "vendor": "Apple"}', 0);

create schema users;
CREATE TABLE users.user (
    id varchar(36) CHARACTER SET utf8 NOT NULL,
    username varchar(100) CHARACTER SET utf8 NOT NULL,
    userType varchar(20) NOT NULL,
    insertDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    lastModified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
    );
INSERT INTO users.user (id, username, userType)
VALUES ('1', 'john.doe@example.com', 'regular'),
       ('2', 'jane.smith@example.com', 'guest'),
       ('3', 'bob.johnson@example.com', 'admin'),
       ('4', 'alice.wong@example.com', 'regular');