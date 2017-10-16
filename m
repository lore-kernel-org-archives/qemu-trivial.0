Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CE3-0006n6-KB
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:43:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDz-0006gT-79
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDx-0006TA-9o
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CDs-0006Ph-Sp; Mon, 16 Oct 2017 16:42:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29C3B40D2C;
	Mon, 16 Oct 2017 23:42:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BBEC5C3F;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12334 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:39 +0300
Message-Id: <534fd8142fae81b621ff61524f319163d2bb1f7b.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/14] MAINTAINERS: Track
 default-configs/pci.mak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2017 20:43:00 -0000

From: Fam Zheng <famz@redhat.com>

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ce393f50d..162e914a2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -934,6 +934,7 @@ F: hw/pci/*
 F: hw/pci-bridge/*
 F: docs/pci*
 F: docs/specs/*pci*
+F: default-configs/pci.mak
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.11.0


