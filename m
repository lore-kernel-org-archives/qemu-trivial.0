Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THpiX-0000dk-7U
	for mharc-qemu-trivial@gnu.org; Sat, 29 Sep 2012 01:35:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1THpiT-0000dA-VI
	for qemu-trivial@nongnu.org; Sat, 29 Sep 2012 01:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1THpiQ-0006Xd-Uu
	for qemu-trivial@nongnu.org; Sat, 29 Sep 2012 01:35:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1THpiQ-0006WI-Eh; Sat, 29 Sep 2012 01:35:50 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8T5Zkxj030544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 29 Sep 2012 01:35:47 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q8T5Zho2012086; Sat, 29 Sep 2012 01:35:44 -0400
From: Amos Kong <akong@redhat.com>
To: stefanha@gmail.com, qemu-trivial@nongnu.org
Date: Sat, 29 Sep 2012 13:36:21 +0800
Message-Id: <1348896981-7558-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] cleanup useless return sentence
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
X-List-Received-Date: Sat, 29 Sep 2012 05:35:56 -0000

This patch cleans up return sentences in the end of void functions.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Amos Kong <akong@redhat.com>
---
 block/qed-table.c            |    1 -
 blockdev.c                   |    1 -
 hw/9pfs/virtio-9p.c          |    5 -----
 hw/blizzard.c                |    2 --
 hw/bt-hci.c                  |    1 -
 hw/device-hotplug.c          |    1 -
 hw/exynos4210_combiner.c     |    4 ----
 hw/exynos4210_gic.c          |    4 ----
 hw/exynos4210_mct.c          |    2 --
 hw/fdc.c                     |    2 --
 hw/framebuffer.c             |    1 -
 hw/ide/macio.c               |    1 -
 hw/ivshmem.c                 |    4 ----
 hw/megasas.c                 |    1 -
 hw/msix.c                    |    1 -
 hw/pflash_cfi01.c            |    1 -
 hw/pflash_cfi02.c            |    1 -
 hw/pxa2xx_keypad.c           |    1 -
 hw/sb16.c                    |    1 -
 hw/scsi-disk.c               |    2 --
 hw/tcx.c                     |    1 -
 hw/usb/dev-uas.c             |    2 --
 hw/usb/hcd-ohci.c            |    2 --
 hw/usb/hcd-xhci.c            |    1 -
 hw/xen_domainbuild.c         |    1 -
 libcacard/vcard.c            |    1 -
 libcacard/vcard_emul_nss.c   |    3 ---
 libcacard/vreader.c          |    1 -
 linux-user/signal.c          |    2 --
 os-posix.c                   |    1 -
 qemu-sockets.c               |    1 -
 qga/commands-posix.c         |    2 --
 qga/commands-win32.c         |    2 --
 savevm.c                     |    1 -
 slirp/ip_input.c             |    1 -
 slirp/tcp_input.c            |    2 --
 slirp/udp.c                  |    1 -
 target-unicore32/translate.c |    2 --
 ui/vnc-auth-sasl.c           |    1 -
 vl.c                         |    1 -
 xen-all.c                    |    1 -
 41 files changed, 0 insertions(+), 67 deletions(-)

diff --git a/block/qed-table.c b/block/qed-table.c
index ce07b05..de845ec 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -103,7 +103,6 @@ static void qed_write_table_cb(void *opaque, int ret)
 out:
     qemu_vfree(write_table_cb->table);
     gencb_complete(&write_table_cb->gencb, ret);
-    return;
 }
 
 /**
diff --git a/blockdev.c b/blockdev.c
index e5d450f..1dadd8a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -824,7 +824,6 @@ exit:
     QSIMPLEQ_FOREACH_SAFE(states, &snap_bdrv_states, entry, next) {
         g_free(states);
     }
-    return;
 }
 
 
diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index 4b52540..8b9cdc9 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -505,7 +505,6 @@ static void virtfs_reset(V9fsPDU *pdu)
         error_report("9pfs:%s: One or more uncluncked fids "
                      "found during reset", __func__);
     }
-    return;
 }
 
 #define P9_QID_TYPE_DIR         0x80
@@ -934,7 +933,6 @@ static void v9fs_version(void *opaque)
 out:
     complete_pdu(s, pdu, offset);
     v9fs_string_free(&version);
-    return;
 }
 
 static void v9fs_attach(void *opaque)
@@ -1314,7 +1312,6 @@ out_nofid:
         g_free(wnames);
         g_free(qids);
     }
-    return;
 }
 
 static int32_t get_iounit(V9fsPDU *pdu, V9fsPath *path)
@@ -2257,7 +2254,6 @@ static void v9fs_flush(void *opaque)
         free_pdu(pdu->s, cancel_pdu);
     }
     complete_pdu(s, pdu, 7);
-    return;
 }
 
 static void v9fs_link(void *opaque)
@@ -2763,7 +2759,6 @@ out:
     put_fid(pdu, fidp);
 out_nofid:
     complete_pdu(s, pdu, retval);
-    return;
 }
 
 static void v9fs_mknod(void *opaque)
diff --git a/hw/blizzard.c b/hw/blizzard.c
index d1c9d81..06e19b3 100644
--- a/hw/blizzard.c
+++ b/hw/blizzard.c
@@ -878,8 +878,6 @@ void s1d13745_write_block(void *opaque, int dc,
         len -= 2;
         buf += 2;
     }
-
-    return;
 }
 
 static void blizzard_update_display(void *opaque)
diff --git a/hw/bt-hci.c b/hw/bt-hci.c
index a3a7fb4..f19299a 100644
--- a/hw/bt-hci.c
+++ b/hw/bt-hci.c
@@ -786,7 +786,6 @@ static void bt_hci_lmp_connection_request(struct bt_link_s *link)
     memcpy(&params.dev_class, &link->host->class, sizeof(params.dev_class));
     params.link_type	= ACL_LINK;
     bt_hci_event(hci, EVT_CONN_REQUEST, &params, EVT_CONN_REQUEST_SIZE);
-    return;
 }
 
 static void bt_hci_conn_accept_timeout(void *opaque)
diff --git a/hw/device-hotplug.c b/hw/device-hotplug.c
index 2bdc615..eec0fe3 100644
--- a/hw/device-hotplug.c
+++ b/hw/device-hotplug.c
@@ -89,5 +89,4 @@ err:
     if (dinfo) {
         drive_put_ref(dinfo);
     }
-    return;
 }
diff --git a/hw/exynos4210_combiner.c b/hw/exynos4210_combiner.c
index 80af22c..60b33c7 100644
--- a/hw/exynos4210_combiner.c
+++ b/hw/exynos4210_combiner.c
@@ -347,8 +347,6 @@ static void exynos4210_combiner_write(void *opaque, target_phys_addr_t offset,
                 TARGET_FMT_plx "\n", offset);
         break;
     }
-
-    return;
 }
 
 /* Get combiner group and bit from irq number */
@@ -380,8 +378,6 @@ static void exynos4210_combiner_handler(void *opaque, int irq, int level)
     }
 
     exynos4210_combiner_update(s, group_n);
-
-    return;
 }
 
 static void exynos4210_combiner_reset(DeviceState *d)
diff --git a/hw/exynos4210_gic.c b/hw/exynos4210_gic.c
index 7d03dd9..4fea098 100644
--- a/hw/exynos4210_gic.c
+++ b/hw/exynos4210_gic.c
@@ -193,8 +193,6 @@ static void exynos4210_irq_handler(void *opaque, int irq, int level)
 
     /* Bypass */
     qemu_set_irq(s->board_irqs[irq], level);
-
-    return;
 }
 
 /*
@@ -410,8 +408,6 @@ static void exynos4210_irq_gate_handler(void *opaque, int irq, int level)
     }
 
     qemu_irq_lower(s->out);
-
-    return;
 }
 
 static void exynos4210_irq_gate_reset(DeviceState *d)
diff --git a/hw/exynos4210_mct.c b/hw/exynos4210_mct.c
index 7a22b1f..6f94ce2 100644
--- a/hw/exynos4210_mct.c
+++ b/hw/exynos4210_mct.c
@@ -574,8 +574,6 @@ static void exynos4210_gfrc_event(void *opaque)
     exynos4210_gfrc_set_count(&s->g_timer, distance);
 
     exynos4210_gfrc_start(&s->g_timer);
-
-    return;
 }
 
 /*
diff --git a/hw/fdc.c b/hw/fdc.c
index 08830c1..a052ccb 100644
--- a/hw/fdc.c
+++ b/hw/fdc.c
@@ -1286,8 +1286,6 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
         fdctrl->msr |= FD_MSR_DIO;
     /* IO based transfer: calculate len */
     fdctrl_raise_irq(fdctrl, FD_SR0_SEEK);
-
-    return;
 }
 
 /* Prepare a transfer of deleted data */
diff --git a/hw/framebuffer.c b/hw/framebuffer.c
index 85a00a5..27fa6f5 100644
--- a/hw/framebuffer.c
+++ b/hw/framebuffer.c
@@ -107,5 +107,4 @@ void framebuffer_update_display(
                               DIRTY_MEMORY_VGA);
     *first_row = first;
     *last_row = last;
-    return;
 }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 848cb31..f228725 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -89,7 +89,6 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
 done:
     bdrv_acct_done(s->bs, &s->acct);
     io->dma_end(opaque);
-    return;
 }
 
 static void pmac_ide_transfer_cb(void *opaque, int ret)
diff --git a/hw/ivshmem.c b/hw/ivshmem.c
index 59f1aa4..5c4ccb8 100644
--- a/hw/ivshmem.c
+++ b/hw/ivshmem.c
@@ -149,7 +149,6 @@ static void ivshmem_IntrStatus_write(IVShmemState *s, uint32_t val)
     s->intrstatus = val;
 
     ivshmem_update_irq(s, val);
-    return;
 }
 
 static uint32_t ivshmem_IntrStatus_read(IVShmemState *s)
@@ -510,8 +509,6 @@ static void ivshmem_read(void *opaque, const uint8_t * buf, int flags)
     if (ivshmem_has_feature(s, IVSHMEM_IOEVENTFD)) {
         ivshmem_add_eventfd(s, incoming_posn, guest_max_eventfd);
     }
-
-    return;
 }
 
 /* Select the MSI-X vectors used by device.
@@ -536,7 +533,6 @@ static void ivshmem_reset(DeviceState *d)
 
     s->intrstatus = 0;
     ivshmem_use_msix(s);
-    return;
 }
 
 static uint64_t ivshmem_get_size(IVShmemState * s) {
diff --git a/hw/megasas.c b/hw/megasas.c
index c728aea..0e57740 100644
--- a/hw/megasas.c
+++ b/hw/megasas.c
@@ -652,7 +652,6 @@ static void megasas_finish_dcmd(MegasasCmd *cmd, uint32_t iov_size)
         }
     }
     cmd->iov_size = 0;
-    return;
 }
 
 static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
diff --git a/hw/msix.c b/hw/msix.c
index d812094..b623cb5 100644
--- a/hw/msix.c
+++ b/hw/msix.c
@@ -366,7 +366,6 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
-    return;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index 855890d..3b437da 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -442,7 +442,6 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
     pfl->bypass = 0;
     pfl->wcycle = 0;
     pfl->cmd = 0;
-    return;
 }
 
 
diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 8cb1549..39337ec 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -474,7 +474,6 @@ static void pflash_write (pflash_t *pfl, target_phys_addr_t offset,
  do_bypass:
     pfl->wcycle = 2;
     pfl->cmd = 0;
-    return;
 }
 
 
diff --git a/hw/pxa2xx_keypad.c b/hw/pxa2xx_keypad.c
index 59db025..1a997c9 100644
--- a/hw/pxa2xx_keypad.c
+++ b/hw/pxa2xx_keypad.c
@@ -172,7 +172,6 @@ static void pxa27x_keyboard_event (PXA2xxKeyPadState *kp, int keycode)
         kp->kpc |= KPC_MI;
         qemu_irq_raise(kp->irq);
     }
-    return;
 }
 
 static uint64_t pxa2xx_keypad_read(void *opaque, target_phys_addr_t offset,
diff --git a/hw/sb16.c b/hw/sb16.c
index c81455d..523ab0d 100644
--- a/hw/sb16.c
+++ b/hw/sb16.c
@@ -822,7 +822,6 @@ static void complete (SB16State *s)
 
     ldebug ("\n");
     s->cmd = -1;
-    return;
 }
 
 static void legacy_reset (SB16State *s)
diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index 95e9158..d6ea883 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -1446,7 +1446,6 @@ invalid_param_len:
 
 invalid_field:
     scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
-    return;
 }
 
 static inline bool check_lba_range(SCSIDiskState *s,
@@ -1544,7 +1543,6 @@ static void scsi_disk_emulate_unmap(SCSIDiskReq *r, uint8_t *inbuf)
 
 invalid_param_len:
     scsi_check_condition(r, SENSE_CODE(INVALID_PARAM_LEN));
-    return;
 }
 
 static void scsi_disk_emulate_write_data(SCSIRequest *req)
diff --git a/hw/tcx.c b/hw/tcx.c
index 93994d6..2db2db1 100644
--- a/hw/tcx.c
+++ b/hw/tcx.c
@@ -472,7 +472,6 @@ static void tcx_dac_writel(void *opaque, target_phys_addr_t addr, uint64_t val,
     default:
         break;
     }
-    return;
 }
 
 static const MemoryRegionOps tcx_dac_ops = {
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 5a0057a..4389380 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -576,7 +576,6 @@ bad_target:
      */
     usb_uas_queue_response(uas, req->tag, UAS_RC_INVALID_INFO_UNIT, 0);
     g_free(req);
-    return;
 }
 
 static void usb_uas_task(UASDevice *uas, uas_ui *ui)
@@ -640,7 +639,6 @@ bad_target:
 
 incorrect_lun:
     usb_uas_queue_response(uas, tag, UAS_RC_INCORRECT_LUN, 0);
-    return;
 }
 
 static int usb_uas_handle_data(USBDevice *dev, USBPacket *p)
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index c36184a..59c7055 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1470,8 +1470,6 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
 
     if (old_state != port->ctrl)
         ohci_set_interrupt(ohci, OHCI_INTR_RHSC);
-
-    return;
 }
 
 static uint64_t ohci_mem_read(void *opaque,
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index e0ca690..f8c208a 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -805,7 +805,6 @@ static void xhci_events_update(XHCIState *xhci, int v)
         DPRINTF("xhci_events_update(): event ring no longer full\n");
         intr->er_full = 0;
     }
-    return;
 }
 
 static void xhci_event(XHCIState *xhci, XHCIEvent *event, int v)
diff --git a/hw/xen_domainbuild.c b/hw/xen_domainbuild.c
index a6a12e5..db14974 100644
--- a/hw/xen_domainbuild.c
+++ b/hw/xen_domainbuild.c
@@ -153,7 +153,6 @@ static void xen_domain_poll(void *opaque)
 
 quit:
     qemu_system_shutdown_request();
-    return;
 }
 
 static int xen_domain_watcher(void)
diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index b02556e..539177b 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -200,7 +200,6 @@ vcard_free(VCard *vcard)
     }
     vcard_buffer_response_delete(vcard->vcard_buffer_response);
     g_free(vcard);
-    return;
 }
 
 void
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 802cae3..b861c5a 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -168,7 +168,6 @@ vcard_emul_delete_key(VCardKey *key)
     if (key->slot) {
         PK11_FreeSlot(key->slot);
     }
-    return;
 }
 
 /*
@@ -418,7 +417,6 @@ vcard_emul_reset(VCard *card, VCardPower power)
     /* TODO: we may also need to send insertion/removal events? */
     slot = vcard_emul_card_get_slot(card);
     PK11_Logout(slot); /* NOTE: ignoring SECStatus return value */
-    return;
 }
 
 
@@ -535,7 +533,6 @@ vcard_emul_get_atr(VCard *card, unsigned char *atr, int *atr_len)
 
     memcpy(atr, nss_atr, len);
     *atr_len = len;
-    return;
 }
 
 /*
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index ec126df..96d2407 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -93,7 +93,6 @@ vreader_free(VReader *reader)
         reader->reader_private_free(reader->reader_private);
     }
     g_free(reader);
-    return;
 }
 
 static VCard *
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7869147..15bc4e8 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -2762,7 +2762,6 @@ static void setup_frame(int sig, struct target_sigaction * ka,
 give_sigsegv:
     unlock_user_struct(frame, frame_addr, 1);
     force_sig(TARGET_SIGSEGV/*, current*/);
-    return;
 }
 
 long do_sigreturn(CPUMIPSState *regs)
@@ -2871,7 +2870,6 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
 give_sigsegv:
     unlock_user_struct(frame, frame_addr, 1);
     force_sig(TARGET_SIGSEGV/*, current*/);
-    return;
 }
 
 long do_rt_sigreturn(CPUMIPSState *env)
diff --git a/os-posix.c b/os-posix.c
index eabccb8..178e7ca 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -194,7 +194,6 @@ void os_parse_cmd_args(int index, const char *optarg)
         break;
 #endif
     }
-    return;
 }
 
 static void change_process_uid(void)
diff --git a/qemu-sockets.c b/qemu-sockets.c
index 1f14e8b..ec5c266 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -266,7 +266,6 @@ static void wait_for_connect(void *opaque)
         s->callback(s->fd, s->opaque);
     }
     g_free(s);
-    return;
 }
 
 static int inet_connect_addr(struct addrinfo *addr, bool *in_progress,
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ce90421..b0eec74 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -988,8 +988,6 @@ int64_t qmp_guest_fsfreeze_thaw(Error **err)
 void qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
-
-    return;
 }
 #endif
 
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 54bc546..5bd8fb2 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -180,8 +180,6 @@ int64_t qmp_guest_fsfreeze_thaw(Error **err)
 void qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **err)
 {
     error_set(err, QERR_UNSUPPORTED);
-
-    return;
 }
 
 typedef enum {
diff --git a/savevm.c b/savevm.c
index c7fe283..31fd2e0 100644
--- a/savevm.c
+++ b/savevm.c
@@ -2201,7 +2201,6 @@ void qmp_xen_save_devices_state(const char *filename, Error **errp)
  the_end:
     if (saved_vm_running)
         vm_start();
-    return;
 }
 
 int load_vmstate(const char *name)
diff --git a/slirp/ip_input.c b/slirp/ip_input.c
index ce24faf..6f4cff8 100644
--- a/slirp/ip_input.c
+++ b/slirp/ip_input.c
@@ -213,7 +213,6 @@ ip_input(struct mbuf *m)
 	return;
 bad:
 	m_free(m);
-	return;
 }
 
 #define iptofrag(P) ((struct ipasfrag *)(((char*)(P)) - sizeof(struct qlink)))
diff --git a/slirp/tcp_input.c b/slirp/tcp_input.c
index 942aaf4..6440eae 100644
--- a/slirp/tcp_input.c
+++ b/slirp/tcp_input.c
@@ -1281,8 +1281,6 @@ drop:
 	 * Drop space held by incoming segment and return.
 	 */
 	m_free(m);
-
-	return;
 }
 
 static void
diff --git a/slirp/udp.c b/slirp/udp.c
index ced5096..9286cb7 100644
--- a/slirp/udp.c
+++ b/slirp/udp.c
@@ -231,7 +231,6 @@ udp_input(register struct mbuf *m, int iphlen)
 	return;
 bad:
 	m_free(m);
-	return;
 }
 
 int udp_output2(struct socket *so, struct mbuf *m,
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 36f4f2f..c3cdafa 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -1932,8 +1932,6 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
         }
         ILLEGAL;
     }
-
-    return;
 }
 
 /* generate intermediate code in gen_opc_buf and gen_opparam_buf for
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index 8fba770..9a0ad30 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -619,7 +619,6 @@ void start_auth_sasl(VncState *vs)
 
  authabort:
     vnc_client_error(vs);
-    return;
 }
 
 
diff --git a/vl.c b/vl.c
index 8d305ca..29e05a3 100644
--- a/vl.c
+++ b/vl.c
@@ -1023,7 +1023,6 @@ static void numa_add(const char *optarg)
         }
         nb_numa_nodes++;
     }
-    return;
 }
 
 static void smp_parse(const char *optarg)
diff --git a/xen-all.c b/xen-all.c
index f76b051..a7e118d 100644
--- a/xen-all.c
+++ b/xen-all.c
@@ -1076,7 +1076,6 @@ static void xen_read_physmap(XenIOState *state)
         QLIST_INSERT_HEAD(&state->physmap, physmap, list);
     }
     free(entries);
-    return;
 }
 
 int xen_hvm_init(void)
-- 
1.7.1


