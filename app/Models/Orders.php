<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    use HasFactory;
    
    protected $table = 'orders';
    public $timestamps = true;


    protected $fillable = [
        'OrderId',
        'OrderDate',
        'CustomerId',
        'Quantity',
        'PickupDate',
        'created_at'
    ];
}
