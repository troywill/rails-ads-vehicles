#!/usr/bin/env perl
use warnings;
use strict;

# See http://www.w3.org/TR/html401/interact/forms.html#edef-SELECT if curious
# and see http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html
# http://paulsturgess.co.uk/articles/show/23-select-and-collect-with-conditions-in-ruby-on-rails ( October 2010 )

#### Begin section: Edit these four variables for the spin box to the foreign key ####
# Tip: Ask yourself which view will have the selection code. The model associated with this view
# will be the child model

my $child = 'model'; # The child table singularized, e.g. 'model'

my $foreign_key = 'make_id'; # The foreign key in the child table, e.g. 'make_id'
my $foreign_model = 'Make'; # The model of the parent table, e.g. 'Make'
my $foreign_attribute = 'name'; # The thing you want to lookup in the foreign table, e.g. 'name'

# Tip 1: the table that belongs_to another table is the child table
# Tip 2: the child table with have the foreign key in it, e.g. make_id

# Here's an example to distinguish the child table:
# Table "make" ( Suzuki, Honda, Yamaha, .. )
# Table "model" ( 2007 Suzuki Burgman, 2001 Suzuki Savage, 2008 Honda Goldwing, ... )
# "model" is a child table to the parent table "make"
# "model" will have the html select control generate by this program
#### End section: Edit these variables ####

my $spin_box = &spin_box;
open( my $out, ">>", "${child}_${foreign_model}.html.erb");
print $out "$spin_box\n";

sub spin_box {
    my $spin_box = "<%= select(\"$child\", \"$foreign_key\", $foreign_model.find(:all).collect { |p| [p.$foreign_attribute, p.id]}) %>";
    return $spin_box;
}
