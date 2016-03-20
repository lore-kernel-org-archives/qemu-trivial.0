Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ahkSZ-0000TB-4N
	for mharc-qemu-trivial@gnu.org; Sun, 20 Mar 2016 17:00:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ahkSX-0000RL-42
	for qemu-trivial@nongnu.org; Sun, 20 Mar 2016 17:00:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ahkSW-0004Rw-AJ
	for qemu-trivial@nongnu.org; Sun, 20 Mar 2016 17:00:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1ahkSS-0004RJ-4f; Sun, 20 Mar 2016 17:00:20 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 92DF38553F;
	Sun, 20 Mar 2016 21:00:18 +0000 (UTC)
Received: from moo.home.annexia.org (ovpn-204-74.brq.redhat.com [10.40.204.74])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2KL0GYV015135; Sun, 20 Mar 2016 17:00:17 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 20 Mar 2016 21:00:14 +0000
Message-Id: <1458507614-32470-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] docs: Update documentation for stderr (now
	log) tracing backend.
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
X-List-Received-Date: Sun, 20 Mar 2016 21:00:25 -0000

This fixes commit ed7f5f1d8db06fc31352a5ef4f54985e630c575a.

Signed-off-by: Richard W.M. Jones.
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/tracing.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/tracing.txt b/docs/tracing.txt
index 3182ee8..0bd6b9c 100644
--- a/docs/tracing.txt
+++ b/docs/tracing.txt
@@ -157,9 +157,9 @@ performance penalty.
 Note that regardless of the selected trace backend, events with the "disable"
 property will be generated with the "nop" backend.
 
-=== Stderr ===
+=== Log ===
 
-The "stderr" backend sends trace events directly to standard error.  This
+The "log" backend sends trace events directly to standard error.  This
 effectively turns trace events into debug printfs.
 
 This is the simplest backend and can be used together with existing code that
-- 
2.7.4


