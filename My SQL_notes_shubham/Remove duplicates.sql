CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    Shifts VARCHAR(255) NOT NULL
);
INSERT INTO contacts (first_name,last_name,email, Shifts) 
VALUES ('Carine ','Schmitt','carine.schmitt@verizon.net','Morning'),
       ('Jean','King','jean.king@me.com', 'Night'),
       ('Peter','Ferguson','peter.ferguson@google.com','Night'),
       ('Janine ','Labrune','janine.labrune@aol.com','Morning'),
       ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com','Morning'),
       ('Janine ','Labrune','janine.labrune@aol.com','Morning'),
       ('Susan','Nelson','susan.nelson@comcast.net','Night'),
       ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@att.net','Morning'),
       ('Roland','Keitel','roland.keitel@yahoo.com','Morning'),
       ('Julie','Murphy','julie.murphy@yahoo.com','Night'),
       ('Kwai','Lee','kwai.lee@google.com','Night'),
       ('Jean','King','jean.king@me.com','Night'),
       ('Susan','Nelson','susan.nelson@comcast.net','Night'),
       ('Roland','Keitel','roland.keitel@yahoo.com','Morning');
select id
FROM(select *, row_number() OVER(partition by email) As xyz
	FROM contacts
    ) as Prasi
where xyz>1;
Delete from contacts where id IN (6,12,14,13);
-- to count the number of email IDs in each shift group
SELECT
    Shifts,
    COUNT(email) AS EmailCount
FROM
    contacts
WHERE
    Shifts IN ('Morning', 'Night')
GROUP BY
    Shifts;

