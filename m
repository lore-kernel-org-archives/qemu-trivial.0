Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlGXU-000462-OD
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 04:29:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGXS-0003w8-87
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGXR-00076Y-5j
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:29:22 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:36069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QlGXP-00075y-8M; Mon, 25 Jul 2011 04:29:19 -0400
Received: by pzk1 with SMTP id 1so8390739pzk.30
	for <multiple recipients>; Mon, 25 Jul 2011 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZZu92MoSsqeC7h65c2fwKUOaizqPpWwjqXcVM2tIW0k=;
	b=xN3Ixd+f8foGSB8zi/z4e+ub0NhtQbn3S1ZPkWoZBXhXx75oxd8oV/PX+I9ZUhYhxq
	CXL0Tv74Y7RSstxQjAkga4CXyr2u7TDi3FhfqwZlAMZaAy703MBuQ0C0lRusbUDM9/0J
	GrTlPOlfSVypIpN6BIhbhYJy87c6KM/ZY+D3M=
Received: by 10.68.58.162 with SMTP id s2mr7794301pbq.155.1311582558373;
	Mon, 25 Jul 2011 01:29:18 -0700 (PDT)
Received: from localhost.localdomain ([211.101.48.70])
	by mx.google.com with ESMTPS id b4sm4362859pba.27.2011.07.25.01.29.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 01:29:17 -0700 (PDT)
From: TeLeMan <geleman@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Date: Mon, 25 Jul 2011 16:29:14 +0800
Message-Id: <1311582554-963-1-git-send-email-geleman@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] monitor: fix build breakage with
	--disable-vnc
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
X-List-Received-Date: Mon, 25 Jul 2011 08:29:23 -0000

The breakage was introduced by the commit 13661089810d3e59931f3e80d7cb541b99af7071

Signed-off-by: TeLeMan <geleman@gmail.com>
---
 monitor.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/monitor.c b/monitor.c
index 92cdd05..52ae5f2 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1200,10 +1200,12 @@ static int add_graphics_client(Monitor *mon, const QDict *qdict, QObject **ret_d
         }
 	qerror_report(QERR_ADD_CLIENT_FAILED);
 	return -1;
+#ifdef CONFIG_VNC
     } else if (strcmp(protocol, "vnc") == 0) {
 	int fd = monitor_get_fd(mon, fdname);
 	vnc_display_add_client(NULL, fd, skipauth);
 	return 0;
+#endif
     } else if ((s = qemu_chr_find(protocol)) != NULL) {
 	int fd = monitor_get_fd(mon, fdname);
 	if (qemu_chr_add_client(s, fd) < 0) {
-- 
1.7.3.1.msysgit.0


