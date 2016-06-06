# Linux Design Philosophies
Linux borrows its design philosophies from Unix. Some of these principles are:

* Allow for multi-user interaction
* Design simple programs that connect well with other programs
* Write programs that are clear and well documented to ease problem solving and future maintenance
* Design programs that solve one problem instead of adding functionality to an existing program 

# Virtual Private Server
A VPS is a server that emulates a physical server but is sandboxed in such a way that any action performed in the VPS will only impact the VPS and nothing outside of it. It runs a copy of an operating system, allowing the user to install any software needed to run and maintain the server.

Some advantages of a VPS:
* It is cheaper to run than a physical server.
* A user can choose which operating system to run.
* A user is free from having to know how to run a physical server.

# Dangers of Root as a User
A root user (or superuser) has unrestricted access to system resources. As such, this poses the risk that the superuser adversely alters or deletes precious resources develop by other users.
Such damage may occur inadvertently due to typos or negligence on the part of the superuser.
