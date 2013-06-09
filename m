Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ulee0-0003Cg-JR
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jun 2013 08:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uledx-00038p-N2
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 08:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uledw-00037a-PA
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 08:22:45 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:50340
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uledu-000374-Nq; Sun, 09 Jun 2013 08:22:42 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id A4396181F1F; Sun,  9 Jun 2013 14:22:37 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun,  9 Jun 2013 14:22:16 +0200
Message-Id: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, "Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] audio: Replace macro GCC_ATTR by
	GCC_FMT_ATTR and use inline functions
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
X-List-Received-Date: Sun, 09 Jun 2013 12:22:46 -0000

GCC_ATTR was only used in audio_int.h, so it is now unused and
the definition can be removed from compiler.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 audio/audio_int.h       |    8 +++-----
 include/qemu/compiler.h |    3 ---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index b9b0676..5a6284b 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -243,7 +243,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
     return (dst >= src) ? (dst - src) : (len - src + dst);
 }
 
-static void GCC_ATTR dolog (const char *fmt, ...)
+static inline void GCC_FMT_ATTR(1, 2) dolog (const char *fmt, ...)
 {
     va_list ap;
 
@@ -253,7 +253,7 @@ static void GCC_ATTR dolog (const char *fmt, ...)
 }
 
 #ifdef DEBUG
-static void GCC_ATTR ldebug (const char *fmt, ...)
+static inline void GCC_FMT_ATTR(1, 2) ldebug (const char *fmt, ...)
 {
     va_list ap;
 
@@ -267,15 +267,13 @@ static void GCC_ATTR ldebug (const char *fmt, ...)
 #elif defined NDEBUG && defined _MSC_VER
 #define ldebug __noop
 #else
-static void GCC_ATTR ldebug (const char *fmt, ...)
+static inline void GCC_FMT_ATTR(1, 2) ldebug (const char *fmt, ...)
 {
     (void) fmt;
 }
 #endif
 #endif
 
-#undef GCC_ATTR
-
 #define AUDIO_STRINGIFY_(n) #n
 #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
 
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 6175c24..155b358 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -38,11 +38,9 @@
 #if defined __GNUC__
 # if !QEMU_GNUC_PREREQ(4, 4)
    /* gcc versions before 4.4.x don't support gnu_printf, so use printf. */
-#  define GCC_ATTR __attribute__((__unused__, format(printf, 1, 2)))
 #  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
 # else
    /* Use gnu_printf when supported (qemu uses standard format strings). */
-#  define GCC_ATTR __attribute__((__unused__, format(gnu_printf, 1, 2)))
 #  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
 #  if defined(_WIN32)
     /* Map __printf__ to __gnu_printf__ because we want standard format strings
@@ -51,7 +49,6 @@
 #  endif
 # endif
 #else
-#define GCC_ATTR /**/
 #define GCC_FMT_ATTR(n, m)
 #endif
 
-- 
1.7.10.4


