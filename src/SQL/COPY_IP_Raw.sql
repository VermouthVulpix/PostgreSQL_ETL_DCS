COPY temporary_ip
FROM '..\Data\IP_Raw.csv'
WITH (FORMAT CSV, HEADER);