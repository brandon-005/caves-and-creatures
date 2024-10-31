-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 08:46 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caves_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_quest`
--

CREATE TABLE `active_quest` (
  `activequest_id` int(10) NOT NULL COMMENT 'The unique ID of the active quest in the game.',
  `quest_id` int(10) NOT NULL COMMENT 'The foreign key linking to the quest entity.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_quest`
--

INSERT INTO `active_quest` (`activequest_id`, `quest_id`) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 1),
(6, 7),
(7, 6),
(8, 9),
(9, 8),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `alignment`
--

CREATE TABLE `alignment` (
  `alignment_id` int(10) NOT NULL COMMENT 'The unique ID of the alignment in the game.',
  `alignment_name` varchar(20) NOT NULL COMMENT 'The name given to the alignment.',
  `alignment_description` varchar(250) NOT NULL COMMENT 'A description of the alignment explaining what it is.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alignment`
--

INSERT INTO `alignment` (`alignment_id`, `alignment_name`, `alignment_description`) VALUES
(1, 'Lawful Good', 'Upholds order and morality, adhering to strict principles of justice and compassion.'),
(2, 'Chaotic Neutral', 'Embraces unpredictability and personal freedom, prioritising individual desires over societal norms or moral considerations.'),
(3, 'Neutral Good', 'Strives for altruism and benevolence without being bound by strict rules or chaotic impulses, seeking to do what is right in each situation.'),
(4, 'Lawful Neutral', 'Places emphasis on order and structure, adhering to a personal code or set of laws regardless of whether they are considered good or evil.'),
(5, 'Chaotic Evil', 'Revels in chaos and destruction, showing no regard for others\' well-being or societal norms, driven solely by selfish desires and malevolence.'),
(6, 'True Neutral', 'Maintains a balance between good and evil, law and chaos, often acting in self-interest or in accordance with natural forces rather than moral considerations.'),
(7, 'Lawful Evil', 'Values order and control, using laws and regulations to further their own selfish ambitions or malevolent agendas without remorse.'),
(8, 'Neutral Evil', 'Acts with malicious intent and self-interest, unconstrained by moral principles or societal norms, pursuing personal gain at any cost.'),
(9, 'Chaotic Good', 'Fights against tyranny and oppression, valuing personal freedom and justice even if it means breaking laws or challenging authority.');

-- --------------------------------------------------------

--
-- Table structure for table `character`
--

CREATE TABLE `character` (
  `character_id` int(10) NOT NULL COMMENT 'The unique ID of the character owned by the player.',
  `character_name` varchar(20) NOT NULL COMMENT 'The name given to the character in the game.',
  `character_level` int(3) NOT NULL COMMENT 'The level accumulated by the character in the game.',
  `alignment_id` int(10) NOT NULL COMMENT 'The foreign key of the alignment entity.',
  `species_id` int(10) NOT NULL COMMENT 'The foreign key of the species entity.',
  `class_id` int(10) NOT NULL COMMENT 'The foreign key of the class entity.',
  `player_id` int(10) NOT NULL COMMENT 'The foreign key of the player entity.',
  `activequest_id` int(10) NOT NULL COMMENT 'The foreign key of the active quest entity.',
  `chartype_id` int(10) NOT NULL COMMENT 'The foreign key of the type entity.',
  `inventory_id` int(10) NOT NULL COMMENT 'The foreign key of the inventory entity.',
  `region_id` int(10) NOT NULL COMMENT 'The foreign key of the region entity.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character`
--

INSERT INTO `character` (`character_id`, `character_name`, `character_level`, `alignment_id`, `species_id`, `class_id`, `player_id`, `activequest_id`, `chartype_id`, `inventory_id`, `region_id`) VALUES
(1, 'Thalgar the Brave', 7, 3, 2, 3, 1, 1, 1, 1, 3),
(13, 'Lyra Dawnblade', 5, 7, 5, 5, 2, 2, 6, 2, 5),
(14, 'Soren Nightshade', 6, 5, 3, 4, 3, 3, 5, 3, 1),
(15, 'Aria Lightbringer', 8, 4, 5, 7, 4, 4, 5, 4, 4),
(16, 'Elara Moonshadow', 3, 6, 7, 1, 5, 5, 7, 6, 2),
(17, 'Kael Sunfire', 9, 8, 4, 6, 6, 6, 8, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `character_type`
--

CREATE TABLE `character_type` (
  `chartype_id` int(10) NOT NULL COMMENT 'The unique ID of the character type.',
  `chartype_name` varchar(20) NOT NULL COMMENT 'The name of the character type.',
  `chartype_description` varchar(250) NOT NULL COMMENT 'The description of the character type.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character_type`
--

INSERT INTO `character_type` (`chartype_id`, `chartype_name`, `chartype_description`) VALUES
(1, 'Barbarian', 'Barbarians are fierce warriors who rely on brute strength and primal instincts to overcome their enemies. They are masters of close combat, wielding powerful weapons and raging with fury in battle.'),
(2, 'Wizard', 'Wizards are arcane spellcasters who wield immense magical power, drawing upon ancient tomes and mystical knowledge to cast spells of devastating effect. They are scholars of the arcane arts, mastering spells of elemental destruction, illusion.'),
(3, 'Rogue', 'Rogues are masters of stealth and subterfuge, skilled in the arts of thievery, espionage, and assassination. They are adept at slipping past enemies unnoticed, striking from the shadows with deadly precision, and disarming traps with finesse.'),
(4, 'Paladin', 'Paladins are holy warriors imbued with divine power, sworn to uphold justice and righteousness in the world. They are champions of light and virtue, wielding the power of their gods to smite evil and protect the innocent.'),
(5, 'Ranger', 'Rangers are skilled hunters and trackers who roam the wilderness, attuned to the rhythms of nature and the ways of the wild. They are adept archers and survivalists, able to navigate through any terrain and commune with beasts.'),
(6, 'Cleric', 'Clerics are devout servants of the gods, blessed with divine magic and charged with spreading their deity\'s teachings and values. They are healers and protectors, able to channel the power of their gods to heal wounds, and banish the undead.'),
(7, 'Fighter', 'Fighters are versatile warriors who excel in combat, mastering a wide array of weapons and fighting styles. They are seasoned veterans of battle, able to adapt to any situation and stand firm against any foe.'),
(8, 'Sorcerer', 'Sorcerers are innate spellcasters who wield magic through sheer force of will, tapping into their innate arcane talents to cast spells of incredible power. They are conduits of raw magical energy, able to shape reality with their thoughts and emotion'),
(9, 'Druid', 'Druids are guardians of the natural world, attuned to the cycles of life and death and the balance of nature. They are shapeshifters and elementalists, able to commune with the spirits of the land and wield the forces of earth, air, fire, and water.'),
(10, 'Monk', 'Monks are disciplined martial artists who harness the power of mind, body, and spirit to achieve supernatural feats of agility and strength. They are masters of unarmed combat and mystical techniques, able to strike with blinding speed.');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(10) NOT NULL COMMENT 'The unique ID of the class in the game.',
  `class_name` varchar(20) NOT NULL COMMENT 'The name of the class that is referenced.',
  `class_description` varchar(250) NOT NULL COMMENT 'A description of the class explaining what it is.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `class_description`) VALUES
(1, 'Spellblade', 'Masters of both martial combat and arcane magic, spellblades seamlessly blend swordplay with spellcasting, delivering devastating attacks with both blade and magic.'),
(2, 'Shadowdancer', 'Agile and elusive, shadowdancers harness the power of shadows to evade detection, strike from the darkness, and manipulate the minds of their foes with illusion magic.'),
(3, 'Beastmaster', 'Forming a deep bond with animals, beastmasters command the loyalty of fierce companions, fighting alongside their animal allies and utilizing their unique abilities in battle.'),
(4, 'Runemaster', 'Scholars of ancient runes and symbols, runemasters wield the power of arcane glyphs to shape reality, unleashing potent spells and enchantments inscribed in mystic symbols.'),
(5, 'Warden', 'Protectors of the natural world, wardens are attuned to the elements and spirits of nature, channeling their power to heal allies, manipulate the environment, and summon creatures of the wild.'),
(6, 'Tinkerer', 'Ingenious inventors and gadgeteers, tinkerers craft mechanical contraptions and devices to aid them in battle, from clockwork automatons to explosive traps.'),
(7, 'Soulweaver', 'Masters of soul magic, soulweavers manipulate the essence of life and death, weaving intricate spells to manipulate souls, control undead, and harness the power of the afterlife.'),
(8, 'Celestial Knight', 'Blessed warriors infused with celestial power, celestial knights serve as champions of light and righteousness, wielding holy magic to smite evil and protect the innocent.'),
(9, 'Arcane Trickster', 'Cunning and deceptive, arcane tricksters blend arcane magic with stealth and guile, using illusions, enchantments, and arcane sleight of hand to outwit their enemies.'),
(10, 'Drakewarden', 'Dragon-riders and guardians of ancient knowledge, drakewardens form bonds with majestic dragons, commanding their aerial might in battle and wielding the power of draconic magic.');

-- --------------------------------------------------------

--
-- Table structure for table `difficulty`
--

CREATE TABLE `difficulty` (
  `difficulty_id` int(10) NOT NULL COMMENT 'The unique ID of the difficulty of the quest.',
  `difficulty_name` varchar(20) NOT NULL COMMENT 'The name given to the difficulty, referenced in the game.',
  `difficulty_description` varchar(250) NOT NULL COMMENT 'A description of the difficulty explaining what it is.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `difficulty`
--

INSERT INTO `difficulty` (`difficulty_id`, `difficulty_name`, `difficulty_description`) VALUES
(1, 'Novice', 'Novice difficulty is suitable for beginner players or those looking for a more relaxed gaming experience. Encounters are simplified, and challenges are less daunting, allowing players to focus on learning the game mechanics and exploring the world.'),
(2, 'Standard', 'Standard difficulty offers a balanced experience, providing a moderate level of challenge for players familiar with the game mechanics. Encounters are challenging enough to keep players engaged, requiring strategic thinking and teamwork.'),
(3, 'Heroic', 'Heroic difficulty is designed for experienced players seeking a greater challenge. Encounters are more difficult, requiring careful planning and coordination to succeed. Enemies are tougher, and the stakes are higher, providing a rewarding experience'),
(4, 'Legendary', 'Legendary difficulty is for seasoned veterans looking for the ultimate challenge. Encounters are incredibly challenging, pushing players to their limits and demanding flawless execution of strategy and tactics. Enemies are formidable.'),
(5, 'Hardcore', 'Hardcore difficulty is not for the faint of heart. In this mode, death is permanent, and mistakes are unforgiving. Players must exercise extreme caution and precision to survive, as there are no second chances. Hardcore mode offers the ultimate test.');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(10) NOT NULL COMMENT 'The unique ID of the inventory.',
  `item_id` int(20) NOT NULL COMMENT 'The foreign key linking to the item entity.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `item_id`) VALUES
(7, 4),
(3, 6),
(4, 7),
(1, 8),
(6, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(10) NOT NULL COMMENT 'The unique ID of the item.',
  `item_name` varchar(20) NOT NULL COMMENT 'The name given to the item in the game.',
  `item_description` varchar(250) NOT NULL COMMENT 'A description explaining what the item is.',
  `item_typeid` int(10) NOT NULL COMMENT 'The type of item it is, e.g. weapon, potion. Links to foreign key',
  `rarity_id` int(10) NOT NULL COMMENT 'The foreign key linking to the rarity entity.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_description`, `item_typeid`, `rarity_id`) VALUES
(1, 'Shadowstep Boots', 'These sleek black boots allow the wearer to traverse through shadows with ease, granting increased movement speed and the ability to teleport short distances between shadows.', 1, 4),
(2, 'Elixir of Phoenix', 'This shimmering red elixir, when consumed, grants the drinker temporary immunity to fire damage and the ability to resurrect once upon death, bursting forth from the ashes with renewed vigour.', 2, 4),
(3, 'Stormcaller\'s Staff', 'Carved from ancient oak and adorned with crackling blue gems, this staff channels the power of thunderstorms, allowing the wielder to summon lightning bolts and control the weather.', 3, 5),
(4, 'Guardian Armour', 'This gleaming suit of armor is said to have been forged by celestial beings, granting the wearer resistance to radiant damage and the ability to call upon the power of the heavens to smite their enemies.', 4, 5),
(5, 'Totem of Fury', 'Carved from a single piece of enchanted obsidian, this totem pulsates with elemental energy, granting the bearer control over fire, ice, and lightning to unleash devastating attacks.', 5, 4),
(6, 'Hourglass', 'This ornate hourglass is filled with shimmering sands that flow backwards, allowing the wielder to manipulate time itself, slowing down or speeding up the passage of time within a limited area.', 1, 3),
(7, 'Vial of Shadows', 'This small vial contains a swirling mass of darkness, which, when released, shrouds the area in magical darkness, granting the user concealment and the ability to move unseen.', 2, 2),
(8, 'Blade of Frost', 'Crafted from enchanted ice, this shimmering blade never melts and is as cold as the heart of winter. It deals frost damage with each strike and has the ability to freeze enemies solid.', 3, 3),
(9, 'Helm of Earthshaker', 'This helm is adorned with intricate runes that grant the wearer the ability to cause tremors and earthquakes with a mere thought, shaking the ground and toppling foes.', 4, 4),
(10, 'Crystal Heart', 'This crystalline heart pulsates with magical energy, allowing the user to tap into the wild magic of the Feywild, granting them enhanced spellcasting abilities and protection against charm effects.', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `item_typeid` int(10) NOT NULL COMMENT 'The unique ID of the item type.',
  `item_typename` varchar(20) NOT NULL COMMENT 'The name of the item type.',
  `item_typedescription` varchar(250) NOT NULL COMMENT 'A description of the item type.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`item_typeid`, `item_typename`, `item_typedescription`) VALUES
(1, 'Arcane Relic', 'Arcane relics are ancient artifacts imbued with powerful magic, often with mysterious origins and potent abilities. They are sought after by wizards and scholars for their ability to unlock hidden knowledge and unleash formidable spells.'),
(2, 'Alchemical Elixir', 'Alchemical elixirs are potent concoctions brewed by skilled alchemists, capable of granting temporary enhancements or special abilities to those who consume them. They come in a variety of forms, from healing potions to potions of invisibility.'),
(3, 'Enchanted Weapon', 'Enchanted weapons are weapons imbued with magical properties, enhancing their effectiveness in combat and granting them unique abilities. They are often crafted by master artisans and sought after by adventurers for their ability to turn the tide.'),
(4, 'Relic Armour', 'Relic armour is ancient armour imbued with mystical energies, providing exceptional protection to those who wear it. These suits of armour are often passed down through generations or discovered in long-forgotten ruins.'),
(5, 'Elemental Totem', 'Elemental totems are mystical artifacts attuned to the primal forces of nature, channelling the power of the elements to aid their wielders. They come in various forms including carved stones representing earth');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(10) NOT NULL COMMENT 'The unique ID of the player who''s playing the game.',
  `player_forename` varchar(12) NOT NULL COMMENT 'The first name of the person using the account.',
  `player_surname` varchar(12) NOT NULL COMMENT 'The last name of the person using the account.',
  `player_email` varchar(25) NOT NULL COMMENT 'The email address used to log into the account.',
  `player_password` varchar(20) NOT NULL COMMENT 'Uniquely identified string used to access player account.',
  `player_dob` date NOT NULL COMMENT 'The date of birth of the player using the account.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_forename`, `player_surname`, `player_email`, `player_password`, `player_dob`) VALUES
(1, 'Brandon', 'Gilbertson', 'brandon3@gmail.com', 'brandon45!?', '2005-03-08'),
(2, 'James', 'Strickland', 'james2@gmail.com', 'jamesisthebest45', '2007-03-14'),
(3, 'Frederik', 'Solvang', 'f.solvang@outlook.com', 'solvang34322!?', '1996-05-09'),
(4, 'Tricia', 'Burns', 't.burns@gmail.com', 'tricia89!!', '1985-06-07'),
(5, 'Daisy', 'Riley', 'daisy.riley@hotmail.com', 'rdaisy32?', '1986-01-21'),
(6, 'Aman', 'Hart', 'hartAman@outlook.com', 'amanhart21!?', '1994-03-15'),
(7, 'Clive', 'Rees', 'c.rees@outlook.com', 'reesthec32!', '1984-06-08'),
(8, 'Brandon', 'Burns', 'brandon_burgers@gmail.com', 'backtheburgers21!', '2004-03-05'),
(9, 'Ben', 'Duffy', 'catsarecool@gmail.com', 'iLoVeCaTs42!', '1994-06-10'),
(10, 'Amanda', 'Higgins', 'hgamandas@gmail.com', 'higginsforthewin23', '1995-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `quest`
--

CREATE TABLE `quest` (
  `quest_id` int(10) NOT NULL COMMENT 'The unique ID of the quest in the game.',
  `quest_name` varchar(20) NOT NULL COMMENT 'The name given to the quest.',
  `quest_description` varchar(250) NOT NULL COMMENT 'A description of the quest explaining what it is.',
  `difficulty_id` int(10) NOT NULL COMMENT 'The foreign key linking to the difficulty entity.',
  `region_id` int(10) NOT NULL COMMENT 'The foreign key linking to the region entity.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quest`
--

INSERT INTO `quest` (`quest_id`, `quest_name`, `quest_description`, `difficulty_id`, `region_id`) VALUES
(1, 'The Lost Relic', 'Rumours speak of an ancient relic hidden deep within the Ebonwood Forest. Brave adventurers are needed to journey into the heart of the forest, overcome its dangers, and retrieve the artefact before it falls into the wrong hands.', 3, 1),
(2, 'Guardian of Crystal ', 'A powerful elemental guardian has been awakened within the Crystal Peaks, threatening to unleash chaos upon the land. Adventurers must brave the treacherous mountain terrain, defeat the guardian, and restore peace to the region.', 4, 2),
(3, 'Sands of Deception', 'Dark forces have been at work in the Whispering Sands, spreading lies and deceit among the local populace. Players must unravel the mystery, uncover the source of the deception, and put an end to the sinister plot.', 2, 3),
(4, 'Frostfire Forge', 'Deep within the Frostfire Valley lies an ancient forge, where legendary weapons of immense power were once crafted. Adventurers are tasked with braving the icy depths, retrieving lost artefacts, and unlocking the forge\'s secrets.', 5, 4),
(5, 'Starfall Prophecy', 'A celestial event is foretold to occur atop the Starfall Plateau, heralding great upheaval and change. Players must ascend the plateau, decipher the prophecy, and confront the forces seeking to manipulate its power for their own ends.', 3, 5),
(6, 'Shadows of Undercity', 'Strange shadows have been spotted lurking in the depths of the Undercity, preying upon unsuspecting travellers. Adventurers must descend into the underground labyrinth, uncover the source of the darkness, and vanquish the shadowy threat.', 4, 1),
(7, 'Tideborn Tempest', 'A massive storm is brewing beneath the waves, threatening to engulf the underwater city of the Tideborn. Players must dive into the depths, calm the raging tempest, and save the Tideborn from destruction.', 2, 2),
(8, 'Emberkin Uprising', 'The Emberkin, fiery denizens of the Ember Peaks, have risen up against their oppressors and are wreaking havoc across the land. Adventurers are called upon to quell the rebellion, restore order, and prevent further destruction.', 5, 3),
(9, 'Relics of Ancients', 'Ancient relics have been unearthed within the ruins of Frostfall Keep, but dark forces seek to claim them for their own nefarious purposes. Players must delve into the ruins, retrieve the relics, and thwart the plans of those who would misuse power.', 3, 4),
(10, 'Feywild Frenzy', 'The barrier between the material plane and the Feywild is weakening, causing creatures from the Feywild to spill into the mortal realm. Players must venture into the Feywild, restore balance to the realms, and prevent a full-scale invasion.', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rarity`
--

CREATE TABLE `rarity` (
  `rarity_id` int(10) NOT NULL COMMENT 'The unique ID of the rarity given to items.',
  `rarity_name` varchar(20) NOT NULL COMMENT 'The rarity name given to the items.',
  `rarity_description` varchar(250) NOT NULL COMMENT 'A description explaining what different rarities are.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rarity`
--

INSERT INTO `rarity` (`rarity_id`, `rarity_name`, `rarity_description`) VALUES
(1, 'Common', 'Items of common rarity are readily available and easily accessible, often found in everyday settings or wielded by novice adventurers. While they may lack extraordinary abilities, common items still serve useful purposes in a variety of situations.'),
(2, 'Rare', 'Rare items are uncommon finds, possessing potent abilities or unique qualities that set them apart from more mundane equipment. These items are highly sought after by adventurers and collectors alike for their exceptional craftsmanship and power.'),
(3, 'Legendary', 'Legendary items are the stuff of myths and legends, possessing unparalleled power and significance. These rare artifacts are steeped in history and often tied to epic quests or ancient prophecies, capable of altering the course of history.'),
(4, 'Exotic', 'Exotic items are rare and unusual finds, originating from distant lands or otherworldly realms. These mysterious artifacts possess strange and esoteric powers, often defying conventional explanation and captivating the imagination of people.'),
(5, 'Relic', 'Relics are ancient and venerable items of immense historical and cultural significance. These artifacts hold great power and meaning, imbued with the essence of long-forgotten civilisations or legendary figures from the past.');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(10) NOT NULL COMMENT 'The unique ID of the region.',
  `region_name` varchar(20) NOT NULL COMMENT 'The name given to the region in the game.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Ebonwood Forest'),
(2, 'Crystal Peaks'),
(3, 'Whispering Sands'),
(4, 'Frostfire Valley'),
(5, 'Starfall Plateau');

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
  `species_id` int(10) NOT NULL COMMENT 'The unique ID of the species in the game.',
  `species_name` varchar(20) NOT NULL COMMENT 'The name given to the species.',
  `species_description` varchar(250) NOT NULL COMMENT 'A description of the species explaining what it is.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`species_id`, `species_name`, `species_description`) VALUES
(1, 'Drakari', 'Drakari are a race of dragon-like beings, possessing scales of varying colors and abilities akin to their draconic ancestors. They are known for their affinity with magic and their fierce warrior traditions.'),
(2, 'Sylvaneth', 'Sylvaneth are forest-dwelling creatures closely attuned to nature, with bodies intertwined with plant life. They are guardians of the woods, wielding druidic magic and defending their natural habitats from harm.'),
(3, 'Gloomkin', 'Gloomkin are shadowy beings that lurk in the darkest corners of the world, possessing an affinity for darkness and shadow magic. They are skilled assassins and spies, often serving sinister masters in the shadows.'),
(4, 'Tideborn', 'Tideborn are aquatic creatures hailing from the depths of the ocean, with webbed appendages and shimmering scales. They are adept swimmers and skilled warriors, often forming close-knit communities beneath the waves.'),
(5, 'Emberkin', 'Emberkin are beings of living flame, with bodies composed of flickering fire and molten rock. They harness the power of fire magic and are resistant to extreme heat, making them fearsome adversaries on the battlefield.'),
(6, 'Stormborn', 'Stormborn are beings attuned to the power of the skies, with bodies crackling with electrical energy and wings capable of soaring through storm clouds. They wield the power of lightning and thunder.'),
(7, 'Ironclad', 'Ironclad are constructs forged from enchanted metal and imbued with artificial intelligence. They are skilled craftsmen and warriors, serving as guardians of ancient ruins or enforcers of powerful wizards.'),
(8, 'Verdantkin', 'Verdantkin are beings infused with the essence of plant life, with bodies covered in lush foliage and vibrant flowers. They are skilled herbalists and druids, using their connection to nature to heal and protect their allies.'),
(9, 'Celestials', 'Celestials are beings of divine origin, with radiant forms and powers bestowed upon them by the gods. They serve as champions of righteousness and defenders of the innocent, combating evil wherever it may arise.'),
(10, 'Voidborn', 'Voidborn are creatures from the depths of the void, with bodies shrouded in darkness and eyes that gleam with malevolent energy. They wield the power of shadow magic and are often associated with dark cults and forbidden rituals.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_quest`
--
ALTER TABLE `active_quest`
  ADD PRIMARY KEY (`activequest_id`),
  ADD KEY `activequest_id` (`activequest_id`,`quest_id`);

--
-- Indexes for table `alignment`
--
ALTER TABLE `alignment`
  ADD PRIMARY KEY (`alignment_id`),
  ADD KEY `alignment_id` (`alignment_id`);

--
-- Indexes for table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`character_id`),
  ADD KEY `character_id` (`character_id`,`alignment_id`,`species_id`,`class_id`,`player_id`,`activequest_id`,`chartype_id`,`inventory_id`,`region_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `alignment_id` (`alignment_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `chartype_id` (`chartype_id`),
  ADD KEY `species_id` (`species_id`),
  ADD KEY `activequest_id` (`activequest_id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `character_type`
--
ALTER TABLE `character_type`
  ADD PRIMARY KEY (`chartype_id`),
  ADD KEY `chartype_id` (`chartype_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `difficulty`
--
ALTER TABLE `difficulty`
  ADD PRIMARY KEY (`difficulty_id`),
  ADD KEY `difficulty_id` (`difficulty_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `inventory_id` (`inventory_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`,`rarity_id`),
  ADD KEY `rarity_id` (`rarity_id`),
  ADD KEY `item_typeid` (`item_typeid`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`item_typeid`),
  ADD KEY `item_typeid` (`item_typeid`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `player_email` (`player_email`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`quest_id`),
  ADD KEY `quest_id` (`quest_id`,`difficulty_id`,`region_id`),
  ADD KEY `difficulty_id` (`difficulty_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `rarity`
--
ALTER TABLE `rarity`
  ADD PRIMARY KEY (`rarity_id`),
  ADD KEY `rarity_id` (`rarity_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`species_id`),
  ADD KEY `species_id` (`species_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_quest`
--
ALTER TABLE `active_quest`
  MODIFY `activequest_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the active quest in the game.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `alignment`
--
ALTER TABLE `alignment`
  MODIFY `alignment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the alignment in the game.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `character`
--
ALTER TABLE `character`
  MODIFY `character_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the character owned by the player.', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `character_type`
--
ALTER TABLE `character_type`
  MODIFY `chartype_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the character type.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the class in the game.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `difficulty`
--
ALTER TABLE `difficulty`
  MODIFY `difficulty_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the difficulty of the quest.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the inventory.', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the item.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `item_typeid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the item type.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the player who''s playing the game.', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quest`
--
ALTER TABLE `quest`
  MODIFY `quest_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the quest in the game.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rarity`
--
ALTER TABLE `rarity`
  MODIFY `rarity_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the rarity given to items.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the region.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `species_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID of the species in the game.', AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `character`
--
ALTER TABLE `character`
  ADD CONSTRAINT `character_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_2` FOREIGN KEY (`alignment_id`) REFERENCES `alignment` (`alignment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_3` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_4` FOREIGN KEY (`chartype_id`) REFERENCES `character_type` (`chartype_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_5` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_6` FOREIGN KEY (`activequest_id`) REFERENCES `active_quest` (`activequest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_7` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `character_ibfk_8` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarity` (`rarity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`item_typeid`) REFERENCES `item_type` (`item_typeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quest`
--
ALTER TABLE `quest`
  ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`difficulty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quest_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
