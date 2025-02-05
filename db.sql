-- Create `airtime` table
CREATE TABLE IF NOT EXISTS airtime (
    aId INTEGER PRIMARY KEY,
    aNetwork VARCHAR(10) NOT NULL,
    aBuyDiscount REAL NOT NULL,
    aUserDiscount REAL NOT NULL,
    aAgentDiscount REAL NOT NULL,
    aVendorDiscount REAL NOT NULL,
    aType VARCHAR(50) NOT NULL
);

-- Insert data into `airtime`
INSERT INTO airtime (aId, aNetwork, aBuyDiscount, aUserDiscount, aAgentDiscount, aVendorDiscount, aType)
VALUES
    (1, '1', 98, 99.5, 99.2, 99, 'VTU'),
    (2, '2', 95.5, 99, 98, 97.5, 'VTU'),
    (3, '3', 96.5, 98.5, 98, 97.8, 'VTU'),
    (4, '4', 98, 99.5, 99.2, 99, 'VTU'),
    (5, '1', 98, 99.6, 99.2, 99, 'Share And Sell'),
    (6, '2', 93.5, 98, 97.2, 96.5, 'Share And Sell'),
    (7, '3', 87, 94, 93, 92, 'Share And Sell'),
    (8, '4', 88, 85, 94, 92, 'Share And Sell')
    ON CONFLICT(aId) DO NOTHING;

-- Create `apiconfigs` table
CREATE TABLE IF NOT EXISTS apiconfigs (
    aId INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULL
);

-- Insert data into `apiconfigs`
INSERT INTO apiconfigs (aId, name, value)
VALUES
    (1, 'data_api', '49697ettdrd55555ggdd76ss77477ddssg6'),
    (2, 'monifyApi', 'MK_PROD_FLX4P92EDF'),
    (3, 'monifySecrete', 'RQDUNGNX17WTDRYAK2SH2RKTLNR38Y5Y'),
    (13, 'mtnVtuKey', '49697ettdrd55555ggdd76ss77477ddssg6')
    ON CONFLICT(aId) DO NOTHING;

-- Create `dataplans` table
CREATE TABLE IF NOT EXISTS dataplans (
    pId INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price REAL NOT NULL,
    userprice REAL NOT NULL,
    agentprice REAL NOT NULL,
    vendorprice REAL NOT NULL,
    planid VARCHAR(50) NOT NULL,
    atype VARCHAR(50) NOT NULL,
    datanetwork INTEGER NOT NULL,
    day VARCHAR(50) NOT NULL
);

-- Insert data into `dataplans`
INSERT INTO dataplans (pId, name, price, userprice, agentprice, vendorprice, planid, atype, datanetwork, day)
VALUES
-- MTN SME Plans
(1, '500MB', '130', '130', '130', '130', '1', 'SME', 1, '30'),
(2, '1GB', '260', '260', '260', '260', '2', 'SME', 1, '30'),
(3, '2GB', '520', '520', '520', '520', '3', 'SME', 1, '30'),
(4, '3GB', '780', '780', '780', '780', '4', 'SME', 1, '30'),
(5, '5GB', '1300', '1300', '1300', '1300', '5', 'SME', 1, '30'),
(6, '10GB', '2600', '2600', '2600', '2600', '6', 'SME', 1, '30'),

-- 9MOBILE GIFTING Plans
(7, '1.5GB', '880', '880', '880', '880', '36', 'GIFTING', 4, '30'),
(8, '2GB', '1000', '1000', '1000', '1000', '37', 'GIFTING', 4, '30'),
(9, '3GB', '1300', '1300', '1300', '1300', '38', 'GIFTING', 4, '30'),
(10, '4.5GB', '1750', '1750', '1750', '1750', '39', 'GIFTING', 4, '30'),

-- AIRTEL COOPERATE GIFTING Plans
(11, '500MB', '137', '137', '137', '137', '46', 'COOPERATE GIFTING', 2, '30'),
(12, '1GB', '275', '275', '275', '275', '47', 'COOPERATE GIFTING', 2, '30'),
(13, '2GB', '550', '550', '550', '550', '48', 'COOPERATE GIFTING', 2, '30'),
(14, '5GB', '1375', '1375', '1375', '1375', '49', 'COOPERATE GIFTING', 2, '30'),

-- MTN COOPERATE GIFTING Plan
(15, '500MB', '130', '130', '130', '130', '50', 'COOPERATE GIFTING', 1, '30'),
-- MTN COOPERATE GIFTING Plans
(16, '1GB', '260', '260', '260', '260', '51', 'COOPERATE GIFTING', 1, '30'),
(17, '2GB', '520', '520', '520', '520', '52', 'COOPERATE GIFTING', 1, '30'),
(18, '3GB', '780', '780', '780', '780', '53', 'COOPERATE GIFTING', 1, '30'),
(19, '5GB', '1300', '1300', '1300', '1300', '54', 'COOPERATE GIFTING', 1, '30'),
(20, '10GB', '2600', '2600', '2600', '2600', '55', 'COOPERATE GIFTING', 1, '30'),

-- AIRTEL COOPERATE GIFTING Plan
(21, '10GB', '2750', '2750', '2750', '2750', '56', 'COOPERATE GIFTING', 2, '30'),

-- GLO COOPERATE GIFTING Plans
(22, '200MB', '50', '50', '50', '50', '57', 'COOPERATE GIFTING', 3, '30'),
(23, '500MB', '135', '135', '135', '135', '58', 'COOPERATE GIFTING', 3, '30'),
(24, '1GB', '270', '270', '270', '270', '59', 'COOPERATE GIFTING', 3, '30'),
(25, '2GB', '540', '540', '540', '540', '60', 'COOPERATE GIFTING', 3, '30'),
-- GLO COOPERATE GIFTING Plans
(26, '3GB', '810', '810', '810', '810', '61', 'COOPERATE GIFTING', 3, '30'),
(27, '5GB', '1350', '1350', '1350', '1350', '62', 'COOPERATE GIFTING', 3, '30'),
(28, '10GB', '2700', '2700', '2700', '2700', '63', 'COOPERATE GIFTING', 3, '30'),

-- AIRTEL COOPERATE GIFTING Plans
(29, '300MB', '85', '85', '85', '85', '70', 'COOPERATE GIFTING', 2, '30'),
(30, '100MB', '30', '30', '30', '30', '71', 'COOPERATE GIFTING', 2, '30'),

-- 9MOBILE COOPERATE GIFTING Plans
(31, '500MB', '90', '90', '90', '90', '72', 'COOPERATE GIFTING', 4, '30'),
(32, '1GB', '170', '170', '170', '170', '73', 'COOPERATE GIFTING', 4, '30'),
(33, '2GB', '340', '340', '340', '340', '74', 'COOPERATE GIFTING', 4, '30'),
(34, '3GB', '510', '510', '510', '510', '75', 'COOPERATE GIFTING', 4, '30'),
(35, '5GB', '850', '850', '850', '850', '76', 'COOPERATE GIFTING', 4, '30'),
(36, '10GB', '1700', '1700', '1700', '1700', '77', 'COOPERATE GIFTING', 4, '30'),

-- MTN GIFTING Plans
(37, '1GB', '225', '225', '225', '225', '78', 'GIFTING', 1, '1'),
(38, '3.5GB', '550', '550', '550', '550', '79', 'GIFTING', 1, '2'),
(39, '15GB', '2050', '2050', '2050', '2050', '80', 'GIFTING', 1, '7'),

-- AIRTEL GIFTING Plans
(40, '100MB', '70', '70', '70', '70', '82', 'GIFTING', 2, '1'),
(41, '300MB', '125', '125', '125', '125', '83', 'GIFTING', 2, '2'),
(42, '1GB', '230', '230', '230', '230', '84', 'GIFTING', 2, '2'),
(43, '2GB', '350', '350', '350', '350', '85', 'GIFTING', 2, '2'),
(44, '3GB', '550', '550', '550', '550', '86', 'GIFTING', 2, '7'),
(45, '4GB', '1030', '1030', '1030', '1030', '87', 'GIFTING', 2, '30'),
(46, '10GB', '2050', '2050', '2050', '2050', '88', 'GIFTING', 2, '30'),
(47, '15GB', '3050', '3050', '3050', '3050', '89', 'GIFTING', 2, '30'),

-- GLO GIFTING Plans
(48, '1GB', '220', '220', '220', '220', '90', 'GIFTING', 3, '1'),
(49, '2GB', '320', '320', '320', '320', '91', 'GIFTING', 3, '1'),
(50, '3.5GB', '500', '500', '500', '500', '92', 'GIFTING', 3, '2'),
-- GLO GIFTING Plan
(51, '15GB', '2000', '2000', '2000', '2000', '93', 'GIFTING', 3, '7'),
    ON CONFLICT(pId) DO NOTHING;

-- Create `networkid` table
CREATE TABLE IF NOT EXISTS networkid (
    nId INTEGER PRIMARY KEY,
    networkid VARCHAR(10) NOT NULL,
    smeId VARCHAR(10) NOT NULL,
    giftingId VARCHAR(10) NOT NULL,
    corporateId VARCHAR(10) NOT NULL,
    vtuId VARCHAR(10) NOT NULL,
    sharesellId VARCHAR(10) NOT NULL,
    network VARCHAR(255) NOT NULL,
    networkStatus VARCHAR(10) NOT NULL,
    vtuStatus VARCHAR(10) NOT NULL,
    sharesellStatus VARCHAR(10) NOT NULL,
    airtimepinStatus VARCHAR(10) NOT NULL,
    smeStatus VARCHAR(10) NOT NULL,
    giftingStatus VARCHAR(10) NOT NULL,
    corporateStatus VARCHAR(10) NOT NULL,
    datapinStatus VARCHAR(10) NOT NULL
);

-- Insert data into `networkid`
INSERT INTO networkid (nId, networkid, smeId, giftingId, corporateId, vtuId, sharesellId, network, networkStatus, vtuStatus, sharesellStatus, airtimepinStatus, smeStatus, giftingStatus, corporateStatus, datapinStatus)
VALUES
    (1, '1', '1', '1', '1', '1', '1', 'MTN', 'On', 'On', 'On', 'On', 'On', 'On', 'On', 'On'),
    (3, '3', '3', '3', '3', '3', '3', 'GLO', 'On', 'On', 'On', 'On', 'On', 'On', 'On', 'On'),
    (4, '4', '4', '4', '4', '4', '4', '9MOBILE', 'On', 'On', 'On', 'On', 'On', 'On', 'On', 'On'),
    (2, '2', '2', '2', '2', '2', '2', 'AIRTEL', 'On', 'On', 'On', 'On', 'On', 'On', 'On', 'On')
    ON CONFLICT(nId) DO NOTHING;
