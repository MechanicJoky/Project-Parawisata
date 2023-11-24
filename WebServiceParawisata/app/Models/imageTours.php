<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class imageTours extends Model
{
    protected $table = 'image_tours';
    protected $keyType = 'int';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;

    protected $fillable = [
        'tours_id',
        'image'
    ];
    // public function tours() : BelongsTo
    // {
    //     return $this->belongsTo(tour::class,'tours_id','id');
    // }
}
