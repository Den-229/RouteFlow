<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
class OrderController extends Controller {
    public function index() { return response()->json(Order::all()); }
    public function store(Request $request) {
        $validated = $request->validate(['customer_name' => 'required', 'delivery_address' => 'required']);
        $validated['tracking_number'] = 'RF-' . strtoupper(bin2hex(random_bytes(4)));
        return response()->json(Order::create($validated), 201);
    }
}
