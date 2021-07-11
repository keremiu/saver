///Room Create
//Spawn Monster
ini_open("save.ini") //open file
room_clear = ini_read_real(string(Room1),"clear",0); //set room_clear to saved value for current room
if !room_clear //not clear
{
    instance_create_layer(736,576,1,golem);  //create monster
    ini_write_real(string(Room1),"clear",1);  //save as clear
}
ini_close()