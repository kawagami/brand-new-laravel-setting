#!/bin/bash

# 建立 sh 檔

echo "#!/bin/bash\n\ncd ./laradock\n\ndocker-compose up -d nginx mysql" >> ./up.sh
echo "#!/bin/bash\n\ncd ./laradock\n\ndocker-compose down" >> ./down.sh
echo '#!/bin/bash
cd ./laradock
docker-compose exec --user=laradock workspace $@' >> ./cmd.sh

# 刪除從 github 下載的 .git
rm -rf ./.git

# 修改 laradock .env

# 下載 laradock
git clone https://github.com/laradock/laradock.git

# 移動到 laradock 路徑
cd ./laradock

# 
rm -rf ./.git

# 新增 .env
cp .env.example .env

# 專案路徑
OLD_APP_PATH=APP_CODE_PATH_HOST=.*
NEW_APP_PATH="APP_CODE_PATH_HOST=\.\."
# 資料庫路徑
OLD_DB_PATH=DATA_PATH_HOST=.*
NEW_DB_PATH=DATA_PATH_HOST="\.\.\/data"

# sed cmd
sed -e "s/$OLD_APP_PATH/$NEW_APP_PATH/" -i ./.env
sed -e "s/$OLD_DB_PATH/$NEW_DB_PATH/" -i ./.env

# 起 service
docker-compose up -d nginx mysql

# 專案名稱
APP_NAME=laravel

# 使用 workspace 下載新的 laravel 專案
docker-compose exec --user=laradock workspace composer create-project laravel/laravel $APP_NAME

# 安裝完後 down service
docker-compose down

# 修改根路徑
AFTER_LARAVEL_INSTALL="APP_CODE_PATH_HOST=\.\.\/$APP_NAME"
sed -e "s/APP_CODE_PATH_HOST=\.\./$AFTER_LARAVEL_INSTALL/" -i ./.env

# 再起 service
docker-compose up -d nginx mysql

# 開啟 IDE
cd ../laravel && code .
