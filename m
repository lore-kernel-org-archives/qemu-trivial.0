Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1claTJ-0003mM-IR
	for mharc-qemu-trivial@gnu.org; Wed, 08 Mar 2017 07:13:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1claTG-0003ke-Sv
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 07:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1claTF-0000hm-IP
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 07:13:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1claT9-0000gz-Vd; Wed, 08 Mar 2017 07:13:28 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23ECF80F93;
	Wed,  8 Mar 2017 12:13:28 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v28CDQeo022806; Wed, 8 Mar 2017 07:13:27 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed,  8 Mar 2017 13:13:25 +0100
Message-Id: <1488975205-26312-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 08 Mar 2017 12:13:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Fix broken URLs of amnhltm.zip and
 dosidle210.zip
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
X-List-Received-Date: Wed, 08 Mar 2017 12:13:36 -0000

There are some broken URLs in the qemu-doc which reference tools that
are not available at their original location anymore. Fortunately, they
have been mirrored to archive.org, so point to that location instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 794ab4a..50411bc 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1878,8 +1878,8 @@ resolution modes which the Cirrus Logic BIOS does not support (i.e. >=
 Windows 9x does not correctly use the CPU HLT
 instruction. The result is that it takes host CPU cycles even when
 idle. You can install the utility from
-@url{http://www.user.cityline.ru/~maxamn/amnhltm.zip} to solve this
-problem. Note that no such tool is needed for NT, 2000 or XP.
+@url{http://web.archive.org/web/20060212132151/http://www.user.cityline.ru/~maxamn/amnhltm.zip}
+to solve this problem. Note that no such tool is needed for NT, 2000 or XP.
 
 @subsubsection Windows 2000 disk full problem
 
@@ -1927,9 +1927,9 @@ vvfat block device ("-hdb fat:directory_which_holds_the_SP").
 @subsubsection CPU usage reduction
 
 DOS does not correctly use the CPU HLT instruction. The result is that
-it takes host CPU cycles even when idle. You can install the utility
-from @url{http://www.vmware.com/software/dosidle210.zip} to solve this
-problem.
+it takes host CPU cycles even when idle. You can install the utility from
+@url{http://web.archive.org/web/20051222085335/http://www.vmware.com/software/dosidle210.zip}
+to solve this problem.
 
 @node QEMU System emulator for non PC targets
 @chapter QEMU System emulator for non PC targets
-- 
1.8.3.1


