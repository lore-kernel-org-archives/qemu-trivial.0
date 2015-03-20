Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYzlA-0007Ig-Dr
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 12:26:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzl2-00078X-Vn
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzkw-0005kp-Ke
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:26:48 -0400
Received: from resqmta-po-06v.sys.comcast.net ([96.114.154.165]:41423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzkw-0005kg-Ch
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:26:42 -0400
Received: from resomta-po-11v.sys.comcast.net ([96.114.154.235])
	by resqmta-po-06v.sys.comcast.net with comcast
	id 5sRy1q00154zqzk01sShXk; Fri, 20 Mar 2015 16:26:41 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-11v.sys.comcast.net with comcast
	id 5sSb1q00c2fD5rL01sSgo6; Fri, 20 Mar 2015 16:26:41 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Mar 2015 10:26:29 -0600
Message-Id: <1426868789-20873-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1426868801;
	bh=o/Eh1ptQNdYNVFLTtli0/plN6301nT1Mbxme1ps+NUI=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=BbC6zyc42F7Ih+kZBwCbEWuV53Wd0wp19w5wQHtg9UDswt4c4HLuJggKH/nrvVbaR
	AvLQFRbizQeS+SxqxfqXanc2Yn3/hjQ6w2y/PD+VSBZFY/MauBmUeQQ6iTuNG1AYr1
	ytrQtjeymALUbMHiZUME9QxQPkV2BgShDTtkR7HJV6Bsp0goQHsbL/Nnbsg4YeISKe
	vX4OWoG+SvxFpb6XsLJxzR0G8tybwSBezPTBsWTIY4IcKPOVi4/eR40/iuINcAE7l3
	svBqoL8+FwpvVuYZV6vlYIhYG4BX7O6mT80w1AAK5CmXbrYmrLPWxgKYzBlo4aiYgR
	a2yTK9cDX/MMQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.165
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [for-2.3 PATCH] gitignore: Ignore more .pod files.
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
X-List-Received-Date: Fri, 20 Mar 2015 16:26:55 -0000

kvm_stat.{1,pod} started showing up as untracked files in my
directory, and I nearly accidentally merged them into a commit
with my usual habit of 'git add .'.  Rather than naming every
such generated doc file, just exclude the pattern.

Signed-off-by: Eric Blake <eblake@redhat.com>
CC: qemu-trivial@nongnu.org
---
 .gitignore | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/.gitignore b/.gitignore
index e32a584..da5413d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,14 +37,8 @@
 /qemu-tech.html
 /qemu-doc.info
 /qemu-tech.info
-/qemu.1
-/qemu.pod
-/qemu-img.1
-/qemu-img.pod
 /qemu-img
 /qemu-nbd
-/qemu-nbd.8
-/qemu-nbd.pod
 /qemu-options.def
 /qemu-options.texi
 /qemu-img-cmds.texi
@@ -56,8 +50,7 @@
 /qmp-commands.txt
 /vscclient
 /fsdev/virtfs-proxy-helper
-/fsdev/virtfs-proxy-helper.1
-/fsdev/virtfs-proxy-helper.pod
+*.1
 *.a
 *.aux
 *.cp
@@ -70,6 +63,7 @@
 *.ky
 *.log
 *.pdf
+*.pod
 *.cps
 *.fns
 *.kys
-- 
2.1.0


