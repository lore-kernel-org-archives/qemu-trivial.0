Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqnEn-0001kF-7U
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 18:01:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqnEj-0001iI-Ry
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:01:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gqnEi-0006hM-Rq
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:01:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gqn9Z-0002cC-JP; Mon, 04 Feb 2019 17:55:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFFA059448;
	Mon,  4 Feb 2019 22:55:45 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-162.phx2.redhat.com [10.3.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99A44608C5;
	Mon,  4 Feb 2019 22:55:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-trivial@nongnu.org
Date: Mon,  4 Feb 2019 16:55:42 -0600
Message-Id: <20190204225542.5597-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 04 Feb 2019 22:55:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] checkpatch: Flag suspicious attribution
 lines
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2019 23:01:10 -0000

Flag commit attribution tags that are unusual (often because they
were a typo), but only as a warning (because sometimes a humorous
or otherwise useful tag is intentionally supplied).

This picks the 6-most popular tags, each with 700 or more uses (well,
S-o-b was already checked for case-sensitivity and typos, leaving
only 5 new tags being checked), as determined by:
$ git log | sed -n 's/^ *\([A-Za-z-]*-by:\).*/\1/p' | \
  sort | uniq -c | sort -k1,1n | tail

Most of the rejected lines were obvious typos (among others, we've
had 4 cases of someone being burnt, based on Singed-off-by; and 2
cases of list-reading via an e-reader, based on eviewed-by; there
are also lines forgetting a space after the ':') or otherwise
tongue-in-check (3 Approximately-suggested-by). A few lines not
whitelisted here may be legitimate, but as they are orders of
magnitude rarer, it is therefore not worth worrying about
(7 Requested-by, 3 Co-authored-by, 1 Inspired-by, etc.).

Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: fix regex

 scripts/checkpatch.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88682cb0a9f..4962f74eec1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1456,7 +1456,7 @@ sub process {
 		    ERROR("Author email address is mangled by the mailing list\n" . $h=
erecurr);
 		}

-#check the patch for a signoff:
+#check the patch for a signoff, and that other attribution lines are typ=
ical:
 		if ($line =3D~ /^\s*signed-off-by:/i) {
 			# This is a signoff, if ugly, so do not double report.
 			$signoff++;
@@ -1470,6 +1470,10 @@ sub process {
 				ERROR("space required after Signed-off-by:\n" .
 					$herecurr);
 			}
+		} elsif($line =3D~ /^\s*([A-Za-z-]*)-by:/ &&
+			($1 !~ /(Suggest|Report|Test|Ack|Review)ed/ ||
+			 $line !~ /^\s*[a-z-]*-by:\s/i)) {
+		    WARN("suspicious attribution tag:\n" . $herecurr);
 		}

 # Check if MAINTAINERS is being updated.  If so, there's probably no nee=
d to
--=20
2.20.1


