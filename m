Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoglF-0001gx-GU
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 17:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1UocSB-00077j-Um
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 12:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1UocSA-0006rF-Of
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 12:38:51 -0400
Received: from smtp.citrix.com ([66.165.176.89]:39592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1UocSA-0006qu-Ju; Mon, 17 Jun 2013 12:38:50 -0400
X-IronPort-AV: E=Sophos;i="4.87,882,1363132800"; d="scan'208";a="31621633"
Received: from accessns.citrite.net (HELO FTLPEX01CL02.citrite.net)
	([10.9.154.239]) by FTLPIPO01.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	17 Jun 2013 16:38:48 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.79) with Microsoft SMTP Server id 14.2.342.4;
	Mon, 17 Jun 2013 12:38:47 -0400
Received: from [10.80.3.61] (helo=perard.uk.xensource.com)	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<anthony.perard@citrix.com>)	id 1UocS8-0003r4-4F;
	Mon, 17 Jun 2013 17:38:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: QEMU-devel <qemu-devel@nongnu.org>
Date: Mon, 17 Jun 2013 17:38:26 +0100
Message-ID: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
X-Mailman-Approved-At: Mon, 17 Jun 2013 17:14:47 -0400
Cc: qemu-trivial@nongnu.org, Anthony PERARD <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] qxl: Fix QXLRam initialisation.
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
X-List-Received-Date: Mon, 17 Jun 2013 16:38:54 -0000

The qxl driver expect NULL for QXLRam.memory_configs, but this is never
initialized.

If memory is set to 0xc2c2.., it leads to a spice-critical error when
trying to start qxl.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/display/qxl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index c475cb1..937a402 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -387,6 +387,7 @@ static void init_qxl_ram(PCIQXLDevice *d)
     d->ram->int_pending = cpu_to_le32(0);
     d->ram->int_mask    = cpu_to_le32(0);
     d->ram->update_surface = 0;
+    d->ram->monitors_config = 0;
     SPICE_RING_INIT(&d->ram->cmd_ring);
     SPICE_RING_INIT(&d->ram->cursor_ring);
     SPICE_RING_INIT(&d->ram->release_ring);
-- 
Anthony PERARD


