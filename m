Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2OIU-00063x-8c
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2013 12:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OIP-0005rc-1e
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 12:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OIN-0002HK-B8
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 12:21:40 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47099
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OIG-0002FU-6Y; Thu, 25 Jul 2013 12:21:32 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0E8DC183DE7; Thu, 25 Jul 2013 18:21:29 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu, 25 Jul 2013 18:21:28 +0200
Message-Id: <1374769288-19745-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] misc: Use g_assert_not_reached for code
	which is expected to be unreachable
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
X-List-Received-Date: Thu, 25 Jul 2013 16:21:43 -0000

The macro g_assert_not_reached is a better self documenting replacement
for assert(0) or assert(false).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

The patch replaces [g_]assert(0), [g_]assert(false) by
g_assert_not_reached().

It did not remove some code like assignments, break or return
statements after the g_assert_not_reached statement.

Up to now, my compilers did not complain, but this might need
an additional fix in the future.

Stefan


 blockdev.c                         |    2 +-
 hw/net/vmxnet3.c                   |   16 ++++++++--------
 hw/net/vmxnet_tx_pkt.c             |    2 +-
 hw/usb/hcd-ehci.c                  |    8 ++++----
 net/eth.c                          |    2 +-
 qdev-monitor.c                     |    4 ++--
 target-arm/helper.c                |    2 +-
 tests/test-qmp-input-visitor.c     |    2 +-
 tests/test-qmp-output-visitor.c    |    4 ++--
 tests/test-visitor-serialization.c |    8 ++++----
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index c5abd65..cf8353d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -971,7 +971,7 @@ static void abort_prepare(BlkTransactionState *common, Error **errp)
 
 static void abort_commit(BlkTransactionState *common)
 {
-    assert(false); /* this action never succeeds */
+    g_assert_not_reached(); /* this action never succeeds */
 }
 
 static const BdrvActionOps actions[] = {
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index b39ff08..0f3c58c 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -528,7 +528,7 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
         break;
 
     default:
-        assert(false);
+        g_assert_not_reached();
         return false;
     }
 
@@ -575,7 +575,7 @@ vmxnet3_on_tx_done_update_stats(VMXNET3State *s, int qidx,
             stats->ucastBytesTxOK += tot_len;
             break;
         default:
-            assert(false);
+            g_assert_not_reached();
         }
 
         if (s->offload_mode == VMXNET3_OM_TSO) {
@@ -599,7 +599,7 @@ vmxnet3_on_tx_done_update_stats(VMXNET3State *s, int qidx,
         break;
 
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 }
 
@@ -634,7 +634,7 @@ vmxnet3_on_rx_done_update_stats(VMXNET3State *s,
             stats->ucastBytesRxOK += tot_len;
             break;
         default:
-            assert(false);
+            g_assert_not_reached();
         }
 
         if (tot_len > s->mtu) {
@@ -643,7 +643,7 @@ vmxnet3_on_rx_done_update_stats(VMXNET3State *s,
         }
         break;
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 }
 
@@ -1106,7 +1106,7 @@ vmxnet3_io_bar0_read(void *opaque, hwaddr addr, unsigned size)
 {
     if (VMW_IS_MULTIREG_ADDR(addr, VMXNET3_REG_IMR,
                         VMXNET3_MAX_INTRS, VMXNET3_REG_ALIGN)) {
-        assert(false);
+        g_assert_not_reached();
     }
 
     VMW_CBPRN("BAR0 unknown read [%" PRIx64 "], size %d", addr, size);
@@ -1651,7 +1651,7 @@ vmxnet3_io_bar1_write(void *opaque,
     case VMXNET3_REG_ICR:
         VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
                   val, size);
-        assert(false);
+        g_assert_not_reached();
         break;
 
     /* Event Cause Register */
@@ -1801,7 +1801,7 @@ vmxnet3_rx_filter_may_indicate(VMXNET3State *s, const void *data,
         break;
 
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     return true;
diff --git a/hw/net/vmxnet_tx_pkt.c b/hw/net/vmxnet_tx_pkt.c
index fc01e4d..f7344c4 100644
--- a/hw/net/vmxnet_tx_pkt.c
+++ b/hw/net/vmxnet_tx_pkt.c
@@ -287,7 +287,7 @@ void vmxnet_tx_pkt_build_vheader(struct VmxnetTxPkt *pkt, bool tso_enable,
         break;
 
     default:
-        assert(false);
+        g_assert_not_reached();
     }
 
     if (csum_enable) {
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 67e4b24..010a0d0 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1357,7 +1357,7 @@ static void ehci_execute_complete(EHCIQueue *q)
     default:
         /* should not be triggerable */
         fprintf(stderr, "USB invalid response %d\n", p->packet.status);
-        assert(0);
+        g_assert_not_reached();
         break;
     }
 
@@ -2142,7 +2142,7 @@ static void ehci_advance_state(EHCIState *ehci, int async)
         default:
             fprintf(stderr, "Bad state!\n");
             again = -1;
-            assert(0);
+            g_assert_not_reached();
             break;
         }
 
@@ -2206,7 +2206,7 @@ static void ehci_advance_async_state(EHCIState *ehci)
         /* this should only be due to a developer mistake */
         fprintf(stderr, "ehci: Bad asynchronous state %d. "
                 "Resetting to active\n", ehci->astate);
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -2256,7 +2256,7 @@ static void ehci_advance_periodic_state(EHCIState *ehci)
         /* this should only be due to a developer mistake */
         fprintf(stderr, "ehci: Bad periodic state %d. "
                 "Resetting to active\n", ehci->pstate);
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
diff --git a/net/eth.c b/net/eth.c
index 1d7494d..7c61132 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -73,7 +73,7 @@ eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto)
     }
 
     /* Unsupported offload */
-    assert(false);
+    g_assert_not_reached();
 
     return VIRTIO_NET_HDR_GSO_NONE | ecn_state;
 }
diff --git a/qdev-monitor.c b/qdev-monitor.c
index e54dbc2..e5adf6c 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -360,7 +360,7 @@ static BusState *qbus_find(const char *path)
 
         /* find device */
         if (sscanf(path+pos, "%127[^/]%n", elem, &len) != 1) {
-            assert(0);
+            g_assert_not_reached();
             elem[0] = len = 0;
         }
         pos += len;
@@ -397,7 +397,7 @@ static BusState *qbus_find(const char *path)
 
         /* find bus */
         if (sscanf(path+pos, "%127[^/]%n", elem, &len) != 1) {
-            assert(0);
+            g_assert_not_reached();
             elem[0] = len = 0;
         }
         pos += len;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index b0c3ca1..4968391 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1653,7 +1653,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                 "was %s, now %s\n", r2->cp, 32 + 32 * is64,
                                 r2->crn, r2->crm, r2->opc1, r2->opc2,
                                 oldreg->name, r2->name);
-                        assert(0);
+                        g_assert_not_reached();
                     }
                 }
                 g_hash_table_insert(cpu->cp_regs, key, r2);
diff --git a/tests/test-qmp-input-visitor.c b/tests/test-qmp-input-visitor.c
index 2741eef..0beb8fb 100644
--- a/tests/test-qmp-input-visitor.c
+++ b/tests/test-qmp-input-visitor.c
@@ -394,7 +394,7 @@ static void test_native_list_integer_helper(TestInputVisitorData *data,
         break;
     }
     default:
-        g_assert(false);
+        g_assert_not_reached();
     }
 
     g_string_free(gstr_union, true);
diff --git a/tests/test-qmp-output-visitor.c b/tests/test-qmp-output-visitor.c
index b2fa9a7..e073d83 100644
--- a/tests/test-qmp-output-visitor.c
+++ b/tests/test-qmp-output-visitor.c
@@ -559,7 +559,7 @@ static void init_native_list(UserDefNativeListUnion *cvalue)
         break;
     }
     default:
-        g_assert(false);
+        g_assert_not_reached();
     }
 }
 
@@ -645,7 +645,7 @@ static void check_native_list(QObject *qobj,
         }
         break;
     default:
-        g_assert(false);
+        g_assert_not_reached();
     }
     QDECREF(qlist);
 }
diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index ee7916b..9aaa587 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -136,7 +136,7 @@ static void visit_primitive_type(Visitor *v, void **native, Error **errp)
         visit_type_int64(v, &pt->value.s64, NULL, errp);
         break;
     case PTYPE_EOL:
-        g_assert(false);
+        g_assert_not_reached();
     }
 }
 
@@ -181,7 +181,7 @@ static void visit_primitive_list(Visitor *v, void **native, Error **errp)
         visit_type_uint64List(v, &pl->value.u64_integers, NULL, errp);
         break;
     default:
-        g_assert(false);
+        g_assert_not_reached();
     }
 }
 
@@ -500,7 +500,7 @@ static void test_primitive_lists(gconstpointer opaque)
             break;
         }
         default:
-            g_assert(0);
+            g_assert_not_reached();
         }
     }
 
@@ -656,7 +656,7 @@ static void test_primitive_lists(gconstpointer opaque)
             break;
         }
         default:
-            g_assert(0);
+            g_assert_not_reached();
         }
         i++;
     } while (cur_head);
-- 
1.7.10.4


