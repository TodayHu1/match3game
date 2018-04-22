var entities =
[{
  "id": 1,
  "typeString": "class",
  "methods": [
    {
  "name": "setUp()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDown()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testExample()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testPerformanceExample()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "match3Tests",
  "superClass": 41
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var horizontalCount",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var verticalCount",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var numberOfMatch",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchSizeOnAction",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchZIndex",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var boardSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var halfBoardSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var centerMatchBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "matchPosition(i: Int, j: Int) -> CGPoint",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "getRandomMatchHorizontal() -> Int",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "getRandomMatchVertical() -> Int",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init(horizontalCount:Int, verticalCount:Int, gameScene: GameScene)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MatchParametrs"
},{
  "id": 3,
  "typeString": "enum",
  "cases": [
    {
  "name": "item case spell case legendary case potion"
}
  ],
  "name": "itemType"
},{
  "id": 4,
  "typeString": "enum",
  "cases": [
    {
  "name": "heal case mana case armor"
}
  ],
  "name": "potionType"
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var armor: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var health: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var attack: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mana: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellArmor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellHealth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellMana",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellGold",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var img: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var description: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var vampirism: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var evasion: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var critacal: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var blockDamage: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellName: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var type: itemType!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var percentOfheal: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var potion: potionType!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "generateItemDescription(armor: Int, health: Int, attack: Int, mana: Int) -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(armor: Int, health: Int, attack: Int, mana: Int, img: String, name: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init (vampirism: Int, evasion: Int, critacal: Int, blockDamage: Int, img: String, name: String, description: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init (img: String, name: String, description: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init (name: String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Item",
  "containedEntities": [
    3,
    4
  ]
},{
  "id": 6,
  "typeString": "enum",
  "cases": [
    {
  "name": "SpawnAttack_OnAttack"
}
  ],
  "name": "SpecialKey",
  "superClass": 42
},{
  "id": 7,
  "typeString": "class",
  "properties": [
    {
  "name": "var manaNow",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var manaMax",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var healthNow",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var healthMax",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armorNow",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armorMax",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var attack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gold",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellOnBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var needRevive",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellInBag",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var legendArr",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "encode(with aCoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addSpell(newSpell: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(manaNow: Int, manaMax: Int, healthNow: Int, healthMax: Int, armorNow: Int, armorMax: Int, gold: Int, attack: Int, spellArr: [String], spellInBag: [String], legendArr: [String])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(manaMax: Int, healthMax: Int, armorMax: Int, attack: Int, spellArr: [String])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    44
  ],
  "name": "PlayerStat",
  "superClass": 43,
  "containedEntities": [
    6
  ]
},{
  "id": 11,
  "typeString": "class",
  "properties": [
    {
  "name": "var unitPower: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unitStat: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unitSpell: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var numberUnitSpell: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unitNumberAttack: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unitNumberArmor: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unitNumberHealth: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var unit: EnemyUnit!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nameEnemy: String!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "echo()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getSprite() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "generateSkills() -> [String: Int]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "generate() -> EnemyUnit",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(playerLvl: Int, gameScene: GameScene)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "GeneratRandomUnit"
},{
  "id": 12,
  "typeString": "enum",
  "cases": [
    {
  "name": "Linear case EaseIn case EaseOut case EaseInOut"
}
  ],
  "name": "AnimationType"
},{
  "id": 13,
  "typeString": "enum",
  "cases": [
    {
  "name": "Int case Float case Custom"
}
  ],
  "name": "CountingType"
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "let kCounterRate: Float",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var start: Float",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var end: Float",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timer: Timer?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var progress: TimeInterval!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastUpdate: TimeInterval!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var duration: TimeInterval!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var countingType: CountingType!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var animationType: AnimationType!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var format: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var currentValue: Float",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let percent",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let update",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "countFrom(fromValue: Float, to toValue: Float, withDuration duration: TimeInterval, andAnimationType aType: AnimationType, andCountingType cType: CountingType)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "updateText(value: Float)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateValue()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "killTimer()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateCounter(t: Float) -> Float",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(fontNamed fontName: String!)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "SKCountingLabel",
  "superClass": 45,
  "containedEntities": [
    12,
    13
  ]
},{
  "id": 15,
  "typeString": "class",
  "properties": [
    {
  "name": "var enemy: [[String]]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bg: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var boardSize: [Int]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lvlName: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameViewController: GameViewController!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "removeAll()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "arrLevelRule()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentScene()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "checkBG(bgName: String) -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "checkEnemy(enemy: [String]) -> [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "checkBoardSize(size: [Int]) -> CGSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getRandomBG() -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didMove(to view: SKView)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MovingScreen",
  "superClass": 46
},{
  "id": 16,
  "typeString": "enum",
  "cases": [
    {
  "name": "basic case spell case strong"
}
  ],
  "name": "attackType"
},{
  "id": 17,
  "typeString": "class",
  "properties": [
    {
  "name": "var playerArrAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrStand",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasStand",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrWalking",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasWalking",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrStrongAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasStrongAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrSpellBuff",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasSpellBuff",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrSpellAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasSpellAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerArrDeath",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerAtlasDeath",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelHealth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelShield",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let iconHeart",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let iconShield",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var attack: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var health: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armor: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var move: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mana: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gold: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var positionAnchor: CGPoint",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var positionCenter: CGPoint",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var specialAbilities",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "initShadow()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "takeDamage(damage: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "playerDie()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fullAttackStandAnimation(damage: Int, attackType: attackType)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationAttack(attackType: attackType) -> SKAction?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationNil() -> SKAction",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationStand() -> SKAction?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationSpellBuffAndStand()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationWalking()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationDeath()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getMove(move: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "wait()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buffParticle(name: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initLegendItem()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(gameScene: GameScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Player",
  "superClass": 47,
  "containedEntities": [
    16
  ]
},{
  "id": 18,
  "typeString": "enum",
  "cases": [
    {
  "name": "null"
},
    {
  "name": "chain"
},
    {
  "name": "skull"
},
    {
  "name": "armor"
},
    {
  "name": "energy"
},
    {
  "name": "attack"
},
    {
  "name": "coin"
},
    {
  "name": "poison"
},
    {
  "name": "cog"
}
  ],
  "name": "Match",
  "superClass": 48
},{
  "id": 19,
  "typeString": "class",
  "properties": [
    {
  "name": "var gameViewController: GameViewController!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchBoard: MatchParametrs!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var randomUnit: GeneratRandomUnit!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gestureLabel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyIndexNow",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var manaLabel: SKCountingLabel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var manaPoolNode",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchTypeOnTable",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchNodeOnTable",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchTexture",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var statArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastTouch",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var player: Player!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyUnit: EnemyUnit!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var actionOnTurn",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyOnLevelArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var matchChance: [Int]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyCountLabel: SKLabelNode!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var goldLabel : SKLabelNode! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "removeAllObject()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "swipedLeft(sender:UISwipeGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "swipedUp(sender:UISwipeGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "swipedDown(sender:UISwipeGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "swipedRight(sender:UISwipeGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "afterAnimation()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buildScene(bgName: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didMove(to view: SKView)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fadeInStart()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentScene()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "gameOverScreen()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateEnemyCount()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updatePlayerGold()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "update(_ currentTime: TimeInterval)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(enemyArr: [String], playerSpell: [String], bg: String, size: CGSize)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "GameScene",
  "superClass": 46
},{
  "id": 20,
  "typeString": "class",
  "properties": [
    {
  "name": "var manaToUse",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var healthToUse",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armorToUse",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coinToUse",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var skillName",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var skillDescription",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "useSpell()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initStatSpell()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "conditionToUse() -> Bool",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "changePlayerStat()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "init(name: String, position: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(skillName: String, texture: SKTexture, mana: Int, health: Int, armor: Int, coin: Int, name: String, position: CGPoint, description: String, gameScene: GameScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(skillName: String, texture: SKTexture, mana: Int, health: Int, armor: Int, coin: Int, name: String, description: String, gameScene: GameScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Spell",
  "superClass": 47
},{
  "id": 21,
  "typeString": "class",
  "properties": [
    {
  "name": "var enemyArrAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyAtlasAttack",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyArrStand",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyAtlasStand",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var attack: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var health: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armor: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var specialAbilities",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelUnitName",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelRandomUnit",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelHealth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelShield",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let iconHeart",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let iconShield",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var positionAnchor: CGPoint",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var positionCenter: CGPoint",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var enemyName",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isRandomUnit",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isBoss",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var normalColor: UIColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "initEnemyAnimationTexture()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationStand() -> SKAction?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationAttack() -> SKAction?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fullAttackStandAnimation(damage: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initShadow()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "takeDamage(damage: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "animationNil() -> SKAction",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buffParticle(name: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(enemyName: String, attack: Int, health: Int, shield: Int, size: CGSize, gameScene: GameScene )",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "EnemyUnit",
  "superClass": 47
},{
  "id": 22,
  "typeString": "enum",
  "cases": [
    {
  "name": "spellAndItem"
},
    {
  "name": "itemChest case spellChest case legendaryChest case oneLegendChest"
}
  ],
  "name": "ChestType"
},{
  "id": 23,
  "typeString": "enum",
  "cases": [
    {
  "name": "unspecified case phone case pad"
}
  ],
  "name": "UIUserInterfaceIdiom",
  "superClass": 48
},{
  "id": 24,
  "typeString": "enum",
  "cases": [
    {
  "name": "player case enemy"
}
  ],
  "name": "alertType"
},{
  "id": 25,
  "typeString": "class",
  "properties": [
    {
  "name": "var lvlName: String! override",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prefersStatusBarHidden: Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var shouldAutorotate: Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var supportedInterfaceOrientations: UIInterfaceOrientationMask",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let enemyDifficultyArr",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "isHiddenStatusBar() -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentText(text: String, color: UIColor = UIColor.white, whoIs: alertType = .player)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentChooseWindow()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentImageTip(imgName: String, title: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imageTipAction(sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removeSubViewByTag(tag: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveGameProgress()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "loadGameProgress()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "gameOverScreen()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "victoryScreen()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "goToView(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "presentScene(scene: SKScene)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initLevel()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getEnemy(difficulty: Int) -> [[String]]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getBoss(difficulty: Int) -> [[String]]?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "GameViewController",
  "superClass": 49,
  "containedEntities": [
    23,
    24
  ]
},{
  "id": 26,
  "typeString": "class",
  "properties": [
    {
  "name": "var countOfSelectedItem",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedItem",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var allItem",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var itemOnBoard",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeCellColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var chestType: ChestType!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var getItemButtomObject: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let armorArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let ringArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let spellArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let trashArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let beltArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let amuletArr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let legendaryItemArr",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "getItemButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buildChest(chestType: ChestType)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SelectItemViewController",
  "superClass": 49
},{
  "id": 27,
  "typeString": "class",
  "properties": [
    {
  "name": "var AttackLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var HealthLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ArmorLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ManaLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var CoinLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var SoulGemLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToHealth: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToHealthLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToArmor: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToArmorLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToMana: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addToManaLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stoneImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var soulStoneShadow: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ItemChestGoldLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var LegendaryChestGoldLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ItemChestGemLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var LegandaryChestGemLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyHealthConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyArmorConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyManaConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyItemChestGoldConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyLegendChestGoldConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyItemChestGemConstant",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let buyLegendChestGemConstant",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initStatBoard()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buyHealth(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buyArmor(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buyMana(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "byChestBuyGold(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "byLegendaryChestByGold(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "byChestBuyGem(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "byLegendaryBuyGem(_ sender: UIButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "openChest(chestType: ChestType)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SoulStoneViewController",
  "superClass": 49
},{
  "id": 28,
  "typeString": "class",
  "properties": [
    {
  "name": "var Spell1: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Spell2: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Spell3: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Spell4: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableSpell: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var gameScene: GameScene!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var allPlayerSpell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeCellColor",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "backButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "selectRow(index: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "initBoard()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getRowTitle(cell: SpellTableViewCell) -> String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "findFreePlaceInBag() -> Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "findIndexPlace(arr: [String],text: String) -> Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removeAllWord(text: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ChangeSpellViewController",
  "superClass": 49
},{
  "id": 29,
  "typeString": "class",
  "properties": [
    {
  "name": "var bossLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var difficultyLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "StartQuestViewController",
  "superClass": 49
},{
  "id": 30,
  "typeString": "class",
  "properties": [
    {
  "name": "var buttonCollection: [UIButton]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelCollection: [UILabel]!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buttonOpenRule(page: Int)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ToLvl_Tutorial(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ToLvl_SteamPunk(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ToLvl_Dungeon(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ChoiceLevelViewController",
  "superClass": 49
},{
  "id": 31,
  "typeString": "class",
  "properties": [
    {
  "name": "var kek1: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ToLvl_Tutorial(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ToLvl_SteamPunk(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ChoiceLevelViewController",
  "superClass": 49
},{
  "id": 32,
  "typeString": "class",
  "properties": [
    {
  "name": "var cellImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cellTitle: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cellDescription: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ItemCellTableViewCell",
  "superClass": 50
},{
  "id": 33,
  "typeString": "class",
  "properties": [
    {
  "name": "var cellImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cellTitle: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cellDescription: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SpellTableViewCell",
  "superClass": 50
},{
  "id": 34,
  "typeString": "class",
  "properties": [
    {
  "name": "var gameVC: GameViewController!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerStatOnDie: PlayerStat! override",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prefersStatusBarHidden: Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showAD()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "topMostController() -> UIViewController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewWillAppear(_ animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "refreshEnemyButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "LooseAndWinViewController",
  "superClass": 49
},{
  "id": 35,
  "typeString": "class",
  "properties": [
    {
  "name": "var NumberOfGold: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UpgradeSwordButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UpgradeArmorButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UpgradeManaButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setGoldLabel(plusNumber: Int) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "test(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "SwordUpgrade(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ArmorUpgrade(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "ManaUpgrade(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TownHallViewController",
  "superClass": 49
},{
  "id": 36,
  "typeString": "class",
  "properties": [
    {
  "name": "var tableButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spellChanger: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var soulStone: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelForSpellChanger: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelForTable: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelForSoulStone: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stageButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var playerImage: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var healthNow: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var armorNow: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var attackNow: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var manaNow: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var goldNow: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "startLevelButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateStageText()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "leaderBoard(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "GameCenter(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MainMenuViewController",
  "superClass": 49
},{
  "id": 37,
  "typeString": "class",
  "properties": [
    {
  "name": "let shared",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "setColoredLabel(oldString: NSMutableAttributedString) -> NSAttributedString",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setBackgroundColorLabel(oldString: NSMutableAttributedString) -> NSAttributedString",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Utils"
},{
  "id": 38,
  "typeString": "class",
  "properties": [
    {
  "name": "var pageControl",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var orderedViewControllers: [UIViewController]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "createButton()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "buttonAction(sender: UIButton!)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "configurePageControl()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "newVc(viewController: String) -> UIViewController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    52,
    53
  ],
  "name": "PageViewController",
  "superClass": 51
},{
  "id": 39,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    55
  ],
  "name": "AppDelegate",
  "superClass": 54
},{
  "id": 40,
  "typeString": "class",
  "methods": [
    {
  "name": "setUp()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDown()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testExample()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "match3UITests",
  "superClass": 41
},{
  "id": 41,
  "typeString": "class",
  "name": "XCTestCase"
},{
  "id": 42,
  "typeString": "class",
  "name": "String"
},{
  "id": 43,
  "typeString": "class",
  "name": "NSObject"
},{
  "id": 44,
  "typeString": "protocol",
  "name": "NSCoding"
},{
  "id": 45,
  "typeString": "class",
  "name": "SKLabelNode"
},{
  "id": 46,
  "typeString": "class",
  "name": "SKScene"
},{
  "id": 47,
  "typeString": "class",
  "name": "SKSpriteNode"
},{
  "id": 48,
  "typeString": "class",
  "name": "Int"
},{
  "id": 49,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 50,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 51,
  "typeString": "class",
  "name": "UIPageViewController"
},{
  "id": 52,
  "typeString": "protocol",
  "name": "UIPageViewControllerDelegate"
},{
  "id": 53,
  "typeString": "protocol",
  "name": "UIPageViewControllerDataSource"
},{
  "id": 54,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 55,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 56,
  "typeString": "class",
  "name": "NSMutableAttributedString",
  "extensions": [
    8
  ]
},{
  "id": 57,
  "typeString": "class",
  "name": "Array",
  "extensions": [
    9,
    10
  ]
},{
  "id": 8,
  "typeString": "extension",
  "methods": [
    {
  "name": "setColorForText(_ textToFind: String, with color: UIColor)",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 9,
  "typeString": "extension",
  "methods": [
    {
  "name": "removeDuplicates() -> [Element]",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
},{
  "id": 10,
  "typeString": "extension",
  "methods": [
    {
  "name": "removeDuplicates2()",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
}]
;

var renderedEntities = [];

var useCentralNode = true;

var templates = {
  case: undefined,
  property: undefined,
  method: undefined,
  entity: undefined,
  data: undefined,

  setup: function() {
    this.case = document.getElementById("case").innerHTML;
    this.property = document.getElementById("property").innerHTML;
    this.method = document.getElementById("method").innerHTML;
    this.entity = document.getElementById("entity").innerHTML;
    this.data = document.getElementById("data").innerHTML;

    Mustache.parse(this.case)
    Mustache.parse(this.property);
    Mustache.parse(this.method);
    Mustache.parse(this.entity);
    Mustache.parse(this.data);
  }
}

var colorSuperClass = { color: "#848484", highlight: "#848484", hover: "#848484" }
var colorProtocol = { color: "#9a2a9e", highlight: "#9a2a9e", hover: "#9a2a9e" }
var colorExtension = { color: "#2a8e9e", highlight: "#2a8e9e", hover: "#2a8e9e" }
var colorContainedIn = { color: "#99AB22", highlight: "#99AB22", hover: "#99AB22" }
var centralNodeColor = "rgba(0,0,0,0)";
var centralEdgeLengthMultiplier = 1;
var network = undefined;

function bindValues() {
    templates.setup();

    for (var i = 0; i < entities.length; i++) {
        var entity = entities[i];
        var entityToBind = {
            "name": entity.name == undefined ? entity.typeString : entity.name,
            "type": entity.typeString,
            "props": renderTemplate(templates.property, entity.properties),
            "methods": renderTemplate(templates.method, entity.methods),
            "cases": renderTemplate(templates.case, entity.cases)
        };
        var rendered = Mustache.render(templates.entity, entityToBind);
        var txt = rendered;
        document.getElementById("entities").innerHTML += rendered;
    }

    setSize();
    setTimeout(startCreatingDiagram, 100);
}

function renderTemplate(template, list) {
    if (list != undefined && list.length > 0) {
        var result = "";
        for (var i = 0; i < list.length; i++) {
            var temp = Mustache.render(template, list[i]);
            result += temp;
        }
        return result;
    }
    return undefined;
}

function getElementSizes() {
  var strings = [];
  var elements = $("img");

  for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      
      var elementData = {
        width: element.offsetWidth,
        height: element.offsetHeight
      };
      strings.push(elementData);
  }
  return strings;
}

function renderEntity(index) {
  if (index >= entities.length) {
    // create the diagram
    $("#entities").html("");
    setTimeout(createDiagram, 100);
    return;
  }
  html2canvas($(".entity")[index], {
    onrendered: function(canvas) {
      var data = canvas.toDataURL();
      renderedEntities.push(data);
      var img = Mustache.render(templates.data, {data: data}); 
      $(document.body).append(img);

      renderEntity(index + 1);
    }
  });
}

function startCreatingDiagram() {
  renderedEntities = [];
  renderEntity(0);
}

function createDiagram() {
  var entitySizes = getElementSizes();

  var nodes = [];
  var edges = [];

  var edgesToCentral = [];
  var maxEdgeLength = 0;
  for (var i = 0; i < entities.length; i++) {
    var entity = entities[i];
    var data = entitySizes[i];
    var length = Math.max(data.width, data.height) * 1.5;
    var hasDependencies = false;

    maxEdgeLength = Math.max(maxEdgeLength, length);

    nodes.push({id: entity.id, label: undefined, image: renderedEntities[i], shape: "image", shapeProperties: {useImageSize: true } });
    if (entity.superClass != undefined && entity.superClass > 0) {
      edges.push({from: entity.superClass, to: entity.id, length: length, color: colorSuperClass, label: "inherits", arrows: {from: true} });
      
      hasDependencies = true;
    }

    var extEdges = getEdges(entity.id, entity.extensions, length, "extends", colorExtension, {from: true});
    var proEdges = getEdges(entity.id, entity.protocols, length, "conforms to", colorProtocol, {to: true});
    var conEdges = getEdges(entity.id, entity.containedEntities, length, "contained in", colorContainedIn, {from: true});

    hasDependencies = hasDependencies && extEdges.length > 0 && proEdges.length > 0 && conEdges.length > 0;

    edges = edges.concat(extEdges);
    edges = edges.concat(proEdges);
    edges = edges.concat(conEdges);

    if (!hasDependencies && useCentralNode)
    {
      edgesToCentral.push({from: entity.id, to: -1, length: length * centralEdgeLengthMultiplier, color: centralNodeColor, arrows: {from: true} });
    }
  }

  if (edgesToCentral.length > 1) {
    edges = edges.concat(edgesToCentral);
    nodes.push({id: -1, label: undefined, shape: "circle", color: centralNodeColor });
  }

  var container = document.getElementById("classDiagram");
  var dataToShow = {
      nodes: nodes,
      edges: edges
  };
  var options = {
      "edges": { "smooth": false },
      "physics": {
        "barnesHut": {
          "gravitationalConstant": -7000,
          "springLength": maxEdgeLength,
          "avoidOverlap": 1
        }
      },
      //configure: true
  };
  network = new vis.Network(container, dataToShow, options);

  $("#entities").html("");
  $("img").remove();

  setTimeout(disablePhysics, 200);
}

function disablePhysics()
{
  var options = {
      "edges": { "smooth": false },
      "physics": { "enabled": false }
  };
  network.setOptions(options);
  $(".loading-overlay").fadeOut("fast");
}

function getEdges(entityId, arrayToBind, edgeLength, label, color, arrows) {
  var result = [];
  if (arrayToBind != undefined && arrayToBind.length > 0) {
      for (var i = 0; i < arrayToBind.length; i++) {
        result.push({from: entityId, to: arrayToBind[i], length: edgeLength, color: color, label: label, arrows: arrows });
      }
  }
  return result;   
}

function setSize() {
  var width = $(window).width();
  var height = $(window).height();

  $("#classDiagram").width(width - 5);
  $("#classDiagram").height(height - 5);
}