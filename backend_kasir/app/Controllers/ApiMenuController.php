<?php

namespace App\Controllers;
use App\Models\MenuModel;
use CodeIgniter\RESTful\ResourceController;

class ApiMenuController extends ResourceController
{
    public function get_menu(){
        $models = new MenuModel();

        $get = $models->findAll();
        $data = array();
        $data['data'] = $get;
        $data['code'] = 200;
        $data['message']= "success";

        return $this->respond($data, 200, '');

    }

    public function store(){
        $files = $this->request->getFile('images');
        $name_file = $files->getRandomName();
        $models = new MenuModel();
             $hasil = $models->insert([
            'nama_menu' => $this->request->getVar('nama_menu'),
            'jenis_menu'=> $this->request->getVar('jenis_menu'),
            'harga'=> $this->request->getVar('harga'),
            'images'=> $name_file,
        ]);
        if($hasil){
            $files->move('assets/images',$name_file);
            $data['code'] = 200;
            $data['message'] ="Sukses!";
            return $this->respond($data,200,"oke");
           
        }else{
            $data['code'] = 200;
            $data['message'] = "Gagal!";
            return $this->respond($data,200,"oke");
        }
    }



    public function update_menu(){
        $files = $this->request->getFile('images');
        $name_file = $files->getRandomName();
        $models = new MenuModel();
        $data_old = $models->where("id", $this->request->getVar('id'))->first();
        if($files != null){
           
            $models = new MenuModel();
                $hasil = $models->update($this->request->getVar('id'),[
                'nama_menu' => $this->request->getVar('nama_menu'),
                'jenis_menu'=> $this->request->getVar('jenis_menu'),
                'harga'=> $this->request->getVar('harga'),
                'images'=> $name_file,
            ]);
        }else{
            $models = new MenuModel();
            $hasil = $models->update($this->request->getVar('id'),[
            'nama_menu' => $this->request->getVar('nama_menu'),
            'jenis_menu'=> $this->request->getVar('jenis_menu'),
            'harga'=> $this->request->getVar('harga'),
           
            ]);
        }
        
        if($hasil){
            if($files !=null){
                unlink('assets/images/'.$data_old['images']);
                $files->move('assets/images',$name_file);
            }
           
            $data['code'] = 200;
            $data['message'] ="Sukses!";
            return $this->respond($data,200,"oke");
           
        }else{
            $data['code'] = 200;
            $data['message'] = "Gagal!";
            return $this->respond($data,200,"oke");
        }
    }


    public function destroy(){
        $models = new MenuModel();
        $id = $this->request->getVar('id');
        $data_old = $models->where("id",$id)->first();
      
        $models = new MenuModel();
             $hasil = $models->delete($id);
        if($hasil){
           
           unlink("assets/images/".$data_old['images']);
            $data['code'] = 200;
            $data['message'] ="Sukses!";
            return $this->respond($data,200,"oke");
           
        }else{
            $data['code'] = 200;
            $data['message'] = "Gagal!";
            return $this->respond($data,400,"oke");
        }
    }

   
}