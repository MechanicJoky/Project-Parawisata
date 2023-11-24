<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ToursResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id"=> $this->id,
            "name"=> $this->name,
            "area"=> $this->area,
            "address"=> $this->address,
            "lat"=> $this->lat,
            "lang"=> $this->lang,
            "categories" => CategoryResource::collection($this->whenLoaded('categories')),
            "information" => InformationResource::collection($this->whenLoaded('information')),
        ];
    }
}