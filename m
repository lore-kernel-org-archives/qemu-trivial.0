Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgs-0006sg-AI
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgj-0006be-So
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgh-0006yN-7N
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:45 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46023 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgg-0006y7-5E
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:43 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgY-00084c-Rm; Fri, 06 Feb 2015 22:43:34 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:10 +0100
Message-Id: <1423258997-30957-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Amit Shah <amit.shah@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH 03/10] migration: Fix warning caused by
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:52 -0000

Warning from the Sparse static analysis tool:

stubs/vmstate.c:4:26: warning:
 symbol 'vmstate_dummy' was not declared. Should it be static?

Cc: Juan Quintela <quintela@redhat.com>
Cc: Amit Shah <amit.shah@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


