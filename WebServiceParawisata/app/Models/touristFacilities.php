<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class touristFacilities extends Model
{
    protected $table = 'tourist_facilities';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;


    // public function tours(): BelongsTo
    // {
        // return $this->belongsTo(Tour::class,'tours_id', 'id');
    // }
}
