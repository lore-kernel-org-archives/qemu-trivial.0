Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWgfq-00034T-Rs
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 06:58:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gWgfm-00032U-6h
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 06:57:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1gWgfl-0006tS-E0
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 06:57:58 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45957)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mjt@tls.msk.ru>)
	id 1gWgfg-0006kF-8T; Tue, 11 Dec 2018 06:57:52 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F079E41C72;
	Tue, 11 Dec 2018 14:57:40 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D38EE1680;
	Tue, 11 Dec 2018 14:57:40 +0300 (MSK)
Received: (nullmailer pid 7769 invoked by uid 1000);
	Tue, 11 Dec 2018 11:57:40 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 11 Dec 2018 14:57:39 +0300
Message-Id: <20181211115739.7725-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial]
 contrib/systemd/qemu-guest-agent.service: BindTo=>BindsTo
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
X-List-Received-Date: Tue, 11 Dec 2018 11:57:59 -0000

As per https://github.com/systemd/systemd/commit/7f2cddae09fd2579ae24434df577bb5e5a157d86

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 contrib/systemd/qemu-guest-agent.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/systemd/qemu-guest-agent.service b/contrib/systemd/qemu-guest-agent.service
index 51cd7b37ff..59f7ecb1b8 100644
--- a/contrib/systemd/qemu-guest-agent.service
+++ b/contrib/systemd/qemu-guest-agent.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=QEMU Guest Agent
-BindTo=dev-virtio\x2dports-org.qemu.guest_agent.0.device
+BindsTo=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 After=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 
 [Service]
-- 
2.11.0


