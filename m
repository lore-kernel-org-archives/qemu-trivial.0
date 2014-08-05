Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEkUG-0006wm-1Q
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 15:33:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEfL7-0000h9-FY
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 10:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEfL2-0005Yk-I4
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 10:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XEfKp-0005VZ-A4; Tue, 05 Aug 2014 10:03:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s75E2cug015600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 5 Aug 2014 10:02:38 -0400
Received: from redhat.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s75E2Vvf025582; Tue, 5 Aug 2014 10:02:31 -0400
Date: Tue, 5 Aug 2014 16:02:56 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20140805140256.GA16091@redhat.com>
References: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 05 Aug 2014 15:33:28 -0400
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, stefanha@redhat.com,
	marcel.a@redhat.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, qemu-devel@nongnu.org, armbru@redhat.com,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	imammedo@redhat.com, dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com,
	eblake@redhat.com, afaerber@suse.de, dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 for-2.2 0/8] don't use Yoda conditions
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
X-List-Received-Date: Tue, 05 Aug 2014 14:03:52 -0000

On Fri, Aug 01, 2014 at 03:46:08PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> $WHATEVER: don't use 'Yoda conditions'
> 
> 'Yoda conditions' are not part of idiomatic QEMU coding
> style, so rewrite them in the more usual order.


OK but why stop at these files? How about this
instead?

--->

style: fix up Yoda coding style

Find and fix up all Yoda conditions in code.
Generated using the following semantic patch:

@ disable commneq @
expression E;
constant C;
@@
- C != E
+ E != C
@ disable commeq @
expression E;
constant C;
@@
- C == E
+ E == C
@ disable commeq @
expression E;
constant C;
@@
- C == E
+ E == C
@ disable gtr_lss @
expression E;
constant C;
@@
- C > E
+ E < C
@ disable gtr_lss_eq @
expression E;
constant C;
@@
- C >= E
+ E <= C

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

 audio/ossaudio.c                     |    2 +-
 block/raw-posix.c                    |    4 ++--
 hw/audio/gus.c                       |    2 +-
 hw/audio/hda-codec.c                 |    2 +-
 hw/audio/sb16.c                      |   10 +++++-----
 hw/block/m25p80.c                    |    2 +-
 hw/bt/sdp.c                          |    4 ++--
 hw/dma/i8257.c                       |   12 ++++++------
 hw/dma/pl330.c                       |    2 +-
 hw/isa/isa-bus.c                     |    2 +-
 hw/net/vmxnet3.c                     |   22 +++++++++++-----------
 hw/net/vmxnet_tx_pkt.c               |    6 +++---
 hw/ssi/xilinx_spips.c                |    2 +-
 hw/timer/a9gtimer.c                  |    2 +-
 hw/usb/bus.c                         |    2 +-
 hw/usb/ccid-card-passthru.c          |    2 +-
 hw/usb/dev-audio.c                   |    2 +-
 hw/usb/dev-mtp.c                     |    4 ++--
 hw/usb/hcd-ehci.c                    |    2 +-
 hw/xen/xen_backend.c                 |    4 ++--
 hw/xenpv/xen_machine_pv.c            |    2 +-
 linux-user/arm/nwfpe/double_cpdo.c   |    2 +-
 linux-user/arm/nwfpe/extended_cpdo.c |    2 +-
 linux-user/arm/nwfpe/fpa11_cpdo.c    |    2 +-
 linux-user/arm/nwfpe/single_cpdo.c   |    2 +-
 linux-user/flatload.c                |    6 +++---
 qdev-monitor.c                       |    2 +-
 qemu-char.c                          |    2 +-
 slirp/slirp.c                        |    2 +-
 trace/control.c                      |    4 ++--
 ui/spice-core.c                      |    4 ++--
 util/qemu-sockets.c                  |   14 +++++++-------
 32 files changed, 67 insertions(+), 67 deletions(-)

diff -u -p a/trace/control.c b/trace/control.c
--- a/trace/control.c
+++ b/trace/control.c
@@ -121,10 +121,10 @@ static void trace_init_events(const char
         size_t len = strlen(line_buf);
         if (len > 1) {              /* skip empty lines */
             line_buf[len - 1] = '\0';
-            if ('#' == line_buf[0]) { /* skip commented lines */
+            if (line_buf[0] == '#') { /* skip commented lines */
                 continue;
             }
-            const bool enable = ('-' != line_buf[0]);
+            const bool enable = (line_buf[0] != '-');
             char *line_ptr = enable ? line_buf : line_buf + 1;
             if (trace_event_is_pattern(line_ptr)) {
                 TraceEvent *ev = NULL;
diff -u -p a/util/qemu-sockets.c b/util/qemu-sockets.c
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -437,7 +437,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
     if (qemu_opt_get_bool(opts, "ipv6", 0))
         ai.ai_family = PF_INET6;
 
-    if (0 != (rc = getaddrinfo(addr, port, &ai, &peer))) {
+    if ((rc = getaddrinfo(addr, port, &ai, &peer)) != 0) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
 	return -1;
@@ -457,7 +457,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
     if (!port || strlen(port) == 0)
         port = "0";
 
-    if (0 != (rc = getaddrinfo(addr, port, &ai, &local))) {
+    if ((rc = getaddrinfo(addr, port, &ai, &local)) != 0) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
         goto err;
@@ -488,7 +488,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
     return sock;
 
 err:
-    if (-1 != sock)
+    if (sock != -1)
         closesocket(sock);
     if (local)
         freeaddrinfo(local);
@@ -513,20 +513,20 @@ InetSocketAddress *inet_parse(const char
     if (str[0] == ':') {
         /* no host given */
         host[0] = '\0';
-        if (1 != sscanf(str, ":%32[^,]%n", port, &pos)) {
+        if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
             error_setg(errp, "error parsing port in address '%s'", str);
             goto fail;
         }
     } else if (str[0] == '[') {
         /* IPv6 addr */
-        if (2 != sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos)) {
+        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing IPv6 address '%s'", str);
             goto fail;
         }
         addr->ipv6 = addr->has_ipv6 = true;
     } else {
         /* hostname or IPv4 addr */
-        if (2 != sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos)) {
+        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing address '%s'", str);
             goto fail;
         }
@@ -732,7 +732,7 @@ int unix_connect_opts(QemuOpts *opts, Er
     ConnectState *connect_state = NULL;
     int sock, rc;
 
-    if (NULL == path) {
+    if (path == NULL) {
         error_setg(errp, "unix connect: no path specified");
         return -1;
     }
diff -u -p a/hw/dma/i8257.c b/hw/dma/i8257.c
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -88,7 +88,7 @@ static void write_page (void *opaque, ui
     int ichan;
 
     ichan = channels[nport & 7];
-    if (-1 == ichan) {
+    if (ichan == -1) {
         dolog ("invalid channel %#x %#x\n", nport, data);
         return;
     }
@@ -101,7 +101,7 @@ static void write_pageh (void *opaque, u
     int ichan;
 
     ichan = channels[nport & 7];
-    if (-1 == ichan) {
+    if (ichan == -1) {
         dolog ("invalid channel %#x %#x\n", nport, data);
         return;
     }
@@ -114,7 +114,7 @@ static uint32_t read_page (void *opaque,
     int ichan;
 
     ichan = channels[nport & 7];
-    if (-1 == ichan) {
+    if (ichan == -1) {
         dolog ("invalid channel read %#x\n", nport);
         return 0;
     }
@@ -127,7 +127,7 @@ static uint32_t read_pageh (void *opaque
     int ichan;
 
     ichan = channels[nport & 7];
-    if (-1 == ichan) {
+    if (ichan == -1) {
         dolog ("invalid channel read %#x\n", nport);
         return 0;
     }
@@ -275,7 +275,7 @@ static void write_cont(void *opaque, hwa
     }
 
 #ifdef DEBUG_DMA
-    if (0xc != iport) {
+    if (iport != 0xc) {
         linfo ("write_cont: nport %#06x, ichan % 2d, val %#06x\n",
                nport, ichan, data);
     }
@@ -380,7 +380,7 @@ static void DMA_run (void)
 
             mask = 1 << ichan;
 
-            if ((0 == (d->mask & mask)) && (0 != (d->status & (mask << 4)))) {
+            if (((d->mask & mask) == 0) && ((d->status & (mask << 4)) != 0)) {
                 channel_run (icont, ichan);
                 rearm = 1;
             }
diff -u -p a/hw/dma/pl330.c b/hw/dma/pl330.c
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -23,7 +23,7 @@
 #endif
 
 #define DB_PRINT_L(lvl, fmt, args...) do {\
-    if (PL330_ERR_DEBUG >= lvl) {\
+    if (lvl <= PL330_ERR_DEBUG) {\
         fprintf(stderr, "PL330: %s:" fmt, __func__, ## args);\
     } \
 } while (0);
diff -u -p a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -81,7 +81,7 @@ static void xen_init_pv(MachineState *ma
 
     /* configure nics */
     for (i = 0; i < nb_nics; i++) {
-        if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
+        if (!nd_table[i].model || strcmp(nd_table[i].model, "xen") != 0)
             continue;
         xen_config_dev_nic(nd_table + i);
     }
diff -u -p a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
--- a/hw/xen/xen_backend.c
+++ b/hw/xen/xen_backend.c
@@ -104,7 +104,7 @@ int xenstore_read_int(const char *base,
     int rc = -1;
 
     val = xenstore_read_str(base, node);
-    if (val && 1 == sscanf(val, "%d", ival)) {
+    if (val && sscanf(val, "%d", ival) == 1) {
         rc = 0;
     }
     g_free(val);
@@ -117,7 +117,7 @@ int xenstore_read_uint64(const char *bas
     int rc = -1;
 
     val = xenstore_read_str(base, node);
-    if (val && 1 == sscanf(val, "%"SCNu64, uval)) {
+    if (val && sscanf(val, "%"SCNu64, uval) == 1) {
         rc = 0;
     }
     g_free(val);
diff -u -p a/hw/block/m25p80.c b/hw/block/m25p80.c
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -30,7 +30,7 @@
 #endif
 
 #define DB_PRINT_L(level, ...) do { \
-    if (M25P80_ERR_DEBUG > (level)) { \
+    if ((level) < M25P80_ERR_DEBUG) { \
         fprintf(stderr,  ": %s: ", __func__); \
         fprintf(stderr, ## __VA_ARGS__); \
     } \
diff -u -p a/hw/bt/sdp.c b/hw/bt/sdp.c
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -309,7 +309,7 @@ static ssize_t sdp_attr_get(struct bt_l2
             }
             len += record->attribute_list[i].len;
         }
-    if (0 >= start) {
+    if (start <= 0) {
        lst[0] = SDP_DTYPE_SEQ | SDP_DSIZE_NEXT2;
        lst[1] = (len + start - 3) >> 8;
        lst[2] = (len + start - 3) & 0xff;
@@ -463,7 +463,7 @@ static ssize_t sdp_svc_search_attr_get(s
         }
     if (len == 3 - start)
         len -= 3;
-    else if (0 >= start) {
+    else if (start <= 0) {
        lst[0] = SDP_DTYPE_SEQ | SDP_DSIZE_NEXT2;
        lst[1] = (len + start - 3) >> 8;
        lst[2] = (len + start - 3) & 0xff;
diff -u -p a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -30,7 +30,7 @@
 #endif
 
 #define DB_PRINT_L(level, ...) do { \
-    if (A9_GTIMER_ERR_DEBUG > (level)) { \
+    if ((level) < A9_GTIMER_ERR_DEBUG) { \
         fprintf(stderr,  ": %s: ", __func__); \
         fprintf(stderr, ## __VA_ARGS__); \
     } \
diff -u -p a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -35,7 +35,7 @@
 #endif
 
 #define DB_PRINT_L(level, ...) do { \
-    if (XILINX_SPIPS_ERR_DEBUG > (level)) { \
+    if ((level) < XILINX_SPIPS_ERR_DEBUG) { \
         fprintf(stderr,  ": %s: ", __func__); \
         fprintf(stderr, ## __VA_ARGS__); \
     } \
diff -u -p a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1009,7 +1009,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
 
         vmxnet3_dump_rx_descr(&rxd);
 
-        if (0 != ready_rxcd_pa) {
+        if (ready_rxcd_pa != 0) {
             cpu_physical_memory_write(ready_rxcd_pa, &rxcd, sizeof(rxcd));
         }
 
@@ -1020,7 +1020,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
         rxcd.gen = new_rxcd_gen;
         rxcd.rqID = RXQ_IDX + rx_ridx * s->rxq_num;
 
-        if (0 == bytes_left) {
+        if (bytes_left == 0) {
             vmxnet3_rx_update_descr(s->rx_pkt, &rxcd);
         }
 
@@ -1038,16 +1038,16 @@ vmxnet3_indicate_packet(VMXNET3State *s)
         num_frags++;
     }
 
-    if (0 != ready_rxcd_pa) {
+    if (ready_rxcd_pa != 0) {
         rxcd.eop = 1;
-        rxcd.err = (0 != bytes_left);
+        rxcd.err = (bytes_left != 0);
         cpu_physical_memory_write(ready_rxcd_pa, &rxcd, sizeof(rxcd));
 
         /* Flush RX descriptor changes */
         smp_wmb();
     }
 
-    if (0 != new_rxcd_pa) {
+    if (new_rxcd_pa != 0) {
         vmxnet3_revert_rxc_descr(s, RXQ_IDX);
     }
 
@@ -1190,8 +1190,8 @@ static void vmxnet3_update_mcast_filters
     s->mcast_list_len = list_bytes / sizeof(s->mcast_list[0]);
 
     s->mcast_list = g_realloc(s->mcast_list, list_bytes);
-    if (NULL == s->mcast_list) {
-        if (0 == s->mcast_list_len) {
+    if (s->mcast_list == NULL) {
+        if (s->mcast_list_len == 0) {
             VMW_CFPRN("Current multicast list is empty");
         } else {
             VMW_ERPRN("Failed to allocate multicast list of %d elements",
@@ -1667,7 +1667,7 @@ vmxnet3_io_bar1_write(void *opaque,
          * memory address. We save it to temp variable and set the
          * shared address only after we get the high part
          */
-        if (0 == val) {
+        if (val == 0) {
             s->device_active = false;
         }
         s->temp_shared_guest_driver_memory = val;
@@ -2009,7 +2009,7 @@ vmxnet3_use_msix_vectors(VMXNET3State *s
     int i;
     for (i = 0; i < num_vectors; i++) {
         int res = msix_vector_use(d, i);
-        if (0 > res) {
+        if (res < 0) {
             VMW_WRPRN("Failed to use MSI-X vector %d, error %d", i, res);
             vmxnet3_unuse_msix_vectors(s, i);
             return false;
@@ -2029,7 +2029,7 @@ vmxnet3_init_msix(VMXNET3State *s)
                         VMXNET3_MSIX_BAR_IDX, VMXNET3_OFF_MSIX_PBA,
                         0);
 
-    if (0 > res) {
+    if (res < 0) {
         VMW_WRPRN("Failed to initialize MSI-X, error %d", res);
         s->msix_used = false;
     } else {
@@ -2067,7 +2067,7 @@ vmxnet3_init_msi(VMXNET3State *s)
 
     res = msi_init(d, VMXNET3_MSI_OFFSET, VMXNET3_MAX_NMSIX_INTRS,
                    VMXNET3_USE_64BIT, VMXNET3_PER_VECTOR_MASK);
-    if (0 > res) {
+    if (res < 0) {
         VMW_WRPRN("Failed to initialize MSI, error %d", res);
         s->msi_used = false;
     } else {
diff -u -p a/hw/net/vmxnet_tx_pkt.c b/hw/net/vmxnet_tx_pkt.c
--- a/hw/net/vmxnet_tx_pkt.c
+++ b/hw/net/vmxnet_tx_pkt.c
@@ -94,8 +94,8 @@ void vmxnet_tx_pkt_update_ip_checksums(s
     uint8_t gso_type = pkt->virt_hdr.gso_type & ~VIRTIO_NET_HDR_GSO_ECN;
     struct ip_header *ip_hdr;
 
-    if (VIRTIO_NET_HDR_GSO_TCPV4 != gso_type &&
-        VIRTIO_NET_HDR_GSO_UDP != gso_type) {
+    if (gso_type != VIRTIO_NET_HDR_GSO_TCPV4 &&
+        gso_type != VIRTIO_NET_HDR_GSO_UDP) {
         return;
     }
 
@@ -548,7 +548,7 @@ bool vmxnet_tx_pkt_send(struct VmxnetTxP
      * Since underlying infrastructure does not support IP datagrams longer
      * than 64K we should drop such packets and don't even try to send
      */
-    if (VIRTIO_NET_HDR_GSO_NONE != pkt->virt_hdr.gso_type) {
+    if (pkt->virt_hdr.gso_type != VIRTIO_NET_HDR_GSO_NONE) {
         if (pkt->payload_len >
             ETH_MAX_IP_DGRAM_LEN -
             pkt->vec[VMXNET_TX_PKT_L3HDR_FRAG].iov_len) {
diff -u -p a/hw/audio/gus.c b/hw/audio/gus.c
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -212,7 +212,7 @@ static int GUS_read_DMA (void *opaque, i
         pos += copied;
     }
 
-    if (0 == ((mode >> 4) & 1)) {
+    if (((mode >> 4) & 1) == 0) {
         DMA_release_DREQ (s->emu.gusdma);
     }
     return dma_len;
diff -u -p a/hw/audio/sb16.c b/hw/audio/sb16.c
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -226,7 +226,7 @@ static void dma_cmd8 (SB16State *s, int
     s->fmt_bits = 8;
     s->fmt_signed = 0;
     s->fmt_stereo = (s->mixer_regs[0x0e] & 2) != 0;
-    if (-1 == s->time_const) {
+    if (s->time_const == -1) {
         if (s->freq <= 0)
             s->freq = 11025;
     }
@@ -288,7 +288,7 @@ static void dma_cmd (SB16State *s, uint8
         break;
     }
 
-    if (-1 != s->time_const) {
+    if (s->time_const != -1) {
 #if 1
         int tmp = 256 - s->time_const;
         s->freq = (1000000 + (tmp / 2)) / tmp;
@@ -314,7 +314,7 @@ static void dma_cmd (SB16State *s, uint8
             s->freq, s->fmt_stereo, s->fmt_signed, s->fmt_bits,
             s->block_size, s->dma_auto, s->fifo, s->highspeed);
 
-    if (16 == s->fmt_bits) {
+    if (s->fmt_bits == 16) {
         if (s->fmt_signed) {
             s->fmt = AUD_FMT_S16;
         }
@@ -1212,7 +1212,7 @@ static int SB_read_DMA (void *opaque, in
 #endif
 
     if (till <= copy) {
-        if (0 == s->dma_auto) {
+        if (s->dma_auto == 0) {
             copy = till;
         }
     }
@@ -1224,7 +1224,7 @@ static int SB_read_DMA (void *opaque, in
     if (s->left_till_irq <= 0) {
         s->mixer_regs[0x82] |= (nchan & 4) ? 2 : 1;
         qemu_irq_raise (s->pic);
-        if (0 == s->dma_auto) {
+        if (s->dma_auto == 0) {
             control (s, 0);
             speaker (s, 0);
         }
diff -u -p a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -489,7 +489,7 @@ static int hda_audio_init(HDACodecDevice
     for (i = 0; i < a->desc->nnodes; i++) {
         node = a->desc->nodes + i;
         param = hda_codec_find_param(node, AC_PAR_AUDIO_WIDGET_CAP);
-        if (NULL == param)
+        if (param == NULL)
             continue;
         type = (param->val & AC_WCAP_TYPE) >> AC_WCAP_TYPE_SHIFT;
         switch (type) {
diff -u -p a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -50,7 +50,7 @@ ISABus *isa_bus_new(DeviceState *dev, Me
         fprintf(stderr, "Can't create a second ISA bus\n");
         return NULL;
     }
-    if (NULL == dev) {
+    if (dev == NULL) {
         dev = qdev_create(NULL, "isabus-bridge");
         qdev_init_nofail(dev);
     }
diff -u -p a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -832,7 +832,7 @@ static void usb_mtp_command(MTPState *s,
             return;
         }
         data_in = usb_mtp_get_object(s, c, o);
-        if (NULL == data_in) {
+        if (data_in == NULL) {
             usb_mtp_queue_result(s, RES_GENERAL_ERROR,
                                  c->trans, 0, 0, 0);
             return;
@@ -851,7 +851,7 @@ static void usb_mtp_command(MTPState *s,
             return;
         }
         data_in = usb_mtp_get_partial_object(s, c, o);
-        if (NULL == data_in) {
+        if (data_in == NULL) {
             usb_mtp_queue_result(s, RES_GENERAL_ERROR,
                                  c->trans, 0, 0, 0);
             return;
diff -u -p a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1596,7 +1596,7 @@ static EHCIQueue *ehci_state_fetchqh(EHC
 
     entry = ehci_get_fetch_addr(ehci, async);
     q = ehci_find_queue_by_qh(ehci, entry, async);
-    if (NULL == q) {
+    if (q == NULL) {
         q = ehci_alloc_queue(ehci, entry, async);
     }
 
diff -u -p a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -108,7 +108,7 @@ static int ccid_card_vscard_can_read(voi
 {
     PassthruState *card = opaque;
 
-    return VSCARD_IN_SIZE >= card->vscard_in_pos ?
+    return card->vscard_in_pos <= VSCARD_IN_SIZE ?
            VSCARD_IN_SIZE - card->vscard_in_pos : 0;
 }
 
diff -u -p a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -371,7 +371,7 @@ static void output_callback(void *opaque
             return;
         }
         data = streambuf_get(&s->out.buf);
-        if (NULL == data) {
+        if (data == NULL) {
             return;
         }
         AUD_write(s->out.voice, data, USBAUDIO_PACKET_SIZE);
diff -u -p a/hw/usb/bus.c b/hw/usb/bus.c
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -91,7 +91,7 @@ USBBus *usb_bus_find(int busnr)
 {
     USBBus *bus;
 
-    if (-1 == busnr)
+    if (busnr == -1)
         return QTAILQ_FIRST(&busses);
     QTAILQ_FOREACH(bus, &busses, next) {
         if (bus->busnr == busnr)
diff -u -p a/qemu-char.c b/qemu-char.c
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -4117,7 +4117,7 @@ void qmp_chardev_remove(const char *id,
     CharDriverState *chr;
 
     chr = qemu_chr_find(id);
-    if (NULL == chr) {
+    if (chr == NULL) {
         error_setg(errp, "Chardev '%s' not found", id);
         return;
     }
diff -u -p a/slirp/slirp.c b/slirp/slirp.c
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -68,7 +68,7 @@ int get_dns_addr(struct in_addr *pdns_ad
     FixedInfo = (FIXED_INFO *)GlobalAlloc(GPTR, sizeof(FIXED_INFO));
     BufLen = sizeof(FIXED_INFO);
 
-    if (ERROR_BUFFER_OVERFLOW == GetNetworkParams(FixedInfo, &BufLen)) {
+    if (GetNetworkParams(FixedInfo, &BufLen) == ERROR_BUFFER_OVERFLOW) {
         if (FixedInfo) {
             GlobalFree(FixedInfo);
             FixedInfo = NULL;
diff -u -p a/block/raw-posix.c b/block/raw-posix.c
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -1628,7 +1628,7 @@ kern_return_t FindEjectableCDMedia( io_i
     CFMutableDictionaryRef  classesToMatch;
 
     kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
-    if ( KERN_SUCCESS != kernResult ) {
+    if (kernResult != KERN_SUCCESS) {
         printf( "IOMasterPort returned %d\n", kernResult );
     }
 
@@ -1639,7 +1639,7 @@ kern_return_t FindEjectableCDMedia( io_i
     CFDictionarySetValue( classesToMatch, CFSTR( kIOMediaEjectableKey ), kCFBooleanTrue );
     }
     kernResult = IOServiceGetMatchingServices( masterPort, classesToMatch, mediaIterator );
-    if ( KERN_SUCCESS != kernResult )
+    if (kernResult != KERN_SUCCESS)
     {
         printf( "IOServiceGetMatchingServices returned %d\n", kernResult );
     }
diff -u -p a/qdev-monitor.c b/qdev-monitor.c
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -694,7 +694,7 @@ void qmp_device_del(const char *id, Erro
     DeviceState *dev;
 
     dev = qdev_find_recursive(sysbus_get_default(), id);
-    if (NULL == dev) {
+    if (dev == NULL) {
         error_set(errp, QERR_DEVICE_NOT_FOUND, id);
         return;
     }
diff -u -p a/linux-user/flatload.c b/linux-user/flatload.c
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -185,7 +185,7 @@ static int decompress_exec(
 	ret = 10;
 	if (buf[3] & EXTRA_FIELD) {
 		ret += 2 + buf[10] + (buf[11] << 8);
-		if (unlikely(LBUFSIZE == ret)) {
+		if (unlikely(ret == LBUFSIZE)) {
 			DBG_FLT("binfmt_flat: buffer overflow (EXTRA)?\n");
 			goto out_free_buf;
 		}
@@ -193,7 +193,7 @@ static int decompress_exec(
 	if (buf[3] & ORIG_NAME) {
 		for (; ret < LBUFSIZE && (buf[ret] != 0); ret++)
 			;
-		if (unlikely(LBUFSIZE == ret)) {
+		if (unlikely(ret == LBUFSIZE)) {
 			DBG_FLT("binfmt_flat: buffer overflow (ORIG_NAME)?\n");
 			goto out_free_buf;
 		}
@@ -201,7 +201,7 @@ static int decompress_exec(
 	if (buf[3] & COMMENT) {
 		for (;  ret < LBUFSIZE && (buf[ret] != 0); ret++)
 			;
-		if (unlikely(LBUFSIZE == ret)) {
+		if (unlikely(ret == LBUFSIZE)) {
 			DBG_FLT("binfmt_flat: buffer overflow (COMMENT)?\n");
 			goto out_free_buf;
 		}
diff -u -p a/linux-user/arm/nwfpe/fpa11_cpdo.c b/linux-user/arm/nwfpe/fpa11_cpdo.c
--- a/linux-user/arm/nwfpe/fpa11_cpdo.c
+++ b/linux-user/arm/nwfpe/fpa11_cpdo.c
@@ -67,7 +67,7 @@ unsigned int EmulateCPDO(const unsigned
       to be. */
    Fd = getFd(opcode);
    nType = fpa11->fType[Fd];
-   if ((0 != nRc) && (nDest != nType))
+   if ((nRc != 0) && (nDest != nType))
    {
      switch (nDest)
      {
diff -u -p a/linux-user/arm/nwfpe/double_cpdo.c b/linux-user/arm/nwfpe/double_cpdo.c
--- a/linux-user/arm/nwfpe/double_cpdo.c
+++ b/linux-user/arm/nwfpe/double_cpdo.c
@@ -226,7 +226,7 @@ unsigned int DoubleCPDO(const unsigned i
       }
    }
 
-   if (0 != nRc) fpa11->fType[Fd] = typeDouble;
+   if (nRc != 0) fpa11->fType[Fd] = typeDouble;
    return nRc;
 }
 
diff -u -p a/linux-user/arm/nwfpe/single_cpdo.c b/linux-user/arm/nwfpe/single_cpdo.c
--- a/linux-user/arm/nwfpe/single_cpdo.c
+++ b/linux-user/arm/nwfpe/single_cpdo.c
@@ -190,7 +190,7 @@ unsigned int SingleCPDO(const unsigned i
       }
    }
 
-   if (0 != nRc) fpa11->fType[Fd] = typeSingle;
+   if (nRc != 0) fpa11->fType[Fd] = typeSingle;
    return nRc;
 }
 
diff -u -p a/linux-user/arm/nwfpe/extended_cpdo.c b/linux-user/arm/nwfpe/extended_cpdo.c
--- a/linux-user/arm/nwfpe/extended_cpdo.c
+++ b/linux-user/arm/nwfpe/extended_cpdo.c
@@ -210,7 +210,7 @@ unsigned int ExtendedCPDO(const unsigned
       }
    }
 
-   if (0 != nRc) fpa11->fType[Fd] = typeExtended;
+   if (nRc != 0) fpa11->fType[Fd] = typeExtended;
    return nRc;
 }
 
diff -u -p a/audio/ossaudio.c b/audio/ossaudio.c
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -286,7 +286,7 @@ static int oss_open (int in, struct oss_
     oflags |= conf.try_mmap ? O_RDWR : (in ? O_RDONLY : O_WRONLY);
 
     fd = open (dspname, oflags | O_NONBLOCK);
-    if (-1 == fd) {
+    if (fd == -1) {
         oss_logerr2 (errno, typ, "Failed to open `%s'\n", dspname);
         return -1;
     }
diff -u -p a/ui/spice-core.c b/ui/spice-core.c
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -677,7 +677,7 @@ void qemu_spice_init(void)
 
     if (tls_port) {
         x509_dir = qemu_opt_get(opts, "x509-dir");
-        if (NULL == x509_dir) {
+        if (x509_dir == NULL) {
             x509_dir = ".";
         }
 
@@ -803,7 +803,7 @@ void qemu_spice_init(void)
 
     seamless_migration = qemu_opt_get_bool(opts, "seamless-migration", 0);
     spice_server_set_seamless_migration(spice_server, seamless_migration);
-    if (0 != spice_server_init(spice_server, &core_interface)) {
+    if (spice_server_init(spice_server, &core_interface) != 0) {
         error_report("failed to initialize spice server");
         exit(1);
     };



