Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b179c-0000B1-Fh
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 03:04:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179Z-0008Ta-DG
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179T-0003Ru-EY
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1b179L-0003P5-CB; Fri, 13 May 2016 03:04:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E30687F36F;
	Fri, 13 May 2016 07:04:38 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-225.ams2.redhat.com [10.36.7.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4D74XkY010464; Fri, 13 May 2016 03:04:37 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Fri, 13 May 2016 09:04:30 +0200
Message-Id: <1463123072-30603-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1463123072-30603-1-git-send-email-thuth@redhat.com>
References: <1463123072-30603-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 13 May 2016 07:04:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/4] slirp: Remove obsolete
 backward-compatibility cruft
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
X-List-Received-Date: Fri, 13 May 2016 07:04:55 -0000

The slirp code does not use index() and gethostid() anymore,
so these parts can be removed without problems.
memmove() and strerror() should be available on each of the
supported platforms nowadays, too, so these wrappers are also
not needed anymore.
And we certainly also do not support Ultrix anymore, so no
need to keep the code for this platform anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/misc.c         | 21 ---------------------
 slirp/slirp.h        | 28 ----------------------------
 slirp/slirp_config.h | 12 ------------
 3 files changed, 61 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index 2fbd048..1a0ea1b 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -60,27 +60,6 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, char *exec,
 	return 0;
 }
 
-#ifndef HAVE_STRERROR
-
-/*
- * For systems with no strerror
- */
-
-extern int sys_nerr;
-extern char *sys_errlist[];
-
-char *
-strerror(error)
-	int error;
-{
-	if (error < sys_nerr)
-	   return sys_errlist[error];
-	else
-	   return "Unknown error.";
-}
-
-#endif
-
 
 #ifdef _WIN32
 
diff --git a/slirp/slirp.h b/slirp/slirp.h
index 203deec..5b5df59 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -23,11 +23,6 @@ typedef char *caddr_t;
 # include <sys/bitypes.h>
 #endif
 
-
-#ifndef HAVE_MEMMOVE
-#define memmove(x, y, z) bcopy(y, x, z)
-#endif
-
 #ifndef _WIN32
 #include <sys/uio.h>
 #endif
@@ -37,17 +32,6 @@ typedef char *caddr_t;
 #include <arpa/inet.h>
 #endif
 
-/* Systems lacking strdup() definition in <string.h>. */
-#if defined(ultrix)
-char *strdup(const char *);
-#endif
-
-/* Systems lacking malloc() definition in <stdlib.h>. */
-#if defined(ultrix) || defined(hcx)
-void *malloc(size_t arg);
-void free(void *ptr);
-#endif
-
 #ifndef NO_UNIX_SOCKETS
 #include <sys/un.h>
 #endif
@@ -259,18 +243,6 @@ void if_start(Slirp *);
 void if_start(struct ttys *);
 #endif
 
-#ifndef HAVE_STRERROR
- char *strerror(int error);
-#endif
-
-#ifndef HAVE_INDEX
- char *index(const char *, int);
-#endif
-
-#ifndef HAVE_GETHOSTID
- long gethostid(void);
-#endif
-
 #ifndef _WIN32
 #include <netdb.h>
 #endif
diff --git a/slirp/slirp_config.h b/slirp/slirp_config.h
index a5fa36e..c59f655 100644
--- a/slirp/slirp_config.h
+++ b/slirp/slirp_config.h
@@ -34,9 +34,6 @@
 #define HAVE_SYS_FILIO_H
 #endif
 
-/* Define if you have strerror */
-#define HAVE_STRERROR
-
 /* Define if you have sys/bitypes.h */
 #undef HAVE_SYS_BITYPES_H
 
@@ -82,15 +79,6 @@
 #define HAVE_INET_ATON
 #endif
 
-/* Define if you have index() */
-#define HAVE_INDEX
-
-/* Define if you have memmove */
-#define HAVE_MEMMOVE
-
-/* Define if you have gethostid */
-#define HAVE_GETHOSTID
-
 /* Define if you DON'T have unix-domain sockets */
 #undef NO_UNIX_SOCKETS
 #ifdef _WIN32
-- 
1.8.3.1


