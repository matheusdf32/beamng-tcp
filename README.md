# beamng-tcp
This is a beamng mod that will gather information from the game and send it -via TCP socket- to a server.
Example using NodeJS: https://www.youtube.com/watch?v=7uh2omI_e9E

This was made initialy for a college final project in order to get my bachelors degree.
To use it as is, place the content in (windows) Documents\BeamNG.drive\mods\unpacked

the structure should look like:
unpacked
    └───beamng-tcp
        ├───lua
        │   ├───ge
        │   │   └───extensions
        │   └───vehicle
        │       └───extensions
        │           └───Test
        └───scripts
            └───Test
            
The mod is a client tcp socket, your server must be listening at port 4343.
Your server will recieve a buffered string, unbuffering it will show a stringified JSON.
