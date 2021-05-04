@extends('layouts.backend.app')

@section('title','Manual Fee')

@push('css')
<style>
    .bs-caret {
        display: none;

    }
    .filter-option.pull-left {
        display: none;
    }
    button.btn.dropdown-toggle.btn-default {
        display: none;
    }
</style>
@endpush

@section('content')
<div class="container-fluid">
    <!-- Vertical Layout | With Floating Label -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

          @if(session()->has('message'))
          <div class="alert alert-success">
            {{ session()->get('message') }}
        </div>
        @endif

  

        <div class="card">
            <div class="header">
                <h2>
                    ADD NEW Payment (Manual)
                </h2>
            </div>

            <div class="body">
                <form action="{{ route('admin.mpayment.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group form-float">

                      <select style="width:200px;height:40px;" name="userID" id="" class="" required>
                        <option selected="" disabled="" value="">Select Memebr</option>

                        @foreach($userlist as $each)
                        <option   value="{{ $each->id }}">{{ $each->name }}</option>
                        @endforeach
                    </select>


                </div>

                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" id="title" class="form-control" name="title">
                        <label class="form-label">Payment Way Example: Bkash,Nagad,Rocket,Bank Payment</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" id="amount" class="form-control" name="amount">
                        <label class="form-label">Amount</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" id="company" class="form-control" name="company">
                        <label class="form-label">Company Name</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="text" id="phone" class="form-control" name="phone">
                        <label class="form-label">Contact Number</label>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <textarea type="textarea" id="deatils" class="form-control" name="details">
                        </textarea>
                        <label class="form-label">Details</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlFile1">Payment Prove</label>
                    <input name="image" type="file" class="form-control-file">
                </div>
                <div class="form-group form-float">
                    <div class="form-line {{ $errors->has('categories') ? 'focused error' : '' }}">
                        <!-- <label for="category">Payment  Category</label> -->
                        <select style="width:200px;height:40px;" name="categories" id="category" class="" required="">
                           <!--  <select name="categories[]" id="category" class="form-control" data-live-search="true" multiple> -->
                              <option value="" selected="" disabled="">Select Cateogry</option>
                              @foreach($categories as $category)
                              <option value="{{ $category->id }}">{{ $category->name }}</option>
                              @endforeach
                          </select>
                      </div>
                  </div>



                  <a  class="btn btn-danger m-t-15 waves-effect" href="{{ route('admin.payment.index') }}">BACK</a>
                  <button type="submit" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
              </form>
          </div>
      </div>
  </div>
</div>
</div>
@endsection

@push('script')

@endpush
