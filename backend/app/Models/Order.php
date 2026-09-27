<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Order extends Model { protected $fillable = ['tracking_number', 'customer_name', 'delivery_address', 'status']; }
