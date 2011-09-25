Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7tEB-0007Gn-Sx
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 14:14:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7tE9-00077W-Hi
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 14:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7tE8-0005Oe-R0
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 14:14:57 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:54979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R7tE2-0005Nm-C7; Sun, 25 Sep 2011 14:14:50 -0400
Received: by fxh13 with SMTP id 13so5474259fxh.4
	for <multiple recipients>; Sun, 25 Sep 2011 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8S4S/H9xs9YqZO1f6rxbGM7KxI+HghUdj6HnG03ZgLY=;
	b=jsKP0xMzdKSR4lL6jUCx1A1hlcvjD/+4mrQ6DtVxlbEv3LVOtos9fqcXqDoifX1gX1
	5N5iAvE+l5R38ZhYFrUASgR2ZY/nC0TCxmoGo5D/sI5KxXhe7Hpf34QHkayYhfZ+lbdm
	WhqkrzRPGG92zb5BtR8p/YkE7L7Zvvc+mvIrs=
Received: by 10.223.57.70 with SMTP id b6mr9187842fah.124.1316974489708;
	Sun, 25 Sep 2011 11:14:49 -0700 (PDT)
Received: from localhost.localdomain (ppp95-165-19-215.pppoe.spdop.ru.
	[95.165.19.215])
	by mx.google.com with ESMTPS id j5sm15530351fac.25.2011.09.25.11.14.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 11:14:49 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Sep 2011 22:14:43 +0400
Message-Id: <1316974483-16947-2-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
References: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [Qemu-trivial] [PATCH 2/2] gt64xxx.c: remove reference to
	non-existing ISD_handle field
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
X-List-Received-Date: Sun, 25 Sep 2011 18:14:58 -0000

The commit fc2bf44972349b078d8310466c3866615500e67f
removed ISD_handle field from struct GT64120State,
so remove the field from DPRINTF too.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/gt64xxx.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/gt64xxx.c b/hw/gt64xxx.c
index 0baa320..36919fa 100644
--- a/hw/gt64xxx.c
+++ b/hw/gt64xxx.c
@@ -275,8 +275,9 @@ static void gt64120_isd_mapping(GT64120State *s)
     check_reserved_space(&start, &length);
     length = 0x1000;
     /* Map new address */
-    DPRINTF("ISD: "TARGET_FMT_plx"@"TARGET_FMT_plx" -> "TARGET_FMT_plx"@"TARGET_FMT_plx", %x\n", s->ISD_length, s->ISD_start,
-            length, start, s->ISD_handle);
+    DPRINTF("ISD: "TARGET_FMT_plx"@"TARGET_FMT_plx
+        " -> "TARGET_FMT_plx"@"TARGET_FMT_plx"\n",
+        s->ISD_length, s->ISD_start, length, start);
     s->ISD_start = start;
     s->ISD_length = length;
     memory_region_add_subregion(get_system_memory(), s->ISD_start, &s->ISD_mem);
-- 
1.7.5.4


