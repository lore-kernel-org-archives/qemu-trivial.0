Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEye-0000E5-Dg
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyY-00006L-Np
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyX-0006Wj-V2
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEyS-0006TC-Nk; Sun, 24 Sep 2017 18:02:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6A3A341C92;
	Mon, 25 Sep 2017 01:02:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 97C8FC35;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28286 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:41 +0300
Message-Id: <67124752942a3ba5ab23a78847fb9f20e69f8c58.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/31] trivial: Add missing "-m" parameter in
 docs/memory-hotplug.txt
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
X-List-Received-Date: Sun, 24 Sep 2017 22:02:12 -0000

From: Thomas Huth <thuth@redhat.com>

The example obviously lacks the "-m" parameter.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/memory-hotplug.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/memory-hotplug.txt b/docs/memory-hotplug.txt
index 56bdd0a47b..d96397c1af 100644
--- a/docs/memory-hotplug.txt
+++ b/docs/memory-hotplug.txt
@@ -24,7 +24,7 @@ Where,
 
 For example, the following command-line:
 
- qemu [...] 1G,slots=3,maxmem=4G
+ qemu [...] -m 1G,slots=3,maxmem=4G
 
 Creates a guest with 1GB of memory and three hotpluggable memory slots.
 The hotpluggable memory slots are empty when the guest is booted, so all
-- 
2.11.0


