Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b179e-0000GM-Oi
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 03:04:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179c-00007f-0H
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179U-0003SJ-Ji
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1b179N-0003PK-02; Fri, 13 May 2016 03:04:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88C757F6B4;
	Fri, 13 May 2016 07:04:40 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-225.ams2.redhat.com [10.36.7.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4D74XkZ010464; Fri, 13 May 2016 03:04:39 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Fri, 13 May 2016 09:04:31 +0200
Message-Id: <1463123072-30603-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1463123072-30603-1-git-send-email-thuth@redhat.com>
References: <1463123072-30603-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 13 May 2016 07:04:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/4] slirp: Remove some unused code from
 slirp.h
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
X-List-Received-Date: Fri, 13 May 2016 07:04:57 -0000

These hunks are apparently not used anymore, so let's delete them.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/slirp.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/slirp/slirp.h b/slirp/slirp.h
index 5b5df59..e373876 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -58,10 +58,6 @@ typedef char *caddr_t;
 # include <sys/filio.h>
 #endif
 
-#ifdef USE_PPP
-#include <ppp/slirppp.h>
-#endif
-
 /* Avoid conflicting with the libc insque() and remque(), which
    have different prototypes. */
 #define insque slirp_insque
@@ -96,10 +92,6 @@ typedef char *caddr_t;
 #include "if.h"
 #include "main.h"
 #include "misc.h"
-#ifdef USE_PPP
-#include "ppp/pppd.h"
-#include "ppp/ppp.h"
-#endif
 
 #include "bootp.h"
 #include "tftp.h"
@@ -237,18 +229,12 @@ extern Slirp *slirp_instance;
 #define NULL (void *)0
 #endif
 
-#ifndef FULL_BOLT
 void if_start(Slirp *);
-#else
-void if_start(struct ttys *);
-#endif
 
 #ifndef _WIN32
 #include <netdb.h>
 #endif
 
-#define DEFAULT_BAUD 115200
-
 #define SO_OPTIONS DO_KEEPALIVE
 #define TCP_MAXIDLE (TCPTV_KEEPCNT * TCPTV_KEEPINTVL)
 
@@ -306,14 +292,6 @@ int tcp_emu(struct socket *, struct mbuf *);
 int tcp_ctl(struct socket *);
 struct tcpcb *tcp_drop(struct tcpcb *tp, int err);
 
-#ifdef USE_PPP
-#define MIN_MRU MINMRU
-#define MAX_MRU MAXMRU
-#else
-#define MIN_MRU 128
-#define MAX_MRU 16384
-#endif
-
 #ifndef _WIN32
 #define min(x,y) ((x) < (y) ? (x) : (y))
 #define max(x,y) ((x) > (y) ? (x) : (y))
-- 
1.8.3.1


