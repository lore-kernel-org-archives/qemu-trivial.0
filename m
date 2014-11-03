Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlGjg-00066A-PV
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 07:27:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1XlFFQ-0007bN-HT
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1XlFFL-0007Lv-IA
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:52:32 -0500
Received: from lekensteyn.nl ([178.21.112.251]:58151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1XlFFB-0007Ew-4e; Mon, 03 Nov 2014 05:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2014-q3; 
	h=Message-Id:Date:Subject:Cc:To:From;
	bh=sMMaDU0RbNUR+4uYiVRSZDATLPuZbD0bfy3s22qn80M=; 
	b=pIivL0WviQPf2itgzL1jC7bh3vBu/mbGHC8g2QKpksQrb3ij0nFLH4wxtuuABUPOBw7I9kaWwwXuOELO+FgCKDTbHfv+L35Ybm/q308xKXUCRkD+KFJj4H1KfF61aKfW1DwvN29cmuRK/VGmezjIHPIqGrJ4meXxEq+CptmDBdgyEWJx2Il/4dplKi05RyhFR9F1UprUdZvKMnVt68P+2FChu4IV1sXmX8vR5wdTZzxyO4NLSdENSqsK0N+zvrO44Tf5tGDr4AZacxKSlNjZCm4K0EdLAojzPXy1z0tsKwJrwWKMTRpLN+eAw3MYQnCjmvrnwHQg8CbI+zl+ZQtaag==;
Received: by lekensteyn.nl with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA256:128)
	(Exim 4.80) (envelope-from <peter@lekensteyn.nl>)
	id 1XlFF6-00055A-BM; Mon, 03 Nov 2014 11:52:12 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Date: Mon,  3 Nov 2014 11:52:10 +0100
Message-Id: <1415011930-1964-1-git-send-email-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.1.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.21.112.251
X-Mailman-Approved-At: Mon, 03 Nov 2014 07:27:50 -0500
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] slirp/smbd: disable printer in smb config
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
X-List-Received-Date: Mon, 03 Nov 2014 10:52:37 -0000

The file sharing module should not handle printers, so disable it.
The options 'load printers' and 'printing' have been available since the
beginning (May 1996, commit 0e8fd3398771da2f016d72830179507f3edda51b).
Option 'disable spoolss' is available since Samba 2.0.4, commit
de5f42c9d9172592779fa2504d44544e3b6b1c0d).

Next, "socket address" was reported as deprecated, use a combination of
"interfaces" and "bind interfaces only" instead (available since October
1997, commit 79f4fb52c1ed56fd843f81b4eb0cdd2991d4d0f4).

Override cache directory to avoid writing to a global directory. Option
available since Samba 3.4.0, Jan 2009, commit
19a05bf2f485023b11b41dfae3f6459847d55ef7.

Set "usershare max shared=0" to prevent a global directory from being
used. Option available since Samba 3.0.23, February 2006, commit
5831715049f2d460ce42299963a5defdc160891b.

The most recently option was introduced with Samba 3.4.0, but previously
"state directory" was already added which exists in Samba 3.4.0. As
unknown parameters are ignored (while printing a warning), it should be
safe to add another option.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
Hi,

While trying to share a folder with a guest, I noticed that the option -net
user,smb=... would time out in the guest due to an incompatibility with Samba 4
(see also mailing list message "slirp-smb broken with Samba 4.1" from Jan Kiska
and https://bugs.debian.org/747636). FYI, the bug is fixed in newer Samba
(tested with samba-4.2.0rc1-388-ga3b333a).

While trying to fix that, I found that Samba would try to communicate with CUPS.
This patch disables that fixes some other paths as well. Looking through the
smb.conf manual for "{prefix}", it seems that no other directory is forgotten
now.

As the inetd mode is broken, I work around by starting smbd with the generated
config:

    smbd -s smb.conf -p 1337

Then I forward the ports to the guest with (newline inserted for readability):

    -user net,
        guestfwd=tcp:0.0.0.0:139-cmd:'nc 127.0.0.1 1337',
        guestfwd=tcp:0.0.0.0:445-cmd:'nc 127.0.0.1 1337'

This "works" but is certainly not optimal.

Kind regards,
Peter
---
 net/slirp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index c171119..bad427b 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -523,15 +523,21 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     fprintf(f,
             "[global]\n"
             "private dir=%s\n"
-            "socket address=127.0.0.1\n"
+            "interfaces=127.0.0.1\n"
+            "bind interfaces only=yes\n"
             "pid directory=%s\n"
             "lock directory=%s\n"
             "state directory=%s\n"
+            "cache directory=%s\n"
             "ncalrpc dir=%s/ncalrpc\n"
             "log file=%s/log.smbd\n"
             "smb passwd file=%s/smbpasswd\n"
             "security = user\n"
             "map to guest = Bad User\n"
+            "load printers = no\n"
+            "printing = bsd\n"
+            "disable spoolss = yes\n"
+            "usershare max shares = 0\n"
             "[qemu]\n"
             "path=%s\n"
             "read only=no\n"
@@ -544,6 +550,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             s->smb_dir,
             s->smb_dir,
             s->smb_dir,
+            s->smb_dir,
             exported_dir,
             passwd->pw_name
             );
-- 
2.1.2


