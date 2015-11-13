Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zx5KV-0003jZ-2m
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 22:47:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zx5KS-0003j7-PO
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 22:47:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zx5KP-0006td-Gz
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 22:47:12 -0500
Received: from resqmta-po-03v.sys.comcast.net ([96.114.154.162]:45343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Zx5KP-0006t3-CO
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 22:47:09 -0500
Received: from resomta-po-18v.sys.comcast.net ([96.114.154.242])
	by resqmta-po-03v.sys.comcast.net with comcast
	id grn41r0025E3ZMc01rn8kr; Fri, 13 Nov 2015 03:47:08 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-18v.sys.comcast.net with comcast
	id grn31r00G2fD5rL01rn7Tq; Fri, 13 Nov 2015 03:47:08 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2015 20:47:03 -0700
Message-Id: <1447386423-13160-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.4.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1447386428;
	bh=BlSFt/39SFpMSFSkB2yKPe/DKnvCP7cZFGFrbU7qUvw=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=V5YaAFJpJPlqjN55z/39vlV+ltMe/a8qtIdVFEFzc+0rbCnWTuWcran1AWCh25Ybh
	QUt8tmm78/61do5xPCCRrmc4aJheQPNN5hDKJKXtkemMwp1OauNEIQQaU5ERyUTWWw
	EMsYlgUUq20zijDI8QIyVXaw8qOdoECjG1EKLhlYR9WpNEbIimmIkOXBATWSwjB80H
	UU6xe0eYdIsx4ocWAKZzrar/YtoCnrqdKsgHlUQL4a9hovbDouN62VBUcz6Sz/qSda
	SgGI9bll7NiWYzXK6SnlSNSuDaRUUkhgCmGjdrbNqMCzUw8fYpmk3Z5fLYbbJ4OOpX
	sqE94mTLoEAKQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.162
Cc: qemu-trivial@nongnu.org, berto@igalia.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH for-2.5 v2] tests: Ignore recent test binaries
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
X-List-Received-Date: Fri, 13 Nov 2015 03:47:13 -0000

Commits 6c6f312d and bd797fc1 added new tests (test-blockjob-txn
and test-timed-average, respectively), but did not mark them for
exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: retitle; also ignore test-timed-average

 tests/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index e96f569..1e55722 100644
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
@@ -45,6 +46,7 @@ test-string-input-visitor
 test-string-output-visitor
 test-thread-pool
 test-throttle
+test-timed-average
 test-visitor-serialization
 test-vmstate
 test-write-threshold
-- 
2.4.3


