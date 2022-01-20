<?php
require_once PROJECT_ROOT_PATH . "/Model/Database.php";

class AnimalModel extends Database
{
    public function getAnimals($limit)
    {
        return $this->select("SELECT * FROM animals ORDER BY animalID ASC LIMIT ?", ["i", $limit]);
    }
}