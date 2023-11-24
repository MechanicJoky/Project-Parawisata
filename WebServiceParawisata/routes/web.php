<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\InformationController;
use App\Http\Controllers\ToursController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//information
Route::get('/information', [InformationController::class, 'index']);
Route::get('/information/create', [InformationController::class,'create']);
Route::post('/information/store', [InformationController::class, 'store']);
Route::get('/information/edit/{id}', [InformationController::class,'edit']);
Route::put('/information/edit/{id}', [InformationController::class, 'update']);
Route::delete('/information/delete/{id}', [InformationController::class,'delete']);

//category
Route::get('/category', [CategoryController::class, 'index']);
Route::get('/category/create', [CategoryController::class,'create']);
Route::post('/category/store', [CategoryController::class, 'store']);
Route::get('/category/edit/{id}', [CategoryController::class,'edit']);
Route::put('/category/edit/{id}', [CategoryController::class, 'update']);
Route::delete('/category/delete/{id}', [CategoryController::class,'delete']);

Route::get('/tours', [ToursController::class, 'index'])->name('tours.index');
Route::post('/tours/{tour}/addImage', [ToursController::class, 'addImage'])->name('tours.addImage');
Route::get('/tours/create', [ToursController::class,'create'])->name('tours.create');
Route::post('/tours/store', [ToursController::class, 'store'])->name('tours.store');
Route::get('/tours/edit/{id}', [ToursController::class,'edit']);
Route::put('/tours/edit/{id}', [ToursController::class, 'update']);
Route::delete('/tours/delete/{id}', [ToursController::class,'delete']);