Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Iw6-0005u4-2w
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 10:37:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>) id 1S5Iw0-0005tv-LG
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 10:37:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>) id 1S5Ivy-00006V-Qj
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 10:37:48 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:45622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>)
	id 1S5Ivy-00006J-IX; Wed, 07 Mar 2012 10:37:46 -0500
Received: by wgbfm10 with SMTP id fm10so4460921wgb.10
	for <multiple recipients>; Wed, 07 Mar 2012 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CElEbQwX8XFGrFpoWRkqI3/1vEIYFi2SV//70dy8TnI=;
	b=KQ2j2Bxwpsh4kvRHV45RVoMH/ce9dLqeu699WCSIJSISTLZRhrOdbpgo1cuWAZTSz/
	5PFzWDa1T6aSa9UNTs2xSgqkNWxAGgeCadgmYjq6KZwV/yP2uIQnf3uOA9Oufhs0yPvC
	Wi7gGUPpAGlFSgmx9SnhEwo8Txq2kELmZN5ku5hvN+mHLjh2Z6VrpiyEGEgny/M+Dar2
	ie+/Q9GhS55iU+Otka9BfxwkJ3toznjGji7t0vm2fwkQSkWNVRg+378RJlapqipukn6s
	r2R2XyiA1iVUEleAP3JpIoiAag0U7UEhD4AtU6CDlayOiKhIjT3I0abxebnxg4DOJgnj
	/xDA==
Received: by 10.180.93.4 with SMTP id cq4mr4766263wib.21.1331134663894;
	Wed, 07 Mar 2012 07:37:43 -0800 (PST)
Received: from localhost ([199.19.224.98])
	by mx.google.com with ESMTPS id ep17sm35449427wid.2.2012.03.07.07.37.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 07:37:43 -0800 (PST)
From: Chen Yufei <cyfdecyf@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed,  7 Mar 2012 23:36:43 +0800
Message-Id: <1331134603-73952-1-git-send-email-cyfdecyf@gmail.com>
X-Mailer: git-send-email 1.7.8.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Remove type field in ModuleEntry as it's not
	used.
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
X-List-Received-Date: Wed, 07 Mar 2012 15:37:53 -0000

Signed-off-by: Chen Yufei <cyfdecyf@gmail.com>
---
 module.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/module.c b/module.c
index 106a969..c3a6da7 100644
--- a/module.c
+++ b/module.c
@@ -19,7 +19,6 @@
 
 typedef struct ModuleEntry
 {
-    module_init_type type;
     void (*init)(void);
     QTAILQ_ENTRY(ModuleEntry) node;
 } ModuleEntry;
-- 
1.7.3.2


