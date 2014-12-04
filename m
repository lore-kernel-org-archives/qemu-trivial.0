Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwXZ1-0007pr-5b
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:39:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1XwV4B-00045s-7c
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 06:59:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1XwV41-0001hS-JL
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 06:59:27 -0500
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:57152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1XwV41-0001h4-At
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 06:59:17 -0500
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 4 Dec 2014 11:59:14 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 4 Dec 2014 11:59:13 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4CEAE2190041; 
	Thu,  4 Dec 2014 11:58:44 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id sB4BxCZC54984926; Thu, 4 Dec 2014 11:59:12 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id sB4BxBRF024752; Thu, 4 Dec 2014 04:59:11 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-21.boeblingen.de.ibm.com
	[9.152.224.21])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id sB4BxAr2024698; Thu, 4 Dec 2014 04:59:10 -0700
Date: Thu, 4 Dec 2014 12:59:09 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Message-ID: <20141204125909.03040aaa@oc7435384737.ibm.com>
In-Reply-To: <20141103135024.5681f929@oc7435384737.ibm.com>
References: <1413980918-6130-1-git-send-email-thuth@linux.vnet.ibm.com>
	<5448028D.4050408@terremark.com>
	<20141103135024.5681f929@oc7435384737.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14120411-0005-0000-0000-000002566BCB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
X-Mailman-Approved-At: Thu, 04 Dec 2014 09:39:25 -0500
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Don Slutz <dslutz@verizon.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] get_maintainer.pl: Remove
 the --git-chief-penguins option
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2014 11:59:33 -0000

On Mon, 3 Nov 2014 13:50:24 +0100
Thomas Huth <thuth@linux.vnet.ibm.com> wrote:

> On Wed, 22 Oct 2014 15:16:29 -0400
> Don Slutz <dslutz@verizon.com> wrote:
> 
> > On 10/22/14 08:28, Thomas Huth wrote:
> > > Linus likely does not want to get e-mails about QEMU, so let's
> > > just remove this option.
> > >
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > 
> > Looks good to me.
> > 
> > Reviewed-by: Don Slutz <dslutz@verizon.com>
> 
> 
> Ping?

Ping again


> > > ---
> > >   scripts/get_maintainer.pl |   45 +--------------------------------------------
> > >   1 files changed, 1 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> > > index 38334de..4034997 100755
> > > --- a/scripts/get_maintainer.pl
> > > +++ b/scripts/get_maintainer.pl
> > > @@ -23,7 +23,6 @@ my $email_usename = 1;
> > >   my $email_maintainer = 1;
> > >   my $email_list = 1;
> > >   my $email_subscriber_list = 0;
> > > -my $email_git_penguin_chiefs = 0;
> > >   my $email_git = 0;
> > >   my $email_git_all_signature_types = 0;
> > >   my $email_git_blame = 0;
> > > @@ -60,21 +59,6 @@ my $exit = 0;
> > >   my %commit_author_hash;
> > >   my %commit_signer_hash;
> > >   
> > > -my @penguin_chief = ();
> > > -push(@penguin_chief, "Linus Torvalds:torvalds\@linux-foundation.org");
> > > -#Andrew wants in on most everything - 2009/01/14
> > > -#push(@penguin_chief, "Andrew Morton:akpm\@linux-foundation.org");
> > > -
> > > -my @penguin_chief_names = ();
> > > -foreach my $chief (@penguin_chief) {
> > > -    if ($chief =~ m/^(.*):(.*)/) {
> > > -	my $chief_name = $1;
> > > -	my $chief_addr = $2;
> > > -	push(@penguin_chief_names, $chief_name);
> > > -    }
> > > -}
> > > -my $penguin_chiefs = "\(" . join("|", @penguin_chief_names) . "\)";
> > > -
> > >   # Signature types of people who are either
> > >   # 	a) responsible for the code in question, or
> > >   # 	b) familiar enough with it to give relevant feedback
> > > @@ -187,7 +171,6 @@ if (!GetOptions(
> > >   		'git-blame!' => \$email_git_blame,
> > >   		'git-blame-signatures!' => \$email_git_blame_signatures,
> > >   		'git-fallback!' => \$email_git_fallback,
> > > -		'git-chief-penguins!' => \$email_git_penguin_chiefs,
> > >   		'git-min-signatures=i' => \$email_git_min_signatures,
> > >   		'git-max-maintainers=i' => \$email_git_max_maintainers,
> > >   		'git-min-percent=i' => \$email_git_min_percent,
> > > @@ -256,7 +239,7 @@ if ($sections) {
> > >   
> > >   if ($email &&
> > >       ($email_maintainer + $email_list + $email_subscriber_list +
> > > -     $email_git + $email_git_penguin_chiefs + $email_git_blame) == 0) {
> > > +     $email_git + $email_git_blame) == 0) {
> > >       die "$P: Please select at least 1 email option\n";
> > >   }
> > >   
> > > @@ -663,19 +646,6 @@ sub get_maintainers {
> > >       }
> > >   
> > >       if ($email) {
> > > -	foreach my $chief (@penguin_chief) {
> > > -	    if ($chief =~ m/^(.*):(.*)/) {
> > > -		my $email_address;
> > > -
> > > -		$email_address = format_email($1, $2, $email_usename);
> > > -		if ($email_git_penguin_chiefs) {
> > > -		    push(@email_to, [$email_address, 'chief penguin']);
> > > -		} else {
> > > -		    @email_to = grep($_->[0] !~ /${email_address}/, @email_to);
> > > -		}
> > > -	    }
> > > -	}
> > > -
> > >   	foreach my $email (@file_emails) {
> > >   	    my ($name, $address) = parse_email($email);
> > >   
> > > @@ -732,7 +702,6 @@ MAINTAINER field selection options:
> > >       --git-all-signature-types => include signers regardless of signature type
> > >           or use only ${signature_pattern} signers (default: $email_git_all_signature_types)
> > >       --git-fallback => use git when no exact MAINTAINERS pattern (default: $email_git_fallback)
> > > -    --git-chief-penguins => include ${penguin_chiefs}
> > >       --git-min-signatures => number of signatures required (default: $email_git_min_signatures)
> > >       --git-max-maintainers => maximum maintainers to add (default: $email_git_max_maintainers)
> > >       --git-min-percent => minimum percentage of commits required (default: $email_git_min_percent)
> > > @@ -1273,10 +1242,6 @@ sub vcs_find_signers {
> > >       save_commits_by_author(@lines) if ($interactive);
> > >       save_commits_by_signer(@lines) if ($interactive);
> > >   
> > > -    if (!$email_git_penguin_chiefs) {
> > > -	@signatures = grep(!/${penguin_chiefs}/i, @signatures);
> > > -    }
> > > -
> > >       my ($types_ref, $signers_ref) = extract_formatted_signatures(@signatures);
> > >   
> > >       return ($commits, @$signers_ref);
> > > @@ -1288,10 +1253,6 @@ sub vcs_find_author {
> > >   
> > >       @lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
> > >   
> > > -    if (!$email_git_penguin_chiefs) {
> > > -	@lines = grep(!/${penguin_chiefs}/i, @lines);
> > > -    }
> > > -
> > >       return @lines if !@lines;
> > >   
> > >       my @authors = ();
> > > @@ -1917,10 +1878,6 @@ sub vcs_file_blame {
> > >   
> > >   		@lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
> > >   
> > > -		if (!$email_git_penguin_chiefs) {
> > > -		    @lines = grep(!/${penguin_chiefs}/i, @lines);
> > > -		}
> > > -
> > >   		last if !@lines;
> > >   
> > >   		my @authors = ();
> > 
> 
> 


