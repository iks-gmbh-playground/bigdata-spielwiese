# bigdata-spielwiese
Quellcode und Skripte, um eine Bigdata-Cluster mit docker aufzustetzen. 

# Informationen zum Cluster

Es wird mit Hilfe von *docker-compose* ein auf den Öko-System von Hadoop basierendes BigData-Cluster aufgebaut. 

Das gesamte Cluster besteht aus unterschiedlichen Systemen/Werkzeugen, welche in diesem Cluster installiert werden. jedes dieser Werkzeuge wird in einem eigen docker-compose-File installiert. damit alle Systeme in einem gemeinsamen Netzwerk kommunizieren können, wird im ersten Schritt ein netzangelegt.

```
docker network create bigdata-spielwiese-network
```

# Hadoop Distributed Filesystem (HDFS)

Das erste System, welches in diesem Cluster installiert wird, ist HDFS. Alle Sourcen liegen unter [./hdfs]().

Es wird ein Cluster bestehend aus einem Namenode und zwei Datanode installiert. Die Installation basiert auf HDFS v 3.2.1 

Vor dem ersten Start

```
docker-compose build
```

Start des Clusters

```
docker-compose up -d 
```

Löschen 

```
docker-compose down –remove-orphans
```

Um die Testdaten in HDFS zu laden , wird wie folgt vorgegangen:

```
docker cp ../testdaten/movielens/ml-latest-small/ namenode:/tmp
```

Jetzt verbinden wir uns mit dem Container *namenode* und öffnen dort eine bash-shell.

```
docker exec -it namenode /bin/bash  
```

```
# hdfs dfs -mkdir -p /user/admin/movielens
# hdfs dfs -put /tmp/ml-latest-small/movies.csv /user/admin/movielens
# hdfs dfs -chown -R admin /user/admin/movielens
# hdfs dfs -ls /user/admin/movielens
```

