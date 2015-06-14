#API設計書
##GET
###モンスター情報取得
**エンドポイント**

ドメイン/monstar

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|uuid|string|o|-|DSA421402131FSAOFS|アプリ固有のID|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true||
|data|Object||
|data/uuid|string||
|data/monstar/id|int|モンスターID|
|data/monstar/name|string|モンスター名|
|data/monstar/sex|int|性別(男:0, 女:1)|
|data/monstar/age|int||
|data/monstar/hp|float|HP|
|data/monstar/decrease_rate|float|どのくらい減らすか|
|data/monstar/level|int|モンスターのレベル|

**ステータスコード**

200 : 成功
500 : 失敗

###料理検索API

**エンドポイント**

ドメイン/foods/search

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|query|string|o|-|ほうれん草|検索クエリ|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true||
|data|Object||
|data/query|string|検索クエリ|
|data/foods/id|int|料理ID|
|data/foods/name|string|料理名|

**ステータスコード**

200 : 成功
500 : 失敗

###病気情報取得

**エンドポイント**

ドメイン/illnesses

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|uuid|string|o|-|DSA421402131FSAOFS|アプリ固有のID|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true||
|data|Object||
|data/uuid|string|UUID|
|data/illnesses/id|int|病気のID|
|data/illnesses/name|string|病名|
|data/illnesses/recommends/name|string|レコメンドされたアイテム名|
|data/illnesses/recommends/param|float|レコメンドされたアイテムにより発病確率がどのくらい下がるか|

**ステータスコード**

200 : 成功
500 : 失敗

###リザルト情報取得

**エンドポイント**

ドメイン/result

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|uuid|string|o|-|DSA421402131FSAOFS|アプリ固有のID|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true||
|data|Object||
|data/uuid|string|UUID|
|data/monstar/id|int|モンスターID|
|data/monstar/name|string|モンスター名|
|data/monstar/level|int|モンスターの到達レベル|
|data/illness/id|int|主要な病気ID|
|data/illness/name|string|主要な病名|
|data/ingredients/id|int|栄養素ID|
|data/ingredients/name|string|栄養素名|
|data/ingredients/ideal_quantity|float|理想の量|
|data/ingredients/quantity|float|実際の量|
|data/foods/id|int|おすすめメニューID|
|data/foods/name|int|おすすめメニュー名|

**ステータスコード**

200 : 成功
500 : 失敗


##POST

###モンスター登録

**エンドポイント**

ドメイン/monstar/create

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|uuid|string|o|-|DSA421402131FSAOFS|アプリ固有のID|
|name|string|o|名称未設定|武田ドラゴン|モンスター名|
|sex|int|o|-|0|性別(男:0, 女:1)|
|age|int|o|-|24|年齢|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true|登録に成功したか|
|data|Object||
|data/uuid|string|uuid|

**ステータスコード**

200 : 成功
500 : 失敗

###料理登録

**エンドポイント**

ドメイン/food/create

**リクエストパラメータ**

|パラメータ|型|必須|デフォルト値|サンプル値|説明|
|---|---|---|---|---|---|
|uuid|string|o|-|DSA421402131FSAOFS|アプリ固有のID|
|food_id|int|o|-|1|料理のID|

**レスポンス**

|フィールド|型|説明|
|---|---|---|
|result|true|登録に成功したか|
|data|Object||
|data/uuid|string|uuid|
|data/food_id|int|登録した料理ID|

**ステータスコード**

200 : 成功
500 : 失敗