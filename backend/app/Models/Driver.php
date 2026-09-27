<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Driver extends Model { protected $fillable = ['name', 'phone', 'status', 'current_lat', 'current_lng']; }
