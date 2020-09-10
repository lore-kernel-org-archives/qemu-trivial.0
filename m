Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGGaq-0005Hk-JM
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 03:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGap-0005F7-8r
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:02:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59232
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGan-0001lF-1k
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599721320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOfPlRcHNPnFEFQL04D9b7WV0+f6qJ96Y7nXN27AiJ8=;
 b=GWBdzqOWAxbPW7jhunM+/J/b63iVFY3I+8wE/0tFTQ/6MoDVTYH8mAQqgL0LHVW0QAEn32
 BIrhZCIkXFbiAdaxupxHhtM2NY5EBdHZKWp4C9vrsA4GN3QAWlOaDnNi3ShNYDmchKbZRp
 zFtiL+vPJ8O3CLkLvkXQarnpVNOe5Zw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Bw9Xk9d8O2Kc_CA58UeymA-1; Thu, 10 Sep 2020 03:01:58 -0400
X-MC-Unique: Bw9Xk9d8O2Kc_CA58UeymA-1
Received: by mail-wr1-f71.google.com with SMTP id l17so1869607wrw.11
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 00:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOfPlRcHNPnFEFQL04D9b7WV0+f6qJ96Y7nXN27AiJ8=;
 b=bXHUJRgVm3jZTGriLQraxkz7IXF348rY+cGPhK1ZkyQpPe6w+UcAgb4fOjsa7vIoTr
 kLRNuZXtGH8IEa8ErSFDnz9YmBYZ1fQhkwN5A1cftSy4h9ZuPS3wO8lx56vId8UcbIds
 om4jDsY0h1L1tghxakgzu+DdEuO9KcScpssGUvw0130ehgILIMO3uD+XogsLKNk3xjPI
 m3r+FydVMobhxLV6QGUyCxrHhL60984VGHOxXBP9iCDJjWCdpEJ1YulYkQwpWl6L+3nW
 PvSqTezi2xgi+S1b0F69RC4G/nEiY7XIPRjp9xiWmvP4GXrJubWI8t675DAjYtmNsPAI
 JTjg==
X-Gm-Message-State: AOAM5335GbTRsTgGXw1OD/A0YqPo/Bjt9wr9MEJYNZ1oE4Labh5mBEdZ
 K/E8PHZQRVfJ1qsXOJPZMT0HqabGvqlgUesF9REz0rOJqOJFxo3fBEqw9gMusWefjXBkjcLh2tr
 jIkqppuvUt8mDSz0Dvg==
X-Received: by 2002:adf:e852:: with SMTP id d18mr8003824wrn.40.1599721316989; 
 Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlwpG0tUUcWG7cYI6DeHX0M5TDMJpNZQcQfEC1vqrWrbjug/Hj3GDkPn1UBSppzX4Ol1mWhw==
X-Received: by 2002:adf:e852:: with SMTP id d18mr8003791wrn.40.1599721316799; 
 Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id f6sm2615123wme.32.2020.09.10.00.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/6] hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
Date: Thu, 10 Sep 2020 09:01:29 +0200
Message-Id: <20200910070131.435543-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 01:23:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 10 Sep 2020 07:02:03 -0000

In order to use inclusive terminology, rename 'slave stream'
as 'sink stream'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/xilinx_axienet.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 0c4ac727207..4e48535f373 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -46,11 +46,11 @@
      OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
 
 #define XILINX_AXI_ENET_DATA_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
      TYPE_XILINX_AXI_ENET_DATA_STREAM)
 
 #define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
      TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
 /* Advertisement control register. */
@@ -310,10 +310,10 @@ struct TEMAC  {
     void *parent;
 };
 
-typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
+typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
 typedef struct XilinxAXIEnet XilinxAXIEnet;
 
-struct XilinxAXIEnetStreamSlave {
+struct XilinxAXIEnetStreamSink {
     Object parent;
 
     struct XilinxAXIEnet *enet;
@@ -325,8 +325,8 @@ struct XilinxAXIEnet {
     qemu_irq irq;
     StreamSink *tx_data_dev;
     StreamSink *tx_control_dev;
-    XilinxAXIEnetStreamSlave rx_data_dev;
-    XilinxAXIEnetStreamSlave rx_control_dev;
+    XilinxAXIEnetStreamSink rx_data_dev;
+    XilinxAXIEnetStreamSink rx_control_dev;
     NICState *nic;
     NICConf conf;
 
@@ -859,7 +859,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
                                    bool eop)
 {
     int i;
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
     XilinxAXIEnet *s = cs->enet;
 
     assert(eop);
@@ -880,7 +880,7 @@ static size_t
 xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
                                 bool eop)
 {
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
     XilinxAXIEnet *s = ds->enet;
 
     /* TX enable ?  */
@@ -954,8 +954,8 @@ static NetClientInfo net_xilinx_enet_info = {
 static void xilinx_enet_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
                                                             &s->rx_control_dev);
 
     object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
@@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_info = {
 static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
@@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
 static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
-- 
2.26.2


