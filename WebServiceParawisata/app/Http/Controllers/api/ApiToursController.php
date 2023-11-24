<?php

namespace App\Http\Controllers\api;
use App\Http\Requests\ToursCreateRequest;
use App\Http\Resources\ToursCollection;
use App\Http\Resources\ToursResource;
use App\Models\category;
use App\Models\information;
use Illuminate\Http\Request;
use App\Models\tour;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
class ApiToursController extends ApiController
{
    private function getTours(int $id)
    {
        $tour = tour::where('id', $id)->first();
        if (!$tour) {
            throw new HttpResponseException(
                response()
                    ->json([
                        'errors' => [
                            'message' => ['not found'],
                        ],
                    ])
                    ->setStatusCode(404),
            );
        }
        return $tour;
    }
    public function getAll(Request $request): ToursCollection
    {
        $tours = tour::with('categories', 'information')->get();
        if ($tours->isEmpty()) {
            throw new HttpResponseException(
                response()
                    ->json([
                        'errors'=> [
                            'message'=> ['Data Empty'],
                        ]
                    ])
            );
        }

        $tourCollection = ToursResource::collection($tours);
        $tourCollection = $tourCollection->map(function ($tour) {
            $tour->categories = $tour->categories->map(function ($category) {
                $category->image = $category->image ? asset("images/{$category->image}") : null;
                return $category;
            });

            $tour->information = $tour->information->map(function ($information) {
                $information->image = $information->image ? asset("images/{$information->image}") : null;
                return $information;
            });

            return $tour;
        });

        return new ToursCollection($tourCollection);
    }


    public function get(int $id): ToursResource
    {
        $tour = $this->getTours($id);
        $tour->load('categories', 'information');
        $tour->categories = $tour->categories->map(function ($category) {
            $category->image = $category->image ? asset("images/{$category->image}") : null;
            return $category;
        });

        $tour->information = $tour->information->map(function ($information) {
            $information->image = $information->image ? asset("images/{$information->image}") : null;
            return $information;
        });
        return new ToursResource($tour);
    }

    public function create(ToursCreateRequest $request): JsonResponse
    {

    $existingCategories = category::whereIn('id', $request->input('categories'))->pluck('id');
    $existingInformation = information::whereIn('id', $request->input('information'))->pluck('id');

    $tour = Tour::create([
        'name' => $request->input('name'),
        'area' => $request->input('area'),
        'address' => $request->input('address'),
        'lat' => $request->input('lat'),
        'lang' => $request->input('lang'),
    ]);
    $tour->categories()->attach($existingCategories);
    $tour->information()->attach($existingInformation);
    $tour = $tour->load('categories', 'information');
    return (new ToursResource($tour))->response()->setStatusCode(201);
    }
}
