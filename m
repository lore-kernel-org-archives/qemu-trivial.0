Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6h8-0002SZ-3h
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:01:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h4-0002Lq-Ex
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6gy-00026U-Ke
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL6gq-0001zy-Mw; Tue, 10 Feb 2015 04:01:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CC4D41892;
	Tue, 10 Feb 2015 12:01:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE73C936;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9412 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:28 +0300
Message-Id: <9c04cabc2d1a1c376ed40f8d78f931c8ac20e499.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Amit Shah <amit.shah@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PULL 39/46] migration: Fix warning caused by
	missing declaration of vmstate_dummy
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
X-List-Received-Date: Tue, 10 Feb 2015 09:01:19 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

stubs/vmstate.c:4:26: warning:
 symbol 'vmstate_dummy' was not declared. Should it be static?

Cc: Juan Quintela <quintela@redhat.com>
Cc: Amit Shah <amit.shah@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/migration/vmstate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 0b26bc6..c20f2d1 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -139,9 +139,7 @@ struct VMStateDescription {
     const VMStateSubsection *subsections;
 };
 
-#ifdef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_dummy;
-#endif
 
 extern const VMStateInfo vmstate_info_bool;
 
-- 
2.1.4


