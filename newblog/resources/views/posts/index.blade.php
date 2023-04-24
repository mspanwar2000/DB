@extends('layouts.app', ['activePage' => 'Post-management', 'titlePage' => __('Post Management')])

@section('content')

<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
          <div class="card">
            <div class="card-header card-header-primary">
              <h4 class="card-title ">Posts</h4>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-12 text-right">
                  <a href="{{ route('posts.create') }}" class="btn btn-sm btn-primary">Add Post</a>
                </div>
              </div>

              @if (session('status'))
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <i class="material-icons">close</i>
                        </button>
                        <span>{{ session('status') }}</span>
                      </div>
                    </div>
                  </div>
                @endif

              <div class="table-responsive">
                <table class="table">
                  <thead class=" text-primary">
                    <tr><th>
                    Title
                    </th>
                    <th>
                      Creation date
                    </th>
                    <th class="text-right">
                      Actions
                    </th>
                  </tr></thead>
                  <tbody>
                    @foreach($posts as $post)
                      <tr>
                        <td>
                          {{ $post->title }}
                        </td>
                        
                        <td>
                        {{ $post->created_at }}
                        </td>
                        <td class="td-actions text-right">
                            <a rel="tooltip" class="btn btn-light btn-link" href="{{route('posts.edit', $post->id)}}" data-original-title="Edit Post" title="Post Edit">
                              <i class="material-icons">Edit</i>
                              <div class="ripple-container"></div>
                            </a>
                            <form action="{{ route('posts.destroy', $post->id) }}" id="delete_form" method="POST" style="float: right;">
                                                        {{ csrf_field() }}
                                                        {{ method_field('DELETE') }}
                                                        <button rel="tooltip" class="btn btn-danger">
                                                          Delete
                                                        </button>
                                                      </form>
                            
                        </td>
                      </tr>
                    @endforeach
                    </tbody>
                </table>
              </div>
            </div>
          </div>
          
      </div>
    </div>
  </div>
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
