Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEdp3-0000Po-Cf
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 13:49:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdnI-0008ST-W1
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdnI-0000EU-3h
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:47:24 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:53840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdnH-0000Di-Pr
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:47:24 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E40522E152C
	for <qemu-trivial@nongnu.org>; Thu, 11 Apr 2019 20:47:21 +0300 (MSK)
Received: from smtpcorp1p.mail.yandex.net (smtpcorp1p.mail.yandex.net
	[2a02:6b8:0:1472:2741:0:8b6:10])
	by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	gWL9A6yasa-lLMWY1lb; Thu, 11 Apr 2019 20:47:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1555004841; bh=KTD/KRk+dBuvXvimccGeR+O/AoBC8BLNGXfC1/jISOY=;
	h=Message-Id:Date:Subject:To:From;
	b=mRneLGuiW0QUMf+1nfqu6EtLwpg3NlVnRxIBklY0OB8U3RODo4/rC16KB4X14VMq1
	XNg82M4gNp9n790osSUw1Ed/3dLYr4q+SScy1ibIKsf/f1eIWx8r2UpgaJw+bVk2Mh
	9059coK9Q+l0Uz2wAhknMJVirsrDRakW9tMMFM/0=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
	[2a02:6b8:0:40c:3404:6cb5:5ab:ed68])
	by smtpcorp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	qcS1ggew7g-lL0WUrUJ; Thu, 11 Apr 2019 20:47:21 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 11 Apr 2019 20:47:15 +0300
Message-Id: <20190411174715.31855-1-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
X-Mailman-Approved-At: Thu, 11 Apr 2019 13:49:11 -0400
Subject: [Qemu-trivial] [PATCH] monitor: Fix return type of
 monitor_fdset_dup_fd_find
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
X-List-Received-Date: Thu, 11 Apr 2019 17:47:25 -0000

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
---
 include/monitor/monitor.h | 2 +-
 monitor.c                 | 4 ++--
 stubs/fdset.c             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index c1b40a9cac..2872621afd 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -46,7 +46,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_=
id, int64_t fdset_id,
 int monitor_fdset_get_fd(int64_t fdset_id, int flags);
 int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
 void monitor_fdset_dup_fd_remove(int dup_fd);
-int monitor_fdset_dup_fd_find(int dup_fd);
+int64_t monitor_fdset_dup_fd_find(int dup_fd);
=20
 void monitor_vfprintf(FILE *stream,
                       const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
diff --git a/monitor.c b/monitor.c
index 4807bbe811..50e6e820d6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -2585,7 +2585,7 @@ err:
     return -1;
 }
=20
-static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
+static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
 {
     MonFdset *mon_fdset;
     MonFdsetFd *mon_fdset_fd_dup;
@@ -2613,7 +2613,7 @@ err:
     return -1;
 }
=20
-int monitor_fdset_dup_fd_find(int dup_fd)
+int64_t monitor_fdset_dup_fd_find(int dup_fd)
 {
     return monitor_fdset_dup_fd_find_remove(dup_fd, false);
 }
diff --git a/stubs/fdset.c b/stubs/fdset.c
index 4f3edf2ea4..a1b8f41f62 100644
--- a/stubs/fdset.c
+++ b/stubs/fdset.c
@@ -7,7 +7,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd=
)
     return -1;
 }
=20
-int monitor_fdset_dup_fd_find(int dup_fd)
+int64_t monitor_fdset_dup_fd_find(int dup_fd)
 {
     return -1;
 }
--=20
2.21.0


