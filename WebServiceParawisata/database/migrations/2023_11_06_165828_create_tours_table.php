<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tours', function (Blueprint $table) {
            $table->id();
            $table->string('name', '200')->nullable(false);
            $table->string('area', '200')->nullable(false);
            $table->string('address', '300')->nullable(false);
            $table->double('lat', '100')->nullable(false);
            $table->double('lang', '100')->nullable(false);
            $table->unsignedBigInteger('category_id')->nullable();
            $table->unsignedBigInteger('information_id')->nullable();
            $table->timestamps();

            $table
                ->foreign('category_id')
                ->references('id')
                ->on('categories');
            $table
                ->foreign('information_id')
                ->references('id')
                ->on('information');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tours');
    }
};
