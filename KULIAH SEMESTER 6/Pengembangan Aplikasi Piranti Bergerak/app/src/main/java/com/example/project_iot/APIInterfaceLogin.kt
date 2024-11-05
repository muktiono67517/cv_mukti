package com.example.project_iot

import retrofit2.Call
import retrofit2.http.GET

interface ApiInterface {
    @GET("login")
    fun login(): Call<DataModel>
}
