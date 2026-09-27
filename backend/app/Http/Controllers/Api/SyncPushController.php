<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
class SyncPushController extends Controller {
    public function push(Request $request) {
        return response()->json(['status' => 'ack', 'processed_mutations' => count($request->mutations ?? [])]);
    }
}
