@extends('layouts.app', ['activePage' => 'Post-management', 'titlePage' => __('Post Management')])

@section('content')

<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <form method="post" action="{{ route('posts.store') }}" autocomplete="off" class="form-horizontal">
            @csrf
            @method('post')
          <div class="card">
            <div class="card-header card-header-primary">
              <h4 class="card-title "> Add Blog</h4>
              <p class="card-category"> Here you can manage Blog</p>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-12 text-left">
                  <a href="{{ route('posts.index') }}" class="btn btn-sm btn-primary">back</a>
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
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Title') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('title') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}" name="title" id="input-title" type="text" placeholder="{{ __('title') }}" value="" required="true" aria-required="true"/>
                      @if ($errors->has('title'))
                        <span id="title-error" class="error text-danger" for="input-title">{{ $errors->first('title') }}</span>
                      @endif
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Slug') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('slug') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('slug') ? ' is-invalid' : '' }}" name="slug" id="input-slug" type="text" placeholder="{{ __('slug') }}" value="" required="true" aria-required="true"/>
                      @if ($errors->has('slug'))
                        <span id="slug-error" class="error text-danger" for="input-slug">{{ $errors->first('slug') }}</span>
                      @endif
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Details') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('details') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('details') ? ' is-invalid' : '' }}" name="details" id="input-details" type="text" placeholder="{{ __('details') }}" value="" required />
                      @if ($errors->has('details'))
                        <span id="details-error" class="error text-danger" for="input-details">{{ $errors->first('details') }}</span>
                      @endif
                    </div>
                  </div>
                </div>
              
            </div>
            <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-primary">{{ __('Save') }}</button>
              </div>
          </div>
        </form>
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
