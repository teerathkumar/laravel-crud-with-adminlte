<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\ChartsController;
use App\Http\Controllers\StocksController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home.index');
});
//Route::get('invoice', function () {
//    return view('charts.invoice');
//});
//Route::get('/bill', function () {
//    return view('reports.bill');
//});
//Route::get('bill', 'ChartsController@bill');
Route::resource('home', HomeController::class);
Route::resource('projects', ProjectController::class);
Route::resource('orders', OrdersController::class);
Route::resource('customers', CustomersController::class);
Route::resource('reports', ReportsController::class);
Route::resource('charts', ChartsController::class);
Route::resource('stocks', StocksController::class);