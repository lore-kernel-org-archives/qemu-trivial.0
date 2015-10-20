Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoRVh-0005VL-3J
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2015 03:39:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZoRVb-0005M2-IY
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 03:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZoRVa-0004V0-HI
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 03:38:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1ZoRVT-0004Qi-DB; Tue, 20 Oct 2015 03:38:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 119B7A0B91;
	Tue, 20 Oct 2015 07:38:51 +0000 (UTC)
Received: from fam-t430.nay.redhat.com. (dhcp-14-147.nay.redhat.com
	[10.66.14.147])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9K7clvA025685; Tue, 20 Oct 2015 03:38:48 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Oct 2015 15:38:46 +0800
Message-Id: <1445326726-16031-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH v2] scripts/text2pod.pl: Escape left brace
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
X-List-Received-Date: Tue, 20 Oct 2015 07:39:04 -0000

Latest perl now deprecates "{" literal in regex and print warnings like
"unescaped left brace in regex is deprecated".  Add escapes to keep it
happy.

Signed-off-by: Fam Zheng <famz@redhat.com>

---

v2: Drop superfluous hunk.
---
 scripts/texi2pod.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/texi2pod.pl b/scripts/texi2pod.pl
index 94097fb..8767662 100755
--- a/scripts/texi2pod.pl
+++ b/scripts/texi2pod.pl
@@ -317,7 +317,7 @@ while(<$inf>) {
 	@columns = ();
 	for $column (split (/\s*\@tab\s*/, $1)) {
 	    # @strong{...} is used a @headitem work-alike
-	    $column =~ s/^\@strong{(.*)}$/$1/;
+	    $column =~ s/^\@strong\{(.*)\}$/$1/;
 	    push @columns, $column;
 	}
 	$_ = "\n=item ".join (" : ", @columns)."\n";
-- 
2.4.3


