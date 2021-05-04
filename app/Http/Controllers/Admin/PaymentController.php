<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Payment;
use App\Account;
use App\Paymentrcv;
use App\Total_pr;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;


class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payments = Payment::latest()->get();
        return view('admin.payment.index',compact('payments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories= Category::all();
        return view('admin.payment.create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    
        $this->validate($request,[
            'title' => 'required',
            'image' => 'required',
            'categories' => 'required',


        ]);
        $image = $request->file('image');
        $slug = str_slug($request->title);
//        if(isset($image))
//        {
////            make unipue name for image
//            $currentDate = Carbon::now()->toDateString();
//            $imageName  = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
//
//            if(!Storage::disk('public')->exists('payment'))
//            {
//                Storage::disk('public')->makeDirectory('payment');
//            }
//
//            $paymentImage = Image::make($image)->resize(1600,1066)->save();
//            Storage::disk('public')->put('payment/'.$imageName,$paymentImage);
//
//        } else {
//            $imageName = "default.png";
//        }

        $payment = new Payment();
        $payment->user_id = Auth::id();
        $payment->title = $request->title;
        $payment->amount = $request->amount;
        $payment->company = $request->company;
        $payment->is_approved = '0';
        
        

//        $payment->image = $imageName;
        $payment->details = $request->details;
        if(isset($request->status))
        {
            $payment->status = '1';
        }else {
            $payment->status = '0';
        }
        $payment->is_approved = '1';
        $payment->save();
        
     

        $payment->categories()->attach($request->categories);


        Toastr::success('Payment Successfully Saved :)','Success');
        return redirect()->route('admin.payment.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        return view('admin.payment.show',compact('payment'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        $categories= Category::all();

        return view('admin.payment.edit',compact('categories'));
    }

    public function pending()
    {
        $payments = Payment::where('is_approved','0')->get();
        return view('admin.payment.pending',compact('payments'));
    }
    public function approved()
    {
       
        $payments = Payment::where('is_approved','1')->get();
        return view('admin.payment.approve',compact('payments'));
    }

    public function approval($id)
    {   
        // dd($id);
        $account=Payment::find($id);
        // dd($account->is_approved);
         if ($account->is_approved == 0)
        {
            $account->is_approved = '1';
            $account->save();
           
        }
        else{
            Toastr::info('This Post is already approved','Info');
        }
        $paymentrcv=  Paymentrcv::find($id);
         if ($paymentrcv->is_approved == '0')
        {
            $paymentrcv->is_approved = '1';
            $paymentrcv->save();
           
        }
        else {
            Toastr::info('This Post is already approved','Info');
        }
        $payment = Payment::find($id);
        if ($payment->is_approved == '0')
        {
            $payment->is_approved = '1';
            $payment->save();
            Toastr::success('Post Successfully Approved :)','Success');
        } else {
            Toastr::info('This Post is already approved','Info');
        }
        
        
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        // dd($payment->id);
        Payment::find($payment->id)->delete();
        Toastr::success(' Category Successfully Deleted :)','Success');
        return redirect()->back();
    }
}
