<?php

use App\Http\Controllers\api\ApiCategoryController;
use App\Http\Controllers\api\ApiInformationController;
use App\Http\Controllers\api\ApiToursController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::get('/information/{id}', [ApiInformationController::class, 'get']);
Route::get('/information', [ApiInformationController::class, 'getAll']);
Route::post('/information', [ApiInformationController::class, 'create']);

Route::get('/category/{id}', [ApiCategoryController::class, 'get']);
Route::get('/category', [ApiCategoryController::class, 'getAll']);
Route::post('/category', [ApiCategoryController::class, 'create']);

Route::get('/tours/{id}', [ApiToursController::class, 'get']);
Route::get('/tours', [ApiToursController::class, 'getAll']);
Route::post('/tours', [ApiToursController::class, 'create']);