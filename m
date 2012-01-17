Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rn7zz-00050R-B7
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2012 07:18:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Rn7zs-0004oM-7r
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 07:18:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Rn7zj-0004h4-Bs
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 07:18:40 -0500
Received: from mout.web.de ([212.227.15.4]:56584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1Rn7zX-0004gJ-Ns; Tue, 17 Jan 2012 07:18:19 -0500
Received: from localhost.localdomain ([195.135.221.2]) by smtp.web.de
	(mrweb001) with ESMTPA (Nemesis) id 0M4Hqd-1SeGZY1Jpb-00r8oF;
	Tue, 17 Jan 2012 13:18:08 +0100
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Jan 2012 13:16:05 +0100
Message-Id: <1326802565-12770-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:6GTsYRCvSZ4CnoRoESkqDV5pv5zzq8uQcyWEnTlh/cL
	KHGIBeGv3COl8ffN400GGY/ozcZurF8DNIDJJrY01aHvYhOL0z
	oXLfv9n99JGRZu14joRVEb5W6A34j5MdDi2bVHFRjSRSpi4POi
	jb7bGX1AJXvmwig3mevuPG+WMzeT7XHwAidt1arI//BN4wuRvh
	BlgZwvjDUX+qaW4NUjflw==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.15.4
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] Makefile: Exclude tests/Makefile in
	unconfigured tree
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
X-List-Received-Date: Tue, 17 Jan 2012 12:18:45 -0000

Since commit dbfe06c62ccedc5b64e1c6466445133dd50f6de1 (build:
split unit test builds to a separate makefile fragment),
in absence of config-host.mak an undefined $(SRC_PATH) breaks
`make distclean' due to /tests/Makefile not being include'able.

Fix by only including when config-host.mak is present.

Signed-off-by: Andreas Färber <andreas.faerber@web.de>
Cc: Anthony Liguori <aliguori@us.ibm.com>
---
 Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 2bbc547..d356f07 100644
--- a/Makefile
+++ b/Makefile
@@ -168,7 +168,9 @@ qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
 
 gen-out-type = $(subst .,-,$(suffix $@))
 
+ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/tests/Makefile
+endif
 
 $(qapi-dir)/qga-qapi-types.c $(qapi-dir)/qga-qapi-types.h :\
 $(SRC_PATH)/qapi-schema-guest.json $(SRC_PATH)/scripts/qapi-types.py
-- 
1.7.7


