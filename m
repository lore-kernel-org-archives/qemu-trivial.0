Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZTI-0003ES-JN
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZkRNf-0003kY-7J
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZkRNe-0005u4-A2
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:42:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1ZkRNY-0005tA-7y; Fri, 09 Oct 2015 02:42:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E93F7C0BE065;
	Fri,  9 Oct 2015 06:42:07 +0000 (UTC)
Received: from ad.nay.redhat.com (dhcp-14-110.nay.redhat.com [10.66.14.110])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t996g4Lb012195; Fri, 9 Oct 2015 02:42:05 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 Oct 2015 14:42:01 +0800
Message-Id: <1444372921-30909-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] scripts/text2pod.pl: Escape left brace
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
X-List-Received-Date: Fri, 09 Oct 2015 06:42:16 -0000

Latest perl now deprecates "{" literal in regex and print warnings like
"unescaped left brace in regex is deprecated".  Add escapes to keep it
happy.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 roms/ipxe           | 2 +-
 scripts/texi2pod.pl | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/roms/ipxe b/roms/ipxe
index 4e03af8..35c5379 160000
--- a/roms/ipxe
+++ b/roms/ipxe
@@ -1 +1 @@
-Subproject commit 4e03af8ec2d497e725566a91fd5c19dd604c18a6
+Subproject commit 35c5379760aa1fea5e38f7a78b090f92bb7813ee
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
2.5.3


