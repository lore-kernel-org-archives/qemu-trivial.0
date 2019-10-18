Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLPka-00011I-Sf
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2019 06:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iLPkY-0000zD-PR
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 06:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iLPkX-00047m-MG
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 06:44:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iLPkT-0003z5-GG; Fri, 18 Oct 2019 06:44:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABE7310DCC96;
 Fri, 18 Oct 2019 10:44:44 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD6860852;
 Fri, 18 Oct 2019 10:44:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com, eblake@redhat.com
Subject: [PATCH] Do not use %m in common code to print error messages
Date: Fri, 18 Oct 2019 12:44:38 +0200
Message-Id: <20191018104438.6158-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 10:44:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2019 10:44:52 -0000

The %m format specifier is an extension from glibc - and when compiling
QEMU for NetBSD, the compiler correctly complains, e.g.:

/home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
/home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
 allowed in syslog(3) like functions [-Wformat=]
             printf("read from sigfd returned %zd: %m\n", len);
             ^
Let's use g_strerror() here instead, which is an easy-to-use wrapper
around the thread-safe strerror_r() function.

While we're at it, also convert the "printf()" in main-loop.c into
the preferred "error_report()".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/tmp421.c | 8 ++++++--
 util/main-loop.c | 4 +++-
 util/systemd.c   | 5 +++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index 9f044705fa..f23c46a40a 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -120,7 +120,9 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
     int tempid;
 
     if (sscanf(name, "temperature%d", &tempid) != 1) {
-        error_setg(errp, "error reading %s: %m", name);
+        const char *errmsg = g_strerror(errno);
+        error_setg(errp, "error reading %s: %s", name, errmsg);
+        g_free((gpointer)errmsg);
         return;
     }
 
@@ -160,7 +162,9 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
     }
 
     if (sscanf(name, "temperature%d", &tempid) != 1) {
-        error_setg(errp, "error reading %s: %m", name);
+        const char *errmsg = g_strerror(errno);
+        error_setg(errp, "error reading %s: %s", errmsg);
+        g_free((gpointer)errmsg);
         return;
     }
 
diff --git a/util/main-loop.c b/util/main-loop.c
index e3eaa55866..e95d93fef3 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -61,7 +61,9 @@ static void sigfd_handler(void *opaque)
         }
 
         if (len != sizeof(info)) {
-            printf("read from sigfd returned %zd: %m\n", len);
+            const char *errmsg = g_strerror(errno);
+            error_report("read from sigfd returned %zd: %s", len, errmsg);
+            g_free((gpointer)errmsg);
             return;
         }
 
diff --git a/util/systemd.c b/util/systemd.c
index d22e86c707..17862c704f 100644
--- a/util/systemd.c
+++ b/util/systemd.c
@@ -59,9 +59,10 @@ unsigned int check_socket_activation(void)
              * descriptor is invalid, so socket activation has gone wrong
              * and we should exit.
              */
+            const char *errmsg = g_strerror(errno);
             error_report("Socket activation failed: "
-                         "invalid file descriptor fd = %d: %m",
-                         fd);
+                         "invalid file descriptor fd = %d: %s", fd, errmsg);
+            g_free((gpointer)errmsg);
             exit(EXIT_FAILURE);
         }
     }
-- 
2.18.1


