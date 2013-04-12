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
        $this->load->library('session');
        if ($this->input->post('button')) {
            $this->load->library('form_validation');
            if ($this->session->flashdata('captcha_word') != $this->input->post('captcha')) {
                exit('验证码错误');
            }
            if ($this->form_validation->run()) {
                $this->load->model('Model_users', 'users', TRUE);
                if ($this->users->checkuser()) {
                    $this->load->library('session');
                    $newdata = array('username' => $this->input->post('username'));
                    $this->session->set_userdata($newdata);
                    redirect('/admin/dianhua', 'location', 301);
                } else {
                    $this->load->view('admin_login');
                }
            } else {
                $this->load->view('admin_login');
            }
        } else {
            $this->load->view('admin_login');
        }
    }

    public function dianhua()
    {
        echo '登陆成功<a href="/admin/logout">退出</a>';
    }

    public function logout()
    {
        $this->load->helper('url');
        $this->load->library('session');
        $this->session->sess_destroy();
        redirect('/', 'location', 301);
    }
    
    public function captcha()
    {
        $this->load->helper(array('custom_captcha'));
        $this->load->library('session');
        $vals = array(
            'word' => rand(1000, 10000),
            'img_width' => 70,
            'img_height' => 30,
            'font_path' => './font/Duality.ttf'
        );
        $cap = create_custom_captcha($vals);
        echo $cap;
        $this->session->set_flashdata('captcha_word', $cap);
    }
}

/* End of file index.php */
/* Location: ./application/controllers/index.php */