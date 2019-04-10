unit module Custom;

use LogP6::Writer::Journald;

class TestSystemd does LogP6::Writer::Journald::Systemd {
	has $.sent = [];
	method send(*@fields) {
		$!sent.push: |@fields;
	}
}
