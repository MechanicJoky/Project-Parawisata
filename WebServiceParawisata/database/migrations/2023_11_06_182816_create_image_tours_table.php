<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('image_tours', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tours_id')->nullable(false);
            $table->string('image')->nullable(false);
            $table->timestamps();
            $table->foreign('tours_id')->references('id')->on('tours');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('image_tours');
    }
};
