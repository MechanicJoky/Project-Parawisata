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
        Schema::create('tourist_facilities', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tours_id')->nullable(false);
            $table->unsignedBigInteger('information_id')->nullable(false);
            $table->string('descriptions')->nullable(false);
            $table->timestamps();

            $table->foreign('tours_id')->references('id')->on('tours');
            $table->foreign('information_id')->references('id')->on('information');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tourist_facilities');
    }
};