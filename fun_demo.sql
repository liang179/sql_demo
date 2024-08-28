DROP TABLE if EXISTS t1;
create table t1(
    `id` char(36) NOT NULL,
    `time` datetime NOT NULL,
    `msg` varchar(1024) DEFAULT '',
    PRIMARY KEY (`id`)
);

INSERT INTO t1(`id`,`time`,`msg`) VALUES(uuid(),now(),'test');

DROP PROCEDURE  IF EXISTS F_TEST;
CREATE PROCEDURE  F_TEST () BEGIN
    INSERT INTO t1(`id`,`time`,`msg`) VALUES(uuid(),now(),'test123');
END;