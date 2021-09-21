<!DOCTYPE html>
<html lang="en">
    @include('includes.header')
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            @include('includes.sidebar');

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">


                <div class="container">
                    @yield('content')
                </div>

                <!-- /.content -->
            </div>
        </div>    
    </body>
    
    @include('includes.footer')
</html>
