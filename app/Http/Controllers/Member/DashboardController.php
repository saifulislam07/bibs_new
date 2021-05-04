<?php

namespace App\Http\Controllers\Member;
use App\Notice;
use App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use DB;
class DashboardController extends Controller
{
     public function index(){
         $userid = auth()->user()->id;
         $notices =  Notice::all();
         $notice_count =  Notice::all()->count();
         $payment_policy = Category::all()->count();
         $payments = Auth::user()->payments()->latest()->get();
         $getPay = DB::table('payments')
    ->where('is_approved', '=', 1)->where('user_id',$userid)
    ->sum('amount');
        
         
    	return view('member.dashboard',compact('getPay','notices','payments','notice_count','payment_policy'));
    }
}
