<?php
//These are the defined authentication environment in the db service

// The MySQL service named in the docker-compose.yml.
$host = 'db';
// Database use name
$user = 'MYSQL_USER';
//database user password
$pass = 'MYSQL_PASSWORD';
//database name
$dbname = "MYSQL_DATABASE";

// check the MySQL connection status
$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

// echo "Connected to MySQL server successfully!";

$Animal = $_GET['getAnimal'];

if($Animal == "all"){
	$sql = 'SELECT * FROM animals as a, province as p where a.provinceId = p.provinceId AND a.taken = 0';
}elseif(is_numeric($Animal)){
	$sql = 'SELECT * FROM animals as a, province as p where a.provinceId = p.provinceId AND a.taken = 0 AND AnimalID = ' . $Animal;
} else {
	$sql = 'SELECT * FROM animals as a, province as p where a.provinceId = p.provinceId AND a.taken = 0 AND AnimalID in ('.$Animal.')'; 
	// die("Wrong query!");
}

$result = $conn->query($sql);

$rows = array();
while($r = mysqli_fetch_assoc($result)) {
    $rows[] = $r;
}
print json_encode($rows);


$conn->close();
?>
