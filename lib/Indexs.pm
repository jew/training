package Indexsvalue::Schema::Result::Indexs;
use base "DBIx::Class";
__PACKAGE__->load_components("Core");
__PACKAGE__->table("authors");
__PACKAGE__->add_columns (
    "id",
    {
        data_type       => "INT",
        default_value   => undef,
        is_nullable     => 0,
        size            => 8,
    
    },
    "name",
    {
        data_type       => "VARCHAR",
        default_value   => undef,
        is_nullable     => 1,
        size            => 255,        

    },
    "value",
    {
        data_type       => "FLOAT",
        default_value   => undef,
        is_nullable     => 1,
        size            => 10,
    },

);
__PACKAGE__->set_primary_key("id");
1;

