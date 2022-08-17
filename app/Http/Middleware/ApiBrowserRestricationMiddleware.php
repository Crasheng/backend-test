<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ApiBrowserRestricationMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if(in_array($request->getHost(), ['127.0.0.1']) == false)
        {
            return response('', 400);
        }
        return $next($request);
    }
}
