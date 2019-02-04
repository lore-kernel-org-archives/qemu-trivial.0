Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqZZo-00051d-Vv
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 03:26:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqZZm-00050C-Rp
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 03:25:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqZZm-0006OQ-4p
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 03:25:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gqZZk-0006Mq-FJ; Mon, 04 Feb 2019 03:25:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C08278F505;
	Mon,  4 Feb 2019 08:25:55 +0000 (UTC)
Received: from thuth.com (ovpn-117-5.ams2.redhat.com [10.36.117.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B1D479D4D;
	Mon,  4 Feb 2019 08:25:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Mon,  4 Feb 2019 09:25:43 +0100
Message-Id: <1549268743-18502-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 04 Feb 2019 08:25:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests/docker/test-mingw and docs: Remove
 --with-sdlabi=2.0
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
X-List-Received-Date: Mon, 04 Feb 2019 08:25:59 -0000

Patchew currently reports failures with the mingw docker test - this
is due to --with-sdlabi=2.0 configure flag which does not exist anymore.
Remove this remainder from the docker test and the docs now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/multiseat.txt      | 2 +-
 tests/docker/test-mingw | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/multiseat.txt b/docs/multiseat.txt
index 8dde36c..11850c9 100644
--- a/docs/multiseat.txt
+++ b/docs/multiseat.txt
@@ -9,7 +9,7 @@ First you must compile qemu with a user interface supporting
 multihead/multiseat and input event routing.  Right now this
 list includes sdl2, gtk (both 2+3) and vnc:
 
-  ./configure --enable-sdl --with-sdlabi=2.0
+  ./configure --enable-sdl
 
 or
 
diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index b078f22..4b84cfe 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -27,8 +27,7 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-curl \
         --enable-vnc \
         --enable-bzip2 \
-        --enable-guest-agent \
-        --with-sdlabi=2.0
+        --enable-guest-agent
     install_qemu
     make clean
 
-- 
1.8.3.1


