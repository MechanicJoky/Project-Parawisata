<?php

namespace App\Http\Controllers;

use App\Http\Requests\CategoryCreateRequest;
use App\Http\Requests\CategoryUpdateRequest;
use App\Models\category;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = category::all();
        return view('Category.index', compact('categories'));
    }

    public function create()
    {
        return view('Category.create');
    }

    public function store(CategoryCreateRequest $request)
    {
        $data = $request->validated();
        $imageFile = $request->file('image');
        if ($imageFile) {
            $path = time() . '.' . $imageFile->getClientOriginalExtension();
            $data['image'] = $imageFile->move('images', $path);
        } else {
            $path = null;
        }

        $category = new category($data);
        $category->save();

        return redirect('Category.index');
    }

    public function edit(category $category)
    {
        return view('Category.edit', compact('category'));
    }

    public function update(int $id, CategoryUpdateRequest $request)
    {
        $category = $this->getCategory($id);
        $data = $request->validated();

        $imageFile = $request->file('image');
        if ($imageFile) {
            $path = time() . '.' . $imageFile->getClientOriginalExtension();
            $data['image'] = $imageFile->move('images', $path);
        } else {
            $path = null;
        }

        $category->image = $path;
        $category->fill($data);
        $category->save();
    }

    public function delete(int $id)
    {
        $category = $this->getCategory($id);
        $category->delete();
        return redirect('Category.index');
    }
}