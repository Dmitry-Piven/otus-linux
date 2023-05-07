# Домашнее задание:Systemd

## Требования:
1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig).
2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).
3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.
https://drive.google.com/file/d/1yVi3sJjl9maOCN_Z6cUyPj4rzo0CpudR/view?usp=sharing

## Выполнение:

- Загрузить файлы Vagrantfile и homesrv.sh
- выполнить vagrant up

## Проверка:

На созданной машине выполнить:
- tail -f /var/log/messages
- systemctl status spawn-fcgi
- ss -tnulp | grep httpd
