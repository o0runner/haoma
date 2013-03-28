<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Model_users extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    public function checkuser()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $query = $this->db->query('SELECT username FROM lqm_users LIMIT 1');
        $row = $query->row();
        print_r($row);
    }
}

/* End of file model_users.php */
/* Location: ./application/models/model_users.php */