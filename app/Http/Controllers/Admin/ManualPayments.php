<?php

namespace App\Http\Controllers\Admin;

use App\rc;
use App\User;
use App\Payment;
use App\Account;
use App\Paymentrcv;
use App\Category;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;



class ManualPayments extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $userlist=  DB::table('users')
       ->where('role_id',2)
       ->get();
       $categories= Category::all();
       return view('admin.manual.manualFee',get_defined_vars());
   }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */




 public function store(Request $request)
    {


       // dd($request->all());

        $this->validate($request,[
            'title' => 'required',
            'image' => 'required',
            'categories' => 'required',
        ]);
        $image = $request->file('image');
        $slug = str_slug($request->title);

        $payment = new Payment();
        $payment->user_id = $request->userID;
        $payment->title = $request->title;
        $payment->amount = $request->amount;
        $payment->company = $request->company;
        $payment->is_approved = 0;
        
//        $payment->image = $imageName;
        $payment->details = $request->details;
        if(isset($request->status))
        {
            $payment->status = true;
        }else {
            $payment->status = false;
        }
        $payment->is_approved = true;
        $payment->save();
        


        $payment->categories()->attach($request->categories);

    
       return redirect()->back()->with('message', 'IT WORKS!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function show(rc $rc)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function edit(rc $rc)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, rc $rc)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\rc  $rc
     * @return \Illuminate\Http\Response
     */
    public function destroy(rc $rc)
    {
        //
    }
}
