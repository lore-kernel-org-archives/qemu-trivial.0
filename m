Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFQA5-0004iQ-L4
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2017 14:49:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eFQA3-0004gO-68
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 14:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eFQA2-000575-DQ
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 14:49:19 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:60098
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1eFQ9v-0004wq-I9; Thu, 16 Nov 2017 14:49:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id CEC54DA8E46;
	Thu, 16 Nov 2017 20:49:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ANeSJeAqNRdS; Thu, 16 Nov 2017 20:49:08 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 78E9CDA8E39;
	Thu, 16 Nov 2017 20:49:08 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 4260C46162E; Thu, 16 Nov 2017 20:49:08 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Thu, 16 Nov 2017 20:49:02 +0100
Message-Id: <20171116194902.5887-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH for-2.11] MAINTAINERS: Add missing entry for
 eepro100 emulation
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:20 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ffd77b461c..83434e09af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1183,6 +1183,11 @@ M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 
+eepro100
+M: Stefan Weil <sw@weilnetz.de>
+S: Maintained
+F: hw/net/eepro100.c
+
 Generic Loader
 M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
-- 
2.11.0


