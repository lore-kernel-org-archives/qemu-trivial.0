Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZqoMo-0001tQ-Dg
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2015 16:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZqoMl-0001rg-KQ
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 16:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZqoMi-00046X-Du
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 16:27:39 -0400
Received: from resqmta-po-08v.sys.comcast.net ([96.114.154.167]:55215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZqoMi-000468-9q
	for qemu-trivial@nongnu.org; Mon, 26 Oct 2015 16:27:36 -0400
Received: from resomta-po-13v.sys.comcast.net ([96.114.154.237])
	by resqmta-po-08v.sys.comcast.net with comcast
	id ZwTb1r00157bBgG01wTbgz; Mon, 26 Oct 2015 20:27:35 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-13v.sys.comcast.net with comcast
	id ZwTY1r0082fD5rL01wTaVj; Mon, 26 Oct 2015 20:27:35 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Oct 2015 14:27:31 -0600
Message-Id: <1445891251-10072-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.4.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1445891255;
	bh=bIA5DZQe3Ynqe55v6n4bKWVPpb3xXYTvS+FxCnRaC8M=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=jxtBuhQJDRO/oRZnj84+PILImMyYTfhYkgchxF4COIsUYEeThC1n3pvfp/7i2mzGa
	N2HNVFJIl6FNFkCyDWxD1w6+mw+tAM6qfonYkCbwggf3CCWXUfKF9/68MNXhLHomO+
	AIFdJd7LxQLLxdxsWFdQdhrFKjgvsS57MbzvqXxRlnJn5/H5DhZVMw+RDN57bNWPEd
	W55xa2dLBcjy5Rnq3MeEaJaYv/bxPG6q6QSow3GVFOtjh62AGE2yUSZlaOVnnE4Cww
	2mUMXibgWbtJ61VzmemWQvyxLXQ9JyV8kInck42mHrHnkE6LkxMKyiKvEh0bFXCrYu
	LodtKwlcQ3Fww==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.167
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Subject: [Qemu-trivial] [PATCH] maint: Ignore ivshmem binaries
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
X-List-Received-Date: Mon, 26 Oct 2015 20:27:40 -0000

Commit a75eb03b added ivshmem-client and ivshmem-server binaries,
but did not mark them for exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Yes, I know that these only show up in 'git status' as dirty if you
do an in-tree build, and that we prefer VPATH builds.  But we might
as well be consistent, and we already ignore other in-tree
binaries such as qemu-img and qemu-nbd.

 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75bceb9..88a80ff 100644
--- a/.gitignore
+++ b/.gitignore
@@ -24,6 +24,8 @@
 /*-darwin-user
 /*-linux-user
 /*-bsd-user
+/ivshmem-client
+/ivshmem-server
 /libdis*
 /libuser
 /linux-headers/asm
-- 
2.4.3


