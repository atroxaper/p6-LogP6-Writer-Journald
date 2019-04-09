use Test;

use lib 'lib';
use lib './t/resources/00-config-file';
use LogP6 :configure;
use LogP6::WriterConf::Journald;
use Custom;

init-from-file('./t/resources/00-config-file/log-p6.json');

my $log = get-logger('journald');
$log.mdc-put('OBJ', 'value');
$log.mdc-put('VAL', 'obj');
sub foo() {
	$log.error('boom');
}
foo;

done-testing;
