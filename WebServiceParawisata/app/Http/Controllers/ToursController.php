<?php

namespace App\Http\Controllers;

use App\Http\Requests\ImageToursCreateRequest;
use App\Http\Requests\ToursCreateRequest;
use App\Http\Requests\ToursUpdateRequest;
use App\Http\Resources\ToursResource;
use App\Models\category;
use App\Models\imageTours;
use App\Models\information;
use App\Models\tour;

class ToursController extends Controller
{
    public function index()
    {
        $tours = tour::all();
        $imageTours = imageTours::all();
        return view('Tours.index', compact('tours', 'imageTours'));
    }

    public function create()
    {
        $categories = category::all();
        $informations = information::all();

        // Menyediakan data ke tampilan Tours.create
        return view('Tours.create', compact('categories', 'informations'));
    }

    public function addImage(ImageToursCreateRequest $request, Tour $tour)
    {
        $toursId = $tour->id;
        $data = $request->validated();
        $imagePath = $request->file('image');
        if ($imagePath) {
            $path = time() . '.' . $imagePath->getClientOriginalExtension();
            $imagePath->move(public_path('images'), $path);
            $data['image'] = $path;
        } else {
            $path = null;
        }

        $tour->imageTour()->create([
            'tours_id' => $toursId,
            'image' => $data['image'],
        ]);

        return redirect()
            ->back()
            ->with('success', 'Image added successfully.');
    }

    public function viewImage(tour $tour, $image)
    {
        $imagePath = storage_path("app/tours_images/{$image}");
        return response()->file($imagePath);
    }
    public function store(ToursCreateRequest $request)
    {
        $existingCategories = category::whereIn('id', $request->input('categories'))->pluck('id');
        $existingInformation = information::whereIn('id', $request->input('information'))->pluck('id');
        $data = $request->validated();
        $tour = tour::create($data);
        $tour->categories()->attach($existingCategories);
        $tour->information()->attach($existingInformation);
        $tour = $tour->load('categories', 'information');
        $tour->save();

        return redirect()->route('tours.index');
    }

    public function edit(tour $tour, int $id)
    {
        $tour = tour::find($id);
        return view('Tours.edit', compact('tour'));
    }

    public function update(int $id, ToursUpdateRequest $request): ToursResource
    {
        $tour = $this->getTours($id);
        $data = $request->validated();
        $tour->fill($data);
        $tour->save();
        return (new ToursResource($tour))->redirect('Tours.index');
    }

    public function delete(int $id)
    {
        $tour = $this->getTours($id);
        $tour->delete();
        return redirect('Tours.index');
    }
}