Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8J-0001Js-Tc
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8C-00013X-T6
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8B-0002AA-UC
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY86-00027M-Fy; Mon, 11 Jan 2016 03:47:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 543D0403E8;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5453FADE;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28794 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:53 +0300
Message-Id: <8f32510f1ca72332b9a662579e951f67d636142e.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/19] scripts/checkpatch.pl: Don't allow
	special cases of unspaced operators
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:18 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The checkpatch.pl script has a special case to permit the following
operators to have no spaces around them:
 <<  >>  &  ^  |  +  -  *  /  %

QEMU style prefers all operators to consistently have spacing around
them, so remove this special case handling. This avoids reviewers
having to manually note it during code review.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/checkpatch.pl | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b0f6e11..efca817 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1890,19 +1890,6 @@ sub process {
 						ERROR("space prohibited after that '$op' $at\n" . $hereptr);
 					}
 
-
-				# << and >> may either have or not have spaces both sides
-				} elsif ($op eq '<<' or $op eq '>>' or
-					 $op eq '&' or $op eq '^' or $op eq '|' or
-					 $op eq '+' or $op eq '-' or
-					 $op eq '*' or $op eq '/' or
-					 $op eq '%')
-				{
-					if ($ctx =~ /Wx[^WCE]|[^WCE]xW/) {
-						ERROR("need consistent spacing around '$op' $at\n" .
-							$hereptr);
-					}
-
 				# A colon needs no spaces before when it is
 				# terminating a case value or a label.
 				} elsif ($opv eq ':C' || $opv eq ':L') {
-- 
2.1.4


