<?php

namespace App\Http\Controllers\Admin;
use App\Payment;
use App\Category;
use App\Sale;
use App\Notice;
use App\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class DashboardController extends Controller
{
    public function index(){
        $notices =  Notice::all();
        $payments = Payment::where('is_approved',false)->latest()->get();
        
        $getPay = DB::table('payments')
    ->where('is_approved', '=', 1)
    ->sum('amount');
        
    //    dd($getPay);
        
        
        $payment_categories = Category::all();
        $total_pending_payments = Payment::where('is_approved','0')->count();
        $total_approve_payments = Payment::where('is_approved','1')->count();
        $payment_policy = Category::all()->count();
        $total_sale=Sale::all()->count();
        $total_product=Product::all()->count();
        
    	return view('admin.dashboard',compact('getPay','payments','total_pending_payments','total_approve_payments','payment_policy','notices','total_sale','total_product',
                'payment_categories'));
       
    }
}
