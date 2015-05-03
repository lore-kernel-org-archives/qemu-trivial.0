Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YopYk-0004Wn-Pf
	for mharc-qemu-trivial@gnu.org; Sun, 03 May 2015 04:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YopYi-0004TV-Cr
	for qemu-trivial@nongnu.org; Sun, 03 May 2015 04:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YopYh-0002Or-4B
	for qemu-trivial@nongnu.org; Sun, 03 May 2015 04:47:32 -0400
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1YopYc-0002No-J9; Sun, 03 May 2015 04:47:26 -0400
Received: by wiun10 with SMTP id n10so83123632wiu.1;
	Sun, 03 May 2015 01:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=pJAmgFm0CrxlaFjLqdCi1qwN/Czty7xT4BZ2pqz7w3A=;
	b=WJOK/mWP6cvtSwte0wjnrXlVO9zzhNjLBtQ70ODEWgJENX0XHktvJQM0GC8WZbMYrB
	qY8wKKImL5NgzTan9AtyrBR/JgNgB1KamTMJ/rPuJY4TymImW4LujJhgESivsQznGEig
	6PcUKojCzNCbua08Lz2+jYFrxfiK6mXKslbysW6oJzEhm+hJRZ5J5LU/svujZzua6Kdn
	vhtRB1tSyxPdqJWZ6nz/rHuGRyWS4fHIltTTyltbz/NnTb8KArvnY9qazAuaN4aSBx4d
	34B69YKgPO5Law4m08t3qFwCyFwBDdSj2i5qFEnDKrdw0ssOBReBP4uaduX7nyes76N+
	J7fA==
X-Received: by 10.180.84.97 with SMTP id x1mr10214364wiy.1.1430642845390;
	Sun, 03 May 2015 01:47:25 -0700 (PDT)
Received: from tpl530 (p57AEDA62.dip0.t-ipconnect.de. [87.174.218.98])
	by mx.google.com with ESMTPSA id o6sm5715009wiz.24.2015.05.03.01.47.23
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Sun, 03 May 2015 01:47:24 -0700 (PDT)
Date: Sun, 3 May 2015 10:47:22 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Message-ID: <20150503104722.3b3670c7@tpl530>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.182
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Remove various unused functions
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
X-List-Received-Date: Sun, 03 May 2015 08:47:33 -0000


The functions tpm_backend_thread_tpm_reset() and iothread_find()
are completely unused, let's remove them.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
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
1.9.1


