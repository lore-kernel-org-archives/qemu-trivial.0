Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUZ4-0006PK-2i
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:13:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMP-0002R8-Gr
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMO-0002vt-N5
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:29 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:37016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMM-0002LR-D6; Sun, 14 Oct 2012 16:00:26 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so2786709lah.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PPese5YOqtHymdwICgsgKo1GGittl5sxxe+8J6gSR6o=;
	b=QWRpytu9lNda0XkfsiMQqkKotpsNcw4Gg24Of1eBbohA/+Wbz+vAPK/02ommtUuf8q
	HlVZCsxts+3mizrddkH8lZXioFevjlbWSmEYKAPvz4DjhrX6x6kpEOjV4uAUStCVyaT4
	0fY9WclJ7U+iD4jXKC7J2OKlYEzbBR+yPSC7EhcT69HIr9pBxl+Efu2HSfxYJhmUQpsX
	x+HfxDqlRGu6GA4SA0Uj8hWbdRp4VTbVls2QhOi7xRKABZBiJUxgsBmIS/4nyXgUVzAb
	L8mWDnwoaG6+PwWhRyxDwXrkBYGI1PCIsDNnuKFgU6Hh4hdZEpT96AeFbvlJR1BsYbrp
	6/cw==
Received: by 10.112.99.168 with SMTP id er8mr3543697lbb.36.1350244825642;
	Sun, 14 Oct 2012 13:00:25 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:24 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:55 +0000
Message-Id: <c9f551f13f2f91a9e48120358c93cc1e14082cb8.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [Qemu-trivial] [PATCH 07/11] slirp: remove unused function u_sleep
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
X-List-Received-Date: Sun, 14 Oct 2012 20:13:33 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 slirp/misc.c |   14 --------------
 slirp/misc.h |    1 -
 2 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index 0bee864..664532a 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -253,20 +253,6 @@ void lprint(const char *format, ...)
     va_end(args);
 }
 
-void
-u_sleep(int usec)
-{
-	struct timeval t;
-	fd_set fdset;
-
-	FD_ZERO(&fdset);
-
-	t.tv_sec = 0;
-	t.tv_usec = usec * 1000;
-
-	select(0, &fdset, &fdset, &fdset, &t);
-}
-
 void slirp_connection_info(Slirp *slirp, Monitor *mon)
 {
     const char * const tcpstates[] = {
diff --git a/slirp/misc.h b/slirp/misc.h
index ed40a10..cc36aeb 100644
--- a/slirp/misc.h
+++ b/slirp/misc.h
@@ -64,7 +64,6 @@ void snooze_hup(int);
 void snooze(void);
 void relay(int);
 void add_emu(char *);
-void u_sleep(int);
 void fd_nonblock(int);
 void fd_block(int);
 int rsh_exec(struct socket *, struct socket *, char *, char *, char *);
-- 
1.7.2.5


