<?php

namespace App\Http\Controllers;

use App\Models\Orders;
use App\Models\Customers;
use App\Models\Foods;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class HomeController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {


        $Stock = DB::table('orders')
                ->join('orderitems', 'orderitems.OrderId', '=', 'orders.OrderId')
                ->join('FoodItems', 'FoodItems.FoodId', '=', 'orderitems.FoodId')
                ->groupBy('FoodItems.FoodId')
                ->select('FoodItems.Quantity as totall', DB::raw('(sum(orderitems.Quantity)) as available '))->get()->toArray();
        $from = date("Y-m-d");
$to = date("Y-m-d", strtotime("-7 days"));
$to_m = date("Y-m-d", strtotime("-1 month"));
        $Income_Wk = DB::table('orders')
                ->join('orderitems', 'orderitems.OrderId', '=', 'orders.OrderId')
                ->join('FoodItems', 'FoodItems.FoodId', '=', 'orderitems.FoodId')
                ->whereRaw('orders.OrderDate between "'.$to.'" and "'. $from.'" ')
                //->whereBetween( 'orders.OrderDate', array($from, $to))
                ->groupBy('FoodItems.FoodId')
                ->select(DB::raw('(sum(orderitems.UnitPrice)) as weekk'))->get()->toArray();
                //->select(DB::raw('(sum(orderitems.UnitPrice)) as "week" '))->toSql();
        //dd($Income_Wk);
        $Income_Month = DB::table('orders')
                ->join('orderitems', 'orderitems.OrderId', '=', 'orders.OrderId')
                ->join('FoodItems', 'FoodItems.FoodId', '=', 'orderitems.FoodId')
                ->whereRaw('orders.OrderDate between "'.$to_m.'" and "'. $from.'" ')
                ->groupBy('FoodItems.FoodId')
                ->select(DB::raw('(sum(orderitems.UnitPrice)) as monthh'))->get()->toArray();
        

        $data = [
            'stock' => $Stock[0],
            'inc_w' => $Income_Wk[0],
            'inc_m' => $Income_Month[0]
        ];


        return view('home.index', compact('data'));

        //return view('home.index');
    }

}
