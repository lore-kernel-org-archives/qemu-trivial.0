Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRp-0005nr-P1
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRi-0005cK-U2
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRe-0003mz-0a
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRQ-0003hF-AO; Fri, 26 Sep 2014 13:36:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93F2246F63;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 80DB370D;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: (nullmailer pid 29120 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:12 +0400
Message-Id: <1411752976-29051-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 08/12] qapi: Ignore files created during make
	check
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:48 -0000

From: Eric Blake <eblake@redhat.com>

After an in-tree build and run of 'make check-{qapi-schema,unit}',
I noticed some leftover files.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Wenchao Xia <wenchaoqemu@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index c71c110..e2e4957 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -14,11 +14,14 @@ test-int128
 test-iov
 test-mul64
 test-opts-visitor
+test-qapi-event.[ch]
 test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
+test-qemu-opts
 test-qmp-commands
 test-qmp-commands.h
+test-qmp-event
 test-qmp-input-strict
 test-qmp-input-visitor
 test-qmp-marshal.c
-- 
1.7.10.4


