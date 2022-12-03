## Занятие2 Дисковая система

## Прохождение:

### добавить в Vagrantfile еще дисков
                :sata5 => {
                        :dfile => './sata5.vdi',
                        :size => 250, # Megabytes
                        :port => 5
                }


### собрать R0/R5/R10 на выбор
sudo mdadm --create --verbose /dev/md/raid5 --level=5 --raid-devices=3 /dev/sdb /dev/sdc /dev/sdd 

#сломать/починить raid;
sudo mdadm /dev/md/raid5 -f /dev/sdb 
sudo mdadm /dev/md/raid5 -r /dev/sdb
sudo mdadm /dev/md/raid5 -a /dev/sdb

sudo mdadm --detail /dev/md/raid5 

### прописать собранный рейд в конф, чтобы рейд собирался при загрузке
mdadm --stop /dev/md/raid5
sudo mdadm --assemble --scan

### создать GPT раздел
sudo gdisk /dev/sde
GPT fdisk (gdisk) version 0.8.10

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present

Creating new GPT entries.

Command (? for help): o
This option deletes all partitions and creates a new protective MBR.
Proceed? (Y/N): Y

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): Y
OK; writing new GUID partition table (GPT) to /dev/sde.
The operation has completed successfully.
[vagrant@otuslinux ~]$ sudo gdisk /dev/sde
GPT fdisk (gdisk) version 0.8.10

Partition table scan:
  MBR: protective
  BSD: not present
  APM: not present
  GPT: present

Found valid GPT with protective MBR; using GPT.

### создать 5 партиций
for i in {1..5} ; do sudo sgdisk -n ${i}:0:+20M /dev/sde ; done



