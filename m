Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QWJCE-0003Ic-Ii
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2011 22:17:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QWJCB-0003Hw-Bk
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 22:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QWJC9-0003XR-U1
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 22:17:34 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:41826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QWJC7-0003X5-Qd; Mon, 13 Jun 2011 22:17:31 -0400
Received: by vws17 with SMTP id 17so4722542vws.4
	for <multiple recipients>; Mon, 13 Jun 2011 19:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ad311HE4BCiZH4yew3T0d8i+ETZ1TcoRNDq+xdaNCGM=;
	b=JQhNaw3vElrLTffh4oIevWZ22oBV5/QArWlg8MGXcpkb5BYuTmLGXx/iIzG4obuQhJ
	gtaDyUDYwKUxHX0G4OsMkEi9KDKvlf4SErla54kwON+kijF7esSe+Ebrvg6rRBmJYG5e
	Xzp2yMYIULtytTGrb4xBRWKylfyOuZG+B+hMI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YKZjofXQQMbBCIBabbtG2L2cfA+cQA/tlxLe4P2F9FMaCczwMvsM+SNz2ewB6h0jO6
	/1+7wPN5eFwey5ng/FZZSaWFEmWJ+AMgh0/K8BuErfd3PljILGOjcwjhRzujECiva1fP
	m+FO49MietR7z7fJwC9L4wcy/FdYuTYkcL20c=
Received: by 10.52.160.99 with SMTP id xj3mr5031160vdb.261.1308017850530;
	Mon, 13 Jun 2011 19:17:30 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id bh17sm2104126vdc.3.2011.06.13.19.17.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 19:17:29 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2011 22:16:36 -0400
Message-Id: <1308017796-397-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] Fix typo in cpus.c
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
X-List-Received-Date: Tue, 14 Jun 2011 02:17:36 -0000

filed -> failed

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 cpus.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/cpus.c b/cpus.c
index 1fc34b7..4ab76f0 100644
--- a/cpus.c
+++ b/cpus.c
@@ -297,7 +297,7 @@ static void qemu_event_increment(void)
 
     /* EAGAIN is fine, a read must be pending.  */
     if (ret < 0 && errno != EAGAIN) {
-        fprintf(stderr, "qemu_event_increment: write() filed: %s\n",
+        fprintf(stderr, "qemu_event_increment: write() failed: %s\n",
                 strerror(errno));
         exit (1);
     }
-- 
1.7.5


