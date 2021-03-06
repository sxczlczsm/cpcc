#!/usr/bin/perl

use strict;
use Getopt::Long;
use Pod::Usage;
use Time::Local;
use Math::Trig;
use Statistics::Descriptive;

my $estimatesFile = 'estimates.csv';
my $tasksFile     = 'tasks.csv';
my $vvsFile       = 'vvs.csv';
my $help          = undef;
my $man           = undef;

my $r = GetOptions(
	'estimates-out|e=s' => \$estimatesFile,
	'tasks-out|t=s'     => \$tasksFile,
	'vvs-out|v=s'       => \$vvsFile,
	'help|?'            => \$help,
	'man'               => \$man,
	'no-estimates'      => sub { undef $estimatesFile },
	'no-tasks'          => sub { undef $tasksFile },
	'no-vvs'            => sub { undef $vvsFile },
);

$help and pod2usage(1);
$man and pod2usage( -exitstatus => 0, -verbose => 2 );

# $estimatesFile && $tasksFile or pod2usage(1);

my $oute  = undef;
my $outt  = undef;
my $vv    = {};
my $vvPos = {};

$vv->{ALL}->{minCreated}     = 2147483648000;
$vv->{ALL}->{maxExecuted}    = 0;
$vv->{ALL}->{nrTasks}        = 0;
$vv->{ALL}->{startTime}      = 0;
$vv->{ALL}->{flightTime}     = 0;
$vv->{ALL}->{execTime}       = 0;
$vv->{ALL}->{distance}       = 0;
$vv->{ALL}->{statStartTime}  = Statistics::Descriptive::Full->new();
$vv->{ALL}->{statFlightTime} = Statistics::Descriptive::Full->new();
$vv->{ALL}->{statExecTime}   = Statistics::Descriptive::Full->new();

sub parseTime {
	$_[0] or shift;
	$_[0] or return '';
	my ( $dt, $m ) = split /,/, $_[0];
	my @a = ( split /[:\s\-]+/, $dt )[ 5, 4, 3, 2, 1, 0 ];
	--$a[4];
	sprintf( "%d%03d", timelocal(@a), $m );
}

sub distance {
	my ( $a, $b ) = @_;
	my $rEarth = 6371000;

	my $dAlpha = ( $a->[0] - $b->[0] ) * pi / 180;
	my $dBeta  = ( $a->[1] - $b->[1] ) * pi / 180;
	my $dLat   = $dAlpha * $rEarth;
	my $dLon   = $dBeta * $rEarth * cos( $a->[0] * pi / 180 );
	sqrt( $dLat * $dLat + $dLon * $dLon );
}

# Task executed: ;VV-0299;41072825-6a68-4484-9d63-54a2b0f54e3f;2016-07-28 15:27:24;2016-07-28 15:28:05;2016-07-28 15:28:06;47.82140509513377;13.039254546879977;50.0;2.1;
sub handleTaskExecutionService {
	$_[0] =~ m/^.*Task executed: ;([^;]*);([^;]*);([^;]*);([^;]*);([^;]*);([^;]*);([^;]*);([^;]*);([^;]*);.*$/
	  or return;
	my $time       = parseTime(@_);
	my $created    = parseTime($3);
	my $start      = parseTime( $4, @_ );
	my $end        = parseTime( $5, @_ );
	my $waitTime   = $start - $created;
	my $flightTime = $end - $start;
	my $execTime   = $waitTime + $flightTime;
	my $tt         = '';

	if ( exists $vvPos->{$2} ) {
		$tt = distance $vvPos->{$2}, [ $6, $7, $8 ];
	}
	$vvPos->{$2} = [ $6, $7, $8 ];

	printf $outt "%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%.2f;%d;%d;%d;\n",
	  $time, $1, $2, $created, $start, $end, $6, $7, $8, $tt, $9, $waitTime, $flightTime, $execTime;

	if ( defined $vv->{$1}->{minCreated} ) {
		$vv->{$1}->{minCreated} > $created and $vv->{$1}->{minCreated}  = $created;
		$vv->{$1}->{maxExecuted} < $end    and $vv->{$1}->{maxExecuted} = $end;
		$vv->{$1}->{nrTasks}++;
		$vv->{$1}->{startTime}  += ( $start - $created ) / 1000.0;
		$vv->{$1}->{flightTime} += ( $end - $start ) / 1000.0;
		$vv->{$1}->{execTime}   += ( $end - $created ) / 1000.0;
		$vv->{$1}->{distance}   += $tt;
	}
	else {
		$vv->{$1}->{minCreated}  = $created;
		$vv->{$1}->{maxExecuted} = $end;
		$vv->{$1}->{nrTasks}     = 1;
		$vv->{$1}->{startTime}   = ( $start - $created ) / 1000.0;
		$vv->{$1}->{flightTime}  = ( $end - $start ) / 1000.0;
		$vv->{$1}->{execTime}    = ( $end - $created ) / 1000.0;
		$vv->{$1}->{distance}    = 0;
	}

	$vv->{ALL}->{minCreated} > $created and $vv->{ALL}->{minCreated}  = $created;
	$vv->{ALL}->{maxExecuted} < $end    and $vv->{ALL}->{maxExecuted} = $end;
	$vv->{ALL}->{nrTasks}++;
	$vv->{ALL}->{startTime}  += ( $start - $created ) / 1000.0;
	$vv->{ALL}->{flightTime} += ( $end - $start ) / 1000.0;
	$vv->{ALL}->{execTime}   += ( $end - $created ) / 1000.0;
	$vv->{ALL}->{distance}   += $tt;
	$vv->{ALL}->{statStartTime}->add_data(  ( $start - $created ) / 1000.0 );
	$vv->{ALL}->{statFlightTime}->add_data( ( $end - $start ) / 1000.0 );
	$vv->{ALL}->{statExecTime}->add_data(   ( $end - $created ) / 1000.0 );
}

sub handlePlantEstimator {
	$_[0] =~ m/^.*(Two): dist=([^,]+), maxV'=([^,]+), maxA=([^,]+), totalTime=([0-9.]+).*$/
	  and printf( $oute "%s;%s;%s;%s;%s;%s;\n", parseTime(@_), $1, $2, $3, $4, $5 ), return;

	$_[0] =~
	  m/^.*(One): dist=([^,]+), maxV=([^,]+), maxA=([^,]+), totalTime=([^,]+), timeOne=([^,]+), timeTwo=([0-9.]+).*$/
	  and printf $oute "%s;%s;%s;%s;%s;%s;%s;%s;\n", parseTime(@_), $1, $2, $3, $4, $5, $6, $7;
}

sub parseFiles {
	map {
		open my $in, "<", $_ or die "Can not open '$_'.";
		map {
			chomp;
			$tasksFile && /cpcc.vvrte.services.VvRteModule.TaskExecutionService - Task executed:/
			  and handleTaskExecutionService($_);
			$estimatesFile && /cpcc.ros.sim.quadrotor.PlantStateEstimatorImpl - (One|Two):/
			  and handlePlantEstimator($_);
		} <$in>;
		close $in;
	} @_;
}

sub writeTasksHeader {
	print $outt
"TIME;VV_NAME;VV_UUID;CREATED;START;END;LATITUDE;LONGITUDE;ALTITUDE;TASK_DISTANCE;TOLERANCE_DISTANCE;START_TIME;FLIGHT_TIME;EXEC_TIME\n";
}

sub writeEstimatesHeader {
	print $oute "TIME;ALGORITHM;DISTANCE;MAX_V;MAX_A;TOTAL_TIME;TIME_ONE;TIME_TWO;\n";
}

sub writeVvsStats {
	open my $outv, ">", $vvsFile or die "Can not open file '$vvsFile'.";
	my @keys = keys %$vv;
	map {
		$vv->{$_}->{startTimePerTask}  = $vv->{$_}->{startTime} / $vv->{$_}->{nrTasks};
		$vv->{$_}->{flightTimePerTask} = $vv->{$_}->{flightTime} / $vv->{$_}->{nrTasks};
	} @keys;

	my $vvCount = ~~ @keys - 1;
	$vv->{ALL}->{startTime}  /= $vvCount;
	$vv->{ALL}->{flightTime} /= $vvCount;
	$vv->{ALL}->{execTime}   /= $vvCount;
	$vv->{ALL}->{nrTasks}    /= $vvCount;
	$vv->{ALL}->{distance}   /= $vvCount;  # TODO: Oje: rvCount ?

	$vv->{ALL}->{avgStartTime}  = $vv->{ALL}->{statStartTime}->mean();
	$vv->{ALL}->{avgFlightTime} = $vv->{ALL}->{statFlightTime}->mean();
	$vv->{ALL}->{avgExecTime}   = $vv->{ALL}->{statExecTime}->mean();
	$vv->{ALL}->{stdStartTime}  = $vv->{ALL}->{statStartTime}->standard_deviation();
	$vv->{ALL}->{stdFlightTime} = $vv->{ALL}->{statFlightTime}->standard_deviation();
	$vv->{ALL}->{stdExecTime}   = $vv->{ALL}->{statExecTime}->standard_deviation();

	my @cols = qw { startTime flightTime execTime nrTasks distance virtualSpeed startTimePerTask flightTimePerTask
	  maxExecuted minCreated avgStartTime avgFlightTime avgExecTime stdStartTime stdFlightTime stdExecTime
	  totalExecTime };

	print $outv map {
		join( ';', 'vvId', map { $_ } @cols ), "\n"
	} ( sort keys %$vv )[0];

	print $outv map {
		my $id = $_;
		$vv->{$id}->{virtualSpeed}  = $vv->{$id}->{distance} / $vv->{$id}->{execTime};
		$vv->{$id}->{totalExecTime} = ( $vv->{$id}->{maxExecuted} - $vv->{$id}->{minCreated} ) / 1000.0;
		join( ';', $id, map { $vv->{$id}->{$_} } @cols ), "\n"
	} sort keys %$vv;

	close $outv;
}

$tasksFile     and ( open $outt, ">", $tasksFile     or die "Can not open file $tasksFile" );
$estimatesFile and ( open $oute, ">", $estimatesFile or die "Can not open file $estimatesFile" );
$tasksFile     and writeTasksHeader;
$estimatesFile and writeEstimatesHeader;

parseFiles @ARGV;

$tasksFile     and close $outt;
$estimatesFile and close $oute;
$vvsFile       and writeVvsStats();

__END__

=head1 NAME

rv-log-2-csv.pl - convert Real Vehicle logs to CSV files for further processing.

=head1 SYNOPSIS

rv-log-2-csv.pl [options]

 Options:

  	-e <fileName>
  	--estimates-out=<fileName>
		The name of the estimator output file.
  
  	-t <fileName>
  	--tasks-out=<fileName>
  		The name of the tasks output file.

 	--help
 		A brief help message.

 	--man
 		The full documentation.

=head1 OPTIONS

=over 8

=item B<--help|-h|?>

 Print a brief help message and exits.

=item B<--man|-m>

 Prints the manual page and exits.

=back

=head1 DESCRIPTION

B<This program> converts Real Vehicle logs to CSV files for further processing.


=cut


