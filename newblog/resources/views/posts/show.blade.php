@extends('layouts.app', ['activePage' => 'Post-management', 'titlePage' => __('Post Management')])

@section('content')

<div class="content">
       @foreach($posts as $post)
        <div class="container-fluid">
          <h3> {{ $post->title }}</h3>

          <p> {{ $post->details}}</p>
        </div>
     @endforeach
  
</div>
@endsection

@push('js')
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();
    });
  </script>
@endpush
