Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6mln-0003CH-IV
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2011 13:09:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1R6mlk-00036c-Ts
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2011 13:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1R6mlj-0001Db-PQ
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2011 13:09:04 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:37868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1R6mlg-0001Cj-BD; Thu, 22 Sep 2011 13:09:00 -0400
Received: by wyh22 with SMTP id 22so3339698wyh.4
	for <multiple recipients>; Thu, 22 Sep 2011 10:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=VYlheVQ7mJKY+qJ+p8bSuufCu8Wwrh7jpOWNUDW65bA=;
	b=My2nLORgKUBn82XFBP+AdT0lowDfb8hwQnE7fedLRsB3KKXs/lQSqVE2/Wv2a+3wBn
	LQR9PkAvo0fgjN0dAetQgAy3tiA1XpR2/K8nv3aBhowU8BTVRuDNyC+6/iJEAv9QwkMz
	AZNaM5aDET9UlNFJmRDfIKXW2bOH0nBGgxMPM=
Received: by 10.216.178.144 with SMTP id f16mr2413625wem.104.1316711338859;
	Thu, 22 Sep 2011 10:08:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-188-71.ip51.fastwebnet.it.
	[93.34.188.71])
	by mx.google.com with ESMTPS id fq9sm12389774wbb.15.2011.09.22.10.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 10:08:57 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Sep 2011 19:08:47 +0200
Message-Id: <1316711327-4046-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] makefile: extract tools-obj-y
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
X-List-Received-Date: Thu, 22 Sep 2011 17:09:06 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a211158..4308470 100644
--- a/Makefile
+++ b/Makefile
@@ -145,11 +145,12 @@ endif
 qemu-img.o: qemu-img-cmds.h
 qemu-img.o qemu-tool.o qemu-nbd.o qemu-io.o cmd.o qemu-ga.o: $(GENERATED_HEADERS)
 
-qemu-img$(EXESUF): qemu-img.o qemu-tool.o qemu-error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) qemu-timer-common.o
+tools-obj-y = qemu-tool.o qemu-error.o $(oslib-obj-y) $(trace-obj-y) \
+        $(block-obj-y) $(qobject-obj-y) $(version-obj-y) qemu-timer-common.o
 
-qemu-nbd$(EXESUF): qemu-nbd.o qemu-tool.o qemu-error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) qemu-timer-common.o
-
-qemu-io$(EXESUF): qemu-io.o cmd.o qemu-tool.o qemu-error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) qemu-timer-common.o
+qemu-img$(EXESUF): qemu-img.o $(tools-obj-y)
+qemu-nbd$(EXESUF): qemu-nbd.o $(tools-obj-y)
+qemu-io$(EXESUF): qemu-io.o cmd.o $(tools-obj-y)
 
 qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"  GEN   $@")
-- 
1.7.6


