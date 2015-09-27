# plr-tm

How to do text analysis with pl/r.

# running

start the machine
```
vagrant up
```

ssh to it
```
vagrant ssh
```

then:

```
vagrant@packer-virtualbox-iso-1441821736:~$ sudo su
root@packer-virtualbox-iso-1441821736:/home/vagrant# sudo su postgres
postgres@packer-virtualbox-iso-1441821736:/home/vagrant$ psql -d kmeans
psql (9.4.4)
Type "help" for help.

kmeans=# select * from km(ARRAY['ana', 'mere'], 'select say from toc', 0.2) as t(term text, corr numeric);
```

... to see the correlation factor between a search term and words from text returned by a query.

