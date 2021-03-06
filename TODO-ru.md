## Список работ

релиз "Предыдущий"

* [X] сделать официальную сборку средствами hub.docker
* [X] сделать сборку средствами travis (cirlce)
* [X] проверить сборку и работу под Linux Docker
* [X] локализовать README
* [x] сделать экспериментальный скрипт по установке TOAST STORAGE `X`
* [X] добавить мониторинг MamonSU
* [X] дать возможность изменять TIMEZONE для PG из параметров docker
* [X] добавить возможность upgrade песочниц для тестов

релиз 6

* [ ] сделать переменную окружения Zabbix-Server в docker-compose и задокументировать
* [ ] подключить PGBadger демон и настроить log-collector
* [X] добавить возможность работы с tmpfs в части временных таблиц PG
* [ ] починить pghero

релиз 7

* [ ] сделать автотюнинг на LOCK.WAL
* [ ] сделать Docker-Compose для работы с Consul.io как показать примера DNS сервисов и нескольких серверов PG на одном хосте
* [ ] добавить автотесты средствами pgbench с параметрами ожидаемой производительности в docker-compose
* [ ] отмигрироваться на наш базовый образ Ubuntu
* [ ] вставить презентационный скрипт автоматического HA средствами repmanager
* [ ] добавить merge-strategies для для работы с upstream
* [ ] отмигрировать настройки barman
* [ ] вставить шардирование и секционирование от PostgreSQL.pro
* [ ] проверить на безопасность образ в части CERT
* [ ] перевести весь README.md 
* [ ] включить поддержку Docker-Macnine для реализации master-slave хостов

релиз 8

* [ ] аудировать и перенести наработки с курса по PG, pgSteroids и pgClass, pgDock
* [ ] проверить концепции pgPool, pgBounser
* [ ] реализовать автоматический failover (stolon, pgrewind, repmanager) без потери сессии 1С - вомзожмно с миграцией IP
    * [ ] возможно только с логической репликацией которая лучше сделана в 10.x PG
* [ ] заменить в GitLab и SonarQube образ на `silverbulleters/ya-docker`
* [ ] изучить форки на предмет интересной функциональности
* [ ] часть функций реализовать на oscript - особенно логику адаптационных postgresql.conf, хотя пока можено олстановиться на `mamonsu tune`

релиз SUPER

* [ ] incorporate alien tech