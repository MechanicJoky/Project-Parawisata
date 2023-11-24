<?php

namespace App\Http\Controllers;
use App\Http\Requests\InformationCreateRequest;
use App\Http\Requests\InformationUpdateRequest;
use App\Http\Resources\InformationCollection;
use App\Http\Resources\InformationResource;
use App\Models\information;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

//FOR WEB
class InformationController extends Controller
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
    public function index()
    {
        $information = information::all();
        return view('Information.index', compact('information'));
    }

    public function create()
    {
        return view('Information.create');
    }

    public function store(InformationCreateRequest $request)
    {
        $data = $request->validated();
        $imageFile = $request->file('image');
        if ($imageFile) {
            $path = time() . '.' . $imageFile->getClientOriginalExtension();
            $data['image'] = $imageFile->move('images', $path);
        } else {
            $path = null;
        }
        $information = new information($data);
        $information->image = $path;
        $information->save();

        return redirect('Information.index');
    }

    public function edit(information $information, int $id)
    {
        $information = information::find($id);
        return view('Information.edit', compact('information'));
    }
    public function update(int $id, InformationUpdateRequest $request): InformationResource
    {
        $information = $this->getInformation($id);
        $data = $request->validated();

        $imageFile = $request->file('image');
        if ($imageFile) {
            $path = time() . '.' . $imageFile->getClientOriginalExtension();
            $data['image'] = $imageFile->move('images', $path);
        } else {
            $path = null;
        }
        $information->image = $path;
        $information->fill($data);
        $information->save();
        return (new InformationResource($information))->redirect('Information.index');
    }

    public function delete(int $id)
    {
        $information = $this->getInformation($id);
        $information->delete();
        return redirect('Information.index');
    }
}
