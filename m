Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJi-0006j5-OC
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJc-0006WG-FB
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0005mD-CU
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJV-0005YF-4G; Fri, 08 May 2015 18:00:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6FA9D40782;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 464AD953;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: (nullmailer pid 10317 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:03 +0300
Message-Id: <ac9541579eb95b0b8c93ca58d0a074e1f22cd55a.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 3/5] Remove various unused functions
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
X-List-Received-Date: Fri, 08 May 2015 22:00:17 -0000

From: Thomas Huth <huth@tuxfamily.org>

The functions tpm_backend_thread_tpm_reset() and iothread_find()
are completely unused, let's remove them.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 backends/tpm.c                   | 11 -----------
 include/sysemu/iothread.h        |  1 -
 include/sysemu/tpm_backend_int.h |  2 --
 iothread.c                       | 12 ------------
 4 files changed, 26 deletions(-)

diff --git a/backends/tpm.c b/backends/tpm.c
index 4efe367..36c5d46 100644
--- a/backends/tpm.c
+++ b/backends/tpm.c
@@ -165,17 +165,6 @@ void tpm_backend_thread_end(TPMBackendThread *tbt)
     }
 }
 
-void tpm_backend_thread_tpm_reset(TPMBackendThread *tbt,
-                                  GFunc func, gpointer user_data)
-{
-    if (!tbt->pool) {
-        tpm_backend_thread_create(tbt, func, user_data);
-    } else {
-        g_thread_pool_push(tbt->pool, (gpointer)TPM_BACKEND_CMD_TPM_RESET,
-                           NULL);
-    }
-}
-
 static const TypeInfo tpm_backend_info = {
     .name = TYPE_TPM_BACKEND,
     .parent = TYPE_OBJECT,
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 7c01a61..2eefea1 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -33,7 +33,6 @@ typedef struct {
 #define IOTHREAD(obj) \
    OBJECT_CHECK(IOThread, obj, TYPE_IOTHREAD)
 
-IOThread *iothread_find(const char *id);
 char *iothread_get_id(IOThread *iothread);
 AioContext *iothread_get_aio_context(IOThread *iothread);
 
diff --git a/include/sysemu/tpm_backend_int.h b/include/sysemu/tpm_backend_int.h
index 05d94d0..40f693a 100644
--- a/include/sysemu/tpm_backend_int.h
+++ b/include/sysemu/tpm_backend_int.h
@@ -32,8 +32,6 @@ void tpm_backend_thread_deliver_request(TPMBackendThread *tbt);
 void tpm_backend_thread_create(TPMBackendThread *tbt,
                                GFunc func, gpointer user_data);
 void tpm_backend_thread_end(TPMBackendThread *tbt);
-void tpm_backend_thread_tpm_reset(TPMBackendThread *tbt,
-                                  GFunc func, gpointer user_data);
 
 typedef enum TPMBackendCmd {
     TPM_BACKEND_CMD_INIT = 1,
diff --git a/iothread.c b/iothread.c
index a1f9109..0416fc4 100644
--- a/iothread.c
+++ b/iothread.c
@@ -114,18 +114,6 @@ static void iothread_register_types(void)
 
 type_init(iothread_register_types)
 
-IOThread *iothread_find(const char *id)
-{
-    Object *container = container_get(object_get_root(), IOTHREADS_PATH);
-    Object *child;
-
-    child = object_property_get_link(container, id, NULL);
-    if (!child) {
-        return NULL;
-    }
-    return (IOThread *)object_dynamic_cast(child, TYPE_IOTHREAD);
-}
-
 char *iothread_get_id(IOThread *iothread)
 {
     return object_get_canonical_path_component(OBJECT(iothread));
-- 
2.1.4


