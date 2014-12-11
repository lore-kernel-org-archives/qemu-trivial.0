Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8aM-0003cK-Qt
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:35:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aG-0003S4-Eq
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aA-0001yy-Eg
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Zz-0001tJ-R5; Thu, 11 Dec 2014 13:35:12 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 74ADC41D48;
	Thu, 11 Dec 2014 21:35:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BAA008F6;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22981 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:01 +0300
Message-Id: <80b57dda897f541dcaa66369241eebc6f2a18a78.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 13/20] get_maintainer.pl: Remove the
	--git-chief-penguins option
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
X-List-Received-Date: Thu, 11 Dec 2014 18:35:32 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

Linus likely does not want to get e-mails about QEMU, so let's
just remove this option.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Don Slutz <dslutz@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/get_maintainer.pl | 45 +--------------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index af68c6c..f39630e 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -23,7 +23,6 @@ my $email_usename = 1;
 my $email_maintainer = 1;
 my $email_list = 1;
 my $email_subscriber_list = 0;
-my $email_git_penguin_chiefs = 0;
 my $email_git = 0;
 my $email_git_all_signature_types = 0;
 my $email_git_blame = 0;
@@ -60,21 +59,6 @@ my $exit = 0;
 my %commit_author_hash;
 my %commit_signer_hash;
 
-my @penguin_chief = ();
-push(@penguin_chief, "Linus Torvalds:torvalds\@linux-foundation.org");
-#Andrew wants in on most everything - 2009/01/14
-#push(@penguin_chief, "Andrew Morton:akpm\@linux-foundation.org");
-
-my @penguin_chief_names = ();
-foreach my $chief (@penguin_chief) {
-    if ($chief =~ m/^(.*):(.*)/) {
-	my $chief_name = $1;
-	my $chief_addr = $2;
-	push(@penguin_chief_names, $chief_name);
-    }
-}
-my $penguin_chiefs = "\(" . join("|", @penguin_chief_names) . "\)";
-
 # Signature types of people who are either
 # 	a) responsible for the code in question, or
 # 	b) familiar enough with it to give relevant feedback
@@ -187,7 +171,6 @@ if (!GetOptions(
 		'git-blame!' => \$email_git_blame,
 		'git-blame-signatures!' => \$email_git_blame_signatures,
 		'git-fallback!' => \$email_git_fallback,
-		'git-chief-penguins!' => \$email_git_penguin_chiefs,
 		'git-min-signatures=i' => \$email_git_min_signatures,
 		'git-max-maintainers=i' => \$email_git_max_maintainers,
 		'git-min-percent=i' => \$email_git_min_percent,
@@ -256,7 +239,7 @@ if ($sections) {
 
 if ($email &&
     ($email_maintainer + $email_list + $email_subscriber_list +
-     $email_git + $email_git_penguin_chiefs + $email_git_blame) == 0) {
+     $email_git + $email_git_blame) == 0) {
     die "$P: Please select at least 1 email option\n";
 }
 
@@ -671,19 +654,6 @@ sub get_maintainers {
 	    }
 	}
 
-	foreach my $chief (@penguin_chief) {
-	    if ($chief =~ m/^(.*):(.*)/) {
-		my $email_address;
-
-		$email_address = format_email($1, $2, $email_usename);
-		if ($email_git_penguin_chiefs) {
-		    push(@email_to, [$email_address, 'chief penguin']);
-		} else {
-		    @email_to = grep($_->[0] !~ /${email_address}/, @email_to);
-		}
-	    }
-	}
-
 	foreach my $email (@file_emails) {
 	    my ($name, $address) = parse_email($email);
 
@@ -740,7 +710,6 @@ MAINTAINER field selection options:
     --git-all-signature-types => include signers regardless of signature type
         or use only ${signature_pattern} signers (default: $email_git_all_signature_types)
     --git-fallback => use git when no exact MAINTAINERS pattern (default: $email_git_fallback)
-    --git-chief-penguins => include ${penguin_chiefs}
     --git-min-signatures => number of signatures required (default: $email_git_min_signatures)
     --git-max-maintainers => maximum maintainers to add (default: $email_git_max_maintainers)
     --git-min-percent => minimum percentage of commits required (default: $email_git_min_percent)
@@ -1281,10 +1250,6 @@ sub vcs_find_signers {
     save_commits_by_author(@lines) if ($interactive);
     save_commits_by_signer(@lines) if ($interactive);
 
-    if (!$email_git_penguin_chiefs) {
-	@signatures = grep(!/${penguin_chiefs}/i, @signatures);
-    }
-
     my ($types_ref, $signers_ref) = extract_formatted_signatures(@signatures);
 
     return ($commits, @$signers_ref);
@@ -1296,10 +1261,6 @@ sub vcs_find_author {
 
     @lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
 
-    if (!$email_git_penguin_chiefs) {
-	@lines = grep(!/${penguin_chiefs}/i, @lines);
-    }
-
     return @lines if !@lines;
 
     my @authors = ();
@@ -1925,10 +1886,6 @@ sub vcs_file_blame {
 
 		@lines = &{$VCS_cmds{"execute_cmd"}}($cmd);
 
-		if (!$email_git_penguin_chiefs) {
-		    @lines = grep(!/${penguin_chiefs}/i, @lines);
-		}
-
 		last if !@lines;
 
 		my @authors = ();
-- 
2.1.3


