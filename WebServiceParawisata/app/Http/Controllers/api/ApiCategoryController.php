<?php

namespace App\Http\Controllers\api;

use App\Http\Requests\CategoryCreateRequest;
use App\Http\Resources\CategoryCollection;
use App\Http\Resources\CategoryResource;
use App\Models\category;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ApiCategoryController extends ApiController
{
    private function getCategory(int $id)
    {
        $category = category::where('id', $id)->first();
        if (!$category) {
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
        return $category;
    }

    public function getAll(Request $request): CategoryCollection
    {
        $category = category::all();
        if($category->isEmpty())
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
        $categoryCollection = CategoryResource::collection($category);
        $categoryCollection = $categoryCollection->map(function ($category) {
            $imagePath = $category->image;
            $category->image = asset('/images/' . $imagePath); // Sertakan path gambar dalam respons
            return $category;
        });
        return new CategoryCollection($categoryCollection);
    }

    public function get(int $id): CategoryResource
    {
        $category = $this->getCategory($id);
        $imagePath = $category->image;
        if ($imagePath) {
            $category->image = asset('/images/' . $imagePath);
        } else {
            $category->image = null;
        }
        return new CategoryResource($category);
    }
    public function create(CategoryCreateRequest $request): JsonResponse
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
        $category = new category($data);
        $category->save();
        return (new CategoryResource($category))->response()->setStatusCode(201);
    }
}
