Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WImgP-00030q-BC
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 17:10:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WImgH-0002ql-3M
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WImgB-0000LS-7k
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:10:20 -0500
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235]:43367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WImfz-00009i-6I; Wed, 26 Feb 2014 17:10:03 -0500
Received: by mail-pd0-f181.google.com with SMTP id p10so1517323pdj.40
	for <multiple recipients>; Wed, 26 Feb 2014 14:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kGgGEaqxB6kgfG2EAr09sqYqVu2Yu62Fgm5pWfkg784=;
	b=IwcXSs5v90Xr69XO1rV0zCaMpRhoCHeVtIZYmSNTRuX4VGbE96CATqvgQE9fXQ4xa9
	/NRpmgegVv/GBLEQXLr58uCQ2pE4ErtWfcs+OUH4KTyUHgwlPu7QCa2wf4W7MlM2LCY1
	oeoR3JZ39wNgLB3D9m9qv3pUKDjYb5iWO5Hxpuj8Ofm6YxciHpPUINmOfRonvVEnTKJ2
	Jy5ccK/d5kj117YNgtfCAfsi5uK5ru+U0Mo9N1MZTseHJHvQSJPOX43LJOjdtfQKHeNC
	HXE01Dv2DeeAxSwI/2ZnRjNByB8Fpl5yqnVzYhGSvQCSbecegg0+I+aRfePcuRmyhkpL
	mdEw==
X-Received: by 10.69.0.10 with SMTP id au10mr9726696pbd.48.1393452601804;
	Wed, 26 Feb 2014 14:10:01 -0800 (PST)
Received: from localhost.localdomain ([41.109.200.255])
	by mx.google.com with ESMTPSA id ou9sm6712059pbc.30.2014.02.26.14.09.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 14:10:01 -0800 (PST)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Feb 2014 23:09:52 +0100
Message-Id: <1393452592-13934-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::235
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] monitor: Remove left-over code in
	do_info_profile.
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
X-List-Received-Date: Wed, 26 Feb 2014 22:10:27 -0000

This is a left-over from 4a1418e.

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 monitor.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/monitor.c b/monitor.c
index aebcbd8..3863d83 100644
--- a/monitor.c
+++ b/monitor.c
@@ -2021,10 +2021,6 @@ int64_t dev_time;
 
 static void do_info_profile(Monitor *mon, const QDict *qdict)
 {
-    int64_t total;
-    total = qemu_time;
-    if (total == 0)
-        total = 1;
     monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
                    dev_time, dev_time / (double)get_ticks_per_sec());
     monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",
-- 
1.8.3.2


