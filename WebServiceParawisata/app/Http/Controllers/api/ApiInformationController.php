<?php

namespace App\Http\Controllers\api;
use App\Http\Requests\InformationCreateRequest;
use App\Http\Resources\InformationCollection;
use App\Http\Resources\InformationResource;
use App\Models\information;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ApiInformationController extends ApiController
{
    private function getInformation(int $id): Information
    {
        $information = information::where('id', $id)->first();
        if (!$information) {
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
        return $information;
    }
    public function getAll(Request $request): InformationCollection
    {
        $information = information::all();

        if($information->isEmpty())
        {
            throw new HttpResponseException(
                response()
                ->json([
                    'errors'=> [
                        'message'=> ['Data Empty'],
                    ]
                ])
            );
        }

        $informationCollection = InformationResource::collection($information);
        $informationCollection = $informationCollection->map(function ($information) {
            $imagePath = $information->image;
            $information->image = asset('/images/' . $imagePath);
            return $information;
        });
        return new InformationCollection($informationCollection);
    }

    public function get(int $id): InformationResource
    {
        $information = $this->getInformation($id);
        $imagePath = $information->image;

        if ($imagePath) {
            $information->image = asset('/images/' . $imagePath);
        } else {
            $information->image = null;
        }
        return new InformationResource($information);
    }

    public function create(InformationCreateRequest $request): JsonResponse
    {
        $data = $request->validated();
        $imageFile = $request->file('image');
        if ($imageFile) {
            $path = time() . '.' . $imageFile->getClientOriginalExtension();
            $imageFile->move(public_path('images'), $path);
            $data['image'] = $path;
        } else {
            $path = null;
        }
        $information = new information($data);
        $information->save();
        return (new InformationResource($information))->response()->setStatusCode(201);
    }
}
