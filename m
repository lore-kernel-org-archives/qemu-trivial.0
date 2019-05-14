Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQXI3-0002d3-0Z
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 09:16:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQXI0-0002aY-Ch
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 09:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQXHy-000646-Dq
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 09:16:16 -0400
Received: from forwardcorp1p.mail.yandex.net
	([2a02:6b8:0:1472:2741:0:8b6:217]:60378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>)
	id 1hQXHo-0005lI-1B; Tue, 14 May 2019 09:16:05 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
	[IPv6:2a02:6b8:0:1402::301])
	by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 97FA22E0B0B;
	Tue, 14 May 2019 16:15:59 +0300 (MSK)
Received: from smtpcorp1o.mail.yandex.net (smtpcorp1o.mail.yandex.net
	[2a02:6b8:0:1a2d::30])
	by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	EGfKYjIG3O-Fxsqnq7J; Tue, 14 May 2019 16:15:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1557839759; bh=zlEvF/oTZJ5liNIhlWTkOCkXgmRQEff72Ptu9kCvEUI=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=fTHYfPCemEkF+ih8ZdjrC4KFSJjO2jKl3CRWv4UBX7v9+V6/MrsekzpTYB3mZmvzr
	MRab4GI2MzkdSgX/Y6/VYEQtsrgFqCFAI5CyBTTpv2Xm6Ziw/M1mp//CJbpZlOa+Ob
	lMsD2JXzjhYzy3F6GlGQnUwk0WMP0Zm4Xu/tCIvM=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
	[2a02:6b8:0:40c:fc64:e1ab:53e6:4177])
	by smtpcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	7hJFJY8ysS-FwluoY2w; Tue, 14 May 2019 16:15:58 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	armbru@redhat.com
Date: Tue, 14 May 2019 16:15:52 +0300
Message-Id: <20190514131552.15832-1-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a02:6b8:0:1472:2741:0:8b6:217
Subject: [Qemu-trivial] [PATCH RESEND] monitor: Fix return type of
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
X-List-Received-Date: Tue, 14 May 2019 13:16:17 -0000

monitor_fdset_dup_fd_find_remove() and monitor_fdset_dup_fd_find()
returns mon_fdset->id which is int64_t. Downcast from int64_t to int lead=
s to
a bug with removing fd from fdset which id >=3D 2^32.
So, fix return types for these function.

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
=3D
id, int64_t fdset_id,
 int monitor_fdset_get_fd(int64_t fdset_id, int flags);
 int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
 void monitor_fdset_dup_fd_remove(int dup_fd);
-int monitor_fdset_dup_fd_find(int dup_fd);
+int64_t monitor_fdset_dup_fd_find(int dup_fd);
=3D20
 void monitor_vfprintf(FILE *stream,
                       const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
diff --git a/monitor.c b/monitor.c
index 4807bbe811..50e6e820d6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -2585,7 +2585,7 @@ err:
     return -1;
 }
=3D20
-static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
+static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
 {
     MonFdset *mon_fdset;
     MonFdsetFd *mon_fdset_fd_dup;
@@ -2613,7 +2613,7 @@ err:
     return -1;
 }
=3D20
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
=3D
)
     return -1;
 }
=3D20
-int monitor_fdset_dup_fd_find(int dup_fd)
+int64_t monitor_fdset_dup_fd_find(int dup_fd)
 {
     return -1;
 }
--=3D20
2.21.0

