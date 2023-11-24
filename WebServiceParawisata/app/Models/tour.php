<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class tour extends Model
{
    protected $table = 'tours';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;


    protected $fillable = [
        'name',
        'area',
        'address',
        'lat',
        'lang',
        'category_id',
        'information_id',
    ];

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(category::class);
    }

    public function information(): BelongsToMany
    {
        return $this->belongsToMany(information::class);
    }

    public function imageTour() : HasMany
    {
        return $this->hasMany(imageTours::class,'tours_id','id');
    }

    public function touristFacilities() : HasMany {
        return $this->hasMany(touristFacilities::class,'tours_id','id');
    }
}