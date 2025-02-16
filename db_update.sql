DELETE FROM dataplans;

-- Insert data into `dataplans`
INSERT INTO dataplans (pId, name, price, userprice, agentprice, vendorprice, planid, atype, datanetwork, day)
VALUES
-- MTN SME Plans
(1, '500MB', '130', '140', '130', '130', '1', 'SME', 1, '30'),
(2, '1GB', '260', '268', '260', '260', '2', 'SME', 1, '30'),
(3, '2GB', '520', '536', '520', '520', '3', 'SME', 1, '30'),
(4, '3GB', '780', '804', '780', '780', '4', 'SME', 1, '30'),
(5, '5GB', '1300', '1340', '1300', '1300', '5', 'SME', 1, '30'),
(6, '10GB', '2600', '2680', '2600', '2600', '6', 'SME', 1, '30'),

-- MTN COOPERATE GIFTING Plan
(15, '500MB', '130', '154', '130', '130', '50', 'COOPERATE GIFTING', 1, '30'),
(16, '1GB', '260', '294', '260', '260', '51', 'COOPERATE GIFTING', 1, '30'),
(17, '2GB', '520', '588', '520', '520', '52', 'COOPERATE GIFTING', 1, '30'),
(18, '3GB', '780', '882', '780', '780', '53', 'COOPERATE GIFTING', 1, '30'),
(19, '5GB', '1300', '1470', '1300', '1300', '54', 'COOPERATE GIFTING', 1, '30'),
(20, '10GB', '2600', '2940', '2600', '2600', '55', 'COOPERATE GIFTING', 1, '30'),

-- MTN GIFTING Plans
(37, '1GB', '225', '234', '225', '225', '78', 'GIFTING', 1, '1'),
(38, '3.5GB', '550', '560', '550', '550', '79', 'GIFTING', 1, '2'),
(39, '15GB', '2050', '2080', '2050', '2050', '80', 'GIFTING', 1, '7'),

-- AIRTEL COOPERATE GIFTING Plans
(11, '500MB', '137', '288', '137', '137', '46', 'COOPERATE GIFTING', 2, '30'),
(12, '1GB', '275', '576', '275', '275', '47', 'COOPERATE GIFTING', 2, '30'),
(13, '2GB', '550', '1152', '550', '550', '48', 'COOPERATE GIFTING', 2, '30'),
(14, '5GB', '1375', '2888', '1375', '1375', '49', 'COOPERATE GIFTING', 2, '30'),
(21, '10GB', '2750', '5760', '2750', '2750', '56', 'COOPERATE GIFTING', 2, '30'),
(29, '300MB', '85', '150', '85', '85', '70', 'COOPERATE GIFTING', 2, '30'),
(30, '100MB', '30', '56', '30', '30', '71', 'COOPERATE GIFTING', 2, '30'),

-- AIRTEL GIFTING Plans
(40, '100MB', '70', '80', '70', '70', '82', 'GIFTING', 2, '1'),
(41, '300MB', '160', '190', '125', '125', '83', 'GIFTING', 2, '2'),
(42, '1GB', '300', '350', '230', '230', '84', 'GIFTING', 2, '2'),
(43, '2GB', '400', '500', '350', '350', '85', 'GIFTING', 2, '2'),
(44, '3GB', '650', '750', '550', '550', '86', 'GIFTING', 2, '7'),
(45, '4GB', '1150', '1300', '1030', '1030', '87', 'GIFTING', 2, '30'),
(46, '10GB', '2150', '2400', '2050', '2050', '88', 'GIFTING', 2, '30'),
(47, '15GB', '3200', '3700', '3050', '3050', '89', 'GIFTING', 2, '30'),

-- AIRTEL SME
(52, '500MB', '200', '250', '200', '200', '94', 'SME', 2, '14'),
(53, '1GB', '300', '350', '200', '200', '94', 'SME', 2, '7'),
(54, '1.5GB', '400', '450', '200', '200', '94', 'SME', 2, '7'),
(55, '2GB', '600', '700', '200', '200', '94', 'SME', 2, '14'),
(56, '5GB', '1300', '1600', '200', '200', '94', 'SME', 2, '14'),
(57, '20GB', '4100', '5500', '200', '200', '94', 'SME', 2, '30'),

-- GLO COOPERATE GIFTING Plans
(22, '200MB', '50', '60', '50', '50', '57', 'COOPERATE GIFTING', 3, '30'),
(23, '500MB', '135', '138', '135', '135', '58', 'COOPERATE GIFTING', 3, '30'),
(24, '1GB', '270', '274', '270', '270', '59', 'COOPERATE GIFTING', 3, '30'),
(25, '2GB', '540', '548', '540', '540', '60', 'COOPERATE GIFTING', 3, '30'),
(26, '3GB', '810', '822', '810', '810', '61', 'COOPERATE GIFTING', 3, '30'),
(27, '5GB', '1350', '1370', '1350', '1350', '62', 'COOPERATE GIFTING', 3, '30'),
(28, '10GB', '2700', '2740', '2700', '2700', '63', 'COOPERATE GIFTING', 3, '30'),

-- GLO GIFTING Plans
(48, '1GB', '220', '230', '220', '220', '90', 'GIFTING', 3, '1'),
(49, '2GB', '320', '330', '320', '320', '91', 'GIFTING', 3, '1'),
(50, '3.5GB', '500', '540', '500', '500', '92', 'GIFTING', 3, '2'),
(51, '15GB', '2000', '2100', '2000', '2000', '93', 'GIFTING', 3, '7'),

-- 9MOBILE GIFTING Plans
(7, '1.5GB', '880', '900', '880', '880', '36', 'GIFTING', 4, '30'),
(8, '2GB', '1000', '1100', '1000', '1000', '37', 'GIFTING', 4, '30'),
(9, '3GB', '1300', '1360', '1300', '1300', '38', 'GIFTING', 4, '30'),
(10, '4.5GB', '1750', '1850', '1750', '1750', '39', 'GIFTING', 4, '30'),

-- 9MOBILE COOPERATE GIFTING Plans
(31, '500MB', '90', '100', '90', '90', '72', 'COOPERATE GIFTING', 4, '30'),
(32, '1GB', '170', '195', '170', '170', '73', 'COOPERATE GIFTING', 4, '30'),
(33, '2GB', '340', '390', '340', '340', '74', 'COOPERATE GIFTING', 4, '30'),
(34, '3GB', '510', '585', '510', '510', '75', 'COOPERATE GIFTING', 4, '30'),
(35, '5GB', '850', '970', '850', '850', '76', 'COOPERATE GIFTING', 4, '30'),
(36, '10GB', '1700', '1850', '1700', '1700', '77', 'COOPERATE GIFTING', 4, '30');
