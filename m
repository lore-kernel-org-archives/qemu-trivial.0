Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izgco-0001kG-QL
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgck-0001Wd-Nx
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcj-0006aU-Pw
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:51:14 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46301)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcc-0006CW-1X; Thu, 06 Feb 2020 07:51:06 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MA7X0-1ipGDL3NvO-00BbCn; Thu, 06 Feb 2020 13:50:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 10/12] hw/pci/pci_bridge: Fix typo in comment
Date: Thu,  6 Feb 2020 13:50:25 +0100
Message-Id: <20200206125027.1926263-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dvrfDhR6DTOhirCpblgtkyZOsXurCpz2lUT8+BgCe+AC302dNr2
 TyTDGbePLn0u7x5scTLfwu/wap6ChKmf2n0vqw96mki9X/o3feJJ5Y0l1hDbqKRO05j85by
 1g4poy999FyyG/2D42fHg2IJ4lb30AIljABO/cgq5EUyRJ/P6/bcboeX/ut9XT55vJqosWs
 BMcJrxnflp0kyKKMrHv4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0amfNGgEKrE=:JOnQLYNPdK2mG5x28jln3w
 VsLmBCqKzffy5h7CkXAOj0ZVUC0naVXBxP7yGWak5OrUYvIEdrM5oUDW2M9hIac26F+4D/TaB
 bsI29F3s9gmitrELcHjKTausehV8xLpPfUBIiZRMv1yKT7KaS7PCP9q6WTXbWNC3Je+jgjrMy
 4tLcomWUZCi/urFYVwcQy0xK7aNwX8rdaeyaPjFP/3VciYglnLOwo1++I5f/4aRZ1RIl+nmnT
 U8P200T0BGyC70gj2Ea9/13sBs5H5YRUs7FYKASoyyLsRif1QK7QjJwKTl3Gu56O1uSFuUBAQ
 afNOc3Wyn9HlcoqO7l6j8swpqa6aaonT97EVGFcCFmHklraML/IYK3xg54LznX2Z26FC/OEv+
 oSiS4xDb7Qf1zWkJst4HL9cOKI9QBNRLzj3KyvEYIRZGBkxqGtPg4R1kzO9r31IuOKr12mfyY
 KN+6HhgKc2S4VNOMxqOOKYmMMcX3pJfNEaEwKA6Sga7TBeUMQYOvbOL+dmpFQ4FYTvfdCW0/1
 VrV8unbKGzrIfInCnI0pO65gXprSSnv/4+AgM7xx5B4/cuEtgY5JGoskCkhrpBEBLb1wZUfvw
 xhTAlvEVl+44/l9B+sejwUAVZiEgl0ipsbHmpXsUuqrpFOgLlPhzRT2GdWY7zZnxwBnOP53Kw
 Iq/WBBFf+4/gvZosN5RoYEWF2lmblmlTAPSAydV9iL9u92LnedX9QP76WrMZJoDZiST2ymR8m
 ruskjq0RgzpnhV62v9eBaBjE2OMfs0T+p9Y+aKsvo/KqMC7sJdYFYPaGrojK6PHePOzgQJduS
 l1BY0WsscTAUMQKvx2tHerAxLaJpUBcP6IPaA/ATKEHfhoYkOfzQgWKvmYbh3MXXLvCzFzR
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
X-List-Received-Date: Thu, 06 Feb 2020 12:51:16 -0000

From: Julia Suvorova <jusual@redhat.com>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200205185123.210209-1-jusual@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/pci/pci_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba488818d292..99c674e94954 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -108,7 +108,7 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
 
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name and
- * map_irq callback which are necessry for pci_bridge_initfn() to
+ * map_irq callback which are necessary for pci_bridge_initfn() to
  * initialize bus.
  */
 void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
-- 
2.24.1


