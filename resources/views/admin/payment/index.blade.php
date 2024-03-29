
@extends('layouts.backend.app')

@section('title','payment-policy')
@push('css')
    <link href="{{asset('assets/backend/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css')}}" rel="stylesheet">
@endpush
@section('content')
<style>
.tablestyle3 {
    margin: 0;
    padding: 0;
    line-height: 0;
    font-size: 12px;
}
</style>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">

                    <h2>
                      ALL PAYMENT
                        <span class="badge bg-blue">{{ $payments->count() }}</span>
                    </h2>
                    <br>
{{--                    <a href="{{route('admin.payment.create')}}" class="btn btn-primary">ADD NEW PAYMENT</a>--}}
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover dataTable js-exportable tablestyle3">
                            <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>Title</th>
                                <th>Amount</th>
                                <th>Company</th>
                                <th>Details</th>
                                <th>Phone</th>
                                <th>Status</th>

                                <th>Created at</th>
                                
                                <th>Action</th>

                            </tr>
                            </thead>
                            <tbody>
                            @foreach($payments as $key=>$payment)
                                <tr>

                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ $payment-> user->name }}</td>
                                    <td>{{ $payment-> title }}</td>
                                    <td>{{ $payment-> amount }}</td>
                                    <td>{{ $payment-> company }}</td>
                                    <td>{{ $payment-> details }}</td>
                                    <td>{{ $payment-> phone }}</td>
                                    <td>
                                        @if($payment->is_approved == 1)
                                            <span class="badge bg-blue">Approved</span>
                                        @else
                                            <span class="badge bg-pink">Pending</span>
                                        @endif
                                    </td>
{{--                                    <td>--}}
{{--                                        @if($payment->status == 0)--}}
{{--                                            <span class="badge bg-blue">Published</span>--}}
{{--                                        @else--}}
{{--                                            <span class="badge bg-pink">Pending</span>--}}
{{--                                        @endif--}}
{{--                                    </td>--}}
                                    <td>{{ $payment-> created_at }}</td>
                                 
                                    <td class="text-center">
                                        <a href="{{ route('admin.payment.show',$payment->id) }}" class="btn btn-info waves-effect">
                                            <i class="material-icons">visibility</i>
                                        </a>
                                        <a href="{{ route('admin.payment.edit',$payment->id) }}" class="btn btn-info waves-effect">
                                            <i class="material-icons">edit</i> </a>

                                        <button class="btn btn-danger waves-effect" type="button" onclick="deletePayment({{ $payment->id }})">
                                            <i class="material-icons">delete</i>
                                        </button>
                                        <form id="delete-form-{{ $payment->id }}" action="{{ route('admin.payment.destroy',$payment->id) }}" method="POST" style="display: none;">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                    </td>

                                </tr>

                            @endforeach

                            </tbody>
                            <tfoot>
                            <tr>

                                 <th>SL</th>
                                <th>Name</th>
                                <th>Title</th>
                                <th>Amount</th>
                                <th>Company</th>
                                <th>Details</th>
                                <th>Phone</th>
                                <th>Status</th>

                                <th>Created at</th>
                                
                                <th>Action</th>
                            </tr>
                            </tfoot>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('js')

    <script src="{{asset('assets/backend/plugins/jquery-datatable/jquery.dataTables.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/buttons.flash.min.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/jszip.min.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/pdfmake.min.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/vfs_fonts.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/backend/plugins/jquery-datatable/extensions/export/buttons.print.min.js')}}"></script>
    <script src="{{(asset('assets/backend/js/pages/tables/jquery-datatable.js'))}}"></script>
    <script src="https://unpkg.com/sweetalert2@7.19.1/dist/sweetalert2.all.js"></script>
    <script type="text/javascript">
        function deletePayment(id) {
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    event.preventDefault();
                    document.getElementById('delete-form-'+id).submit();
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    swal(
                        'Cancelled',
                        'Your data is safe :)',
                        'error'
                    )
                }
            })

        }
    </script>
@endpush
