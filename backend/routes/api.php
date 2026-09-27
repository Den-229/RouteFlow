<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\OrderController;
Route::prefix('v1')->group(function () {
    Route::get('/orders', [OrderController::class, 'index']);
    Route::post('/orders', [OrderController::class, 'store']);
    Route::post('/routes/optimize', function() { return response()->json(['status' => 'optimized', 'eta_mins' => 45]); });
});
