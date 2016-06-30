Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIhla-00011D-1t
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 15:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIhlX-0000zA-3f
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 15:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIhlW-0007KR-3o
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 15:36:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1bIhlQ-0007Jt-Ku; Thu, 30 Jun 2016 15:36:40 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 018E8C049D67;
	Thu, 30 Jun 2016 19:36:39 +0000 (UTC)
Received: from scv.usersys.redhat.com (unused [10.10.51.239] (may be forged))
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5UJab3p029549; Thu, 30 Jun 2016 15:36:38 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Date: Thu, 30 Jun 2016 15:36:36 -0400
Message-Id: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 30 Jun 2016 19:36:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 19:36:48 -0000

Another exercise in placating Clang's increasingly strict -Werror mode.
Technically, this is undefined behavior. In practice, -N<<M is the same
as -(N<<M).

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/audio/fmopl.c      | 2 +-
 target-i386/monitor.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 731110f..de9338b 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -69,7 +69,7 @@ static int opl_dbg_maxchip,opl_dbg_chip;
 /* final output shift , limit minimum and maximum */
 #define OPL_OUTSB   (TL_BITS+3-16)		/* OPL output final shift 16bit */
 #define OPL_MAXOUT (0x7fff<<OPL_OUTSB)
-#define OPL_MINOUT (-0x8000<<OPL_OUTSB)
+#define OPL_MINOUT (-(0x8000<<OPL_OUTSB))
 
 /* -------------------- quality selection --------------------- */
 
diff --git a/target-i386/monitor.c b/target-i386/monitor.c
index fccfe40..94e9871 100644
--- a/target-i386/monitor.c
+++ b/target-i386/monitor.c
@@ -36,7 +36,7 @@ static void print_pte(Monitor *mon, hwaddr addr,
 {
 #ifdef TARGET_X86_64
     if (addr & (1ULL << 47)) {
-        addr |= -1LL << 48;
+        addr |= -(1LL << 48);
     }
 #endif
     monitor_printf(mon, TARGET_FMT_plx ": " TARGET_FMT_plx
-- 
2.5.5


