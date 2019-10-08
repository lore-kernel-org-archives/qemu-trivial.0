Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHlBp-00058V-IA
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2019 04:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iHlBl-00057O-HQ
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 04:49:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iHlBi-0001HW-JY
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 04:49:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42872)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iHlBe-00015U-6C; Tue, 08 Oct 2019 04:49:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F96018C4287;
 Tue,  8 Oct 2019 08:49:40 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFFB960BE0;
 Tue,  8 Oct 2019 08:49:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Vincenzo Maffione <vmaffione@freebsd.org>,
 Giuseppe Lettieri <giuseppe.lettieri@unipi.it>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] Test netmap on FreeBSD
Date: Tue,  8 Oct 2019 10:49:31 +0200
Message-Id: <20191008084931.12753-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 08 Oct 2019 08:49:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 08 Oct 2019 08:49:51 -0000

FreeBSD offers a package for "netmap", thus let's install it in our
FreeBSD tests to get some compile test coverage for net/netmap.c, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .cirrus.yml      | 2 +-
 tests/vm/freebsd | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 8326a3a4b1..44fea2c29e 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -8,7 +8,7 @@ freebsd_12_task:
     memory: 8G
   install_script: pkg install -y
     bash bison curl cyrus-sasl git glib gmake gnutls gsed
-    nettle perl5 pixman pkgconf png usbredir
+    netmap nettle perl5 pixman pkgconf png usbredir
   script:
     - mkdir build
     - cd build
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 2a19461a90..45821702bd 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -54,6 +54,9 @@ class FreeBSDVM(basevm.BaseVM):
         # libs: opengl
         "libepoxy",
         "mesa-libs",
+
+        # libs: network
+        "netmap",
     ]
 
     BUILD_SCRIPT = """
-- 
2.18.1


