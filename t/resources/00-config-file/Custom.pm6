unit module Custom;

use LogP6::Writer::Journald;

class TestSystemd does LogP6::Writer::Journald::Systemd {
	method send(*@fields) {
		say @fields;
		.perl.say for @fields;
	}
}
