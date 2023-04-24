<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Post $post)
    {
        //
        return view('posts.index', ['posts' => $post->paginate(15)]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('posts.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validator =  Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'slug' => 'required|string|max:255|unique:posts',
            'details' => 'required|string',
            
        ],[]);

        if($validator->fails()){
            return redirect()->back()->withErrors($validator)->withInput();         
        }

        $post = new Post;
        $post->title = $request->title;
        $post->slug = $request->slug;
        $post->details = $request->details;
        $post->save();

        return redirect()->route('posts.index')
        ->withStatus(__('Post has been created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
         return view('posts.show',['posts' => $post->paginate(15)]);    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        return view('posts.edit',compact('post'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         $validator =  Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'details' => 'required|string',
          
        ]);

        if($validator->fails()){
            return redirect()->back()->withErrors($validator)->withInput();         
        }

        

        $post = Post::find($id);
        $post->title = $request->title;
        $post->details = $request->details;
        $post->save();

        return redirect()->route('posts.index')
        ->withStatus(__('Post Has Been updated successfully'));    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post->delete();
        
        return redirect()->route('posts.index')
        ->withStatus(__('post has been deleted successfully'));
    }
}
