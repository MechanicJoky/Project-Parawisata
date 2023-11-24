<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class ToursCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "name" => ["required", "string","max:200"],
            "area" => ["required", "string", "max:200"],
            "address" => ["required", "string", "max:300"],
            "lat" => ["required", "numeric", "regex:/^[-]?(([0-8]?[0-9])\.(\d+))|(90(\.0+)?)$/", "max:200"],
            "lang" => ["required", "numeric", "regex:/^[-]?((1[0-7][0-9])\.(\d+))|([0-9]?[0-9]\.(\d+))|(180(\.0+)?)$/", "max:200"],
            'categories' => 'array',
            'categories.*' => 'exists:categories,id',
            'information' => 'array',
            'information.*' => 'exists:information,id',
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            "errors" => $validator->getMessageBag()
        ], 400));
    }
}