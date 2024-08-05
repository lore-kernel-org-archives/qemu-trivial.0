Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sasp6-0007jL-3R
	for mharc-qemu-trivial@gnu.org; Mon, 05 Aug 2024 04:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gorg@gorgnet.net>) id 1sao8B-0008DQ-Q2
 for qemu-trivial@nongnu.org; Sun, 04 Aug 2024 23:11:31 -0400
Received: from gorgnet.net ([2a01:4f9:c012:ca43::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gorg@gorgnet.net>) id 1sao87-0007h9-VZ
 for qemu-trivial@nongnu.org; Sun, 04 Aug 2024 23:11:31 -0400
DKIM-Signature: v=1; a=ed25519-sha256; c=simple/simple;
 d=gorgnet.net; s=b1; x=1723432279; q=dns/txt; h=Received:
 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding; bh=Xz285uRSybBtiTbzvqcQNiuBc2k3ceYY0
 2oDTMiNJwQ=; b=ypfmbzc2jvSsuKaS4gxOEOMYjUnaFR40KsX5vV5blIIclb+rk
 PaKaNfie2E5oxbIFYwFzt0I4YflU9WMDF/rAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=gorgnet.net; s=a1; x=1723432279; q=dns/txt; h=Received:
 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding; bh=Xz285uRSybBtiTbzvqcQNiuBc2k3ceYY0
 2oDTMiNJwQ=; b=Of65wOQh+PkVgog2MEzmhqauZrCKAVhOJnJKj/1+7oyP23X1A
 Lg2wH+Cx9rJbKf7ArTf71dbYQ0cTymS4eNZ7AtfIrqd1UcslP+yOkBxUxQwKNc7k
 MpgABzmDFxa48ny1Dj2TVexsE3VL56Q2CYH5IoWaNt1JHIJW9iOKa7hBVlhNTYLJ
 2ZoFHmBwvR04/YQAqinQJLUdwVhihPU6BGoii6L4Raj+i27G7yxCpY3JzSB7YzdQ
 SEJtk4iUUWJx9DHFr6ZWfn2njHAjP2V940WPHL316Op1EpJQ+cRRKimAvjWI02RK
 zewf8jbW+M2tZtb7W6CdOgmRPIeOLY4423Qww==
Received: (qmail 7206 invoked from network); 5 Aug 2024 03:11:18 -0000
Received: from unknown (HELO localhost.localdomain)
 (gorg@gorgnet.net@73.203.127.165)
 de/crypted with TLSv1.2: ECDHE-ECDSA-CHACHA20-POLY1305 [unknown/unknown] 
 DN=none by 0 with ESMTPSA; 5 Aug 2024 03:11:18 -0000
From: George Matsumura <gorg@gorgnet.net>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 George Matsumura <gorg@gorgnet.net>
Subject: [PATCH 1/2] docs/specs/pci-ids: Add missing devices
Date: Sun,  4 Aug 2024 21:10:11 -0600
Message-ID: <20240805031012.16547-2-gorg@gorgnet.net>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f9:c012:ca43::1;
 envelope-from=gorg@gorgnet.net; helo=gorgnet.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Aug 2024 04:11:34 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2024 03:11:32 -0000
X-List-Received-Date: Mon, 05 Aug 2024 03:11:32 -0000

Add the missing devices 1b36:000c (PCIe root port) and 1b36:000e
(PCIe-to-PCI bridge).

Signed-off-by: George Matsumura <gorg@gorgnet.net>
---
 docs/specs/pci-ids.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
index c0a3dec2e7..0de13de1e4 100644
--- a/docs/specs/pci-ids.rst
+++ b/docs/specs/pci-ids.rst
@@ -82,8 +82,12 @@ PCI devices (other than virtio):
   PCI-PCI bridge (multiseat)
 1b36:000b
   PCIe Expander Bridge (-device pxb-pcie)
+1b36:000c
+  PCIe Root Port (``-device pcie-root-port``)
 1b36:000d
   PCI xhci usb host adapter
+1b36:000e
+  PCIe-to-PCI bridge (``-device pcie-pci-bridge``)
 1b36:000f
   mdpy (mdev sample device), ``linux/samples/vfio-mdev/mdpy.c``
 1b36:0010
-- 
2.46.0


