Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qjl60-0003t0-Ch
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2011 00:42:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qjl5u-0003qk-Pe
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2011 00:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qjl5q-0002CF-SE
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2011 00:42:42 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:53645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1Qjl5i-00029F-LO; Thu, 21 Jul 2011 00:42:30 -0400
Received: by vws17 with SMTP id 17so769841vws.4
	for <multiple recipients>; Wed, 20 Jul 2011 21:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kaMOwAYrZ/PpTkq6KOnjNOPz4skjxZBVw5almc5KSm8=;
	b=pNsyuiuSNEFUr+gFnmBKrX0pwO9NhUG85KjVjGz7Gern0kqbMgTmAKuwQzzclD+kqd
	3TihJcsaiEardepA4a/YDzNfMzY6iHtAVcr5xYn92cMdaCg35htPrnlSJsWzAQXK94ws
	2Q3AJEXx3TplMvxty2HsLwmn5AS/Rjc7ihzZA=
Received: by 10.52.96.33 with SMTP id dp1mr9856982vdb.20.1311223349476;
	Wed, 20 Jul 2011 21:42:29 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id fc13sm312402vcb.13.2011.07.20.21.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 21:42:28 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 21 Jul 2011 00:41:47 -0400
Message-Id: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] Makefile: fix out-of-tree builds
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
X-List-Received-Date: Thu, 21 Jul 2011 04:42:46 -0000

This patch fixes a minor bugs which prevented QEMU from being built
out of tree.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index fbdaecc..1cde239 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ config-all-devices.mak: $(SUBDIR_DEVICES_MAK)
 
 -include $(SUBDIR_DEVICES_MAK_DEP)
 
-%/config-devices.mak: default-configs/%.mak
+%/config-devices.mak: $(SRC_PATH)/default-configs/%.mak
 	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/make_device_config.sh $@ $<, "  GEN   $@")
 	@if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
1.7.5


