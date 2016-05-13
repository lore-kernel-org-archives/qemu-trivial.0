Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b179b-00008o-F5
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 03:04:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179U-0008LP-96
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179S-0003Rj-Ol
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1b179J-0003OI-SU; Fri, 13 May 2016 03:04:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4872563308;
	Fri, 13 May 2016 07:04:37 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-225.ams2.redhat.com [10.36.7.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4D74XkX010464; Fri, 13 May 2016 03:04:36 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Fri, 13 May 2016 09:04:29 +0200
Message-Id: <1463123072-30603-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1463123072-30603-1-git-send-email-thuth@redhat.com>
References: <1463123072-30603-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 13 May 2016 07:04:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/4] slirp: Clean up slirp_config.h
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
X-List-Received-Date: Fri, 13 May 2016 07:04:54 -0000

There are a lot of unused #defines / #undefs in slirp_config.h,
which are apparently left-overs from the very early slirp code.
Since there is no more code that uses them, let's simply remove
them from our version of slirp.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/slirp_config.h | 87 ----------------------------------------------------
 1 file changed, 87 deletions(-)

diff --git a/slirp/slirp_config.h b/slirp/slirp_config.h
index 896d802..a5fa36e 100644
--- a/slirp/slirp_config.h
+++ b/slirp/slirp_config.h
@@ -9,19 +9,6 @@
 /* Define to 1 if you want KEEPALIVE timers */
 #define DO_KEEPALIVE 0
 
-/* Define to MAX interfaces you expect to use at once */
-/* MAX_INTERFACES determines the max. TOTAL number of interfaces (SLIP and PPP) */
-/* MAX_PPP_INTERFACES determines max. number of PPP interfaces */
-#define MAX_INTERFACES 1
-#define MAX_PPP_INTERFACES 1
-
-/* Define if you want slirp's socket in /tmp */
-/* XXXXXX Do this in ./configure */
-#undef USE_TMPSOCKET
-
-/* Define if you want slirp to use cfsetXspeed() on the terminal */
-#undef DO_CFSETSPEED
-
 /* Define this if you want slirp to write to the tty as fast as it can */
 /* This should only be set if you are using load-balancing, slirp does a */
 /* pretty good job on single modems already, and seting this will make */
@@ -29,34 +16,12 @@
 /* XXXXX Talk about having fast modem as unit 0 */
 #undef FULL_BOLT
 
-/*
- * Define if you want slirp to use less CPU
- * You will notice a small lag in interactive sessions, but it's not that bad
- * Things like Netscape/ftp/etc. are completely unaffected
- * This is mainly for sysadmins who have many slirp users
- */
-#undef USE_LOWCPU
-
-/* Define this if your compiler doesn't like prototypes */
-#ifndef __STDC__
-#define NO_PROTOTYPES
-#endif
-
 /*********************************************************/
 /*
  * Autoconf defined configuration options
  * You shouldn't need to touch any of these
  */
 
-/* Ignore this */
-#undef DUMMY_PPP
-
-/* Define if you have unistd.h */
-#define HAVE_UNISTD_H
-
-/* Define if you have stdlib.h */
-#define HAVE_STDLIB_H
-
 /* Define if you have sys/ioctl.h */
 #undef HAVE_SYS_IOCTL_H
 #ifndef _WIN32
@@ -72,10 +37,6 @@
 /* Define if you have strerror */
 #define HAVE_STRERROR
 
-/* Define according to how time.h should be included */
-#define TIME_WITH_SYS_TIME 0
-#undef HAVE_SYS_TIME_H
-
 /* Define if you have sys/bitypes.h */
 #undef HAVE_SYS_BITYPES_H
 
@@ -100,9 +61,6 @@
 #define HAVE_SYS_SELECT_H
 #endif
 
-/* Define if you have strings.h */
-#define HAVE_STRING_H
-
 /* Define if you have arpa/inet.h */
 #undef HAVE_ARPA_INET_H
 #ifndef _WIN32
@@ -115,51 +73,18 @@
 /* Define if you have sys/stropts.h */
 #undef HAVE_SYS_STROPTS_H
 
-/* Define to whatever your compiler thinks inline should be */
-//#define inline inline
-
-/* Define to whatever your compiler thinks const should be */
-//#define const const
-
-/* Define if your compiler doesn't like prototypes */
-#undef NO_PROTOTYPES
-
-/* Define to sizeof(char) */
-#define SIZEOF_CHAR 1
-
-/* Define to sizeof(short) */
-#define SIZEOF_SHORT 2
-
-/* Define to sizeof(int) */
-#define SIZEOF_INT 4
-
 /* Define to sizeof(char *) */
 #define SIZEOF_CHAR_P (HOST_LONG_BITS / 8)
 
-/* Define if you have random() */
-#undef HAVE_RANDOM
-
-/* Define if you have srandom() */
-#undef HAVE_SRANDOM
-
 /* Define if you have inet_aton */
 #undef HAVE_INET_ATON
 #ifndef _WIN32
 #define HAVE_INET_ATON
 #endif
 
-/* Define if you have setenv */
-#undef HAVE_SETENV
-
 /* Define if you have index() */
 #define HAVE_INDEX
 
-/* Define if you have bcmp() */
-#undef HAVE_BCMP
-
-/* Define if you have drand48 */
-#undef HAVE_DRAND48
-
 /* Define if you have memmove */
 #define HAVE_MEMMOVE
 
@@ -171,15 +96,3 @@
 #ifdef _WIN32
 #define NO_UNIX_SOCKETS
 #endif
-
-/* Define if you have revoke() */
-#undef HAVE_REVOKE
-
-/* Define if you have the sysv method of opening pty's (/dev/ptmx, etc.) */
-#undef HAVE_GRANTPT
-
-/* Define if you have fchmod */
-#undef HAVE_FCHMOD
-
-/* Define if you have <sys/type32.h> */
-#undef HAVE_SYS_TYPES32_H
-- 
1.8.3.1


