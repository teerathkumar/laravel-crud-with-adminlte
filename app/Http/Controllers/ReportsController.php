<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReportsController extends Controller {

    //
    public function index(){
        return view('reports.bill');
    }
    public function bill() {
        dd('hhh');
        return view('reports.bill');
    }

}
