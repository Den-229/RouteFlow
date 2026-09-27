<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('drivers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone');
            $table->enum('status', ['available', 'on_route', 'offline'])->default('available');
            $table->decimal('current_lat', 10, 7)->nullable();
            $table->decimal('current_lng', 10, 7)->nullable();
            $table->timestamps();
        });

        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('tracking_number')->unique();
            $table->string('customer_name');
            $table->string('delivery_address');
            $table->enum('status', ['pending', 'assigned', 'in_transit', 'delivered', 'failed'])->default('pending');
            $table->timestamps();
        });

        Schema::create('routes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('driver_id')->constrained()->onDelete('cascade');
            $table->date('route_date');
            $table->integer('total_stops')->default(0);
            $table->integer('estimated_duration_mins')->default(0);
            $table->timestamps();
        });

        Schema::create('proofs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained()->onDelete('cascade');
            $table->string('photo_url')->nullable();
            $table->string('signature_url')->nullable();
            $table->timestamp('delivered_at');
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('proofs');
        Schema::dropIfExists('routes');
        Schema::dropIfExists('orders');
        Schema::dropIfExists('drivers');
    }
};
