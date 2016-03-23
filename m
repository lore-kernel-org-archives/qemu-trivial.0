Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aikGz-0004WI-PU
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 11:00:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aikGu-0004TS-Rx
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 11:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aikGq-0002J5-K4
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 11:00:32 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aikGe-0002GT-RX; Wed, 23 Mar 2016 11:00:17 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id C0EEF17F50C; Wed, 23 Mar 2016 16:00:12 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Wed, 23 Mar 2016 15:59:57 +0100
Message-Id: <1458745197-17973-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Juan Quintela <quintela@redhat.com>, Amit Shah <amit.shah@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Stefan Weil <sw@weilnetz.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] Fix some typos found by codespell
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
X-List-Received-Date: Wed, 23 Mar 2016 15:00:36 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I hope that it is fine not to split this in lots of
small patches.

Regards
Stefan

 audio/mixeng.c                          |  2 +-
 audio/ossaudio.c                        |  2 +-
 contrib/ivshmem-server/ivshmem-server.h |  2 +-
 docs/specs/rocker.txt                   |  2 +-
 docs/throttle.txt                       |  2 +-
 hw/i2c/imx_i2c.c                        |  2 +-
 hw/net/vmxnet3.c                        |  4 ++--
 hw/pci/msi.c                            |  2 +-
 hw/pci/pci_bridge.c                     |  2 +-
 hw/scsi/spapr_vscsi.c                   |  2 +-
 hw/scsi/vmw_pvscsi.c                    |  2 +-
 hw/timer/a9gtimer.c                     |  2 +-
 hw/timer/aspeed_timer.c                 |  4 ++--
 include/crypto/random.h                 |  2 +-
 include/hw/xen/xen_common.h             |  2 +-
 include/io/task.h                       |  2 +-
 include/qemu/osdep.h                    |  2 +-
 kvm-all.c                               |  2 +-
 migration/migration.c                   |  2 +-
 migration/ram.c                         |  2 +-
 nbd/client.c                            |  2 +-
 qga/channel-win32.c                     |  2 +-
 qga/commands.c                          |  2 +-
 scripts/checkpatch.pl                   |  2 +-
 slirp/socket.c                          |  2 +-
 target-cris/translate.c                 |  4 ++--
 target-cris/translate_v10.c             |  2 +-
 target-i386/cpu.c                       |  2 +-
 target-i386/cpu.h                       |  2 +-
 target-mips/op_helper.c                 |  2 +-
 target-tricore/translate.c              |  2 +-
 tcg/README                              |  2 +-
 tests/tcg/cris/check_addo.c             | 14 +++++++-------
 trace/simple.c                          |  4 ++--
 ui/cocoa.m                              |  2 +-
 util/qemu-sockets.c                     |  2 +-
 util/timed-average.c                    |  4 ++--
 37 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index 981b97a..61ef869 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -270,7 +270,7 @@ f_sample *mixeng_clip[2][2][2][3] =3D {
  * August 21, 1998
  * Copyright 1998 Fabrice Bellard.
  *
- * [Rewrote completly the code of Lance Norskog And Sundry
+ * [Rewrote completely the code of Lance Norskog And Sundry
  * Contributors with a more efficient algorithm.]
  *
  * This source code is freely redistributable and may be used for
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 349e9dd..a0d9cda 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -898,7 +898,7 @@ static struct audio_option oss_options[] =3D {
         .name  =3D "EXCLUSIVE",
         .tag   =3D AUD_OPT_BOOL,
         .valp  =3D &glob_conf.exclusive,
-        .descr =3D "Open device in exclusive mode (vmix wont work)"
+        .descr =3D "Open device in exclusive mode (vmix won't work)"
     },
 #ifdef USE_DSP_POLICY
     {
diff --git a/contrib/ivshmem-server/ivshmem-server.h b/contrib/ivshmem-se=
rver/ivshmem-server.h
index 3851639..d37ca85 100644
--- a/contrib/ivshmem-server/ivshmem-server.h
+++ b/contrib/ivshmem-server/ivshmem-server.h
@@ -15,7 +15,7 @@
  * unix socket. For each client, the server will create some eventfd
  * (see EVENTFD(2)), one per vector. These fd are transmitted to all
  * clients using the SCM_RIGHTS cmsg message. Therefore, each client is
- * able to send a notification to another client without beeing
+ * able to send a notification to another client without being
  * "profixied" by the server.
  *
  * We use this mechanism to send interruptions between guests.
diff --git a/docs/specs/rocker.txt b/docs/specs/rocker.txt
index d2a8262..1857b31 100644
--- a/docs/specs/rocker.txt
+++ b/docs/specs/rocker.txt
@@ -303,7 +303,7 @@ Endianness
 ----------
=20
 Device registers are hard-coded to little-endian (LE).  The driver shoul=
d
-convert to/from host endianess to LE for device register accesses.
+convert to/from host endianness to LE for device register accesses.
=20
 Descriptors are LE.  Descriptor buffer TLVs will have LE type and length
 fields, but the value field can either be LE or network-byte-order, depe=
nding
diff --git a/docs/throttle.txt b/docs/throttle.txt
index 28204e4..06ed9b3 100644
--- a/docs/throttle.txt
+++ b/docs/throttle.txt
@@ -10,7 +10,7 @@ Introduction
 ------------
 QEMU includes a throttling module that can be used to set limits to
 I/O operations. The code itself is generic and independent of the I/O
-units, but it is currenly used to limit the number of bytes per second
+units, but it is currently used to limit the number of bytes per second
 and operations per second (IOPS) when performing disk I/O.
=20
 This document explains how to use the throttling code in QEMU, and how
diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index a01e43e..e19d4fa 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -247,7 +247,7 @@ static void imx_i2c_write(void *opaque, hwaddr offset=
,
             if (s->address =3D=3D ADDR_RESET) {
                 if (i2c_start_transfer(s->bus, extract32(s->i2dr_write, =
1, 7),
                                        extract32(s->i2dr_write, 0, 1))) =
{
-                    /* if non zero is returned, the adress is not valid =
*/
+                    /* if non zero is returned, the address is not valid=
 */
                     s->i2sr |=3D I2SR_RXAK;
                 } else {
                     s->address =3D s->i2dr_write;
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 093a71e..20f26b7 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -37,7 +37,7 @@
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
 #define MIN_BUF_SIZE 60
=20
-/* Compatability flags for migration */
+/* Compatibility flags for migration */
 #define VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT 0
 #define VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS \
     (1 << VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT)
@@ -341,7 +341,7 @@ typedef struct {
         uint32_t mcast_list_len;
         uint32_t mcast_list_buff_size; /* needed for live migration. */
=20
-        /* Compatability flags for migration */
+        /* Compatibility flags for migration */
         uint32_t compat_flags;
 } VMXNET3State;
=20
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index e0e64c2..a87ef4d 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -40,7 +40,7 @@
  *
  * Setting this flag to false will remove MSI/MSI-X capability from all =
devices.
  *
- * It is preferrable for controllers to set this to true (non-broken) ev=
en if
+ * It is preferable for controllers to set this to true (non-broken) eve=
n if
  * they do not actually support MSI/MSI-X: guests normally probe the con=
troller
  * type and do not attempt to enable MSI/MSI-X with interrupt controller=
s not
  * supporting such, so removing the capability is not required, and
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3cf30bd..5118ef4 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -116,7 +116,7 @@ pcibus_t pci_bridge_get_base(const PCIDevice *bridge,=
 uint8_t type)
     return base;
 }
=20
-/* accessor funciton to get bridge filtering limit */
+/* accessor function to get bridge filtering limit */
 pcibus_t pci_bridge_get_limit(const PCIDevice *bridge, uint8_t type)
 {
     pcibus_t limit;
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index e4833d5..4699749 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -696,7 +696,7 @@ static void vscsi_inquiry_no_target(VSCSIState *s, vs=
csi_req *req)
     uint8_t resp_data[36];
     int rc, len, alen;
=20
-    /* We dont do EVPD. Also check that page_code is 0 */
+    /* We don't do EVPD. Also check that page_code is 0 */
     if ((cdb[1] & 0x01) || cdb[2] !=3D 0) {
         /* Send INVALID FIELD IN CDB */
         vscsi_makeup_sense(s, req, ILLEGAL_REQUEST, 0x24, 0);
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 9abc086..cd5e7f3 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -62,7 +62,7 @@ typedef struct PVSCSIClass {
 #define PVSCSI_DEVICE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(PVSCSIClass, (obj), TYPE_PVSCSI)
=20
-/* Compatability flags for migration */
+/* Compatibility flags for migration */
 #define PVSCSI_COMPAT_OLD_PCI_CONFIGURATION_BIT 0
 #define PVSCSI_COMPAT_OLD_PCI_CONFIGURATION \
     (1 << PVSCSI_COMPAT_OLD_PCI_CONFIGURATION_BIT)
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index fa4602c..fe304f4 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -183,7 +183,7 @@ static void a9_gtimer_write(void *opaque, hwaddr addr=
, uint64_t value,
     case R_COUNTER_LO:
         /*
          * Keep it simple - ARM docco explicitly says to disable timer b=
efore
-         * modding it, so dont bother trying to do all the difficult on =
the fly
+         * modding it, so don't bother trying to do all the difficult on=
 the fly
          * timer modifications - (if they even work in real hardware??).
          */
         if (s->control & R_CONTROL_TIMER_ENABLE) {
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 51e8303..ebec359 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -187,7 +187,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlSta=
te *s, int timer, int reg,
 }
=20
 /* Control register operations are broken out into helpers that can be
- * explictly called on aspeed_timer_reset(), but also from
+ * explicitly called on aspeed_timer_reset(), but also from
  * aspeed_timer_ctrl_op().
  */
=20
@@ -380,7 +380,7 @@ static void aspeed_timer_reset(DeviceState *dev)
=20
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         AspeedTimer *t =3D &s->timers[i];
-        /* Explictly call helpers to avoid any conditional behaviour thr=
ough
+        /* Explicitly call helpers to avoid any conditional behaviour th=
rough
          * aspeed_timer_set_ctrl().
          */
         aspeed_timer_ctrl_enable(t, false);
diff --git a/include/crypto/random.h b/include/crypto/random.h
index b3021c4..f9308f4 100644
--- a/include/crypto/random.h
+++ b/include/crypto/random.h
@@ -34,7 +34,7 @@
  * Fill @buf with @buflen bytes of cryptographically strong
  * random data
  *
- * Returns 0 on sucess, -1 on error
+ * Returns 0 on success, -1 on error
  */
 int qcrypto_random_bytes(uint8_t *buf,
                          size_t buflen,
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index bd65e67..7b52e8f 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -26,7 +26,7 @@
  * We don't support Xen prior to 4.2.0.
  */
=20
-/* Xen 4.2 thru 4.6 */
+/* Xen 4.2 through 4.6 */
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 471
=20
 typedef xc_interface xenforeignmemory_handle;
diff --git a/include/io/task.h b/include/io/task.h
index 2e69d8a..a993212 100644
--- a/include/io/task.h
+++ b/include/io/task.h
@@ -219,7 +219,7 @@ void qio_task_run_in_thread(QIOTask *task,
  * qio_task_complete:
  * @task: the task struct
  *
- * Mark the operation as succesfully completed
+ * Mark the operation as successfully completed
  * and free the memory for @task.
  */
 void qio_task_complete(QIOTask *task);
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 5bb374c..5a0727a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -283,7 +283,7 @@ static inline void qemu_timersub(const struct timeval=
 *val1,
 void qemu_set_cloexec(int fd);
=20
 /* QEMU "hardware version" setting. Used to replace code that exposed
- * QEMU_VERSION to guests in the past and need to keep compatibilty.
+ * QEMU_VERSION to guests in the past and need to keep compatibility.
  * Do not use qemu_hw_version() in new code.
  */
 void qemu_set_hw_version(const char *);
diff --git a/kvm-all.c b/kvm-all.c
index 44c0464..3294364 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -413,7 +413,7 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryLi=
stener *kml,
          * userspace memory corruption (which is not detectable by valgr=
ind
          * too, in most cases).
          * So for now, let's align to 64 instead of HOST_LONG_BITS here,=
 in
-         * a hope that sizeof(long) wont become >8 any time soon.
+         * a hope that sizeof(long) won't become >8 any time soon.
          */
         size =3D ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
                      /*HOST_LONG_BITS*/ 64) / 8;
diff --git a/migration/migration.c b/migration/migration.c
index 034a918..c515ee1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -278,7 +278,7 @@ static void deferred_incoming_migration(Error **errp)
 void migrate_send_rp_req_pages(MigrationIncomingState *mis, const char *=
rbname,
                                ram_addr_t start, size_t len)
 {
-    uint8_t bufc[12 + 1 + 255]; /* start (8), len (4), rbname upto 256 *=
/
+    uint8_t bufc[12 + 1 + 255]; /* start (8), len (4), rbname up to 256 =
*/
     size_t msglen =3D 12; /* start + len */
=20
     *(uint64_t *)bufc =3D cpu_to_be64((uint64_t)start);
diff --git a/migration/ram.c b/migration/ram.c
index 704f6a9..621fb31 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1271,7 +1271,7 @@ static int ram_save_target_page(MigrationState *ms,=
 QEMUFile *f,
 }
=20
 /**
- * ram_save_host_page: Starting at *offset send pages upto the end
+ * ram_save_host_page: Starting at *offset send pages up to the end
  *                     of the current host page.  It's valid for the ini=
tial
  *                     offset to point into the middle of a host page
  *                     in which case the remainder of the hostpage is se=
nt.
diff --git a/nbd/client.c b/nbd/client.c
index 9e5b651..426dd94 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -318,7 +318,7 @@ static QIOChannel *nbd_receive_starttls(QIOChannel *i=
oc,
     }
     length =3D be32_to_cpu(length);
     if (length !=3D 0) {
-        error_setg(errp, "Start TLS reponse was not zero %x",
+        error_setg(errp, "Start TLS response was not zero %x",
                    length);
         return NULL;
     }
diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index bb59661..1396fe8 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -77,7 +77,7 @@ static gboolean ga_channel_prepare(GSource *source, gin=
t *timeout_ms)
     }
=20
 out:
-    /* dont block forever, iterate the main loop every once and a while =
*/
+    /* don't block forever, iterate the main loop every once and a while=
 */
     *timeout_ms =3D 500;
     /* if there's data in the read buffer, or another event is pending,
      * skip polling and issue user cb.
diff --git a/qga/commands.c b/qga/commands.c
index e091ee1..1589808 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -182,7 +182,7 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, E=
rror **err)
 #ifdef G_OS_WIN32
         /* Additionally WIN32 does not provide any additional informatio=
n
          * on whetherthe child exited or terminated via signal.
-         * We use this simple range check to distingish application exit=
 code
+         * We use this simple range check to distinguish application exi=
t code
          * (usually value less then 256) and unhandled exception code wi=
th
          * ntstatus (always value greater then 0xC0000005). */
         if ((uint32_t)gei->status < 0xC0000000U) {
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c26f76e..ebef642 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -362,7 +362,7 @@ sub sanitise_line {
 	for ($off =3D 1; $off < length($line); $off++) {
 		$c =3D substr($line, $off, 1);
=20
-		# Comments we are wacking completly including the begin
+		# Comments we are wacking completely including the begin
 		# and end, all to $;.
 		if ($sanitise_quote eq '' && substr($line, $off, 2) eq '/*') {
 			$sanitise_quote =3D '*/';
diff --git a/slirp/socket.c b/slirp/socket.c
index b836c42..54e2625 100644
--- a/slirp/socket.c
+++ b/slirp/socket.c
@@ -191,7 +191,7 @@ soread(struct socket *so)
 	 * We don't test for <=3D 0 this time, because there legitimately
 	 * might not be any more data (since the socket is non-blocking),
 	 * a close will be detected on next iteration.
-	 * A return of -1 wont (shouldn't) happen, since it didn't happen above
+	 * A return of -1 won't (shouldn't) happen, since it didn't happen abov=
e
 	 */
 	if (n =3D=3D 2 && nn =3D=3D iov[0].iov_len) {
             int ret;
diff --git a/target-cris/translate.c b/target-cris/translate.c
index a73176c..5227f65 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -3049,7 +3049,7 @@ static unsigned int crisv32_decoder(CPUCRISState *e=
nv, DisasContext *dc)
  *
  * When the software returns from an exception, the branch will re-execu=
te.
  * On QEMU care needs to be taken when a branch+delayslot sequence is br=
oken
- * and the branch and delayslot dont share pages.
+ * and the branch and delayslot don't share pages.
  *
  * The TB contaning the branch insn will set up env->btarget and evaluat=
e=20
  * env->btaken. When the translation loop exits we will note that the br=
anch=20
@@ -3238,7 +3238,7 @@ void gen_intermediate_code(CPUCRISState *env, struc=
t TranslationBlock *tb)
         }
=20
         /* If we are rexecuting a branch due to exceptions on
-           delay slots dont break.  */
+           delay slots don't break.  */
         if (!(tb->pc & 1) && cs->singlestep_enabled) {
             break;
         }
diff --git a/target-cris/translate_v10.c b/target-cris/translate_v10.c
index 7607ead..06ba1ef 100644
--- a/target-cris/translate_v10.c
+++ b/target-cris/translate_v10.c
@@ -130,7 +130,7 @@ static void cris_set_prefix(DisasContext *dc)
     dc->tb_flags |=3D PFIX_FLAG;
     tcg_gen_ori_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], PFIX_FLAG);
=20
-    /* prefix insns dont clear the x flag.  */
+    /* prefix insns don't clear the x flag.  */
     dc->clear_x =3D 0;
     cris_lock_irq(dc);
 }
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3ea6b29..3c6f966 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2519,7 +2519,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index=
, uint32_t count,
=20
         /* The Linux kernel checks for the CMPLegacy bit and
          * discards multiple thread information if it is set.
-         * So dont set it here for Intel to make Linux guests happy.
+         * So don't set it here for Intel to make Linux guests happy.
          */
         if (cs->nr_cores * cs->nr_threads > 1) {
             if (env->cpuid_vendor1 !=3D CPUID_VENDOR_INTEL_1 ||
diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 5148c82..c40ec06 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -1362,7 +1362,7 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAcc=
ess access);
  * If value is NULL, no default will be set and the original
  * value from the CPU model table will be kept.
  *
- * It is valid to call this funciton only for properties that
+ * It is valid to call this function only for properties that
  * are already present in the kvm_default_props table.
  */
 void x86_cpu_change_kvm_default(const char *prop, const char *value);
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 7c5669c..7d2e6a8 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -581,7 +581,7 @@ static bool mips_vp_is_wfi(MIPSCPU *c)
=20
 static inline void mips_vpe_wake(MIPSCPU *c)
 {
-    /* Dont set ->halted =3D 0 directly, let it be done via cpu_has_work
+    /* Don't set ->halted =3D 0 directly, let it be done via cpu_has_wor=
k
        because there might be other conditions that state that c should
        be sleeping.  */
     cpu_interrupt(CPU(c), CPU_INTERRUPT_WAKE);
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index d13e5c8..9ac74e9 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -2858,7 +2858,7 @@ static void gen_shaci(TCGv ret, TCGv r1, int32_t sh=
ift_count)
     } else if (shift_count =3D=3D -32) {
         /* set PSW.C */
         tcg_gen_mov_tl(cpu_PSW_C, r1);
-        /* fill ret completly with sign bit */
+        /* fill ret completely with sign bit */
         tcg_gen_sari_tl(ret, r1, 31);
         /* clear PSW.V */
         tcg_gen_movi_tl(cpu_PSW_V, 0);
diff --git a/tcg/README b/tcg/README
index f4a8ac1..ce8beba 100644
--- a/tcg/README
+++ b/tcg/README
@@ -473,7 +473,7 @@ On a 32 bit target, all 64 bit operations are convert=
ed to 32 bits. A
 few specific operations must be implemented to allow it (see add2_i32,
 sub2_i32, brcond2_i32).
=20
-On a 64 bit target, the values are transfered between 32 and 64-bit
+On a 64 bit target, the values are transferred between 32 and 64-bit
 registers using the following ops:
 - trunc_shr_i64_i32
 - ext_i32_i64
diff --git a/tests/tcg/cris/check_addo.c b/tests/tcg/cris/check_addo.c
index 3d8e789..4235e5f 100644
--- a/tests/tcg/cris/check_addo.c
+++ b/tests/tcg/cris/check_addo.c
@@ -51,7 +51,7 @@ int main(void)
 	t =3D (unsigned char *)x;
 	t -=3D 32768;
 	p =3D (unsigned char *) &y.v1;
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_pi_d(p, t);
@@ -62,7 +62,7 @@ int main(void)
=20
=20
 	t +=3D 32770;
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_pi_w(p, t);
@@ -71,7 +71,7 @@ int main(void)
 	if (*r !=3D 0x4455aa77)
 		err();
=20
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_d(p, r);
@@ -81,7 +81,7 @@ int main(void)
 	if (*r !=3D 0xee19ccff)
 		err();
=20
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_pi_b(p, t);
@@ -90,7 +90,7 @@ int main(void)
 	if (*(uint16_t*)r !=3D 0xff22)
 		err();
=20
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_b(p, r);
@@ -100,7 +100,7 @@ int main(void)
 	if (*r !=3D 0x4455aa77)
 		err();
=20
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_w(p, r);
@@ -110,7 +110,7 @@ int main(void)
 	if (*r !=3D 0xff224455)
 		err();
=20
-	mb(); /* dont reorder anything beyond here.  */
+	mb(); /* don't reorder anything beyond here.  */
 	cris_tst_cc_init();
 	asm volatile ("setf\tzvnc\n");
 	cris_addo_pi_d(p, t);
diff --git a/trace/simple.c b/trace/simple.c
index 3fdcc82..2f09daf 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -108,7 +108,7 @@ static bool get_trace_record(unsigned int idx, TraceR=
ecord **recordptr)
     smp_rmb(); /* read memory barrier before accessing record */
     /* read the record header to know record length */
     read_from_buffer(idx, &record, sizeof(TraceRecord));
-    *recordptr =3D malloc(record.length); /* dont use g_malloc, can dead=
lock when traced */
+    *recordptr =3D malloc(record.length); /* don't use g_malloc, can dea=
dlock when traced */
     /* make a copy of record to avoid being overwritten */
     read_from_buffer(idx, *recordptr, record.length);
     smp_rmb(); /* memory barrier before clearing valid flag */
@@ -180,7 +180,7 @@ static gpointer writeout_thread(gpointer opaque)
         while (get_trace_record(idx, &recordptr)) {
             unused =3D fwrite(recordptr, recordptr->length, 1, trace_fp)=
;
             writeout_idx +=3D recordptr->length;
-            free(recordptr); /* dont use g_free, can deadlock when trace=
d */
+            free(recordptr); /* don't use g_free, can deadlock when trac=
ed */
             idx =3D writeout_idx % TRACE_BUF_LEN;
         }
=20
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 7063a02..6a2ae68 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1405,7 +1405,7 @@ static void addRemovableDevicesMenuItems(void)
     [menuItem setEnabled: NO];
     [menu addItem: menuItem];
=20
-    /* Loop thru all the block devices in the emulator */
+    /* Loop through all the block devices in the emulator */
     while (currentDevice) {
         deviceName =3D [[NSString stringWithFormat: @"%s", currentDevice=
->value->device] retain];
=20
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 540649a..56e0a08 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -90,7 +90,7 @@ NetworkAddressFamily inet_netfamily(int family)
  *   t     f       PF_INET
  *   t     t       PF_INET6
  *
- * NB, this matrix is only about getting the neccessary results
+ * NB, this matrix is only about getting the necessary results
  * from getaddrinfo(). Some of the cases require further work
  * after reading results from getaddrinfo in order to fully
  * apply the logic the end user wants. eg with the last case
diff --git a/util/timed-average.c b/util/timed-average.c
index 2eef9cb..2b49d53 100644
--- a/util/timed-average.c
+++ b/util/timed-average.c
@@ -8,9 +8,9 @@
  *   Beno=C3=AEt Canet <benoit.canet@nodalink.com>
  *   Alberto Garcia <berto@igalia.com>
  *
- * This program is free sofware: you can redistribute it and/or modify
+ * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
- * the Free Sofware Foundation, either version 2 of the License, or
+ * the Free Software Foundation, either version 2 of the License, or
  * (at your option) version 3 or any later version.
  *
  * This program is distributed in the hope that it will be useful,
--=20
2.1.4


