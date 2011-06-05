Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QUJ71-0006Cp-O4
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2011 09:47:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QT4TX-0002Qn-Hz
	for qemu-trivial@nongnu.org; Sat, 04 Jun 2011 23:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QT4TQ-0003NM-QB
	for qemu-trivial@nongnu.org; Sat, 04 Jun 2011 23:58:07 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:42058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QT4TC-0003ML-O5; Sat, 04 Jun 2011 23:57:47 -0400
Received: by vxb37 with SMTP id 37so2461700vxb.4
	for <multiple recipients>; Sat, 04 Jun 2011 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=U/l3g7JHx9amXFuc/GvoXXpEI2F6uul3mKmRndQrvJk=;
	b=rS8cEs2AGtfrA2GvZR0oDUTlew/e/ChtbBOG6c2GECkB7QhkOnrdtQmz5dxyz5dgwX
	XX8Aphlp8yXstlizqQHsu+rxByYiVx09vO6DlcHDzaCXKvmO1/K/PrqTZmX9AAYOgK6B
	kyFJHxfKw1xYJCUySpf9gjdXp83VqCxV0lUtk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=SC7wXu8/nsVkWLVmYXwqzxEho2DKqNCBBEjS/uwAQxFOPPhuS6I+sMwySzwuHEoqPE
	IYI20NsvNwjVo34YWZO40gKWvL7IcgV+mO3wBgugzAi3Gk8s50pHD7A8YHsRvCE6Dxyp
	eU7c4yms33OX1S4MweA05mNeSmRCn2czFp2DM=
Received: by 10.220.176.198 with SMTP id bf6mr121935vcb.235.1307246264813;
	Sat, 04 Jun 2011 20:57:44 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id m9sm47434vcv.16.2011.06.04.20.57.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Jun 2011 20:57:43 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2011 23:57:00 -0400
Message-Id: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
X-Mailman-Approved-At: Wed, 08 Jun 2011 09:47:56 -0400
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_Correct_and_standardize_head?=
	=?utf-8?q?er_guards_in_all_header_files?=
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
X-List-Received-Date: Sun, 05 Jun 2011 03:58:14 -0000

As per ISO/IEC 9899, Section 7.1.3 on reserved identifiers,
identifiers starting with an underscore are reserved.

Therefore:
1) Rename all incorrect header guards

While I'm at it:
2) Standardize header guards to "#ifndef SOMETHING_H"
3) Repeat the header guard identifier after the closing "#endif"

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 a.out.h                         |    6 +++---
 acl.h                           |    6 +++---
 aes.h                           |    2 +-
 arch_init.h                     |    2 +-
 audio/audio.h                   |    2 +-
 audio/audio_int.h               |    2 +-
 audio/audio_pt_int.h            |    2 +-
 audio/mixeng.h                  |    2 +-
 balloon.h                       |    6 +++---
 bitops.h                        |    2 +-
 block.h                         |    2 +-
 block/qcow2.h                   |    2 +-
 block/rbd_types.h               |    2 +-
 blockdev.h                      |    2 +-
 bsd-user/qemu-types.h           |    4 +++-
 bt-host.h                       |    2 +-
 buffered_file.h                 |    2 +-
 cmd.h                           |    6 +++---
 compatfd.h                      |    2 +-
 console.h                       |    2 +-
 cpu-common.h                    |    4 ++--
 cpu-defs.h                      |    2 +-
 cpus.h                          |    2 +-
 darwin-user/qemu.h              |    2 +-
 def-helper.h                    |    4 ++--
 device_tree.h                   |    6 +++---
 disas.h                         |    6 +++---
 dma.h                           |    2 +-
 dyngen-exec.h                   |    6 +++---
 elf.h                           |    6 +++---
 exec-all.h                      |    6 +++---
 fsdev/file-op-9p.h              |    6 +++---
 fsdev/qemu-fsdev.h              |    4 +++-
 gdbstub.h                       |    2 +-
 hpet.h                          |    6 +++---
 hw/9p.h                         |    2 +-
 hw/9pfs/virtio-9p-debug.h       |    6 +++---
 hw/9pfs/virtio-9p-xattr.h       |    6 +++---
 hw/9pfs/virtio-9p.h             |    6 +++---
 hw/apb_pci.h                    |    2 +-
 hw/apic.h                       |    2 +-
 hw/bitbang_i2c.h                |    2 +-
 hw/boards.h                     |    2 +-
 hw/dec_pci.h                    |    2 +-
 hw/devices.h                    |    2 +-
 hw/e1000_hw.h                   |    6 +++---
 hw/esp.h                        |    2 +-
 hw/event_notifier.h             |    2 +-
 hw/fdc.h                        |    2 +-
 hw/fmopl.h                      |    6 +++---
 hw/framebuffer.h                |    2 +-
 hw/fw_cfg.h                     |    2 +-
 hw/grlib.h                      |    6 +++---
 hw/gusemu.h                     |    2 +-
 hw/gustate.h                    |    2 +-
 hw/hpet_emul.h                  |    3 ++-
 hw/hw.h                         |    3 ++-
 hw/i2c.h                        |    2 +-
 hw/ide/pci.h                    |    3 ++-
 hw/intel-hda-defs.h             |    2 +-
 hw/intel-hda.h                  |    2 +-
 hw/irq.h                        |    2 +-
 hw/isa.h                        |    2 +-
 hw/loader.h                     |    2 +-
 hw/mcf.h                        |    2 +-
 hw/mips.h                       |    2 +-
 hw/mips_cpudevs.h               |    2 +-
 hw/msix.h                       |    2 +-
 hw/multiboot.h                  |    2 +-
 hw/omap.h                       |    6 +++---
 hw/openpic.h                    |    6 +++---
 hw/pc.h                         |    2 +-
 hw/pci.h                        |    2 +-
 hw/ppc-viosrp.h                 |    2 +-
 hw/ppc440.h                     |    2 +-
 hw/ppc_mac.h                    |    6 +++---
 hw/prep_pci.h                   |    2 +-
 hw/primecell.h                  |    2 +-
 hw/qdev.h                       |    2 +-
 hw/scsi.h                       |    2 +-
 hw/sd.h                         |    6 +++---
 hw/sh.h                         |    2 +-
 hw/sh7750_regnames.h            |    6 +++---
 hw/sh7750_regs.h                |    6 +++---
 hw/sh_intc.h                    |    6 +++---
 hw/sharpsl.h                    |    2 +-
 hw/spapr.h                      |    6 +++---
 hw/spapr_vio.h                  |    6 +++---
 hw/sparc32_dma.h                |    2 +-
 hw/ssi.h                        |    2 +-
 hw/strongarm.h                  |    6 +++---
 hw/sun4m.h                      |    2 +-
 hw/syborg.h                     |    6 +++---
 hw/usb-ohci.h                   |    3 +--
 hw/usb-uhci.h                   |    2 +-
 hw/vhost.h                      |    2 +-
 hw/vhost_net.h                  |    2 +-
 hw/virtio-balloon.h             |    6 +++---
 hw/virtio-blk.h                 |    6 +++---
 hw/virtio-net.h                 |    6 +++---
 hw/virtio-serial.h              |    6 +++---
 hw/virtio.h                     |    6 +++---
 hw/vmware_vga.h                 |    2 +-
 hw/vt82c686.h                   |    2 +-
 hw/xen_blkif.h                  |    6 +++---
 hw/xics.h                       |    6 +++---
 iorange.h                       |    2 +-
 json-lexer.h                    |    2 +-
 json-parser.h                   |    2 +-
 json-streamer.h                 |    2 +-
 kvm.h                           |    3 ++-
 libcacard/cac.h                 |    6 ++++--
 libcacard/card_7816.h           |    4 ++--
 libcacard/card_7816t.h          |    4 ++--
 libcacard/eventt.h              |    5 ++---
 libcacard/vcard.h               |    4 ++--
 libcacard/vcard_emul.h          |    5 +++--
 libcacard/vcard_emul_type.h     |    4 ++--
 libcacard/vcardt.h              |    4 ++--
 libcacard/vevent.h              |    6 +++---
 libcacard/vreader.h             |    4 ++--
 libcacard/vreadert.h            |    5 ++---
 libfdt_env.h                    |    6 +++---
 linux-user/arm/nwfpe/fpa11.h    |    6 +++---
 linux-user/arm/nwfpe/fpopcode.h |    6 +++---
 linux-user/arm/nwfpe/fpsr.h     |    6 +++---
 linux-user/linux_loop.h         |    6 +++---
 linux-user/qemu-types.h         |    4 +++-
 linux-user/unicore32/syscall.h  |    6 +++---
 migration.h                     |    2 +-
 module.h                        |    2 +-
 nbd.h                           |    2 +-
 net.h                           |    2 +-
 notify.h                        |    2 +-
 osdep.h                         |    2 +-
 pflib.h                         |    6 +++---
 poison.h                        |    3 ++-
 qemu-aio.h                      |    2 +-
 qemu-barrier.h                  |    6 +++---
 qemu-char.h                     |    3 ++-
 qemu-common.h                   |    2 +-
 qemu-error.h                    |    2 +-
 qemu-log.h                      |    2 +-
 qemu-option.h                   |    2 +-
 qemu-options.h                  |    6 +++---
 qemu-os-posix.h                 |    3 ++-
 qemu-os-win32.h                 |    2 +-
 qemu-thread-posix.h             |    6 +++---
 qemu-thread-win32.h             |    6 +++---
 qemu-thread.h                   |    6 +++---
 qemu-timer.h                    |    2 +-
 range.h                         |    2 +-
 rwhandler.h                     |    2 +-
 slirp/if.h                      |    6 +++---
 slirp/ip.h                      |    6 +++---
 slirp/ip_icmp.h                 |    6 +++---
 slirp/libslirp.h                |    6 +++---
 slirp/mbuf.h                    |    6 +++---
 slirp/misc.h                    |    6 +++---
 slirp/sbuf.h                    |    6 +++---
 slirp/slirp.h                   |    6 +++---
 slirp/socket.h                  |    6 +++---
 slirp/tcp.h                     |    6 +++---
 slirp/tcp_timer.h               |    6 +++---
 slirp/tcp_var.h                 |    6 +++---
 slirp/tcpip.h                   |    6 +++---
 slirp/udp.h                     |    6 +++---
 softmmu_defs.h                  |    2 +-
 sysemu.h                        |    3 ++-
 target-alpha/cpu.h              |    6 +++---
 target-alpha/exec.h             |    6 +++---
 target-arm/cpu.h                |    2 +-
 target-cris/cpu.h               |    2 +-
 target-cris/opcode-cris.h       |    6 +++---
 target-i386/svm.h               |    6 +++---
 target-lm32/cpu.h               |    3 ++-
 target-m68k/cpu.h               |    2 +-
 target-microblaze/cpu.h         |    3 ++-
 target-mips/cpu.h               |    6 +++---
 target-mips/exec.h              |    6 +++---
 target-mips/mips-defs.h         |    6 +++---
 target-ppc/cpu.h                |    6 +++---
 target-ppc/exec.h               |    6 +++---
 target-ppc/helper_regs.h        |    6 +++---
 target-ppc/kvm_ppc.h            |    6 +++---
 target-s390x/cpu.h              |    2 +-
 target-sh4/cpu.h                |    6 +++---
 target-sh4/exec.h               |    6 +++---
 target-sparc/cpu.h              |    2 +-
 target-sparc/exec.h             |    5 +++--
 target-unicore32/cpu.h          |    6 +++---
 target-unicore32/exec.h         |    6 +++---
 targphys.h                      |    2 +-
 tcg/tcg-runtime.h               |    2 +-
 thunk.h                         |    2 +-
 uboot_image.h                   |    6 +++---
 ui/keymaps.h                    |    6 +++---
 ui/vnc-auth-sasl.h              |    7 +++----
 ui/vnc-auth-vencrypt.h          |    6 +++---
 ui/vnc-enc-zrle.h               |    2 +-
 ui/vnc-enc-zywrle.h             |    2 +-
 ui/vnc-tls.h                    |    7 +++----
 ui/vnc.h                        |    6 +++---
 ui/x_keymap.h                   |    2 +-
 204 files changed, 403 insertions(+), 388 deletions(-)

diff --git a/a.out.h b/a.out.h
index dfc104e..620b9dd 100644
--- a/a.out.h
+++ b/a.out.h
@@ -8,8 +8,8 @@ This software is a copyrighted work licensed under the terms of the
 Cygwin license.  Please consult the file "CYGWIN_LICENSE" for
 details. */
 
-#ifndef _A_OUT_H_
-#define _A_OUT_H_
+#ifndef A_OUT_H
+#define A_OUT_H
 
 #ifdef __cplusplus
 extern "C" {
@@ -427,4 +427,4 @@ typedef struct
 }
 #endif
 
-#endif /* _A_OUT_H_ */
+#endif /* A_OUT_H */
diff --git a/acl.h b/acl.h
index 0ef7804..37ab593 100644
--- a/acl.h
+++ b/acl.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef __QEMU_ACL_H__
-#define __QEMU_ACL_H__
+#ifndef QEMU_ACL_H
+#define QEMU_ACL_H
 
 #include "qemu-queue.h"
 
@@ -63,7 +63,7 @@ int qemu_acl_insert(qemu_acl *acl,
 int qemu_acl_remove(qemu_acl *acl,
 		    const char *match);
 
-#endif /* __QEMU_ACL_H__ */
+#endif /* QEMU_ACL_H */
 
 /*
  * Local variables:
diff --git a/aes.h b/aes.h
index a0167eb..ec11024 100644
--- a/aes.h
+++ b/aes.h
@@ -23,4 +23,4 @@ void AES_cbc_encrypt(const unsigned char *in, unsigned char *out,
 		     const unsigned long length, const AES_KEY *key,
 		     unsigned char *ivec, const int enc);
 
-#endif
+#endif /* QEMU_AES_H */
diff --git a/arch_init.h b/arch_init.h
index 2de9f08..58f9ea0 100644
--- a/arch_init.h
+++ b/arch_init.h
@@ -31,4 +31,4 @@ int tcg_available(void);
 int kvm_available(void);
 int xen_available(void);
 
-#endif
+#endif /* QEMU_ARCH_INIT_H */
diff --git a/audio/audio.h b/audio/audio.h
index a70fda9..0817807 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -163,4 +163,4 @@ static inline void *advance (void *p, int incr)
 int wav_start_capture (CaptureState *s, const char *path, int freq,
                        int bits, int nchannels);
 
-#endif  /* audio.h */
+#endif /* QEMU_AUDIO_H */
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 2003f8b..c2914d7 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -279,4 +279,4 @@ static void GCC_ATTR ldebug (const char *fmt, ...)
 #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
 #endif
 
-#endif /* audio_int.h */
+#endif /* QEMU_AUDIO_INT_H */
diff --git a/audio/audio_pt_int.h b/audio/audio_pt_int.h
index 0dfff76..4c0c15b 100644
--- a/audio/audio_pt_int.h
+++ b/audio/audio_pt_int.h
@@ -19,4 +19,4 @@ int audio_pt_wait (struct audio_pt *, const char *);
 int audio_pt_unlock_and_signal (struct audio_pt *, const char *);
 int audio_pt_join (struct audio_pt *, void **, const char *);
 
-#endif /* audio_pt_int.h */
+#endif /* QEMU_AUDIO_PT_INT_H */
diff --git a/audio/mixeng.h b/audio/mixeng.h
index 9de443b..713d30f 100644
--- a/audio/mixeng.h
+++ b/audio/mixeng.h
@@ -48,4 +48,4 @@ void st_rate_stop (void *opaque);
 void mixeng_clear (struct st_sample *buf, int len);
 void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume *vol);
 
-#endif  /* mixeng.h */
+#endif /* QEMU_MIXENG_H */
diff --git a/balloon.h b/balloon.h
index d478e28..4602d85 100644
--- a/balloon.h
+++ b/balloon.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef _QEMU_BALLOON_H
-#define _QEMU_BALLOON_H
+#ifndef QEMU_BALLOON_H
+#define QEMU_BALLOON_H
 
 #include "monitor.h"
 
@@ -30,4 +30,4 @@ int do_info_balloon(Monitor *mon, MonitorCompletion cb, void *opaque);
 int do_balloon(Monitor *mon, const QDict *params,
                MonitorCompletion cb, void *opaque);
 
-#endif
+#endif /* QEMU_BALOON_H */
diff --git a/bitops.h b/bitops.h
index 07d1a06..5949e75 100644
--- a/bitops.h
+++ b/bitops.h
@@ -269,4 +269,4 @@ static inline unsigned long hweight_long(unsigned long w)
     return count;
 }
 
-#endif
+#endif /* BITOPS_H */
diff --git a/block.h b/block.h
index da7d39c..9fb3378 100644
--- a/block.h
+++ b/block.h
@@ -301,4 +301,4 @@ typedef enum {
 #define BLKDBG_EVENT(bs, evt) bdrv_debug_event(bs, evt)
 void bdrv_debug_event(BlockDriverState *bs, BlkDebugEvent event);
 
-#endif
+#endif /* BLOCK_H */
diff --git a/block/qcow2.h b/block/qcow2.h
index a019831..4a22fe6 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -239,4 +239,4 @@ int qcow2_cache_get_empty(BlockDriverState *bs, Qcow2Cache *c, uint64_t offset,
     void **table);
 int qcow2_cache_put(BlockDriverState *bs, Qcow2Cache *c, void **table);
 
-#endif
+#endif /* BLOCK_QCOW2_H */
diff --git a/block/rbd_types.h b/block/rbd_types.h
index f4cca99..bb4cd73 100644
--- a/block/rbd_types.h
+++ b/block/rbd_types.h
@@ -68,4 +68,4 @@ struct rbd_obj_header_ondisk {
 } __attribute__((packed));
 
 
-#endif
+#endif /* CEPH_RBD_TYPES_H */
diff --git a/blockdev.h b/blockdev.h
index 3587786..a7d192b 100644
--- a/blockdev.h
+++ b/blockdev.h
@@ -66,4 +66,4 @@ int do_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data);
 int do_snapshot_blkdev(Monitor *mon, const QDict *qdict, QObject **ret_data);
 int do_block_resize(Monitor *mon, const QDict *qdict, QObject **ret_data);
 
-#endif
+#endif /* BLOCKDEV_H */
diff --git a/bsd-user/qemu-types.h b/bsd-user/qemu-types.h
index 1adda9f..c47a31f 100644
--- a/bsd-user/qemu-types.h
+++ b/bsd-user/qemu-types.h
@@ -1,5 +1,6 @@
 #ifndef QEMU_TYPES_H
 #define QEMU_TYPES_H
+
 #include "cpu.h"
 
 #ifdef TARGET_ABI32
@@ -21,4 +22,5 @@ typedef target_long abi_long;
 #define TARGET_ABI32 1
 #endif
 #endif
-#endif
+
+#endif /* QEMU_TYPES_H */
diff --git a/bt-host.h b/bt-host.h
index f1eff65..20b4763 100644
--- a/bt-host.h
+++ b/bt-host.h
@@ -6,4 +6,4 @@ struct HCIInfo;
 /* bt-host.c */
 struct HCIInfo *bt_host_hci(const char *id);
 
-#endif
+#endif /* BT_HOST_H */
diff --git a/buffered_file.h b/buffered_file.h
index 98d358b..5d8b2ef 100644
--- a/buffered_file.h
+++ b/buffered_file.h
@@ -27,4 +27,4 @@ QEMUFile *qemu_fopen_ops_buffered(void *opaque, size_t xfer_limit,
                                   BufferedWaitForUnfreezeFunc *wait_for_unfreeze,
                                   BufferedCloseFunc *close);
 
-#endif
+#endif /* QEMU_BUFFERED_FILE_H */
diff --git a/cmd.h b/cmd.h
index b763b19..08af703 100644
--- a/cmd.h
+++ b/cmd.h
@@ -14,8 +14,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __COMMAND_H__
-#define __COMMAND_H__
+#ifndef COMMAND_H
+#define COMMAND_H
 
 #define CMD_FLAG_GLOBAL	((int)0x80000000)	/* don't iterate "args" */
 
@@ -76,4 +76,4 @@ void timestr(struct timeval *tv, char *str, size_t sz, int flags);
 
 extern char *progname;
 
-#endif	/* __COMMAND_H__ */
+#endif	/* COMMAND_H */
diff --git a/compatfd.h b/compatfd.h
index fc37915..c527035 100644
--- a/compatfd.h
+++ b/compatfd.h
@@ -40,4 +40,4 @@ struct qemu_signalfd_siginfo {
 
 int qemu_signalfd(const sigset_t *mask);
 
-#endif
+#endif /* QEMU_COMPATFD_H */
diff --git a/console.h b/console.h
index 64d1f09..9ec4fd3 100644
--- a/console.h
+++ b/console.h
@@ -402,4 +402,4 @@ static inline void do_info_vnc_print(Monitor *mon, const QObject *data)
 /* curses.c */
 void curses_display_init(DisplayState *ds, int full_screen);
 
-#endif
+#endif /* CONSOLE_H */
diff --git a/cpu-common.h b/cpu-common.h
index 9f59172..dd66a94 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -1,5 +1,5 @@
 #ifndef CPU_COMMON_H
-#define CPU_COMMON_H 1
+#define CPU_COMMON_H
 
 /* CPU interfaces that are target indpendent.  */
 
@@ -159,4 +159,4 @@ void cpu_physical_memory_write_rom(target_phys_addr_t addr,
 
 #endif
 
-#endif /* !CPU_COMMON_H */
+#endif /* CPU_COMMON_H */
diff --git a/cpu-defs.h b/cpu-defs.h
index db48a7a..d6222a0 100644
--- a/cpu-defs.h
+++ b/cpu-defs.h
@@ -220,4 +220,4 @@ typedef struct CPUWatchpoint {
     int kvm_fd;                                                         \
     int kvm_vcpu_dirty;
 
-#endif
+#endif /* CPU_DEFS_H */
diff --git a/cpus.h b/cpus.h
index 6fdeb0d..070d12a 100644
--- a/cpus.h
+++ b/cpus.h
@@ -21,4 +21,4 @@ void set_numa_modes(void);
 void set_cpu_log(const char *optarg);
 void list_cpus(FILE *f, fprintf_function cpu_fprintf, const char *optarg);
 
-#endif
+#endif /* QEMU_CPUS_H */
diff --git a/darwin-user/qemu.h b/darwin-user/qemu.h
index b6d3e6c..a426381 100644
--- a/darwin-user/qemu.h
+++ b/darwin-user/qemu.h
@@ -175,4 +175,4 @@ static inline uint64_t get_int64_arg(int *i, CPUPPCState *cpu_env)
 }
 #endif
 
-#endif
+#endif /* GEMU_H */
diff --git a/def-helper.h b/def-helper.h
index 8a822c7..4d4e456 100644
--- a/def-helper.h
+++ b/def-helper.h
@@ -16,7 +16,7 @@
  */
 
 #ifndef DEF_HELPER_H
-#define DEF_HELPER_H 1
+#define DEF_HELPER_H
 
 #define HELPER(name) glue(helper_, name)
 
@@ -237,4 +237,4 @@ DEF_HELPER_FLAGS_0(name, flags, ret)
 #undef DEF_HELPER_FLAGS_4
 #undef GEN_HELPER
 
-#endif
+#endif /* DEF_HELPER_H */
diff --git a/device_tree.h b/device_tree.h
index cecd98f..a653cd7 100644
--- a/device_tree.h
+++ b/device_tree.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef __DEVICE_TREE_H__
-#define __DEVICE_TREE_H__
+#ifndef DEVICE_TREE_H
+#define DEVICE_TREE_H
 
 void *load_device_tree(const char *filename_path, int *sizep);
 
@@ -23,4 +23,4 @@ int qemu_devtree_setprop_cell(void *fdt, const char *node_path,
 int qemu_devtree_setprop_string(void *fdt, const char *node_path,
                                 const char *property, const char *string);
 
-#endif /* __DEVICE_TREE_H__ */
+#endif /* DEVICE_TREE_H */
diff --git a/disas.h b/disas.h
index f9287f7..b72ef93 100644
--- a/disas.h
+++ b/disas.h
@@ -1,5 +1,5 @@
-#ifndef _QEMU_DISAS_H
-#define _QEMU_DISAS_H
+#ifndef QEMU_DISAS_H
+#define QEMU_DISAS_H
 
 #include "qemu-common.h"
 
@@ -39,4 +39,4 @@ struct syminfo {
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
 extern struct syminfo *syminfos;
 
-#endif /* _QEMU_DISAS_H */
+#endif /* QEMU_DISAS_H */
diff --git a/dma.h b/dma.h
index f3bb275..35cf8c8 100644
--- a/dma.h
+++ b/dma.h
@@ -38,4 +38,4 @@ BlockDriverAIOCB *dma_bdrv_read(BlockDriverState *bs,
 BlockDriverAIOCB *dma_bdrv_write(BlockDriverState *bs,
                                  QEMUSGList *sg, uint64_t sector,
                                  BlockDriverCompletionFunc *cb, void *opaque);
-#endif
+#endif /* DMA_H */
diff --git a/dyngen-exec.h b/dyngen-exec.h
index db00fba..5115216 100644
--- a/dyngen-exec.h
+++ b/dyngen-exec.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#if !defined(__DYNGEN_EXEC_H__)
-#define __DYNGEN_EXEC_H__
+#ifndef DYNGEN_EXEC_H
+#define DYNGEN_EXEC_H
 
 #include "qemu-common.h"
 
@@ -81,4 +81,4 @@ typedef void * host_reg_t;
 # define GETPC() ((void *)((unsigned long)__builtin_return_address(0) - 1))
 #endif
 
-#endif /* !defined(__DYNGEN_EXEC_H__) */
+#endif /* DYNGEN_EXEC_H */
diff --git a/elf.h b/elf.h
index ffcac7e..cc6ace5 100644
--- a/elf.h
+++ b/elf.h
@@ -1,5 +1,5 @@
-#ifndef _QEMU_ELF_H
-#define _QEMU_ELF_H
+#ifndef QEMU_ELF_H
+#define QEMU_ELF_H
 
 #include <inttypes.h>
 
@@ -1259,4 +1259,4 @@ struct elf32_fdpic_loadmap {
 #endif /* ELF_CLASS */
 
 
-#endif /* _QEMU_ELF_H */
+#endif /* QEMU_ELF_H */
diff --git a/exec-all.h b/exec-all.h
index 026864e..4da5939 100644
--- a/exec-all.h
+++ b/exec-all.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _EXEC_ALL_H_
-#define _EXEC_ALL_H_
+#ifndef EXEC_ALL_H
+#define EXEC_ALL_H
 
 #include "qemu-common.h"
 
@@ -347,4 +347,4 @@ extern int singlestep;
 /* cpu-exec.c */
 extern volatile sig_atomic_t exit_request;
 
-#endif
+#endif /* EXEC_ALL_H */
diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 126e60e..8e1d0c9 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -10,8 +10,8 @@
  * the COPYING file in the top-level directory.
  *
  */
-#ifndef _FILEOP_H
-#define _FILEOP_H
+#ifndef FILEOP_H
+#define FILEOP_H
 #include <sys/types.h>
 #include <dirent.h>
 #include <sys/time.h>
@@ -104,4 +104,4 @@ static inline const char *rpath(FsContext *ctx, const char *path)
     snprintf(buffer, sizeof(buffer), "%s/%s", ctx->fs_root, path);
     return buffer;
 }
-#endif
+#endif /* FILEOP_H */
diff --git a/fsdev/qemu-fsdev.h b/fsdev/qemu-fsdev.h
index f9f08d3..1e57fff 100644
--- a/fsdev/qemu-fsdev.h
+++ b/fsdev/qemu-fsdev.h
@@ -12,6 +12,7 @@
  */
 #ifndef QEMU_FSDEV_H
 #define QEMU_FSDEV_H
+
 #include "qemu-option.h"
 #include "file-op-9p.h"
 
@@ -52,4 +53,5 @@ typedef struct FsTypeListEntry {
 int qemu_fsdev_add(QemuOpts *opts);
 FsTypeEntry *get_fsdev_fsentry(char *id);
 extern FileOperations local_ops;
-#endif
+
+#endif /* QEMU_FSDEV_H */
diff --git a/gdbstub.h b/gdbstub.h
index d82334f..3376ea5 100644
--- a/gdbstub.h
+++ b/gdbstub.h
@@ -41,4 +41,4 @@ int gdbserver_start(const char *port);
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
 extern const char *const xml_builtin[][2];
 
-#endif
+#endif /* GDBSTUB_H */
diff --git a/hpet.h b/hpet.h
index 754051a..46c6ef0 100644
--- a/hpet.h
+++ b/hpet.h
@@ -1,5 +1,5 @@
-#ifndef	__HPET__
-#define	__HPET__ 1
+#ifndef	HPET_H
+#define	HPET_H
 
 
 
@@ -19,4 +19,4 @@ struct hpet_info {
 #define	HPET_DPI	_IO('h', 0x05)	/* disable periodic */
 #define	HPET_IRQFREQ	_IOW('h', 0x6, unsigned long)	/* IRQFREQ usec */
 
-#endif				/* !__HPET__ */
+#endif	/* HPET_H */
diff --git a/hw/9p.h b/hw/9p.h
index d9951d6..c0b6524 100644
--- a/hw/9p.h
+++ b/hw/9p.h
@@ -21,4 +21,4 @@ typedef struct V9fsConf
     char *fsdev_id;
 } V9fsConf;
 
-#endif
+#endif /* QEMU_9P_H */
diff --git a/hw/9pfs/virtio-9p-debug.h b/hw/9pfs/virtio-9p-debug.h
index d9a2491..c61b25e 100644
--- a/hw/9pfs/virtio-9p-debug.h
+++ b/hw/9pfs/virtio-9p-debug.h
@@ -1,6 +1,6 @@
-#ifndef _QEMU_VIRTIO_9P_DEBUG_H
-#define _QEMU_VIRTIO_9P_DEBUG_H
+#ifndef QEMU_VIRTIO_9P_DEBUG_H
+#define QEMU_VIRTIO_9P_DEBUG_H
 
 void pprint_pdu(V9fsPDU *pdu);
 
-#endif
+#endif /* QEMU_VIRTIO_9P_DEBUG_H */
diff --git a/hw/9pfs/virtio-9p-xattr.h b/hw/9pfs/virtio-9p-xattr.h
index 2bbae2d..db6146b 100644
--- a/hw/9pfs/virtio-9p-xattr.h
+++ b/hw/9pfs/virtio-9p-xattr.h
@@ -10,8 +10,8 @@
  * the COPYING file in the top-level directory.
  *
  */
-#ifndef _QEMU_VIRTIO_9P_XATTR_H
-#define _QEMU_VIRTIO_9P_XATTR_H
+#ifndef QEMU_VIRTIO_9P_XATTR_H
+#define QEMU_VIRTIO_9P_XATTR_H
 
 #include <attr/xattr.h>
 
@@ -99,4 +99,4 @@ static inline int notsup_removexattr(FsContext *ctx,
     return -1;
 }
 
-#endif
+#endif /* QEMU_VIRTIO_9P_XATTR_H */
diff --git a/hw/9pfs/virtio-9p.h b/hw/9pfs/virtio-9p.h
index 622928f..40bf0fc 100644
--- a/hw/9pfs/virtio-9p.h
+++ b/hw/9pfs/virtio-9p.h
@@ -1,5 +1,5 @@
-#ifndef _QEMU_VIRTIO_9P_H
-#define _QEMU_VIRTIO_9P_H
+#ifndef QEMU_VIRTIO_9P_H
+#define QEMU_VIRTIO_9P_H
 
 #include <sys/types.h>
 #include <dirent.h>
@@ -504,4 +504,4 @@ static inline size_t do_pdu_unpack(void *dst, struct iovec *sg, int sg_count,
     return pdu_packunpack(dst, sg, sg_count, offset, size, 0);
 }
 
-#endif
+#endif /* QEMU_VIRTIO_9P_H */
diff --git a/hw/apb_pci.h b/hw/apb_pci.h
index 8869f9d..2770262 100644
--- a/hw/apb_pci.h
+++ b/hw/apb_pci.h
@@ -6,4 +6,4 @@
 PCIBus *pci_apb_init(target_phys_addr_t special_base,
                      target_phys_addr_t mem_base,
                      qemu_irq *pic, PCIBus **bus2, PCIBus **bus3);
-#endif
+#endif /* APB_PCI_H */
diff --git a/hw/apic.h b/hw/apic.h
index 8a0c9d0..c2b62f4 100644
--- a/hw/apic.h
+++ b/hw/apic.h
@@ -24,4 +24,4 @@ void apic_sipi(DeviceState *s);
 int cpu_is_bsp(CPUState *env);
 DeviceState *cpu_get_current_apic(void);
 
-#endif
+#endif /* APIC_H */
diff --git a/hw/bitbang_i2c.h b/hw/bitbang_i2c.h
index 519d2dc..1cf74e6 100644
--- a/hw/bitbang_i2c.h
+++ b/hw/bitbang_i2c.h
@@ -11,4 +11,4 @@ typedef struct bitbang_i2c_interface bitbang_i2c_interface;
 bitbang_i2c_interface *bitbang_i2c_init(i2c_bus *bus);
 int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level);
 
-#endif
+#endif /* BITBANG_I2C_H */
diff --git a/hw/boards.h b/hw/boards.h
index 716fd7b..8c71c9a 100644
--- a/hw/boards.h
+++ b/hw/boards.h
@@ -36,4 +36,4 @@ int qemu_register_machine(QEMUMachine *m);
 
 extern QEMUMachine *current_machine;
 
-#endif
+#endif /* HW_BOARDS_H */
diff --git a/hw/dec_pci.h b/hw/dec_pci.h
index 79264ba..d4b293b 100644
--- a/hw/dec_pci.h
+++ b/hw/dec_pci.h
@@ -5,4 +5,4 @@
 
 PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
 
-#endif
+#endif /* DEC_PCI_H */
diff --git a/hw/devices.h b/hw/devices.h
index c788373..51e31ed 100644
--- a/hw/devices.h
+++ b/hw/devices.h
@@ -67,4 +67,4 @@ qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
 void sm501_init(uint32_t base, uint32_t local_mem_bytes, qemu_irq irq,
                 CharDriverState *chr);
 
-#endif
+#endif /* QEMU_DEVICES_H */
diff --git a/hw/e1000_hw.h b/hw/e1000_hw.h
index 9bd8a4b..9773627 100644
--- a/hw/e1000_hw.h
+++ b/hw/e1000_hw.h
@@ -29,8 +29,8 @@
  * Structures, enums, and macros for the MAC
  */
 
-#ifndef _E1000_HW_H_
-#define _E1000_HW_H_
+#ifndef E1000_HW_H
+#define E1000_HW_H
 
 
 /* PCI Device IDs */
@@ -861,4 +861,4 @@ struct e1000_data_desc {
 /* For checksumming, the sum of all words in the EEPROM should equal 0xBABA. */
 #define EEPROM_SUM 0xBABA
 
-#endif /* _E1000_HW_H_ */
+#endif /* E1000_HW_H */
diff --git a/hw/esp.h b/hw/esp.h
index 62bfd4d..39df49f 100644
--- a/hw/esp.h
+++ b/hw/esp.h
@@ -10,4 +10,4 @@ void esp_init(target_phys_addr_t espaddr, int it_shift,
               void *dma_opaque, qemu_irq irq, qemu_irq *reset,
               qemu_irq *dma_enable);
 
-#endif
+#endif /* QEMU_HW_ESP_H */
diff --git a/hw/event_notifier.h b/hw/event_notifier.h
index 24117ea..7d24b71 100644
--- a/hw/event_notifier.h
+++ b/hw/event_notifier.h
@@ -13,4 +13,4 @@ int event_notifier_get_fd(EventNotifier *);
 int event_notifier_test_and_clear(EventNotifier *);
 int event_notifier_test(EventNotifier *);
 
-#endif
+#endif /* QEMU_EVENT_NOTIFIER_H */
diff --git a/hw/fdc.h b/hw/fdc.h
index 09f73c6..5343afe 100644
--- a/hw/fdc.h
+++ b/hw/fdc.h
@@ -28,4 +28,4 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         target_phys_addr_t mmio_base, DriveInfo **fds);
 void sun4m_fdctrl_init(qemu_irq irq, target_phys_addr_t io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc);
-#endif
+#endif /* HW_FDC_H */
diff --git a/hw/fmopl.h b/hw/fmopl.h
index a01ff90..bb65ae0 100644
--- a/hw/fmopl.h
+++ b/hw/fmopl.h
@@ -1,5 +1,5 @@
-#ifndef __FMOPL_H_
-#define __FMOPL_H_
+#ifndef FMOPL_H
+#define FMOPL_H
 
 /* --- select emulation chips --- */
 #define BUILD_YM3812 (HAS_YM3812)
@@ -171,4 +171,4 @@ void YM3812UpdateOne(FM_OPL *OPL, INT16 *buffer, int length);
 
 void Y8950UpdateOne(FM_OPL *OPL, INT16 *buffer, int length);
 
-#endif
+#endif /* FMOPL_H */
diff --git a/hw/framebuffer.h b/hw/framebuffer.h
index a3a2146..7b51884 100644
--- a/hw/framebuffer.h
+++ b/hw/framebuffer.h
@@ -19,4 +19,4 @@ void framebuffer_update_display(
     int *first_row,
     int *last_row);
 
-#endif
+#endif /* QEMU_FRAMEBUFFER_H */
diff --git a/hw/fw_cfg.h b/hw/fw_cfg.h
index 856bf91..b1d1646 100644
--- a/hw/fw_cfg.h
+++ b/hw/fw_cfg.h
@@ -67,4 +67,4 @@ FWCfgState *fw_cfg_init(uint32_t ctl_port, uint32_t data_port,
 
 #endif /* NO_QEMU_PROTOS */
 
-#endif
+#endif /* FW_CFG_H */
diff --git a/hw/grlib.h b/hw/grlib.h
index fdf4b11..81160e0 100644
--- a/hw/grlib.h
+++ b/hw/grlib.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _GRLIB_H_
-#define _GRLIB_H_
+#ifndef GRLIB_H
+#define GRLIB_H
 
 #include "qdev.h"
 #include "sysbus.h"
@@ -123,4 +123,4 @@ DeviceState *grlib_apbuart_create(target_phys_addr_t  base,
     return dev;
 }
 
-#endif /* ! _GRLIB_H_ */
+#endif /* GRLIB_H */
diff --git a/hw/gusemu.h b/hw/gusemu.h
index 5093767..0648ac8 100644
--- a/hw/gusemu.h
+++ b/hw/gusemu.h
@@ -102,4 +102,4 @@ void gus_irqgen(GUSEmuState *state, unsigned int elapsed_time);
 /* lower values won´t provide any benefit at all, higher values can cause audible timing delays */
 /* note: masked timers are also calculated by this function, thus it might be needed even without any IRQs in use! */
 
-#endif  /* gusemu.h */
+#endif /* GUSEMU_H */
diff --git a/hw/gustate.h b/hw/gustate.h
index ece903a..d162971 100644
--- a/hw/gustate.h
+++ b/hw/gustate.h
@@ -129,4 +129,4 @@
 
 #define gusdataend (VSRegsEnd+4)
 
-#endif  /* gustate.h */
+#endif /* GUSTATE_H */
diff --git a/hw/hpet_emul.h b/hw/hpet_emul.h
index 8bf312a..95e89ee 100644
--- a/hw/hpet_emul.h
+++ b/hw/hpet_emul.h
@@ -68,4 +68,5 @@ struct hpet_fw_config
 } __attribute__ ((packed));
 
 extern struct hpet_fw_config hpet_cfg;
-#endif
+
+#endif /* QEMU_HPET_EMUL_H */
diff --git a/hw/hw.h b/hw/hw.h
index 56447a7..baa26af 100644
--- a/hw/hw.h
+++ b/hw/hw.h
@@ -919,4 +919,5 @@ int vmstate_register_with_alias_id(DeviceState *dev, int instance_id,
                                    int required_for_version);
 void vmstate_unregister(DeviceState *dev, const VMStateDescription *vmsd,
                         void *opaque);
-#endif
+
+#endif /* QEMU_HW_H */
diff --git a/hw/i2c.h b/hw/i2c.h
index 5514402..026de85 100644
--- a/hw/i2c.h
+++ b/hw/i2c.h
@@ -74,4 +74,4 @@ void tmp105_set(i2c_slave *i2c, int temp);
 /* lm832x.c */
 void lm832x_key_event(i2c_slave *i2c, int key, int state);
 
-#endif
+#endif /* QEMU_I2C_H */
diff --git a/hw/ide/pci.h b/hw/ide/pci.h
index cd72cba..bd7ff71 100644
--- a/hw/ide/pci.h
+++ b/hw/ide/pci.h
@@ -45,4 +45,5 @@ extern const IORangeOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev, DriveInfo **hd_table);
 
 extern const VMStateDescription vmstate_ide_pci;
-#endif
+
+#endif /* HW_IDE_PCI_H */
diff --git a/hw/intel-hda-defs.h b/hw/intel-hda-defs.h
index 2e37e5b..c5df89e 100644
--- a/hw/intel-hda-defs.h
+++ b/hw/intel-hda-defs.h
@@ -714,4 +714,4 @@ enum {
 
 /* --------------------------------------------------------------------- */
 
-#endif
+#endif /* HW_INTEL_HDA_DEFS_H */
diff --git a/hw/intel-hda.h b/hw/intel-hda.h
index 4e44e38..55d8edb 100644
--- a/hw/intel-hda.h
+++ b/hw/intel-hda.h
@@ -59,4 +59,4 @@ bool hda_codec_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
 
 /* --------------------------------------------------------------------- */
 
-#endif
+#endif /* HW_INTEL_HDA_H */
diff --git a/hw/irq.h b/hw/irq.h
index 389ed7a..c6c86a7 100644
--- a/hw/irq.h
+++ b/hw/irq.h
@@ -33,4 +33,4 @@ qemu_irq qemu_irq_invert(qemu_irq irq);
 /* Returns a new IRQ which feeds into both the passed IRQs */
 qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
 
-#endif
+#endif /* QEMU_IRQ_H */
diff --git a/hw/isa.h b/hw/isa.h
index d2b6126..1978013 100644
--- a/hw/isa.h
+++ b/hw/isa.h
@@ -50,4 +50,4 @@ void DMA_init(int high_page_enable, qemu_irq *cpu_request_exit);
 void DMA_register_channel (int nchan,
                            DMA_transfer_handler transfer_handler,
                            void *opaque);
-#endif
+#endif /* HW_ISA_H */
diff --git a/hw/loader.h b/hw/loader.h
index fc6bdff..67bae46 100644
--- a/hw/loader.h
+++ b/hw/loader.h
@@ -45,4 +45,4 @@ void do_info_roms(Monitor *mon);
 int rom_add_vga(const char *file);
 int rom_add_option(const char *file, int32_t bootindex);
 
-#endif
+#endif /* LOADER_H */
diff --git a/hw/mcf.h b/hw/mcf.h
index 91f2821..0051761 100644
--- a/hw/mcf.h
+++ b/hw/mcf.h
@@ -18,4 +18,4 @@ void mcf_fec_init(NICInfo *nd, target_phys_addr_t base, qemu_irq *irq);
 /* mcf5206.c */
 qemu_irq *mcf5206_init(uint32_t base, CPUState *env);
 
-#endif
+#endif /* HW_MCF_H */
diff --git a/hw/mips.h b/hw/mips.h
index 73aa8f8..0513630 100644
--- a/hw/mips.h
+++ b/hw/mips.h
@@ -37,4 +37,4 @@ void dp83932_init(NICInfo *nd, target_phys_addr_t base, int it_shift,
                   qemu_irq irq, void* mem_opaque,
                   void (*memory_rw)(void *opaque, target_phys_addr_t addr, uint8_t *buf, int len, int is_write));
 
-#endif
+#endif /* HW_MIPS_H */
diff --git a/hw/mips_cpudevs.h b/hw/mips_cpudevs.h
index db82b41..9672464 100644
--- a/hw/mips_cpudevs.h
+++ b/hw/mips_cpudevs.h
@@ -12,4 +12,4 @@ void cpu_mips_irq_init_cpu(CPUState *env);
 /* mips_timer.c */
 void cpu_mips_clock_init(CPUState *);
 
-#endif
+#endif /* HW_MIPS_CPUDEVS_H */
diff --git a/hw/msix.h b/hw/msix.h
index a9f7993..e5c947a 100644
--- a/hw/msix.h
+++ b/hw/msix.h
@@ -33,4 +33,4 @@ void msix_reset(PCIDevice *dev);
 
 extern int msix_supported;
 
-#endif
+#endif /* QEMU_MSIX_H */
diff --git a/hw/multiboot.h b/hw/multiboot.h
index 98fb1b7..47e2e3a 100644
--- a/hw/multiboot.h
+++ b/hw/multiboot.h
@@ -9,4 +9,4 @@ int load_multiboot(void *fw_cfg,
                    int kernel_file_size,
                    uint8_t *header);
 
-#endif
+#endif /* QEMU_MULTIBOOT_H */
diff --git a/hw/omap.h b/hw/omap.h
index c227a82..3211f5d 100644
--- a/hw/omap.h
+++ b/hw/omap.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU General Public License along
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef hw_omap_h
-# define hw_omap_h		"omap.h"
+#ifndef HW_OMAP_H
+#define HW_OMAP_H
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -1138,4 +1138,4 @@ inline static int debug_register_io_memory(CPUReadMemoryFunc * const *mem_read,
 /* Define when we want to reduce the number of IO regions registered.  */
 /*# define L4_MUX_HACK*/
 
-#endif /* hw_omap_h */
+#endif /* HW_OMAP_H */
diff --git a/hw/openpic.h b/hw/openpic.h
index 0957c1f..4a0e5ed 100644
--- a/hw/openpic.h
+++ b/hw/openpic.h
@@ -1,5 +1,5 @@
-#if !defined(__OPENPIC_H__)
-#define __OPENPIC_H__
+#ifndef OPENPIC_H
+#define OPENPIC_H
 
 /* OpenPIC have 5 outputs per CPU connected and one IRQ out single output */
 enum {
@@ -15,4 +15,4 @@ qemu_irq *openpic_init (PCIBus *bus, int *pmem_index, int nb_cpus,
                         qemu_irq **irqs, qemu_irq irq_out);
 qemu_irq *mpic_init (target_phys_addr_t base, int nb_cpus,
                         qemu_irq **irqs, qemu_irq irq_out);
-#endif /* __OPENPIC_H__ */
+#endif /* OPENPIC_H */
diff --git a/hw/pc.h b/hw/pc.h
index 0dcbee7..ac40ae9 100644
--- a/hw/pc.h
+++ b/hw/pc.h
@@ -239,4 +239,4 @@ static inline bool isa_ne2000_init(int base, int irq, NICInfo *nd)
 
 int e820_add_entry(uint64_t, uint64_t, uint32_t);
 
-#endif
+#endif /* HW_PC_H */
diff --git a/hw/pci.h b/hw/pci.h
index 0d288ce..f66d04a 100644
--- a/hw/pci.h
+++ b/hw/pci.h
@@ -475,4 +475,4 @@ static inline uint32_t pci_config_size(const PCIDevice *d)
     return pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE : PCI_CONFIG_SPACE_SIZE;
 }
 
-#endif
+#endif /* QEMU_PCI_H */
diff --git a/hw/ppc-viosrp.h b/hw/ppc-viosrp.h
index d8e365d..7f8e03a 100644
--- a/hw/ppc-viosrp.h
+++ b/hw/ppc-viosrp.h
@@ -213,4 +213,4 @@ struct mad_adapter_info_data {
     uint32_t port_max_txu[8];    /* per-port maximum transfer */
 };
 
-#endif
+#endif /* PPC_VIOSRP_H */
diff --git a/hw/ppc440.h b/hw/ppc440.h
index a40f917..215d7ec 100644
--- a/hw/ppc440.h
+++ b/hw/ppc440.h
@@ -18,4 +18,4 @@ CPUState *ppc440ep_init(ram_addr_t *ram_size, PCIBus **pcip,
                         const unsigned int pci_irq_nrs[4], int do_init,
                         const char *cpu_model);
 
-#endif
+#endif /* QEMU_PPC440_H */
diff --git a/hw/ppc_mac.h b/hw/ppc_mac.h
index ea87593..525cf2b 100644
--- a/hw/ppc_mac.h
+++ b/hw/ppc_mac.h
@@ -22,8 +22,8 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#if !defined(__PPC_MAC_H__)
-#define __PPC_MAC_H__
+#ifndef PPC_MAC_H
+#define PPC_MAC_H
 
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
@@ -110,4 +110,4 @@ void adb_mouse_init(ADBBusState *bus);
 
 extern ADBBusState adb_bus;
 
-#endif /* !defined(__PPC_MAC_H__) */
+#endif /* PPC_MAC_H */
diff --git a/hw/prep_pci.h b/hw/prep_pci.h
index cd68512..01abca0 100644
--- a/hw/prep_pci.h
+++ b/hw/prep_pci.h
@@ -5,4 +5,4 @@
 
 PCIBus *pci_prep_init(qemu_irq *pic);
 
-#endif
+#endif /* QEMU_PREP_PCI_H */
diff --git a/hw/primecell.h b/hw/primecell.h
index de7d6f2..3bcb870 100644
--- a/hw/primecell.h
+++ b/hw/primecell.h
@@ -15,4 +15,4 @@ void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id);
 #define ARM_SYSCTL_GPIO_MMC_WPROT 0
 #define ARM_SYSCTL_GPIO_MMC_CARDIN 1
 
-#endif
+#endif /* PRIMECELL_H */
diff --git a/hw/qdev.h b/hw/qdev.h
index 8a13ec9..b899531 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -326,4 +326,4 @@ char *qdev_get_fw_dev_path(DeviceState *dev);
 /* This is a nasty hack to allow passing a NULL bus to qdev_create.  */
 extern struct BusInfo system_bus_info;
 
-#endif
+#endif /* QDEV_H */
diff --git a/hw/scsi.h b/hw/scsi.h
index c1dca35..7199ffe 100644
--- a/hw/scsi.h
+++ b/hw/scsi.h
@@ -156,4 +156,4 @@ void scsi_req_abort(SCSIRequest *req, int status);
 void scsi_req_cancel(SCSIRequest *req);
 void scsi_device_purge_requests(SCSIDevice *sdev);
 
-#endif
+#endif /* QEMU_HW_SCSI_H */
diff --git a/hw/sd.h b/hw/sd.h
index ac4b7c4..d2770e7 100644
--- a/hw/sd.h
+++ b/hw/sd.h
@@ -26,8 +26,8 @@
  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
-#ifndef __hw_sd_h
-#define __hw_sd_h		1
+#ifndef HW_SD_H
+#define HW_SD_H
 
 #define OUT_OF_RANGE		(1 << 31)
 #define ADDRESS_ERROR		(1 << 30)
@@ -76,4 +76,4 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
 int sd_data_ready(SDState *sd);
 void sd_enable(SDState *sd, int enable);
 
-#endif	/* __hw_sd_h */
+#endif	/* HW_SD_H */
diff --git a/hw/sh.h b/hw/sh.h
index d30e9f5..6727fa7 100644
--- a/hw/sh.h
+++ b/hw/sh.h
@@ -51,4 +51,4 @@ qemu_irq sh7750_irl(struct SH7750State *s);
 /* tc58128.c */
 int tc58128_init(struct SH7750State *s, const char *zone1, const char *zone2);
 
-#endif
+#endif /* QEMU_SH_H */
diff --git a/hw/sh7750_regnames.h b/hw/sh7750_regnames.h
index 7463709..6fa97a8 100644
--- a/hw/sh7750_regnames.h
+++ b/hw/sh7750_regnames.h
@@ -1,6 +1,6 @@
-#ifndef _SH7750_REGNAMES_H
-#define _SH7750_REGNAMES_H
+#ifndef SH7750_REGNAMES_H
+#define SH7750_REGNAMES_H
 
 const char *regname(uint32_t addr);
 
-#endif				/* _SH7750_REGNAMES_H */
+#endif	/* SH7750_REGNAMES_H */
diff --git a/hw/sh7750_regs.h b/hw/sh7750_regs.h
index 6ec13ab..33d1f1c 100644
--- a/hw/sh7750_regs.h
+++ b/hw/sh7750_regs.h
@@ -16,8 +16,8 @@
  * @(#) sh7750_regs.h,v 1.2.4.1 2003/09/04 18:46:00 joel Exp
  */
 
-#ifndef __SH7750_REGS_H__
-#define __SH7750_REGS_H__
+#ifndef SH7750_REGS_H
+#define SH7750_REGS_H
 
 /*
  * All register has 2 addresses: in 0xff000000 - 0xffffffff (P4 address)  and
@@ -1274,4 +1274,4 @@
 #define SH7750_BCR3_A7       0x1f800050
 #define SH7750_BCR4_A7       0x1e0a00f0
 
-#endif
+#endif /* SH7750_REGS_H */
diff --git a/hw/sh_intc.h b/hw/sh_intc.h
index c117d6f..023f227 100644
--- a/hw/sh_intc.h
+++ b/hw/sh_intc.h
@@ -1,5 +1,5 @@
-#ifndef __SH_INTC_H__
-#define __SH_INTC_H__
+#ifndef SH_INTC_H
+#define SH_INTC_H
 
 #include "qemu-common.h"
 #include "irq.h"
@@ -77,4 +77,4 @@ int sh_intc_init(struct intc_desc *desc,
 
 void sh_intc_set_irl(void *opaque, int n, int level);
 
-#endif /* __SH_INTC_H__ */
+#endif /* SH_INTC_H */
diff --git a/hw/sharpsl.h b/hw/sharpsl.h
index 0b3a774..0af8111 100644
--- a/hw/sharpsl.h
+++ b/hw/sharpsl.h
@@ -14,4 +14,4 @@
 #define SL_PXA_PARAM_BASE	0xa0000a00
 void sl_bootparam_write(target_phys_addr_t ptr);
 
-#endif
+#endif /* QEMU_SHARPSL_H */
diff --git a/hw/spapr.h b/hw/spapr.h
index b52133a..2062cea 100644
--- a/hw/spapr.h
+++ b/hw/spapr.h
@@ -1,5 +1,5 @@
-#if !defined(__HW_SPAPR_H__)
-#define __HW_SPAPR_H__
+#ifndef HW_SPAPR_H
+#define HW_SPAPR_H
 
 struct VIOsPAPRBus;
 struct icp_state;
@@ -298,4 +298,4 @@ target_ulong spapr_rtas_call(sPAPREnvironment *spapr,
 int spapr_rtas_device_tree_setup(void *fdt, target_phys_addr_t rtas_addr,
                                  target_phys_addr_t rtas_size);
 
-#endif /* !defined (__HW_SPAPR_H__) */
+#endif /* HW_SPAPR_H */
diff --git a/hw/spapr_vio.h b/hw/spapr_vio.h
index 603a8c4..b64a00e 100644
--- a/hw/spapr_vio.h
+++ b/hw/spapr_vio.h
@@ -1,5 +1,5 @@
-#ifndef _HW_SPAPR_VIO_H
-#define _HW_SPAPR_VIO_H
+#ifndef HW_SPAPR_VIO_H
+#define HW_SPAPR_VIO_H
 /*
  * QEMU sPAPR VIO bus definitions
  *
@@ -111,4 +111,4 @@ void spapr_vscsi_create(VIOsPAPRBus *bus, uint32_t reg,
 int spapr_tce_set_bypass(uint32_t unit, uint32_t enable);
 void spapr_vio_quiesce(void);
 
-#endif /* _HW_SPAPR_VIO_H */
+#endif /* HW_SPAPR_VIO_H */
diff --git a/hw/sparc32_dma.h b/hw/sparc32_dma.h
index 8b72c37..a863ded 100644
--- a/hw/sparc32_dma.h
+++ b/hw/sparc32_dma.h
@@ -9,4 +9,4 @@ void ledma_memory_write(void *opaque, target_phys_addr_t addr,
 void espdma_memory_read(void *opaque, uint8_t *buf, int len);
 void espdma_memory_write(void *opaque, uint8_t *buf, int len);
 
-#endif
+#endif /* SPARC32_DMA_H */
diff --git a/hw/ssi.h b/hw/ssi.h
index 24610a8..a2744c2 100644
--- a/hw/ssi.h
+++ b/hw/ssi.h
@@ -42,4 +42,4 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 /* max111x.c */
 void max111x_set_input(DeviceState *dev, int line, uint8_t value);
 
-#endif
+#endif /* QEMU_SSI_H */
diff --git a/hw/strongarm.h b/hw/strongarm.h
index a81b110..fdfc44a 100644
--- a/hw/strongarm.h
+++ b/hw/strongarm.h
@@ -1,5 +1,5 @@
-#ifndef _STRONGARM_H
-#define _STRONGARM_H
+#ifndef STRONGARM_H
+#define STRONGARM_H
 
 #define SA_CS0          0x00000000
 #define SA_CS1          0x08000000
@@ -61,4 +61,4 @@ typedef struct {
 
 StrongARMState *sa1110_init(unsigned int sdram_size, const char *rev);
 
-#endif
+#endif /* STRONGARM_H */
diff --git a/hw/sun4m.h b/hw/sun4m.h
index ce97ee5..5c34a33 100644
--- a/hw/sun4m.h
+++ b/hw/sun4m.h
@@ -33,4 +33,4 @@ void sun4c_irq_info(Monitor *mon, void *opaque);
 /* sparc32_dma.c */
 #include "sparc32_dma.h"
 
-#endif
+#endif /* SUN4M_H */
diff --git a/hw/syborg.h b/hw/syborg.h
index b82ce4a..645f5cb 100644
--- a/hw/syborg.h
+++ b/hw/syborg.h
@@ -1,5 +1,5 @@
-#ifndef _SYBORG_H
-#define _SYBORG_H
+#ifndef SYBORG_H
+#define SYBORG_H
 
 #define SYBORG_ID_PLATFORM    0xc51d1000
 #define SYBORG_ID_INT         0xc51d0000
@@ -15,4 +15,4 @@
 #define SYBORG_ID_VIRTIO      0xc51d000a
 #define SYBORG_ID_NAND        0xc51d000b
 
-#endif
+#endif /* SYBORG_H */
diff --git a/hw/usb-ohci.h b/hw/usb-ohci.h
index eefcef3..0cb1888 100644
--- a/hw/usb-ohci.h
+++ b/hw/usb-ohci.h
@@ -5,5 +5,4 @@
 
 void usb_ohci_init_pci(struct PCIBus *bus, int devfn);
 
-#endif
-
+#endif /* QEMU_USB_OHCI_H */
diff --git a/hw/usb-uhci.h b/hw/usb-uhci.h
index 3e4d377..d6abef4 100644
--- a/hw/usb-uhci.h
+++ b/hw/usb-uhci.h
@@ -7,4 +7,4 @@ void usb_uhci_piix3_init(PCIBus *bus, int devfn);
 void usb_uhci_piix4_init(PCIBus *bus, int devfn);
 void usb_uhci_vt82c686b_init(PCIBus *bus, int devfn);
 
-#endif
+#endif /* QEMU_USB_UHCI_H */
diff --git a/hw/vhost.h b/hw/vhost.h
index c8c595a..9004bd0 100644
--- a/hw/vhost.h
+++ b/hw/vhost.h
@@ -47,4 +47,4 @@ bool vhost_dev_query(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 
-#endif
+#endif /* VHOST_H */
diff --git a/hw/vhost_net.h b/hw/vhost_net.h
index 91e40b1..36cc2cf 100644
--- a/hw/vhost_net.h
+++ b/hw/vhost_net.h
@@ -17,4 +17,4 @@ void vhost_net_cleanup(VHostNetState *net);
 unsigned vhost_net_get_features(VHostNetState *net, unsigned features);
 void vhost_net_ack_features(VHostNetState *net, unsigned features);
 
-#endif
+#endif /* VHOST_NET_H */
diff --git a/hw/virtio-balloon.h b/hw/virtio-balloon.h
index e20cf6b..56e3b45 100644
--- a/hw/virtio-balloon.h
+++ b/hw/virtio-balloon.h
@@ -12,8 +12,8 @@
  *
  */
 
-#ifndef _QEMU_VIRTIO_BALLOON_H
-#define _QEMU_VIRTIO_BALLOON_H
+#ifndef QEMU_VIRTIO_BALLOON_H
+#define QEMU_VIRTIO_BALLOON_H
 
 #include "virtio.h"
 #include "pci.h"
@@ -52,4 +52,4 @@ typedef struct VirtIOBalloonStat {
     uint64_t val;
 } __attribute__((packed)) VirtIOBalloonStat;
 
-#endif
+#endif /* QEMU_VIRTIO_BALLOON_H */
diff --git a/hw/virtio-blk.h b/hw/virtio-blk.h
index fff46da..3b5bbf6 100644
--- a/hw/virtio-blk.h
+++ b/hw/virtio-blk.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef _QEMU_VIRTIO_BLK_H
-#define _QEMU_VIRTIO_BLK_H
+#ifndef QEMU_VIRTIO_BLK_H
+#define QEMU_VIRTIO_BLK_H
 
 #include "virtio.h"
 #include "block.h"
@@ -103,4 +103,4 @@ struct virtio_scsi_inhdr
 #define DEFINE_VIRTIO_BLK_FEATURES(_state, _field) \
         DEFINE_VIRTIO_COMMON_FEATURES(_state, _field)
 #endif
-#endif
+#endif /* QEMU_VIRTIO_BLK_H */
diff --git a/hw/virtio-net.h b/hw/virtio-net.h
index 8af9a1c..d7f15cf 100644
--- a/hw/virtio-net.h
+++ b/hw/virtio-net.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef _QEMU_VIRTIO_NET_H
-#define _QEMU_VIRTIO_NET_H
+#ifndef QEMU_VIRTIO_NET_H
+#define QEMU_VIRTIO_NET_H
 
 #include "virtio.h"
 #include "net.h"
@@ -186,4 +186,4 @@ struct virtio_net_ctrl_mac {
         DEFINE_PROP_BIT("ctrl_rx", _state, _field, VIRTIO_NET_F_CTRL_RX, true), \
         DEFINE_PROP_BIT("ctrl_vlan", _state, _field, VIRTIO_NET_F_CTRL_VLAN, true), \
         DEFINE_PROP_BIT("ctrl_rx_extra", _state, _field, VIRTIO_NET_F_CTRL_RX_EXTRA, true)
-#endif
+#endif /* QEMU_VIRTIO_NET_H */
diff --git a/hw/virtio-serial.h b/hw/virtio-serial.h
index 36e9d22..d11fe89 100644
--- a/hw/virtio-serial.h
+++ b/hw/virtio-serial.h
@@ -12,8 +12,8 @@
  * the COPYING file in the top-level directory.
  *
  */
-#ifndef _QEMU_VIRTIO_SERIAL_H
-#define _QEMU_VIRTIO_SERIAL_H
+#ifndef QEMU_VIRTIO_SERIAL_H
+#define QEMU_VIRTIO_SERIAL_H
 
 #include "qdev.h"
 #include "virtio.h"
@@ -204,4 +204,4 @@ size_t virtio_serial_guest_ready(VirtIOSerialPort *port);
  */
 void virtio_serial_throttle_port(VirtIOSerialPort *port, bool throttle);
 
-#endif
+#endif /* QEMU_VIRTIO_SERIAL_H */
diff --git a/hw/virtio.h b/hw/virtio.h
index bc72289..e94fa7f 100644
--- a/hw/virtio.h
+++ b/hw/virtio.h
@@ -11,8 +11,8 @@
  *
  */
 
-#ifndef _QEMU_VIRTIO_H
-#define _QEMU_VIRTIO_H
+#ifndef QEMU_VIRTIO_H
+#define QEMU_VIRTIO_H
 
 #include "hw.h"
 #include "net.h"
@@ -227,4 +227,4 @@ EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
 void virtio_queue_notify_vq(VirtQueue *vq);
 void virtio_irq(VirtQueue *vq);
-#endif
+#endif /* QEMU_VIRTIO_H */
diff --git a/hw/vmware_vga.h b/hw/vmware_vga.h
index 5132573..c432c9b 100644
--- a/hw/vmware_vga.h
+++ b/hw/vmware_vga.h
@@ -16,4 +16,4 @@ static inline bool pci_vmsvga_init(PCIBus *bus)
     }
 }
 
-#endif
+#endif /* QEMU_VMWARE_VGA_H */
diff --git a/hw/vt82c686.h b/hw/vt82c686.h
index e3270ca..0675332 100644
--- a/hw/vt82c686.h
+++ b/hw/vt82c686.h
@@ -8,4 +8,4 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn);
 i2c_bus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
             qemu_irq sci_irq);
 
-#endif
+#endif /* HW_VT82C686_H */
diff --git a/hw/xen_blkif.h b/hw/xen_blkif.h
index c0f4136..015f48e 100644
--- a/hw/xen_blkif.h
+++ b/hw/xen_blkif.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_BLKIF_H__
-#define __XEN_BLKIF_H__
+#ifndef XEN_BLKIF_H
+#define XEN_BLKIF_H
 
 #include <xen/io/ring.h>
 #include <xen/io/blkif.h>
@@ -100,4 +100,4 @@ static inline void blkif_get_x86_64_req(blkif_request_t *dst, blkif_x86_64_reque
 		dst->seg[i] = src->seg[i];
 }
 
-#endif /* __XEN_BLKIF_H__ */
+#endif /* XEN_BLKIF_H */
diff --git a/hw/xics.h b/hw/xics.h
index 83c1182..c7e41ee 100644
--- a/hw/xics.h
+++ b/hw/xics.h
@@ -24,8 +24,8 @@
  * THE SOFTWARE.
  *
  */
-#if !defined(__XICS_H__)
-#define __XICS_H__
+#ifndef XICS_H
+#define XICS_H
 
 #define XICS_IPI        0x2
 
@@ -35,4 +35,4 @@ qemu_irq xics_find_qirq(struct icp_state *icp, int irq);
 
 struct icp_state *xics_system_init(int nr_irqs);
 
-#endif /* __XICS_H__ */
+#endif /* XICS_H */
diff --git a/iorange.h b/iorange.h
index 9783168..0f3c5b0 100644
--- a/iorange.h
+++ b/iorange.h
@@ -27,4 +27,4 @@ static inline void iorange_init(IORange *iorange, const IORangeOps *ops,
     iorange->len = len;
 }
 
-#endif
+#endif /* IORANGE_H */
diff --git a/json-lexer.h b/json-lexer.h
index 3b50c46..d65ca5b 100644
--- a/json-lexer.h
+++ b/json-lexer.h
@@ -47,4 +47,4 @@ int json_lexer_flush(JSONLexer *lexer);
 
 void json_lexer_destroy(JSONLexer *lexer);
 
-#endif
+#endif /* QEMU_JSON_LEXER_H */
diff --git a/json-parser.h b/json-parser.h
index 97f43f6..2e5f26e 100644
--- a/json-parser.h
+++ b/json-parser.h
@@ -19,4 +19,4 @@
 
 QObject *json_parser_parse(QList *tokens, va_list *ap);
 
-#endif
+#endif /* QEMU_JSON_PARSER_H */
diff --git a/json-streamer.h b/json-streamer.h
index 09f3bd7..46d07ec 100644
--- a/json-streamer.h
+++ b/json-streamer.h
@@ -36,4 +36,4 @@ int json_message_parser_flush(JSONMessageParser *parser);
 
 void json_message_parser_destroy(JSONMessageParser *parser);
 
-#endif
+#endif /* QEMU_JSON_STREAMER_H */
diff --git a/kvm.h b/kvm.h
index d565dba..f5ecdeb 100644
--- a/kvm.h
+++ b/kvm.h
@@ -196,4 +196,5 @@ int kvm_physical_memory_addr_from_ram(KVMState *s, ram_addr_t ram_addr,
 int kvm_set_ioeventfd_mmio_long(int fd, uint32_t adr, uint32_t val, bool assign);
 
 int kvm_set_ioeventfd_pio_word(int fd, uint16_t adr, uint16_t val, bool assign);
-#endif
+
+#endif /* QEMU_KVM_H */
diff --git a/libcacard/cac.h b/libcacard/cac.h
index 15a61be..aa0a13b 100644
--- a/libcacard/cac.h
+++ b/libcacard/cac.h
@@ -6,7 +6,8 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef CAC_H
-#define CAC_H 1
+#define CAC_H
+
 #include "vcard.h"
 #include "vreader.h"
 /*
@@ -20,4 +21,5 @@ VCardStatus cac_card_init(VReader *reader, VCard *card, const char *params,
 
 /* not yet implemented */
 VCardStatus cac_is_cac_card(VReader *reader);
-#endif
+
+#endif /* CAC_H */
diff --git a/libcacard/card_7816.h b/libcacard/card_7816.h
index 2bb2a0d..bda9af2 100644
--- a/libcacard/card_7816.h
+++ b/libcacard/card_7816.h
@@ -5,7 +5,7 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef CARD_7816_H
-#define CARD_7816_H  1
+#define CARD_7816_H
 
 #include "card_7816t.h"
 #include "vcardt.h"
@@ -59,4 +59,4 @@ void vcard_apdu_delete(VCardAPDU *apdu);
 VCardStatus vcard_process_apdu(VCard *card, VCardAPDU *apdu,
                                VCardResponse **response);
 
-#endif
+#endif /* CARD_7816_H */
diff --git a/libcacard/card_7816t.h b/libcacard/card_7816t.h
index 9333285..d273d3d 100644
--- a/libcacard/card_7816t.h
+++ b/libcacard/card_7816t.h
@@ -5,7 +5,7 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef CARD_7816T_H
-#define CARD_7816T_H 1
+#define CARD_7816T_H
 
 typedef unsigned short vcard_7816_status_t;
 
@@ -162,4 +162,4 @@ struct VCardAPDUStruct {
 #define VCARD7816_INS_VERIFY                0x20
 #define VCARD7816_INS_GET_RESPONSE          0xc0
 
-#endif
+#endif /* CARD_7816T_H */
diff --git a/libcacard/eventt.h b/libcacard/eventt.h
index 0dc7bd4..43384b0 100644
--- a/libcacard/eventt.h
+++ b/libcacard/eventt.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef EVENTT_H
-#define EVENTT_H 1
+#define EVENTT_H
 #include "vreadert.h"
 #include "vcardt.h"
 
@@ -24,6 +24,5 @@ struct VEventStruct {
     VReader *reader;
     VCard *card;
 };
-#endif
-
 
+#endif /* EVENTT_H */
diff --git a/libcacard/vcard.h b/libcacard/vcard.h
index 47dc703..21dab5f 100644
--- a/libcacard/vcard.h
+++ b/libcacard/vcard.h
@@ -3,7 +3,7 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef VCARD_H
-#define VCARD_H 1
+#define VCARD_H
 
 #include "vcardt.h"
 
@@ -83,4 +83,4 @@ VCardType vcard_get_type(VCard *card);
 /* get the private data */
 VCardEmul *vcard_get_private(VCard *card);
 
-#endif
+#endif /* VCARD_H */
diff --git a/libcacard/vcard_emul.h b/libcacard/vcard_emul.h
index 963563f..934612b 100644
--- a/libcacard/vcard_emul.h
+++ b/libcacard/vcard_emul.h
@@ -11,7 +11,7 @@
  */
 
 #ifndef VCARD_EMUL_H
-#define VCARD_EMUL_H 1
+#define VCARD_EMUL_H
 
 #include "card_7816t.h"
 #include "vcard.h"
@@ -62,4 +62,5 @@ VCardEmulOptions *vcard_emul_options(const char *args);
 VCardEmulError vcard_emul_init(const VCardEmulOptions *options);
 void vcard_emul_replay_insertion_events(void);
 void vcard_emul_usage(void);
-#endif
+
+#endif /* VCARD_EMUL_H */
diff --git a/libcacard/vcard_emul_type.h b/libcacard/vcard_emul_type.h
index 0242f40..53b55e3 100644
--- a/libcacard/vcard_emul_type.h
+++ b/libcacard/vcard_emul_type.h
@@ -9,7 +9,7 @@
  */
 
 #ifndef VCARD_EMUL_TYPE_H
-#define VCARD_EMUL_TYPE_H 1
+#define VCARD_EMUL_TYPE_H
 #include "vcardt.h"
 #include "vreadert.h"
 
@@ -29,4 +29,4 @@ VCardStatus vcard_init(VReader *vreader, VCard *vcard, VCardEmulType type,
 VCardEmulType vcard_emul_type_select(VReader *vreader);
 VCardEmulType vcard_emul_type_from_string(const char *type_string);
 
-#endif
+#endif /* VCARD_EMUL_TYPE_H */
diff --git a/libcacard/vcardt.h b/libcacard/vcardt.h
index 538bdde..15b8e59 100644
--- a/libcacard/vcardt.h
+++ b/libcacard/vcardt.h
@@ -3,7 +3,7 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef VCARDT_H
-#define VCARDT_H 1
+#define VCARDT_H
 
 /*
  * these should come from some common spice header file
@@ -61,4 +61,4 @@ struct VCardBufferResponseStruct {
     int len;
 };
 
-#endif
+#endif /* VCARDT_H */
diff --git a/libcacard/vevent.h b/libcacard/vevent.h
index 38c3482..1927288 100644
--- a/libcacard/vevent.h
+++ b/libcacard/vevent.h
@@ -3,7 +3,8 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #ifndef EVENT_H
-#define EVENT_H 1
+#define EVENT_H
+
 #include "eventt.h"
 #include "vreadert.h"
 #include "vcardt.h"
@@ -23,5 +24,4 @@ void vevent_queue_init(void);
 VEvent *vevent_wait_next_vevent(void);
 VEvent *vevent_get_next_vevent(void);
 
-
-#endif
+#endif /* EVENT_H */
diff --git a/libcacard/vreader.h b/libcacard/vreader.h
index ec20421..233f744 100644
--- a/libcacard/vreader.h
+++ b/libcacard/vreader.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef VREADER_H
-#define VREADER_H 1
+#define VREADER_H
 
 #include "eventt.h"
 #include "vreadert.h"
@@ -52,4 +52,4 @@ VReaderStatus vreader_add_reader(VReader *reader);
 VReaderStatus vreader_remove_reader(VReader *reader);
 VReaderStatus vreader_insert_card(VReader *reader, VCard *card);
 
-#endif
+#endif /* VREADER_H */
diff --git a/libcacard/vreadert.h b/libcacard/vreadert.h
index f97e0a7..3607512 100644
--- a/libcacard/vreadert.h
+++ b/libcacard/vreadert.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef VREADERT_H
-#define VREADERT_H 1
+#define VREADERT_H
 
 typedef enum {
     VREADER_OK = 0,
@@ -20,5 +20,4 @@ typedef struct VReaderListEntryStruct VReaderListEntry;
 typedef struct VReaderEmulStruct VReaderEmul;
 typedef void (*VReaderEmulFree)(VReaderEmul *);
 
-#endif
-
+#endif /* VREADERT_H */
diff --git a/libfdt_env.h b/libfdt_env.h
index ee0419f..ff6e08d 100644
--- a/libfdt_env.h
+++ b/libfdt_env.h
@@ -16,8 +16,8 @@
  *
  */
 
-#ifndef _LIBFDT_ENV_H
-#define _LIBFDT_ENV_H
+#ifndef LIBFDT_ENV_H
+#define LIBFDT_ENV_H
 
 #include <stddef.h>
 #include <stdint.h>
@@ -37,4 +37,4 @@
 #define cpu_to_fdt64(x)		(bswap_64((x)))
 #endif
 
-#endif /* _LIBFDT_ENV_H */
+#endif /* LIBFDT_ENV_H */
diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
index 002b3cb..06b41f6 100644
--- a/linux-user/arm/nwfpe/fpa11.h
+++ b/linux-user/arm/nwfpe/fpa11.h
@@ -18,8 +18,8 @@
     along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
 
-#ifndef __FPA11_H__
-#define __FPA11_H__
+#ifndef FPA11_H
+#define FPA11_H
 
 #include <stdlib.h>
 #include <stdio.h>
@@ -127,4 +127,4 @@ unsigned int ExtendedCPDO(const unsigned int opcode);
 /* included only for get_user/put_user macros */
 #include "qemu.h"
 
-#endif
+#endif /* FPA11_H */
diff --git a/linux-user/arm/nwfpe/fpopcode.h b/linux-user/arm/nwfpe/fpopcode.h
index e7d1009..c5d197f 100644
--- a/linux-user/arm/nwfpe/fpopcode.h
+++ b/linux-user/arm/nwfpe/fpopcode.h
@@ -18,8 +18,8 @@
     along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
 
-#ifndef __FPOPCODE_H__
-#define __FPOPCODE_H__
+#ifndef FPOPCODE_H
+#define FPOPCODE_H
 
 /*
 ARM Floating Point Instruction Classes
@@ -387,4 +387,4 @@ static inline float32 getSingleConstant(const unsigned int nIndex)
 unsigned int getRegisterCount(const unsigned int opcode);
 unsigned int getDestinationSize(const unsigned int opcode);
 
-#endif
+#endif /* FPOPCODE_H */
diff --git a/linux-user/arm/nwfpe/fpsr.h b/linux-user/arm/nwfpe/fpsr.h
index 859dcd5..78119d5 100644
--- a/linux-user/arm/nwfpe/fpsr.h
+++ b/linux-user/arm/nwfpe/fpsr.h
@@ -18,8 +18,8 @@
     along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
 
-#ifndef __FPSR_H__
-#define __FPSR_H__
+#ifndef FPSR_H
+#define FPSR_H
 
 /*
 The FPSR is a 32 bit register consisting of 4 parts, each exactly
@@ -104,4 +104,4 @@ typedef unsigned int FPCR;  /* type for floating point control register */
 #define MASK_WFC	MASK_RESET
 #define MASK_RFC	~MASK_RESET
 
-#endif
+#endif /* FPSR_H */
diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
index 8974caa..4ba1474 100644
--- a/linux-user/linux_loop.h
+++ b/linux-user/linux_loop.h
@@ -1,6 +1,6 @@
 /* Copied from 2.6.25 kernel headers to avoid problems on older hosts.  */
-#ifndef _LINUX_LOOP_H
-#define _LINUX_LOOP_H
+#ifndef LINUX_LOOP_H
+#define LINUX_LOOP_H
 
 /*
  * include/linux/loop.h
@@ -92,4 +92,4 @@ struct loop_info64 {
 #define LOOP_GET_STATUS64	0x4C05
 #define LOOP_CHANGE_FD		0x4C06
 
-#endif
+#endif /* LINUX_LOOP_H */
diff --git a/linux-user/qemu-types.h b/linux-user/qemu-types.h
index 1adda9f..c47a31f 100644
--- a/linux-user/qemu-types.h
+++ b/linux-user/qemu-types.h
@@ -1,5 +1,6 @@
 #ifndef QEMU_TYPES_H
 #define QEMU_TYPES_H
+
 #include "cpu.h"
 
 #ifdef TARGET_ABI32
@@ -21,4 +22,5 @@ typedef target_long abi_long;
 #define TARGET_ABI32 1
 #endif
 #endif
-#endif
+
+#endif /* QEMU_TYPES_H */
diff --git a/linux-user/unicore32/syscall.h b/linux-user/unicore32/syscall.h
index 010cdd8..4ab214a 100644
--- a/linux-user/unicore32/syscall.h
+++ b/linux-user/unicore32/syscall.h
@@ -5,8 +5,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __UC32_SYSCALL_H__
-#define __UC32_SYSCALL_H__
+#ifndef UC32_SYSCALL_H
+#define UC32_SYSCALL_H
 struct target_pt_regs {
     abi_ulong uregs[34];
 };
@@ -52,4 +52,4 @@ struct target_pt_regs {
 
 #define UNAME_MACHINE "UniCore-II"
 
-#endif /* __UC32_SYSCALL_H__ */
+#endif /* UC32_SYSCALL_H */
diff --git a/migration.h b/migration.h
index 050c56c..d5b4622 100644
--- a/migration.h
+++ b/migration.h
@@ -148,4 +148,4 @@ int ram_load(QEMUFile *f, void *opaque, int version_id);
 
 extern int incoming_expected;
 
-#endif
+#endif /* QEMU_MIGRATION_H */
diff --git a/module.h b/module.h
index 9263f1c..c5a5c9c 100644
--- a/module.h
+++ b/module.h
@@ -35,4 +35,4 @@ void register_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
 
-#endif
+#endif /* QEMU_MODULE_H */
diff --git a/nbd.h b/nbd.h
index b38d0d0..bbbef3b 100644
--- a/nbd.h
+++ b/nbd.h
@@ -66,4 +66,4 @@ int nbd_trip(BlockDriverState *bs, int csock, off_t size, uint64_t dev_offset,
 int nbd_client(int fd);
 int nbd_disconnect(int fd);
 
-#endif
+#endif /* NBD_H */
diff --git a/net.h b/net.h
index 6ceca50..7ba0f41 100644
--- a/net.h
+++ b/net.h
@@ -181,4 +181,4 @@ void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd);
 
 int net_handle_fd_param(Monitor *mon, const char *param);
 
-#endif
+#endif /* QEMU_NET_H */
diff --git a/notify.h b/notify.h
index b40522f..ba260ff 100644
--- a/notify.h
+++ b/notify.h
@@ -40,4 +40,4 @@ void notifier_list_remove(NotifierList *list, Notifier *notifier);
 
 void notifier_list_notify(NotifierList *list);
 
-#endif
+#endif /* QEMU_NOTIFY_H */
diff --git a/osdep.h b/osdep.h
index 970d767..e4986cd 100644
--- a/osdep.h
+++ b/osdep.h
@@ -147,4 +147,4 @@ static inline void qemu_timersub(const struct timeval *val1,
 #define qemu_timersub timersub
 #endif
 
-#endif
+#endif /* QEMU_OSDEP_H */
diff --git a/pflib.h b/pflib.h
index b70c313..747c415 100644
--- a/pflib.h
+++ b/pflib.h
@@ -1,5 +1,5 @@
-#ifndef __QEMU_PFLIB_H
-#define __QEMU_PFLIB_H
+#ifndef QEMU_PFLIB_H
+#define QEMU_PFLIB_H
 
 /*
  * PixelFormat conversion library.
@@ -17,4 +17,4 @@ QemuPfConv *qemu_pf_conv_get(PixelFormat *dst, PixelFormat *src);
 void qemu_pf_conv_run(QemuPfConv *conv, void *dst, void *src, uint32_t cnt);
 void qemu_pf_conv_put(QemuPfConv *conv);
 
-#endif
+#endif /* QEMU_PFLIB_H */
diff --git a/poison.h b/poison.h
index 2b18232..361efb0 100644
--- a/poison.h
+++ b/poison.h
@@ -51,4 +51,5 @@
 #pragma GCC poison CPU_INTERRUPT_TGT_INT_2
 
 #endif
-#endif
+
+#endif /* HW_POISON_H */
diff --git a/qemu-aio.h b/qemu-aio.h
index 3bdd749..6a02eee 100644
--- a/qemu-aio.h
+++ b/qemu-aio.h
@@ -56,4 +56,4 @@ int qemu_aio_set_fd_handler(int fd,
                             AioProcessQueue *io_process_queue,
                             void *opaque);
 
-#endif
+#endif /* QEMU_AIO_H */
diff --git a/qemu-barrier.h b/qemu-barrier.h
index b77fce2..2e995da 100644
--- a/qemu-barrier.h
+++ b/qemu-barrier.h
@@ -1,5 +1,5 @@
-#ifndef __QEMU_BARRIER_H
-#define __QEMU_BARRIER_H 1
+#ifndef QEMU_BARRIER_H
+#define QEMU_BARRIER_H
 
 /* FIXME: arch dependant, x86 version */
 #define smp_wmb()   asm volatile("" ::: "memory")
@@ -7,4 +7,4 @@
 /* Compiler barrier */
 #define barrier()   asm volatile("" ::: "memory")
 
-#endif
+#endif /* QEMU_BARRIER_H */
diff --git a/qemu-char.h b/qemu-char.h
index 892c6da..2eec37f 100644
--- a/qemu-char.h
+++ b/qemu-char.h
@@ -125,4 +125,5 @@ int qemu_set_fd_handler(int fd,
                         IOHandler *fd_read,
                         IOHandler *fd_write,
                         void *opaque);
-#endif
+
+#endif /* QEMU_CHAR_H */
diff --git a/qemu-common.h b/qemu-common.h
index b851b20..559cf64 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -390,4 +390,4 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 
 #include "module.h"
 
-#endif
+#endif /* QEMU_COMMON_H */
diff --git a/qemu-error.h b/qemu-error.h
index 4d5c537..81e2cfa 100644
--- a/qemu-error.h
+++ b/qemu-error.h
@@ -37,4 +37,4 @@ void error_print_loc(void);
 void error_set_progname(const char *argv0);
 void error_report(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 
-#endif
+#endif /* QEMU_ERROR_H */
diff --git a/qemu-log.h b/qemu-log.h
index fccfb110..be0a6be 100644
--- a/qemu-log.h
+++ b/qemu-log.h
@@ -90,4 +90,4 @@ extern int loglevel;
     } while (0)
 
 
-#endif
+#endif /* QEMU_LOG_H */
diff --git a/qemu-option.h b/qemu-option.h
index b515813..76d200f 100644
--- a/qemu-option.h
+++ b/qemu-option.h
@@ -132,4 +132,4 @@ int qemu_opts_print(QemuOpts *opts, void *dummy);
 int qemu_opts_foreach(QemuOptsList *list, qemu_opts_loopfunc func, void *opaque,
                       int abort_on_failure);
 
-#endif
+#endif /* QEMU_OPTIONS_H */
diff --git a/qemu-options.h b/qemu-options.h
index c96f994..1e7166f 100644
--- a/qemu-options.h
+++ b/qemu-options.h
@@ -25,8 +25,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _QEMU_OPTIONS_H_
-#define _QEMU_OPTIONS_H_
+#ifndef QEMU_OPTIONS_H_
+#define QEMU_OPTIONS_H_
 
 enum {
 #define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
@@ -38,4 +38,4 @@ enum {
 #undef GEN_DOCS
 };
 
-#endif
+#endif /* QEMU_OPTIONS_H_ */
diff --git a/qemu-os-posix.h b/qemu-os-posix.h
index 81fd9ab..79eaf81 100644
--- a/qemu-os-posix.h
+++ b/qemu-os-posix.h
@@ -51,4 +51,5 @@ typedef struct timespec qemu_timespec;
 int qemu_utimensat(int dirfd, const char *path, const qemu_timespec *times,
     int flags);
 
-#endif
+
+#endif /* QEMU_OS_POSIX_H */
diff --git a/qemu-os-win32.h b/qemu-os-win32.h
index 8a069d7..3a611c3 100644
--- a/qemu-os-win32.h
+++ b/qemu-os-win32.h
@@ -66,4 +66,4 @@ typedef struct {
 } qemu_timeval;
 int qemu_gettimeofday(qemu_timeval *tp);
 
-#endif
+#endif /* QEMU_OS_WIN32_H */
diff --git a/qemu-thread-posix.h b/qemu-thread-posix.h
index ee4618e..81f5a9e 100644
--- a/qemu-thread-posix.h
+++ b/qemu-thread-posix.h
@@ -1,5 +1,5 @@
-#ifndef __QEMU_THREAD_POSIX_H
-#define __QEMU_THREAD_POSIX_H 1
+#ifndef QEMU_THREAD_POSIX_H
+#define QEMU_THREAD_POSIX_H
 #include "pthread.h"
 
 struct QemuMutex {
@@ -14,4 +14,4 @@ struct QemuThread {
     pthread_t thread;
 };
 
-#endif
+#endif /* QEMU_THREAD_POSIX_H */
diff --git a/qemu-thread-win32.h b/qemu-thread-win32.h
index 878f86a..d03da8b 100644
--- a/qemu-thread-win32.h
+++ b/qemu-thread-win32.h
@@ -1,5 +1,5 @@
-#ifndef __QEMU_THREAD_WIN32_H
-#define __QEMU_THREAD_WIN32_H 1
+#ifndef QEMU_THREAD_WIN32_H
+#define QEMU_THREAD_WIN32_H
 #include "windows.h"
 
 struct QemuMutex {
@@ -18,4 +18,4 @@ struct QemuThread {
     void *ret;
 };
 
-#endif
+#endif /* QEMU_THREAD_WIN32_H */
diff --git a/qemu-thread.h b/qemu-thread.h
index 0a73d50..7122b5c 100644
--- a/qemu-thread.h
+++ b/qemu-thread.h
@@ -1,5 +1,5 @@
-#ifndef __QEMU_THREAD_H
-#define __QEMU_THREAD_H 1
+#ifndef QEMU_THREAD_H
+#define QEMU_THREAD_H
 
 #include <inttypes.h>
 
@@ -38,4 +38,4 @@ void qemu_thread_get_self(QemuThread *thread);
 int qemu_thread_is_self(QemuThread *thread);
 void qemu_thread_exit(void *retval);
 
-#endif
+#endif /* QEMU_THREAD_H */
diff --git a/qemu-timer.h b/qemu-timer.h
index 06cbe20..73ee7b9 100644
--- a/qemu-timer.h
+++ b/qemu-timer.h
@@ -333,4 +333,4 @@ extern int64_t tlb_flush_time;
 extern int64_t dev_time;
 #endif
 
-#endif
+#endif /* QEMU_TIMER_H */
diff --git a/range.h b/range.h
index 3502372..60abe6d 100644
--- a/range.h
+++ b/range.h
@@ -26,4 +26,4 @@ static inline int ranges_overlap(uint64_t first1, uint64_t len1,
     return !(last2 < first1 || last1 < first2);
 }
 
-#endif
+#endif /* QEMU_RANGE_H */
diff --git a/rwhandler.h b/rwhandler.h
index b2a5790..760061c 100644
--- a/rwhandler.h
+++ b/rwhandler.h
@@ -24,4 +24,4 @@ int cpu_register_io_memory_simple(ReadWriteHandler *, int endian);
 int register_ioport_simple(ReadWriteHandler *,
                            pio_addr_t start, int length, int size);
 
-#endif
+#endif /* READ_WRITE_HANDLER_H */
diff --git a/slirp/if.h b/slirp/if.h
index 2dac1c7..a1261cc 100644
--- a/slirp/if.h
+++ b/slirp/if.h
@@ -5,8 +5,8 @@
  * terms and conditions of the copyright.
  */
 
-#ifndef _IF_H_
-#define _IF_H_
+#ifndef IF_H
+#define IF_H
 
 #define IF_COMPRESS	0x01	/* We want compression */
 #define IF_NOCOMPRESS	0x02	/* Do not do compression */
@@ -22,4 +22,4 @@
 
 #define ifs_init(ifm) ((ifm)->ifs_next = (ifm)->ifs_prev = (ifm))
 
-#endif
+#endif /* IF_H */
diff --git a/slirp/ip.h b/slirp/ip.h
index 48ea38e..1e3a3fc 100644
--- a/slirp/ip.h
+++ b/slirp/ip.h
@@ -30,8 +30,8 @@
  * ip.h,v 1.3 1994/08/21 05:27:30 paul Exp
  */
 
-#ifndef _IP_H_
-#define _IP_H_
+#ifndef IP_H
+#define IP_H
 
 #ifdef HOST_WORDS_BIGENDIAN
 # ifndef NTOHL
@@ -250,4 +250,4 @@ struct ipoption {
 	int8_t	ipopt_list[MAX_IPOPTLEN];	/* options proper */
 } __attribute__((packed));
 
-#endif
+#endif /* IP_H */
diff --git a/slirp/ip_icmp.h b/slirp/ip_icmp.h
index 2692822..72c3350 100644
--- a/slirp/ip_icmp.h
+++ b/slirp/ip_icmp.h
@@ -30,8 +30,8 @@
  * ip_icmp.h,v 1.4 1995/05/30 08:09:43 rgrimes Exp
  */
 
-#ifndef _NETINET_IP_ICMP_H_
-#define _NETINET_IP_ICMP_H_
+#ifndef NETINET_IP_ICMP_H
+#define NETINET_IP_ICMP_H
 
 /*
  * Interface Control Message Protocol Definitions.
@@ -158,4 +158,4 @@ void icmp_error(struct mbuf *msrc, u_char type, u_char code, int minsize,
                 const char *message);
 void icmp_reflect(struct mbuf *);
 
-#endif
+#endif /* NETINET_IP_ICMP_H */
diff --git a/slirp/libslirp.h b/slirp/libslirp.h
index 67c70e3..a8cdd44 100644
--- a/slirp/libslirp.h
+++ b/slirp/libslirp.h
@@ -1,5 +1,5 @@
-#ifndef _LIBSLIRP_H
-#define _LIBSLIRP_H
+#ifndef LIBSLIRP_H
+#define LIBSLIRP_H
 
 #include <qemu-common.h>
 
@@ -53,4 +53,4 @@ static inline void slirp_select_poll(fd_set *readfds, fd_set *writefds,
                                      fd_set *xfds, int select_error) { }
 #endif /* !CONFIG_SLIRP */
 
-#endif
+#endif /* LIBSLIRP_H */
diff --git a/slirp/mbuf.h b/slirp/mbuf.h
index 97729e2..c5f469e 100644
--- a/slirp/mbuf.h
+++ b/slirp/mbuf.h
@@ -30,8 +30,8 @@
  * mbuf.h,v 1.9 1994/11/14 13:54:20 bde Exp
  */
 
-#ifndef _MBUF_H_
-#define _MBUF_H_
+#ifndef MBUF_H
+#define MBUF_H
 
 #define m_freem m_free
 
@@ -124,4 +124,4 @@ void m_adj(struct mbuf *, int);
 int m_copy(struct mbuf *, struct mbuf *, int, int);
 struct mbuf * dtom(Slirp *, void *);
 
-#endif
+#endif /* MBUF_H */
diff --git a/slirp/misc.h b/slirp/misc.h
index ed40a10..f46ae87 100644
--- a/slirp/misc.h
+++ b/slirp/misc.h
@@ -5,8 +5,8 @@
  * terms and conditions of the copyright.
  */
 
-#ifndef _MISC_H_
-#define _MISC_H_
+#ifndef MISC_H
+#define MISC_H
 
 struct ex_list {
 	int ex_pty;			/* Do we want a pty? */
@@ -69,4 +69,4 @@ void fd_nonblock(int);
 void fd_block(int);
 int rsh_exec(struct socket *, struct socket *, char *, char *, char *);
 
-#endif
+#endif /* MISC_H */
diff --git a/slirp/sbuf.h b/slirp/sbuf.h
index 4f22e7c..006a54b 100644
--- a/slirp/sbuf.h
+++ b/slirp/sbuf.h
@@ -5,8 +5,8 @@
  * terms and conditions of the copyright.
  */
 
-#ifndef _SBUF_H_
-#define _SBUF_H_
+#ifndef SBUF_H
+#define SBUF_H
 
 #define sbflush(sb) sbdrop((sb),(sb)->sb_cc)
 #define sbspace(sb) ((sb)->sb_datalen - (sb)->sb_cc)
@@ -27,4 +27,4 @@ void sbreserve(struct sbuf *, int);
 void sbappend(struct socket *, struct mbuf *);
 void sbcopy(struct sbuf *, int, int, char *);
 
-#endif
+#endif /* SBUF_H */
diff --git a/slirp/slirp.h b/slirp/slirp.h
index 954289a..49f16c0 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -1,5 +1,5 @@
-#ifndef __COMMON_H__
-#define __COMMON_H__
+#ifndef COMMON_H
+#define COMMON_H
 
 #include "config-host.h"
 #include "slirp_config.h"
@@ -317,4 +317,4 @@ struct tcpcb *tcp_drop(struct tcpcb *tp, int err);
 #define errno (WSAGetLastError())
 #endif
 
-#endif
+#endif /* COMMON_H */
diff --git a/slirp/socket.h b/slirp/socket.h
index 857b0da..e4d19c8 100644
--- a/slirp/socket.h
+++ b/slirp/socket.h
@@ -5,8 +5,8 @@
  * terms and conditions of the copyright.
  */
 
-#ifndef _SLIRP_SOCKET_H_
-#define _SLIRP_SOCKET_H_
+#ifndef SLIRP_SOCKET_H
+#define SLIRP_SOCKET_H
 
 #define SO_EXPIRE 240000
 #define SO_EXPIREFAST 10000
@@ -92,4 +92,4 @@ struct iovec; /* For win32 */
 size_t sopreprbuf(struct socket *so, struct iovec *iov, int *np);
 int soreadbuf(struct socket *so, const char *buf, int size);
 
-#endif /* _SOCKET_H_ */
+#endif /* SOCKET_H */
diff --git a/slirp/tcp.h b/slirp/tcp.h
index 9d06836..1e2ae7d 100644
--- a/slirp/tcp.h
+++ b/slirp/tcp.h
@@ -30,8 +30,8 @@
  * tcp.h,v 1.3 1994/08/21 05:27:34 paul Exp
  */
 
-#ifndef _TCP_H_
-#define _TCP_H_
+#ifndef TCP_H
+#define TCP_H
 
 typedef	uint32_t tcp_seq;
 
@@ -161,4 +161,4 @@ struct tcphdr {
 
 #define TCP_ISSINCR     (125*1024)      /* increment for tcp_iss each second */
 
-#endif
+#endif /* TCP_H */
diff --git a/slirp/tcp_timer.h b/slirp/tcp_timer.h
index ff17914..4c2fd8a 100644
--- a/slirp/tcp_timer.h
+++ b/slirp/tcp_timer.h
@@ -30,8 +30,8 @@
  * tcp_timer.h,v 1.4 1994/08/21 05:27:38 paul Exp
  */
 
-#ifndef _TCP_TIMER_H_
-#define _TCP_TIMER_H_
+#ifndef TCP_TIMER_H
+#define TCP_TIMER_H
 
 /*
  * Definitions of the TCP timers.  These timers are counted
@@ -124,4 +124,4 @@ void tcp_fasttimo(Slirp *);
 void tcp_slowtimo(Slirp *);
 void tcp_canceltimers(struct tcpcb *);
 
-#endif
+#endif /* TCP_TIMER_H */
diff --git a/slirp/tcp_var.h b/slirp/tcp_var.h
index 004193f..bf5a8f8 100644
--- a/slirp/tcp_var.h
+++ b/slirp/tcp_var.h
@@ -30,8 +30,8 @@
  * tcp_var.h,v 1.3 1994/08/21 05:27:39 paul Exp
  */
 
-#ifndef _TCP_VAR_H_
-#define _TCP_VAR_H_
+#ifndef TCP_VAR_H
+#define TCP_VAR_H
 
 #include "tcpip.h"
 #include "tcp_timer.h"
@@ -158,4 +158,4 @@ struct tcpcb {
 #define	TCP_REXMTVAL(tp) \
 	(((tp)->t_srtt >> TCP_RTT_SHIFT) + (tp)->t_rttvar)
 
-#endif
+#endif /* TCP_VAR_H */
diff --git a/slirp/tcpip.h b/slirp/tcpip.h
index 7974ce3..88c59de 100644
--- a/slirp/tcpip.h
+++ b/slirp/tcpip.h
@@ -30,8 +30,8 @@
  * tcpip.h,v 1.3 1994/08/21 05:27:40 paul Exp
  */
 
-#ifndef _TCPIP_H_
-#define _TCPIP_H_
+#ifndef TCPIP_H
+#define TCPIP_H
 
 /*
  * Tcp+ip header, after ip options removed.
@@ -74,4 +74,4 @@ struct tcpiphdr_2 {
 	char first_char;
 };
 
-#endif
+#endif /* TCPIP_H */
diff --git a/slirp/udp.h b/slirp/udp.h
index 9b5c3cf..7f47b31 100644
--- a/slirp/udp.h
+++ b/slirp/udp.h
@@ -30,8 +30,8 @@
  * udp.h,v 1.3 1994/08/21 05:27:41 paul Exp
  */
 
-#ifndef _UDP_H_
-#define _UDP_H_
+#ifndef UDP_H
+#define UDP_H
 
 #define UDP_TTL 0x60
 #define UDP_UDPDATALEN 16192
@@ -83,4 +83,4 @@ struct socket * udp_listen(Slirp *, uint32_t, u_int, uint32_t, u_int,
 int udp_output2(struct socket *so, struct mbuf *m,
                 struct sockaddr_in *saddr, struct sockaddr_in *daddr,
                 int iptos);
-#endif
+#endif /* UDP_H */
diff --git a/softmmu_defs.h b/softmmu_defs.h
index e38bb75..964873d 100644
--- a/softmmu_defs.h
+++ b/softmmu_defs.h
@@ -19,4 +19,4 @@ void REGPARM __stl_cmmu(target_ulong addr, uint32_t val, int mmu_idx);
 uint64_t REGPARM __ldq_cmmu(target_ulong addr, int mmu_idx);
 void REGPARM __stq_cmmu(target_ulong addr, uint64_t val, int mmu_idx);
 
-#endif
+#endif /* SOFTMMU_DEFS_H */
diff --git a/sysemu.h b/sysemu.h
index 7e70daa..83841e4 100644
--- a/sysemu.h
+++ b/sysemu.h
@@ -172,4 +172,5 @@ void register_devices(void);
 void add_boot_device_path(int32_t bootindex, DeviceState *dev,
                           const char *suffix);
 char *get_boot_devices_list(uint32_t *size);
-#endif
+
+#endif /* SYSEMU_H */
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index 686fb4a..37cd556 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if !defined (__CPU_ALPHA_H__)
-#define __CPU_ALPHA_H__
+#ifndef CPU_ALPHA_H
+#define CPU_ALPHA_H
 
 #include "config.h"
 
@@ -535,4 +535,4 @@ static inline void cpu_set_tls(CPUState *env, target_ulong newtls)
 }
 #endif
 
-#endif /* !defined (__CPU_ALPHA_H__) */
+#endif /* CPU_ALPHA_H */
diff --git a/target-alpha/exec.h b/target-alpha/exec.h
index 6ae96d1..d872205 100644
--- a/target-alpha/exec.h
+++ b/target-alpha/exec.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if !defined (__ALPHA_EXEC_H__)
-#define __ALPHA_EXEC_H__
+#ifndef ALPHA_EXEC_H
+#define ALPHA_EXEC_H
 
 #include "config.h"
 
@@ -47,4 +47,4 @@ static inline void cpu_pc_from_tb(CPUState *env, TranslationBlock *tb)
     env->pc = tb->pc;
 }
 
-#endif /* !defined (__ALPHA_EXEC_H__) */
+#endif /* ALPHA_EXEC_H */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 01f5b57..9c130d8 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -512,4 +512,4 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
     }
 }
 
-#endif
+#endif /* CPU_ARM_H */
diff --git a/target-cris/cpu.h b/target-cris/cpu.h
index 2bc35e4..3575d79 100644
--- a/target-cris/cpu.h
+++ b/target-cris/cpu.h
@@ -268,4 +268,4 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
 #define cpu_list cris_cpu_list
 void cris_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 
-#endif
+#endif /* CPU_CRIS_H */
diff --git a/target-cris/opcode-cris.h b/target-cris/opcode-cris.h
index 8d4749d..2656768 100644
--- a/target-cris/opcode-cris.h
+++ b/target-cris/opcode-cris.h
@@ -19,8 +19,8 @@ GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program; if not, see <http://www.gnu.org/licenses/>.  */
 
-#ifndef __CRIS_H_INCLUDED_
-#define __CRIS_H_INCLUDED_
+#ifndef CRIS_H
+#define CRIS_H
 
 #if !defined(__STDC__) && !defined(const)
 #define const
@@ -355,7 +355,7 @@ extern const struct cris_opcode cris_opcodes[];
    sign-extended before adding to "target".  */
 #define CRIS_DIS_FLAG_MEM_TARGET2_MEM_WORD (1 << 7)
 
-#endif /* __CRIS_H_INCLUDED_ */
+#endif /* CRIS_H */
 
 /*
  * Local variables:
diff --git a/target-i386/svm.h b/target-i386/svm.h
index a224aea..989af76 100644
--- a/target-i386/svm.h
+++ b/target-i386/svm.h
@@ -1,5 +1,5 @@
-#ifndef __SVM_H
-#define __SVM_H
+#ifndef SVM_H
+#define SVM_H
 
 #define TLB_CONTROL_DO_NOTHING 0
 #define TLB_CONTROL_FLUSH_ALL_ASID 1
@@ -219,4 +219,4 @@ struct __attribute__ ((__packed__)) vmcb {
 	struct vmcb_save_area save;
 };
 
-#endif
+#endif /* SVM_H */
diff --git a/target-lm32/cpu.h b/target-lm32/cpu.h
index 8e2d26b..deda6b0 100644
--- a/target-lm32/cpu.h
+++ b/target-lm32/cpu.h
@@ -241,4 +241,5 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
     *cs_base = 0;
     *flags = 0;
 }
-#endif
+
+#endif /* CPU_LM32_H */
diff --git a/target-m68k/cpu.h b/target-m68k/cpu.h
index b025b66..ca7cfa0 100644
--- a/target-m68k/cpu.h
+++ b/target-m68k/cpu.h
@@ -254,4 +254,4 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
             | ((env->macsr >> 4) & 0xf);        /* Bits 0-3 */
 }
 
-#endif
+#endif /* CPU_M68K_H */
diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 78fe14ff..241c448 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -350,4 +350,5 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
 void do_unassigned_access(target_phys_addr_t addr, int is_write, int is_exec,
                           int is_asi, int size);
 #endif
-#endif
+
+#endif /* CPU_MICROBLAZE_H */
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 0b98d10..78e46de 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -1,5 +1,5 @@
-#if !defined (__MIPS_CPU_H__)
-#define __MIPS_CPU_H__
+#ifndef MIPS_CPU_H
+#define MIPS_CPU_H
 
 #define TARGET_HAS_ICE 1
 
@@ -656,4 +656,4 @@ static inline void cpu_set_tls(CPUState *env, target_ulong newtls)
     env->tls_value = newtls;
 }
 
-#endif /* !defined (__MIPS_CPU_H__) */
+#endif /* MIPS_CPU_H */
diff --git a/target-mips/exec.h b/target-mips/exec.h
index 607edf1..d9d51ac 100644
--- a/target-mips/exec.h
+++ b/target-mips/exec.h
@@ -1,5 +1,5 @@
-#if !defined(__QEMU_MIPS_EXEC_H__)
-#define __QEMU_MIPS_EXEC_H__
+#ifndef QEMU_MIPS_EXEC_H
+#define QEMU_MIPS_EXEC_H
 
 //#define DEBUG_OP
 
@@ -80,4 +80,4 @@ static inline void cpu_pc_from_tb(CPUState *env, TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-#endif /* !defined(__QEMU_MIPS_EXEC_H__) */
+#endif /* QEMU_MIPS_EXEC_H */
diff --git a/target-mips/mips-defs.h b/target-mips/mips-defs.h
index bf094a3..128527d 100644
--- a/target-mips/mips-defs.h
+++ b/target-mips/mips-defs.h
@@ -1,5 +1,5 @@
-#if !defined (__QEMU_MIPS_DEFS_H__)
-#define __QEMU_MIPS_DEFS_H__
+#ifndef QEMU_MIPS_DEFS_H
+#define QEMU_MIPS_DEFS_H
 
 /* If we want to use host float regs... */
 //#define USE_HOST_FLOAT_REGS
@@ -69,4 +69,4 @@
    Note that we still maintain Count/Compare to match the host clock. */
 //#define MIPS_STRICT_STANDARD 1
 
-#endif /* !defined (__QEMU_MIPS_DEFS_H__) */
+#endif /* QEMU_MIPS_DEFS_H */
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 8e4582f..aa617b9 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#if !defined (__CPU_PPC_H__)
-#define __CPU_PPC_H__
+#ifndef CPU_PPC_H
+#define CPU_PPC_H
 
 #include "config.h"
 #include "qemu-common.h"
@@ -1999,4 +1999,4 @@ static inline ppcemb_tlb_t *booke206_get_tlbe(CPUState *env, const int tlbn,
 
 extern void (*cpu_ppc_hypercall)(CPUState *);
 
-#endif /* !defined (__CPU_PPC_H__) */
+#endif /* CPU_PPC_H */
diff --git a/target-ppc/exec.h b/target-ppc/exec.h
index f87847a..c850751 100644
--- a/target-ppc/exec.h
+++ b/target-ppc/exec.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#if !defined (__PPC_H__)
-#define __PPC_H__
+#ifndef PPC_H
+#define PPC_H
 
 #include "config.h"
 
@@ -43,4 +43,4 @@ static inline void cpu_pc_from_tb(CPUState *env, TranslationBlock *tb)
     env->nip = tb->pc;
 }
 
-#endif /* !defined (__PPC_H__) */
+#endif /* PPC_H */
diff --git a/target-ppc/helper_regs.h b/target-ppc/helper_regs.h
index 3c98850..2e64105 100644
--- a/target-ppc/helper_regs.h
+++ b/target-ppc/helper_regs.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if !defined(__HELPER_REGS_H__)
-#define __HELPER_REGS_H__
+#ifndef HELPER_REGS_H
+#define HELPER_REGS_H
 
 /* Swap temporary saved registers with GPRs */
 static inline void hreg_swap_gpr_tgpr(CPUPPCState *env)
@@ -108,4 +108,4 @@ static inline int hreg_store_msr(CPUPPCState *env, target_ulong value,
     return excp;
 }
 
-#endif /* !defined(__HELPER_REGS_H__) */
+#endif /* HELPER_REGS_H */
diff --git a/target-ppc/kvm_ppc.h b/target-ppc/kvm_ppc.h
index 45a1373..ddb57d5 100644
--- a/target-ppc/kvm_ppc.h
+++ b/target-ppc/kvm_ppc.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __KVM_PPC_H__
-#define __KVM_PPC_H__
+#ifndef KVM_PPC_H
+#define KVM_PPC_H
 
 void kvmppc_init(void);
 void kvmppc_fdt_update(void *fdt);
@@ -50,4 +50,4 @@ int kvmppc_set_interrupt(CPUState *env, int irq, int level);
 #define KVM_INTERRUPT_SET_LEVEL -3
 #endif
 
-#endif /* __KVM_PPC_H__ */
+#endif /* KVM_PPC_H */
diff --git a/target-s390x/cpu.h b/target-s390x/cpu.h
index 4e5c391..06e73b7 100644
--- a/target-s390x/cpu.h
+++ b/target-s390x/cpu.h
@@ -972,4 +972,4 @@ static inline void cpu_inject_ext(CPUState *env, uint32_t code, uint32_t param,
     cpu_interrupt(env, CPU_INTERRUPT_HARD);
 }
 
-#endif
+#endif /* CPU_S390X_H */
diff --git a/target-sh4/cpu.h b/target-sh4/cpu.h
index 74ff97a..62b1a79 100644
--- a/target-sh4/cpu.h
+++ b/target-sh4/cpu.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _CPU_SH4_H
-#define _CPU_SH4_H
+#ifndef CPU_SH4_H
+#define CPU_SH4_H
 
 #include "config.h"
 #include "qemu-common.h"
@@ -361,4 +361,4 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 4 */
 }
 
-#endif				/* _CPU_SH4_H */
+#endif /* CPU_SH4_H */
diff --git a/target-sh4/exec.h b/target-sh4/exec.h
index 9f1c1f6..ac583ef 100644
--- a/target-sh4/exec.h
+++ b/target-sh4/exec.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _EXEC_SH4_H
-#define _EXEC_SH4_H
+#ifndef EXEC_SH4_H
+#define EXEC_SH4_H
 
 #include "config.h"
 #include "dyngen-exec.h"
@@ -42,4 +42,4 @@ static inline void cpu_pc_from_tb(CPUState *env, TranslationBlock *tb)
     env->flags = tb->flags;
 }
 
-#endif				/* _EXEC_SH4_H */
+#endif /* EXEC_SH4_H */
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 320530e..f7e268c 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -656,4 +656,4 @@ static inline void cpu_get_tb_cpu_state(CPUState *env, target_ulong *pc,
 #endif
 }
 
-#endif
+#endif /* CPU_SPARC_H */
diff --git a/target-sparc/exec.h b/target-sparc/exec.h
index f5c221e..60f879b 100644
--- a/target-sparc/exec.h
+++ b/target-sparc/exec.h
@@ -1,5 +1,6 @@
 #ifndef EXEC_SPARC_H
-#define EXEC_SPARC_H 1
+#define EXEC_SPARC_H
+
 #include "config.h"
 #include "dyngen-exec.h"
 
@@ -28,4 +29,4 @@ static inline void cpu_pc_from_tb(CPUState *env, TranslationBlock *tb)
     env->npc = tb->cs_base;
 }
 
-#endif
+#endif /* EXEC_SPARC_H */
diff --git a/target-unicore32/cpu.h b/target-unicore32/cpu.h
index 1e10049..1725645 100644
--- a/target-unicore32/cpu.h
+++ b/target-unicore32/cpu.h
@@ -7,8 +7,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __CPU_UC32_H__
-#define __CPU_UC32_H__
+#ifndef CPU_UC32_H
+#define CPU_UC32_H
 
 #define TARGET_LONG_BITS                32
 #define TARGET_PAGE_BITS                12
@@ -179,4 +179,4 @@ void uc32_translate_init(void);
 void do_interrupt(CPUState *);
 void switch_mode(CPUState_UniCore32 *, int);
 
-#endif /* __CPU_UC32_H__ */
+#endif /* CPU_UC32_H */
diff --git a/target-unicore32/exec.h b/target-unicore32/exec.h
index 4ab55f4..67c86c4 100644
--- a/target-unicore32/exec.h
+++ b/target-unicore32/exec.h
@@ -7,8 +7,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __UC32_EXEC_H__
-#define __UC32_EXEC_H__
+#ifndef UC32_EXEC_H
+#define UC32_EXEC_H
 
 #include "config.h"
 #include "dyngen-exec.h"
@@ -47,4 +47,4 @@ static inline int cpu_halted(CPUState *env)
     return EXCP_HALTED;
 }
 
-#endif /* __UC32_EXEC_H__ */
+#endif /* UC32_EXEC_H */
diff --git a/targphys.h b/targphys.h
index 95648d6..d256e25 100644
--- a/targphys.h
+++ b/targphys.h
@@ -18,4 +18,4 @@ typedef uint64_t target_phys_addr_t;
 #endif
 #endif
 
-#endif
+#endif /* TARGPHYS_H */
diff --git a/tcg/tcg-runtime.h b/tcg/tcg-runtime.h
index 5615b13..f1bb7b4 100644
--- a/tcg/tcg-runtime.h
+++ b/tcg/tcg-runtime.h
@@ -15,4 +15,4 @@ int64_t tcg_helper_rem_i64(int64_t arg1, int64_t arg2);
 uint64_t tcg_helper_divu_i64(uint64_t arg1, uint64_t arg2);
 uint64_t tcg_helper_remu_i64(uint64_t arg1, uint64_t arg2);
 
-#endif
+#endif /* TCG_RUNTIME_H */
diff --git a/thunk.h b/thunk.h
index 109c541..261dd3c 100644
--- a/thunk.h
+++ b/thunk.h
@@ -158,4 +158,4 @@ unsigned int target_to_host_bitmask(unsigned int x86_mask,
 unsigned int host_to_target_bitmask(unsigned int alpha_mask,
                                     const bitmask_transtbl * trans_tbl);
 
-#endif
+#endif /* THUNK_H */
diff --git a/uboot_image.h b/uboot_image.h
index 9fc2760..34c11a7 100644
--- a/uboot_image.h
+++ b/uboot_image.h
@@ -26,8 +26,8 @@
  ********************************************************************
  */
 
-#ifndef __UBOOT_IMAGE_H__
-#define __UBOOT_IMAGE_H__
+#ifndef UBOOT_IMAGE_H
+#define UBOOT_IMAGE_H
 
 /*
  * Operating System Codes
@@ -155,4 +155,4 @@ typedef struct uboot_image_header {
 } uboot_image_header_t;
 
 
-#endif	/* __IMAGE_H__ */
+#endif /* UBOOT_IMAGE_H */
diff --git a/ui/keymaps.h b/ui/keymaps.h
index a7600d5..47d0613 100644
--- a/ui/keymaps.h
+++ b/ui/keymaps.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef __QEMU_KEYMAPS_H__
-#define __QEMU_KEYMAPS_H__
+#ifndef QEMU_KEYMAPS_H
+#define QEMU_KEYMAPS_H
 
 #include "qemu-common.h"
 
@@ -74,4 +74,4 @@ int keysym2scancode(void *kbd_layout, int keysym);
 int keycode_is_keypad(void *kbd_layout, int keycode);
 int keysym_is_numlock(void *kbd_layout, int keysym);
 
-#endif /* __QEMU_KEYMAPS_H__ */
+#endif /* QEMU_KEYMAPS_H */
diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
index fd9b18a..3e202c2 100644
--- a/ui/vnc-auth-sasl.h
+++ b/ui/vnc-auth-sasl.h
@@ -23,8 +23,8 @@
  */
 
 
-#ifndef __QEMU_VNC_AUTH_SASL_H__
-#define __QEMU_VNC_AUTH_SASL_H__
+#ifndef QEMU_VNC_AUTH_SASL_H
+#define QEMU_VNC_AUTH_SASL_H
 
 
 #include <sasl/sasl.h>
@@ -70,5 +70,4 @@ long vnc_client_write_sasl(VncState *vs);
 
 void start_auth_sasl(VncState *vs);
 
-#endif /* __QEMU_VNC_AUTH_SASL_H__ */
-
+#endif /* QEMU_VNC_AUTH_SASL_H */
diff --git a/ui/vnc-auth-vencrypt.h b/ui/vnc-auth-vencrypt.h
index 9f674c5..075a1bd 100644
--- a/ui/vnc-auth-vencrypt.h
+++ b/ui/vnc-auth-vencrypt.h
@@ -25,9 +25,9 @@
  */
 
 
-#ifndef __QEMU_VNC_AUTH_VENCRYPT_H__
-#define __QEMU_VNC_AUTH_VENCRYPT_H__
+#ifndef QEMU_VNC_AUTH_VENCRYPT_H
+#define QEMU_VNC_AUTH_VENCRYPT_H
 
 void start_auth_vencrypt(VncState *vs);
 
-#endif /* __QEMU_VNC_AUTH_VENCRYPT_H__ */
+#endif /* QEMU_VNC_AUTH_VENCRYPT_H */
diff --git a/ui/vnc-enc-zrle.h b/ui/vnc-enc-zrle.h
index 6b18213..8915a16 100644
--- a/ui/vnc-enc-zrle.h
+++ b/ui/vnc-enc-zrle.h
@@ -37,4 +37,4 @@
 #define VNC_ZRLE_TILE_WIDTH  64
 #define VNC_ZRLE_TILE_HEIGHT 64
 
-#endif
+#endif /* VNC_ENCODING_ZRLE_H */
diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
index ac5d27a..0f81822 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -656,4 +656,4 @@ static inline void zywrle_calc_size(int *w, int *h, int level)
     *h &= ~((1 << level) - 1);
 }
 
-#endif
+#endif /* VNC_ENCODING_ZYWRLE_H */
diff --git a/ui/vnc-tls.h b/ui/vnc-tls.h
index 2b93633..9da22b7 100644
--- a/ui/vnc-tls.h
+++ b/ui/vnc-tls.h
@@ -25,8 +25,8 @@
  */
 
 
-#ifndef __QEMU_VNC_TLS_H__
-#define __QEMU_VNC_TLS_H__
+#ifndef QEMU_VNC_TLS_H
+#define QEMU_VNC_TLS_H
 
 #include <gnutls/gnutls.h>
 #include <gnutls/x509.h>
@@ -72,5 +72,4 @@ int vnc_tls_set_x509_creds_dir(VncDisplay *vd,
 			       const char *path);
 
 
-#endif /* __QEMU_VNC_TLS_H__ */
-
+#endif /* QEMU_VNC_TLS_H */
diff --git a/ui/vnc.h b/ui/vnc.h
index f10c5dc..7dd54d1 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -24,8 +24,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef __QEMU_VNC_H
-#define __QEMU_VNC_H
+#ifndef QEMU_VNC_H
+#define QEMU_VNC_H
 
 #include "qemu-common.h"
 #include "qemu-queue.h"
@@ -551,4 +551,4 @@ int vnc_zrle_send_framebuffer_update(VncState *vs, int x, int y, int w, int h);
 int vnc_zywrle_send_framebuffer_update(VncState *vs, int x, int y, int w, int h);
 void vnc_zrle_clear(VncState *vs);
 
-#endif /* __QEMU_VNC_H */
+#endif /* QEMU_VNC_H */
diff --git a/ui/x_keymap.h b/ui/x_keymap.h
index afde2e9..173e907 100644
--- a/ui/x_keymap.h
+++ b/ui/x_keymap.h
@@ -29,4 +29,4 @@ uint8_t translate_xfree86_keycode(const int key);
 
 uint8_t translate_evdev_keycode(const int key);
 
-#endif
+#endif /* QEMU_X_KEYMAP_H */
-- 
1.7.5


