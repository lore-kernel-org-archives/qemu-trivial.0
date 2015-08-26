Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYiE-0003FH-7y
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYiA-00038E-73
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYi8-00088Z-BR
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhy-00085u-Ki; Wed, 26 Aug 2015 07:17:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 377F7461C0;
	Wed, 26 Aug 2015 11:17:34 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODw028642; Wed, 26 Aug 2015 07:17:33 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:18 +0100
Message-Id: <1440587838-25595-8-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 7/7] maint: avoid useless "if (foo)
	free(foo)" pattern
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:48 -0000

The free() and g_free() functions both happily accept
NULL on any platform QEMU builds on. As such putting a
conditional 'if (foo)' check before calls to 'free(foo)'
merely serves to bloat the lines of code.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 backends/hostmem-file.c      |  4 +---
 bsd-user/elfload.c           |  4 +---
 disas/sparc.c                |  3 +--
 hw/bt/hci.c                  |  9 +++------
 hw/core/loader.c             |  3 +--
 hw/core/qdev-properties.c    |  4 +---
 hw/display/exynos4210_fimd.c |  4 +---
 hw/mips/mips_r4k.c           |  4 +---
 hw/net/fsl_etsec/rings.c     |  4 +---
 hw/net/rocker/rocker.c       |  4 +---
 hw/net/rocker/rocker_desc.c  |  8 ++------
 hw/nvram/fw_cfg.c            |  4 +---
 hw/pci-host/prep.c           |  4 +---
 hw/sd/sd.c                   |  3 +--
 hw/usb/hcd-xhci.c            |  4 +---
 hw/xen/xen_pt_config_init.c  |  4 +---
 migration/savevm.c           |  8 ++------
 qemu-char.c                  |  4 +---
 tests/bios-tables-test.c     | 36 +++++++++++++-----------------------
 ui/spice-display.c           | 14 ++++----------
 20 files changed, 39 insertions(+), 93 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 4b55361..e9b6d21 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -83,9 +83,7 @@ static void set_mem_path(Object *o, const char *str, Error **errp)
         error_setg(errp, "cannot change property value");
         return;
     }
-    if (fb->mem_path) {
-        g_free(fb->mem_path);
-    }
+    g_free(fb->mem_path);
     fb->mem_path = g_strdup(str);
 }
 
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 2bf57eb..a8ce43d 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1355,9 +1355,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
             }
         }
         if (!bprm->p) {
-            if (elf_interpreter) {
-                free(elf_interpreter);
-            }
+            free(elf_interpreter);
             free (elf_phdata);
             close(bprm->fd);
             return -E2BIG;
diff --git a/disas/sparc.c b/disas/sparc.c
index f4e3565..59a1e36 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2622,8 +2622,7 @@ build_hash_table (const sparc_opcode **opcode_table,
 
   memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
   memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
-  if (hash_buf != NULL)
-    free (hash_buf);
+  free(hash_buf);
   hash_buf = malloc (sizeof (* hash_buf) * num_opcodes);
   for (i = num_opcodes - 1; i >= 0; --i)
     {
diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 7ea3dc6..3fec435 100644
--- a/hw/bt/hci.c
+++ b/hw/bt/hci.c
@@ -1151,8 +1151,7 @@ static void bt_hci_reset(struct bt_hci_s *hci)
     hci->event_mask[7] = 0x00;
     hci->device.inquiry_scan = 0;
     hci->device.page_scan = 0;
-    if (hci->device.lmp_name)
-        g_free((void *) hci->device.lmp_name);
+    g_free((void *) hci->device.lmp_name);
     hci->device.lmp_name = NULL;
     hci->device.class[0] = 0x00;
     hci->device.class[1] = 0x00;
@@ -1829,8 +1828,7 @@ static void bt_submit_hci(struct HCIInfo *info,
     case cmd_opcode_pack(OGF_HOST_CTL, OCF_CHANGE_LOCAL_NAME):
         LENGTH_CHECK(change_local_name);
 
-        if (hci->device.lmp_name)
-            g_free((void *) hci->device.lmp_name);
+        g_free((void *) hci->device.lmp_name);
         hci->device.lmp_name = g_strndup(PARAM(change_local_name, name),
                         sizeof(PARAM(change_local_name, name)));
         bt_hci_event_complete_status(hci, HCI_SUCCESS);
@@ -2231,8 +2229,7 @@ static void bt_hci_done(struct HCIInfo *info)
 
     bt_device_done(&hci->device);
 
-    if (hci->device.lmp_name)
-        g_free((void *) hci->device.lmp_name);
+    g_free((void *) hci->device.lmp_name);
 
     /* Be gentle and send DISCONNECT to all connected peers and those
      * currently waiting for us to accept or reject a connection request.
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 216eeeb..a96a74e 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -594,8 +594,7 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
     ret = hdr->ih_size;
 
 out:
-    if (data)
-        g_free(data);
+    g_free(data);
     close(fd);
     return ret;
 }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 04fd80a..33e245e 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -422,9 +422,7 @@ static void set_string(Object *obj, Visitor *v, void *opaque,
         error_propagate(errp, local_err);
         return;
     }
-    if (*ptr) {
-        g_free(*ptr);
-    }
+    g_free(*ptr);
     *ptr = str;
 }
 
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 603ef50..45239e8 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1354,9 +1354,7 @@ static void exynos4210_fimd_reset(DeviceState *d)
         fimd_update_get_alpha(s, w);
     }
 
-    if (s->ifb != NULL) {
-        g_free(s->ifb);
-    }
+    g_free(s->ifb);
     s->ifb = NULL;
 
     exynos4210_fimd_invalidate(s);
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index f4dcacd..86b2c0b 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -252,9 +252,7 @@ void mips_r4k_init(MachineState *machine)
         fprintf(stderr, "qemu: Warning, could not load MIPS bios '%s'\n",
 		bios_name);
     }
-    if (filename) {
-        g_free(filename);
-    }
+    g_free(filename);
 
     if (kernel_filename) {
         loaderparams.ram_size = ram_size;
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 68e7b6d..0a5c6cf 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -464,9 +464,7 @@ static void rx_init_frame(eTSEC *etsec, const uint8_t *buf, size_t size)
         etsec->rx_fcb_size = 0;
     }
 
-    if (etsec->rx_buffer != NULL) {
-        g_free(etsec->rx_buffer);
-    }
+    g_free(etsec->rx_buffer);
 
     /* Do not copy the frame for now */
     etsec->rx_buffer     = (uint8_t *)buf;
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 47d080f..7e7bda4 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -265,9 +265,7 @@ err_bad_io:
 err_no_mem:
 err_bad_attr:
     for (i = 0; i < ROCKER_TX_FRAGS_MAX; i++) {
-        if (iov[i].iov_base) {
-            g_free(iov[i].iov_base);
-        }
+        g_free(iov[i].iov_base);
     }
 
     return err;
diff --git a/hw/net/rocker/rocker_desc.c b/hw/net/rocker/rocker_desc.c
index 9d896fe..b5c0b4a 100644
--- a/hw/net/rocker/rocker_desc.c
+++ b/hw/net/rocker/rocker_desc.c
@@ -136,9 +136,7 @@ bool desc_ring_set_size(DescRing *ring, uint32_t size)
     }
 
     for (i = 0; i < ring->size; i++) {
-        if (ring->info[i].buf) {
-            g_free(ring->info[i].buf);
-        }
+        g_free(ring->info[i].buf);
     }
 
     ring->size = size;
@@ -360,9 +358,7 @@ DescRing *desc_ring_alloc(Rocker *r, int index)
 
 void desc_ring_free(DescRing *ring)
 {
-    if (ring->info) {
-        g_free(ring->info);
-    }
+    g_free(ring->info);
     g_free(ring);
 }
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 88481b7..658f8c4 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -187,9 +187,7 @@ static void fw_cfg_bootsplash(FWCfgState *s)
             g_free(filename);
             return;
         }
-        if (boot_splash_filedata != NULL) {
-            g_free(boot_splash_filedata);
-        }
+        g_free(boot_splash_filedata);
         boot_splash_filedata = (uint8_t *)file_data;
         boot_splash_filedata_size = file_size;
 
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index c63f45d..988907b 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -328,9 +328,7 @@ static void raven_realize(PCIDevice *d, Error **errp)
         if (bios_size < 0 || bios_size > BIOS_SIZE) {
             hw_error("qemu: could not load bios image '%s'\n", s->bios_name);
         }
-        if (filename) {
-            g_free(filename);
-        }
+        g_free(filename);
     }
 }
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a1ff465..3e2a451 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -412,8 +412,7 @@ static void sd_reset(SDState *sd)
     sd_set_cardstatus(sd);
     sd_set_sdstatus(sd);
 
-    if (sd->wp_groups)
-        g_free(sd->wp_groups);
+    g_free(sd->wp_groups);
     sd->wp_switch = sd->blk ? blk_is_read_only(sd->blk) : false;
     sd->wpgrps_size = sect;
     sd->wp_groups = bitmap_new(sd->wpgrps_size);
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index c673bed..1c57e20 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -1453,9 +1453,7 @@ static int xhci_ep_nuke_one_xfer(XHCITransfer *t, TRBCCode report)
         t->running_retry = 0;
         killed = 1;
     }
-    if (t->trbs) {
-        g_free(t->trbs);
-    }
+    g_free(t->trbs);
 
     t->trbs = NULL;
     t->trb_count = t->trb_alloced = 0;
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index dd37be3..ca99783 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1918,9 +1918,7 @@ void xen_pt_config_delete(XenPCIPassthroughState *s)
     if (s->msix) {
         xen_pt_msix_delete(s);
     }
-    if (s->msi) {
-        g_free(s->msi);
-    }
+    g_free(s->msi);
 
     /* free all register group entry */
     QLIST_FOREACH_SAFE(reg_group, &s->reg_grps, entries, next_grp) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 6071215..33e55fe 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -551,9 +551,7 @@ void unregister_savevm(DeviceState *dev, const char *idstr, void *opaque)
     QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
         if (strcmp(se->idstr, id) == 0 && se->opaque == opaque) {
             QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
-            if (se->compat) {
-                g_free(se->compat);
-            }
+            g_free(se->compat);
             g_free(se->ops);
             g_free(se);
         }
@@ -612,9 +610,7 @@ void vmstate_unregister(DeviceState *dev, const VMStateDescription *vmsd,
     QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
         if (se->vmsd == vmsd && se->opaque == opaque) {
             QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
-            if (se->compat) {
-                g_free(se->compat);
-            }
+            g_free(se->compat);
             g_free(se);
         }
     }
diff --git a/qemu-char.c b/qemu-char.c
index fa65159..dd83203 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2710,9 +2710,7 @@ static int tcp_set_msgfds(CharDriverState *chr, int *fds, int num)
     TCPCharDriver *s = chr->opaque;
 
     /* clear old pending fd array */
-    if (s->write_msgfds) {
-        g_free(s->write_msgfds);
-    }
+    g_free(s->write_msgfds);
 
     if (num) {
         s->write_msgfds = g_malloc(num * sizeof(int));
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 613867a..d21f519 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -161,31 +161,23 @@ static void free_test_data(test_data *data)
     AcpiSdtTable *temp;
     int i;
 
-    if (data->rsdt_tables_addr) {
-        g_free(data->rsdt_tables_addr);
-    }
+    g_free(data->rsdt_tables_addr);
 
     for (i = 0; i < data->tables->len; ++i) {
         temp = &g_array_index(data->tables, AcpiSdtTable, i);
-        if (temp->aml) {
-            g_free(temp->aml);
-        }
-        if (temp->aml_file) {
-            if (!temp->tmp_files_retain &&
-                g_strstr_len(temp->aml_file, -1, "aml-")) {
-                unlink(temp->aml_file);
-            }
-            g_free(temp->aml_file);
+        g_free(temp->aml);
+        if (temp->aml_file &&
+            !temp->tmp_files_retain &&
+            g_strstr_len(temp->aml_file, -1, "aml-")) {
+            unlink(temp->aml_file);
         }
-        if (temp->asl) {
-            g_free(temp->asl);
-        }
-        if (temp->asl_file) {
-            if (!temp->tmp_files_retain) {
-                unlink(temp->asl_file);
-            }
-            g_free(temp->asl_file);
+        g_free(temp->aml_file);
+        g_free(temp->asl);
+        if (temp->asl_file &&
+            !temp->tmp_files_retain) {
+            unlink(temp->asl_file);
         }
+        g_free(temp->asl_file);
     }
 
     g_array_free(data->tables, false);
@@ -420,9 +412,7 @@ static void dump_aml_files(test_data *data, bool rebuild)
 
         close(fd);
 
-        if (aml_file) {
-            g_free(aml_file);
-        }
+        g_free(aml_file);
     }
 }
 
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0360abf..77c8cba 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -737,9 +737,7 @@ static void display_mouse_set(DisplayChangeListener *dcl,
     qemu_mutex_lock(&ssd->lock);
     ssd->ptr_x = x;
     ssd->ptr_y = y;
-    if (ssd->ptr_move) {
-        g_free(ssd->ptr_move);
-    }
+    g_free(ssd->ptr_move);
     ssd->ptr_move = qemu_spice_create_cursor_update(ssd, NULL, on);
     qemu_mutex_unlock(&ssd->lock);
 }
@@ -752,13 +750,9 @@ static void display_mouse_define(DisplayChangeListener *dcl,
     qemu_mutex_lock(&ssd->lock);
     ssd->hot_x = c->hot_x;
     ssd->hot_y = c->hot_y;
-    if (ssd->ptr_move) {
-        g_free(ssd->ptr_move);
-        ssd->ptr_move = NULL;
-    }
-    if (ssd->ptr_define) {
-        g_free(ssd->ptr_define);
-    }
+    g_free(ssd->ptr_move);
+    ssd->ptr_move = NULL;
+    g_free(ssd->ptr_define);
     ssd->ptr_define = qemu_spice_create_cursor_update(ssd, c, 0);
     qemu_mutex_unlock(&ssd->lock);
 }
-- 
2.4.3


