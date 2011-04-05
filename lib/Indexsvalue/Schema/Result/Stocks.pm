package Indexsvalue::Schema::Result::Stocks;
use base "DBIx::Class";

__PACKAGE__->load_components(qw/TimeStamp Core/);
__PACKAGE__->table("Stocks");
__PACKAGE__->add_columns (
    "id"           => { data_type => "INT",       is_nullable => 0, },
    "name"         => { data_type => "VARCHAR",   is_nullable => 1, size => 255, },
    "value"        => { data_type => "FLOAT",     is_nullable => 1, },
    "lastmodified" => { data_type => 'datetime',set_on_create => 1, set_on_update => 1 },  
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("name", ["name"]);
1;

