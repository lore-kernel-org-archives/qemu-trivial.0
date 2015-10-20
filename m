Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zocn7-0001hK-Kl
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2015 15:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zocn4-0001fQ-BZ
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 15:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zocn0-0003EZ-BM
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 15:41:46 -0400
Received: from resqmta-po-08v.sys.comcast.net ([96.114.154.167]:39750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zocn0-0003EP-6f
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 15:41:42 -0400
Received: from resomta-po-13v.sys.comcast.net ([96.114.154.237])
	by resqmta-po-08v.sys.comcast.net with comcast
	id XXhQ1r00357bBgG01XhhHW; Tue, 20 Oct 2015 19:41:41 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-13v.sys.comcast.net with comcast
	id XXha1r0032fD5rL01XhguW; Tue, 20 Oct 2015 19:41:41 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Oct 2015 13:41:33 -0600
Message-Id: <1445370093-21670-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.4.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1445370101;
	bh=jzWwo3VwYhG3vyoEs9g5neQV4jy3hQtrivJlkDwRl9A=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=mjcJjTB4K+VmclA6x4dZ/lGR0j3iFK+sJcDtr8euY8NagzUtS5DCHBAEOJSsFRKt0
	jpy4AAtynu6DBF43Q6EYEYueIt2qTVrSdPb7/Y5pg/WrFdYDK6c7vjx6tGxxE1rvNm
	TS1EispIaSjn9s8y4ZLAgXWGTHUjlrG/zqX5ooU8vL86ixqzFL4I8hA/ciw/F4iiSA
	ljHYXoXS3H11fEg8EFTgvL0Ib350+lb5zdJk5FIurXOa+WFBeXg4SBVzwHitU1z/zg
	5FhUTh2vD8BsqsfCBd4dFD2g+nzJMfTLbf4hVBpUx5olfgmiXBRIXX8IoMSXqRlaUT
	axRcxrk3U8mqg==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.167
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Subject: [Qemu-trivial] [PATCH] tests: ignore test-qga
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
X-List-Received-Date: Tue, 20 Oct 2015 19:41:47 -0000

Commit 62c39b30 added a new test, but did not mark it for
exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Yes, I know this only affects people doing in-tree builds, and
that VPATH is recommended these days. But until we actually
require VPATH, we might as well keep things clean.

 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 65496aa..e96f569 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -30,6 +30,7 @@ test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
 test-qemu-opts
+test-qga
 test-qmp-commands
 test-qmp-commands.h
 test-qmp-event
-- 
2.4.3


