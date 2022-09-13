# 使用簡介

## 目的
* 追求一行指令即可完全設定好開發環境

## 簡述
* 依照使用方式的步驟執行完畢後，即可建立最新 laravel 專案 & nginx & mysql 的開發環境
* 其中 nginx & mysql 是使用 laradock 啟用的 service ，其基礎為 docker ，所以可以照自身所需要的 service 來選擇開啟。

## 環境需求
* linux
* docker
* docker-compose

## 使用方式
* git clone 此專案
* cd 至專案目錄下
* 執行以下指令
```
sh init.sh
```
* 執行完成後即會在專案資料夾內產生如下圖的專案
    * ![](https://i.imgur.com/ApZ7gxs.png)
* 會自動開啟在 laravel 目錄下的 VScode IDE
* 此時即可在 http://localhost/ 進入 laravel 的首頁
* mysql DB
    * PORT 3306
    * 資料庫 laravel
    * 帳號 root
    * 密碼 root

## 介紹
* shell 檔案 : up.sh
    * 在專案目錄下使用 **`sh up.sh`** 指令可啟動 laravel 專案預設之 service (nginx & mysql 相關)
* shell 檔案 : down.sh
    * 在專案目錄下使用 **`sh down.sh`** 指令可關閉此專案使用之 service
* shell 檔案 : cmd.sh
    * 在專案目錄下使用 **`sh cmd.sh XXX`**
        * 可快速使用各種 cmd 指令
        * ex : sh cmd.sh php artisan migrate
        * ex : sh cmd.sh composer install
        * ex : sh cmd.sh npm install
        * ex : sh cmd.sh bash
            * 預設會以 laradock 使用者的身分進入 workspace 容器的 terminal 介面
* 資料夾 : data
    * 資料庫存儲的位置
* 資料夾 : laravel
    * laravel code 的位置
* 資料夾 : laradock
    * laradock 各種 service 設定的位置