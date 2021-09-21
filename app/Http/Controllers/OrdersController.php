<?php

namespace App\Http\Controllers;

use App\Models\Orders;
use App\Models\Customers;
use App\Models\Foods;
use App\Http\Controllers\ChartsController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class OrdersController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //
        //die("----");
        $orders = Orders::latest()->paginate(5);

        return view('orders.index', compact('orders'))
                        ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        $Customers = Customers::all();
        $Foods = Foods::all();
        $data = [
            'foods' => $Foods,
            'customers' => $Customers
        ];
        return view('orders.create', compact('data'));

        //return View::make('orders.create')->with($data);
        //
        //return view('orders.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
//        //
//        $request->validate([
//            'name' => 'required',
//            'introduction' => 'required',
//            'location' => 'required',
//            'cost' => 'required'
//        ]);

        $data = $request->all();
        $customerId = $data['customer'];
        $food = $data['food'];
        $quantity = $data['quantity'];
        $OrderCreate = ['CustomerId' => $customerId, 'Quantity' => $quantity, 'OrderDate' => date("Y-m-d"), 'PickupDate' => date("Y-m-d")];


        //dd($request->all());
        //die;
        $UnitPrice = DB::table('fooditems')
                        ->where('FoodId', $food)
                        ->pluck('UnitPrice')->first();
        $OrderId = DB::table('orders')->insertGetId(
                $OrderCreate
        );
        DB::table('orderitems')->insert(
                ['FoodId' => $food, 'OrderId' => $OrderId, 'Quantity' => $quantity, 'UnitPrice' => $UnitPrice]
        );
        //Orders::create($OrderCreate);
        //die;
        return redirect()->route('orders.index')
                        ->with('success', 'Orders created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function show(Orders $orders) {
        //
        
        return view('orders.invoice', compact('orders'));
    }
    public function invoice(Orders $orders) {
        //
        return view('orders.invoice', compact('orders'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function edit(Orders $orders) {
        //
        return view('orders.edit', compact('orders'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Orders $orders) {
        //
        $orders->update($request->all());

        return redirect()->route('orders.index')
                        ->with('success', 'Order updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function destroy(Orders $orders) {
        //
        $orders->delete();

        return redirect()->route('orders.index')
                        ->with('success', 'Order deleted successfully');
    }

}
