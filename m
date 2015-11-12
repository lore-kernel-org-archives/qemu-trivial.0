Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zwwh6-0006Jr-Lk
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 13:34:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zwwh4-0006Fo-81
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 13:33:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zwwh0-0005MH-6x
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 13:33:58 -0500
Received: from resqmta-po-11v.sys.comcast.net ([96.114.154.170]:59578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zwwh0-0005Ly-2C
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 13:33:54 -0500
Received: from resomta-po-11v.sys.comcast.net ([96.114.154.235])
	by resqmta-po-11v.sys.comcast.net with comcast
	id giZC1r00554zqzk01iZspR; Thu, 12 Nov 2015 18:33:52 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-11v.sys.comcast.net with comcast
	id giZp1r0032fD5rL01iZsXL; Thu, 12 Nov 2015 18:33:52 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2015 11:33:48 -0700
Message-Id: <1447353228-30550-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.4.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1447353232;
	bh=WZ6Xh9RWnirCrfQIUo0Uv8ZMcIKOqQJVX8kmvCLPDQk=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=flEAuHtJTEoRYM8aY6WsNXRq+ZX8ZkDrWKY6eBkOY2TumwFtY+8qjL8gxEjqx4x2w
	U3lKEzQQXFWYlN979ItdX6XBjjwEnZRcjy9cIxzc6RlqlIKL+T0Jrs+geSFSvMBC5a
	V9gis2Gm329Rg/o9ugsRJHNtCOb7hzq6bpEA8RiB48DVa4hu1EFDWZtwp9X/h0f0ZK
	rPMeGHtUqdC7+V2Zpfg0RDkcYPzpiqSvnz3w/mn9j8z3xAMcYIIOxgs704/Uzs1ZFi
	l532zIDuuNB9G8EKjfILEwWpoPYJKdu7PsMe79+TELW2qEr2FquCb7Q9lOW1V08jhK
	LjLZnBLZVrGfw==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.170
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] tests: Ignore test-blockjob-txn
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
X-List-Received-Date: Thu, 12 Nov 2015 18:33:59 -0000

Commit 6c6f312d added a new test, but did not mark it for
exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Yeah, I know this affects only non-VPATH builds, which we don't
recommend, but we might as well be consistent.

 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index e96f569..de5e793 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -9,6 +9,7 @@ check-qom-proplist
 rcutorture
 test-aio
 test-bitops
+test-blockjob-txn
 test-coroutine
 test-crypto-cipher
 test-crypto-hash
-- 
2.4.3


