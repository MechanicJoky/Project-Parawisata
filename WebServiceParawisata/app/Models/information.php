<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class information extends Model
{
    protected $table = "information";
    protected $keyType = "int";
    protected $primaryKey = "id";
    public $incrementing = true;
    public $timestamps = true;

    protected $fillable = [
        'name',
        'image'
    ];

    public function tours(): HasMany
    {
        return $this->hasMany(touristFacilities::class, "information_id", "id");
    }

}
