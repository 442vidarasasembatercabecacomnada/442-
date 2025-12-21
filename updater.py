local translator = {}

local words = {
    ["en-us"] = {
        -- main
        runningin = "running in "
        hello = "Hello, ",
        apdesc = "Deflect the ball automatically",
        licensevalid = "License valid until: ",
        pingcomptitle = 'Ping compensator',
        pingcompdesc = 'Adjust according to your ms',
        autocomptitle = "Auto compensator",
        autocompdesc = 'Adjust the ping comp automatically',
        showhitbox = "Show hitbox",
        showhitboxdesc = "Shows a hitbox for the parry",
        bpsgazotitle = "Ignore the balls coming from the gazo (3 and 4)",
        premiumfeature = "Exclusive premium feature",
        autoability = "Auto ability",
        autoabilitydesc = "Use your skills when you miss the parry",
        aimovdesc = "Follows the ball automatically",
        autocurve = "Auto curve",
        autocurvedesc = "Curve the ball in the selected direction",
        unsupported = "Unsupported executor",
        autoready = 'Auto ready',
        autoreadydesc = "Go to ReadyZone automatically",
        fov = "Field of View",
        maxzoom = "Max Zoom",
        maxzoomdesc = "Zoom in on your camera",

        -- raids
        autofarm = "Auto farm",
        autofarmdesc = "Automatically teleport to the top of the boss",
        height = "Height",
        heightdesc = "Adjust the farm height",
        autojoin = "Auto join",
        autojoindesc = "Automatically join raids",
        reviveall = "Revive all",
        revivealldesc = "Revive all your allies",
        godmode = "God mode",
        godmodedesc = "Don't be hit by obstacles",

        -- visuals
        unlockswords = "Unlock all swords",
        unlockswordsdesc = "Unlock your entire sword inventory",
        unlockskins = "Unlock all skins",
        unlockskinsdesc = "Add all skins to your inventory",
        enchants = "Enchants",
        enchantsdesc = "Equip any enchant to your sword",
        maxitens = "Max all items",
        maxitensdesc = "Get maximum quantity of ALL items",
        unlockdiscovered = "Unlock all discoveries",
        unlockdiscovereddesc = "Unlock all sword discoveries in index",
        explosions = "Explosions",
        explosionsdesc = "Equip any explosion on your sword",
        aurasdesc = "Equip any aura",
        posedesc = "Equip any pose",
        unlockemotes = "Unlock all emotes",
        unlockemotesdesc = "Unlock all emotes (everyone can see)",
        unlocksprays = "Unlock sprays",
        unlockspraysdesc = "Unlock all sprays",
        cosmetics = "Cosmetics",
        cosmeticsdesc = "Equip headless and korblox",
        userskin = "User skin",
        userskindesc = "Copy another user's skin",

        -- rage
        warning = "Warning",
        warningdesc = "You can be easily reported using these functions.",
        deflectcooldown = "No Deflect Cooldown",
        deflectcooldowndesc = "Reduce the deflect cooldown at the same time as the parry",
        glitchball = "Glitch ball",
        glitchballdesc = "Use denjin's second skill", 
        freezeball = "Freeze ball",
        freezeballdesc = "Keep distance from the ball",
        speedplayer = "Speed player",
        speedplayerdesc = "Increase your speed",
        fly = "Fly",
        flyspeed = "Fly speed",
        noclip = "Go through the walls",
        nodashstamina = "No dash stamina",
        nodashstaminadesc = "No stamina in the dash maybe?",
        nodashcooldown = "No dash cooldown",
        nodashcooldowndesc = "I dont even need to say anything, right?",
        infinitejump = "Infinite jump",
        infinitejumpdesc = "Just infinite jump",

        -- misc
        selectbanner = "Select banner",
        selectbannerdesc = "Choose which banner to summon",
        autobuy = "Auto buy",
        autobuydesc = "Select the automatic purchase mode",
        buy1x = "Purchase 1 card from the selected banner",
        buy10x = "Purchase 10 cards from the selected banner",
        buy = "Buy"
    },
    
    ["pt-br"] = {
        -- main
        runningin = "rodando em "
        hello = "E aí, ",
        apdesc = "Desvia a bola automaticamente",
        licensevalid = "Licença válida até: ",
        pingcomptitle = 'Compensador de ping',
        pingcompdesc = 'Ajusta de acordo com seu ms',
        autocomptitle = "Compensador automático",
        autocompdesc = 'Ajusta a compensação de ping automagicamente',
        showhitbox = "Mostrar hitbox",
        showhitboxdesc = "Mostra a hitbox do parry",
        bpsgazotitle = "Ignora as bolas do gazo (3 e 4)",
        premiumfeature = "Recurso premium exclusivo",
        autoability = "Habilidade automática",
        autoabilitydesc = "Usa suas skills quando erra o parry",
        aimovdesc = "Segue a bola automaticamente",
        autocurve = "Curva automática",
        autocurvedesc = "Dá uma curva na bola na direção selecionada",
        unsupported = "Executor não suportado",
        autoready = 'Auto ready',
        autoreadydesc = "Vai pro ReadyZone automaticamente",
        fov = "Campo de Visão",
        maxzoom = "Zoom máximo",
        maxzoomdesc = "Dá zoom na sua câmera",

        -- raids
        autofarm = "Farm automático",
        autofarmdesc = "Teleporta pro topo do boss automaticamente",
        height = "Altura",
        heightdesc = "Ajusta a altura do farm",
        autojoin = "Entrada automática",
        autojoindesc = "Entra nas raids automaticamente",
        reviveall = "Reviver geral",
        revivealldesc = "Revive todos seus aliados",
        godmode = "Modo Deus",
        godmodedesc = "Não leva hit dos obstáculos",

        -- visuals
        unlockswords = "Desbloquear todas espadas",
        unlockswordsdesc = "Desbloqueia todo seu inventário de espadas",
        unlockskins = "Desbloquear todas skins",
        unlockskinsdesc = "Adiciona todas skins no seu inventário",
        enchants = "Encantamentos",
        enchantsdesc = "Bota qualquer encanto na sua espada",
        maxitens = "Maxar todos itens",
        maxitensdesc = "Pega quantidade máxima de TODOS os itens",
        unlockdiscovered = "Desbloquear descobertas",
        unlockdiscovereddesc = "Desbloqueia todas descobertas de espada no index",
        explosions = "Explosões",
        explosionsdesc = "Bota qualquer explosão na sua espada",
        aurasdesc = "Bota qualquer aura",
        posedesc = "Bota qualquer pose",
        unlockemotes = "Desbloquear todos emotes",
        unlockemotesdesc = "Desbloqueia todos emotes (todo mundo vê)",
        unlocksprays = "Desbloquear sprays",
        unlockspraysdesc = "Desbloqueia todos sprays",
        cosmetics = "Cosméticos",
        cosmeticsdesc = "Equipa headless e korblox",
        userskin = "Skin de usuário",
        userskindesc = "Copia a skin de outro player",

        -- rage
        warning = "Aviso",
        warningdesc = "Cuidado, pode tomar report fácil usando essas funções.",
        deflectcooldown = "Sem cooldown no deflect",
        deflectcooldowndesc = "Reduz o cooldown do deflect junto com o parry",
        glitchball = "Bola bugada",
        glitchballdesc = "Usa a segunda skill do denjin", 
        freezeball = "Congelar bola",
        freezeballdesc = "Mantém distância da bola",
        speedplayer = "Velocidade do player",
        speedplayerdesc = "Aumenta sua velocidade",
        fly = "Voar",
        flyspeed = "Velocidade do voo",
        noclip = "Passar pelas paredes",
        nodashstamina = "Sem stamina no dash",
        nodashstaminadesc = "Sem stamina no dash talvez?",
        nodashcooldown = "Sem cooldown no dash",
        nodashcooldowndesc = "Nem preciso falar nada, né?",
        infinitejump = "Pulo infinito",
        infinitejumpdesc = "Só pula infinito mesmo",

        -- misc
        selectbanner = "Selecionar banner",
        selectbannerdesc = "Escolhe qual banner puxar",
        autobuy = "Compra automática",
        autobuydesc = "Seleciona o modo de compra automática",
        buy1x = "Puxar 1 carta do banner selecionado",
        buy10x = "Puxar 10 cartas do banner selecionado",
        buy = "Comprar"
    },
    
    ["ru-ru"] = {
        -- main
        runningin = "Запущен в "
        hello = "Привет, ",
        apdesc = "Автоматически отражай мяч",
        licensevalid = "Лицензия действует до: ",
        pingcomptitle = 'Компенсатор пинга',
        pingcompdesc = 'Настрой под свой пинг',
        autocomptitle = "Авто-компенсатор",
        autocompdesc = 'Автоматически настраивает компенсацию пинга',
        showhitbox = "Показать хитбокс",
        showhitboxdesc = "Показывает хитбокс для парирования",
        bpsgazotitle = "Игнорировать мячи от gazo (3 и 4)",
        premiumfeature = "Эксклюзивная премиум-функция",
        autoability = "Авто-способность",
        autoabilitydesc = "Использует твои скиллы при промахе парирования",
        aimovdesc = "Автоматически следует за мячом",
        autocurve = "Авто-кривая",
        autocurvedesc = "Закручивает мяч в выбранном направлении",
        unsupported = "Неподдерживаемый экзекьютор",
        autoready = 'Авто-готовность',
        autoreadydesc = "Автоматически идёт в ReadyZone",
        fov = "Поле зрения",
        maxzoom = "Максимальный зум",
        maxzoomdesc = "Приближает твою камеру",

        -- raids
        autofarm = "Авто-фарм",
        autofarmdesc = "Телепортируется наверх к боссу автоматически",
        height = "Высота",
        heightdesc = "Настраивает высоту фарма",
        autojoin = "Авто-вход",
        autojoindesc = "Автоматически вступает в рейды",
        reviveall = "Оживить всех",
        revivealldesc = "Оживляет всех твоих союзников",
        godmode = "Режим бога",
        godmodedesc = "Не получаешь урон от препятствий",

        -- visuals
        unlockswords = "Разблокировать все мечи",
        unlockswordsdesc = "Разблокирует весь инвентарь мечей",
        unlockskins = "Разблокировать все скины",
        unlockskinsdesc = "Добавляет все скины в инвентарь",
        enchants = "Зачарования",
        enchantsdesc = "Надели меч любым зачарованием",
        maxitens = "Максимум всех предметов",
        maxitensdesc = "Получаешь максимальное количество ВСЕХ предметов",
        unlockdiscovered = "Разблокировать все открытия",
        unlockdiscovereddesc = "Разблокирует все открытия мечей в индексе",
        explosions = "Взрывы",
        explosionsdesc = "Надели меч любым взрывом",
        aurasdesc = "Надели любую ауру",
        posedesc = "Надели любую позу",
        unlockemotes = "Разблокировать все эмоции",
        unlockemotesdesc = "Разблокирует все эмоции (все видят)",
        unlocksprays = "Разблокировать спреи",
        unlockspraysdesc = "Разблокирует все спреи",
        cosmetics = "Косметика",
        cosmeticsdesc = "Экипируй headless и korblox",
        userskin = "Скин пользователя",
        userskindesc = "Копирует скин другого игрока",

        -- rage
        warning = "Предупреждение",
        warningdesc = "Тебя легко зарепортят, используя эти функции.",
        deflectcooldown = "Без кулдауна на отражение",
        deflectcooldowndesc = "Уменьшает кулдаун отражения вместе с парированием",
        glitchball = "Глючный мяч",
        glitchballdesc = "Использует второй скилл denjin", 
        freezeball = "Заморозить мяч",
        freezeballdesc = "Держит дистанцию от мяча",
        speedplayer = "Скорость игрока",
        speedplayerdesc = "Увеличивает твою скорость",
        fly = "Полёт",
        flyspeed = "Скорость полёта",
        noclip = "Проходить сквозь стены",
        nodashstamina = "Без стамины на рывок",
        nodashstaminadesc = "Без стамины на рывок, наверное?",
        nodashcooldown = "Без кулдауна на рывок",
        nodashcooldowndesc = "Мне даже не нужно ничего говорить, да?",
        infinitejump = "Бесконечный прыжок",
        infinitejumpdesc = "Просто бесконечно прыгай",

        -- misc
        selectbanner = "Выбрать баннер",
        selectbannerdesc = "Выбери какой баннер тянуть",
        autobuy = "Авто-покупка",
        autobuydesc = "Выбирает режим автоматической покупки",
        buy1x = "Вытянуть 1 карту из выбранного баннера",
        buy10x = "Вытянуть 10 карт из выбранного баннера",
        buy = "Купить"
    },
    
    ["ja-jp"] = {
        -- main
        runningin = "実行中 "
        hello = "こんにちは、",
        apdesc = "ボールを自動で跳ね返す",
        licensevalid = "ライセンス有効期限：",
        pingcomptitle = 'ピング補正',
        pingcompdesc = '自分のmsに合わせて調整',
        autocomptitle = "自動補正",
        autocompdesc = 'ピング補正を自動で調整',
        showhitbox = "ヒットボックス表示",
        showhitboxdesc = "パリィのヒットボックスを表示",
        bpsgazotitle = "gazoからのボールを無視（3と4）",
        premiumfeature = "プレミアム限定機能",
        autoability = "自動アビリティ",
        autoabilitydesc = "パリィを失敗した時にスキルを使う",
        aimovdesc = "ボールを自動追尾",
        autocurve = "自動カーブ",
        autocurvedesc = "選択した方向にボールをカーブさせる",
        unsupported = "サポート外のエグゼキューター",
        autoready = '自動レディ',
        autoreadydesc = "自動でReadyZoneに行く",
        fov = "視野角",
        maxzoom = "最大ズーム",
        maxzoomdesc = "カメラをズームイン",

        -- raids
        autofarm = "自動ファーム",
        autofarmdesc = "ボスの上に自動テレポート",
        height = "高さ",
        heightdesc = "ファームの高さを調整",
        autojoin = "自動参加",
        autojoindesc = "レイドに自動参加",
        reviveall = "全員復活",
        revivealldesc = "味方を全員復活させる",
        godmode = "ゴッドモード",
        godmodedesc = "障害物のダメージを受けない",

        -- visuals
        unlockswords = "全剣解放",
        unlockswordsdesc = "剣インベントリを全て解放",
        unlockskins = "全スキン解放",
        unlockskinsdesc = "全てのスキンをインベントリに追加",
        enchants = "エンチャント",
        enchantsdesc = "好きなエンチャントを剣に装備",
        maxitens = "全アイテム最大",
        maxitensdesc = "全アイテムを最大所持数に",
        unlockdiscovered = "全発見解放",
        unlockdiscovereddesc = "インデックスの剣発見を全て解放",
        explosions = "爆発エフェクト",
        explosionsdesc = "好きな爆発を剣に装備",
        aurasdesc = "好きなオーラを装備",
        posedesc = "好きなポーズを装備",
        unlockemotes = "全エモート解放",
        unlockemotesdesc = "全エモート解放（誰でも見える）",
        unlocksprays = "スプレー解放",
        unlockspraysdesc = "全スプレーを解放",
        cosmetics = "コスメティック",
        cosmeticsdesc = "ヘッドレスとコーブロックスを装備",
        userskin = "ユーザースキン",
        userskindesc = "他のプレイヤーのスキンをコピー",

        -- rage
        warning = "警告",
        warningdesc = "この機能を使うと簡単に通報される可能性あり",
        deflectcooldown = "ディフレクトクールダウン無し",
        deflectcooldowndesc = "パリィと同時にディフレクトクールダウンを減らす",
        glitchball = "グリッチボール",
        glitchballdesc = "denjinの二つ目のスキルを使用", 
        freezeball = "ボール凍結",
        freezeballdesc = "ボールから距離を保つ",
        speedplayer = "プレイヤー速度",
        speedplayerdesc = "自分の速度を上げる",
        fly = "飛行",
        flyspeed = "飛行速度",
        noclip = "壁を通り抜ける",
        nodashstamina = "ダッシュスタミナ無し",
        nodashstaminadesc = "多分ダッシュにスタミナ消費なし？",
        nodashcooldown = "ダッシュクールダウン無し",
        nodashcooldowndesc = "説明不要だよね？",
        infinitejump = "無限ジャンプ",
        infinitejumpdesc = "ただ無限にジャンプできる",

        -- misc
        selectbanner = "バナー選択",
        selectbannerdesc = "どのバナーを召喚するか選ぶ",
        autobuy = "自動購入",
        autobuydesc = "自動購入モードを選択",
        buy1x = "選択バナーから1枚引く",
        buy10x = "選択バナーから10枚引く",
        buy = "購入"
    }
}

local function detectlanguage()
    local sucess, result = pcall(function()
        return game:GetService("LocalizationService").RobloxLocaleId:lower()
    end)
    
    if sucess and words[result] then
        return result
    end
    
    return "en-us"
end

local language = detectlanguage()

function translator.get(key)
    if words[language] and words[language][key] then
        return words[language][key]
    end
    return key
end

local t = setmetatable({}, {
    __index = function(_, key)
        return translator.get(key)
    end
})

translator.t = t
translator.language = language
return translator
