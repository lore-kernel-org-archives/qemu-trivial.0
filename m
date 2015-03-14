Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQU-0006Yu-4T
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQM-0006IF-3x
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQE-0004CM-Pq
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:50 -0400
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:34139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQE-0004CB-HY
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:42 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:41 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:39 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 299CD17D8042; 
	Sat, 14 Mar 2015 06:20:02 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JcIE36306994; Sat, 14 Mar 2015 06:19:38 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6Jch5013465; Sat, 14 Mar 2015 02:19:38 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkZ013361; Sat, 14 Mar 2015 02:19:38 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:34 +0100
Message-Id: <1426313974-25607-8-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0009-0000-0000-000003795974
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 7/7] Remove various unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:57 -0000

The functions tpm_backend_thread_tpm_reset(), serial_set_frequency()
and iothread_find() are completely unused, let's remove them.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 backends/tpm.c                   |   11 -----------
 hw/char/serial.c                 |    7 -------
 include/hw/char/serial.h         |    1 -
 include/sysemu/iothread.h        |    1 -
 include/sysemu/tpm_backend_int.h |    2 --
 iothread.c                       |   12 ------------
 6 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/backends/tpm.c b/backends/tpm.c
index 01860c4..0566202 100644
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
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 55011cf..231ec7d 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -876,13 +876,6 @@ void serial_exit_core(SerialState *s)
     qemu_unregister_reset(serial_reset, s);
 }
 
-/* Change the main reference oscillator frequency. */
-void serial_set_frequency(SerialState *s, uint32_t frequency)
-{
-    s->baudbase = frequency;
-    serial_update_parameters(s);
-}
-
 const MemoryRegionOps serial_io_ops = {
     .read = serial_ioport_read,
     .write = serial_ioport_write,
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 15beb6b..4be245f 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -80,7 +80,6 @@ extern const MemoryRegionOps serial_io_ops;
 
 void serial_realize_core(SerialState *s, Error **errp);
 void serial_exit_core(SerialState *s);
-void serial_set_frequency(SerialState *s, uint32_t frequency);
 
 /* legacy pre qom */
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
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
index 342a23f..878a594 100644
--- a/iothread.c
+++ b/iothread.c
@@ -121,18 +121,6 @@ static void iothread_register_types(void)
 
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
1.7.1


