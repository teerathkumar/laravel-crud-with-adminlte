
@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Order Management</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="{{ route('orders.create') }}" title="Place an order">Place New Order</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    <table class="table table-bordered table-responsive-lg">
        <tr>
            <th>No</th>
            <th>OrderDate</th>
            <th>CustomerId</th>
            <th>Quantity</th>
            <th>PickupDate</th>
            <th>Date Created</th>
            <th width="280px">Action</th>
        </tr>
        @foreach ($orders as $order)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $order->OrderDate }}</td>
                <td>{{ $order->CustomerId }}</td>
                <td>{{ $order->Quantity }}</td>
                <td>{{ $order->PickupDate }}</td>
                <td>{{ date_format($order->created_at, 'jS M Y') }}</td>
                <td>
                    <form action="{{ route('orders.destroy', $order->OrderId) }}" method="POST">
                        
                        <a href="{{ route('orders.show', $order->OrderId) }}">
                            <i class="fas fa-file-alt fa-lg"></i>
                        </a>

                        <a href="{{ route('orders.show', $order->OrderId) }}" title="show">
                            <i class="fas fa-eye text-success  fa-lg"></i>
                        </a>

                        <a href="{{ route('orders.edit', $order->OrderId) }}">
                            <i class="fas fa-edit  fa-lg"></i>

                        </a>

                        @csrf
                        @method('DELETE')

                        <button type="submit" title="delete" style="border: none; background-color:transparent;">
                            <i class="fas fa-trash fa-lg text-danger"></i>

                        </button>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

    {!! $orders->links() !!}

@endsection
