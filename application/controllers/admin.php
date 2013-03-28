<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class admin extends CI_Controller {

    //默认面板
    public function index()
    {
        $this->load->helper('url');
        $this->load->library('session');
        $user = $this->session->userdata('user');
        if (!$user) {
            redirect('/admin/signin', 'location', 301);
        }
    }
    
    //登录
    public function signin()
    {
        $this->load->helper(array('form', 'url'));
        if ($this->input->post('button')) {
            $this->load->library('form_validation'); 
            if ($this->form_validation->run()) {
                $this->load->model('Model_users', 'users', TRUE);
                echo $this->users->checkuser();
                echo '验证成功';
            } else {
                $this->load->view('admin_login');
            }
        } else {
            $this->load->view('admin_login');
        }
    }
}

/* End of file index.php */
/* Location: ./application/controllers/index.php */