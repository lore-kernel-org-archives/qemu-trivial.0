Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYzp5-0001P0-1F
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 12:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzp2-0001In-Fc
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzow-00074g-V2
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:30:56 -0400
Received: from resqmta-po-05v.sys.comcast.net ([96.114.154.164]:35002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YYzow-00074K-Qw
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 12:30:50 -0400
Received: from resomta-po-19v.sys.comcast.net ([96.114.154.243])
	by resqmta-po-05v.sys.comcast.net with comcast
	id 5sVj1q0095FMDhs01sWqrj; Fri, 20 Mar 2015 16:30:50 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-19v.sys.comcast.net with comcast
	id 5sWl1q00D2fD5rL01sWpj0; Fri, 20 Mar 2015 16:30:49 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Mar 2015 10:30:44 -0600
Message-Id: <1426869044-21338-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1426869050;
	bh=zIst+eSitxFSd/Hw7CPnXYqoF0Wn4CyYhJ4/toHdQwc=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=Dxgi9m0e2IYr1yHVNgHLygvH1VVjrLUuXM7QZ2BEwEhHTmKFRIfpNDY+vyC//75oG
	y/b+lsON02QwEk0CdnAovJktvCYCGDCJOj7XW6uQQTSTq9cRRCdYvtM/8mO5f9cvH8
	7HUc3SmUC2yI01r8vKz2n2xaPp6Sfnmvo00z6ldsw2Y8vMJyTfG8gj6wPBjUtP7HSN
	FAyBJlUIFMAVd5lDF7hy0oC4R9hBm9+dICmL+ETRROxxk8gdPBGpVD/5+csWp/QGB4
	7cLEgfiVZ0AScyFwUBlAnjKgBepCR2F8Y9tdLb4re0Ye7oa9+Z97vZwwY+2DJZiA1F
	cQLZTJuwAOEwA==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.164
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [for-2.3 PATCH v2] gitignore: Ignore more .pod files.
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
X-List-Received-Date: Fri, 20 Mar 2015 16:30:57 -0000

kvm_stat.{1,pod} started showing up as untracked files in my
directory, and I nearly accidentally merged them into a commit
with my usual habit of 'git add .'.  Rather than spelling out
each such file, just ignore the entire pattern.

Signed-off-by: Eric Blake <eblake@redhat.com>
CC: qemu-trivial@nongnu.org
---

v2: fix man page pattern

 .gitignore | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/.gitignore b/.gitignore
index e32a584..aed0e1f 100644
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
+*.[1-9]
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


