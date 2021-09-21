<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChartsController extends Controller {

    //
    public function index() {
        //
        //die("----");
        return view('reports.bill');
    }

    public function invoice() {
        //
        //die("----");
        return view('reports.bill');
    }
    
    public function show(Orders $orders) {
        //
        return view('charts.invoice', compact('orders'));
    }

}
