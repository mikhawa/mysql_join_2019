<?php
/**
 * Created by PhpStorm.
 * User: Michael
 * Date: 28/03/2019
 * Time: 11:45
 */

$name = [
    "Mikhawa",
    "PitiPierre",
    "Sylvia1",
    "Tsarim",
    "Vendoreum",
    "FlobertS",
    "VDBlens",
    "Lecteur1",
    "Lecteur2",
    "Lecteur3",

        ];

foreach ($name as $item){
    echo $item." : ".hash("sha256",$item)."<br>";
}