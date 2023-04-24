<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
class FrontendController extends Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function homepage(Post $post)
    {
        return view('welcome', ['posts' => $post->paginate(15)]);
    }

    public function blogpage($slug)
    {
        $post = Post::where('slug', $slug)->first();
        return view('blogpage', ['post'=>$post]);

    }
}
