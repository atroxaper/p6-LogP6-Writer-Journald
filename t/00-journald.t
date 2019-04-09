use Test;

use lib 'lib';
use lib './t/resources/00-config-file';
use LogP6 :configure;
use LogP6::WriterConf::Journald;
use Custom;



writer(LogP6::WriterConf::Journald.new(
	:name<journald>, :systemd(Custom::TestSystemd.new), :pattern('%level %msg'),
	#:use-priority,
	#:use-code-line,
	#:use-code-file,
	#:use-code-func,
	:use-mdc,
));

cliche(:name<journald>, :matcher<journald>,
		grooves => ('journald', level($trace)));

say writer-conf-journald(:name<journald>, :pattern('%level %msg'), :systemd(Custom::TestSystemd.new));

my $log = get-logger('journald');
$log.mdc-put('OBJ', 'value');
$log.mdc-put('VAL', 'obj');
sub foo() {
	$log.error('boom');
}
foo;

done-testing;
