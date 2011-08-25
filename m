Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QwU90-0008BI-OQ
	for mharc-qemu-trivial@gnu.org; Thu, 25 Aug 2011 03:14:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1QwU8y-00080k-4a
	for qemu-trivial@nongnu.org; Thu, 25 Aug 2011 03:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1QwU8x-0001pd-Bl
	for qemu-trivial@nongnu.org; Thu, 25 Aug 2011 03:14:28 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:35552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1QwU8v-0001p3-6B; Thu, 25 Aug 2011 03:14:25 -0400
Received: by fxbb27 with SMTP id b27so1744203fxb.4
	for <multiple recipients>; Thu, 25 Aug 2011 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l6NFs8N7zdQuaJlC4Z8eXm0Ge5CZlEuVd/ctQ1lntC0=;
	b=FTOFDcMPUtMprbJokT/7juftVjsD6y0VbrQF3Qe05bbNg89+RDPRCgxoPIzXAsYywS
	QgHc05830fTsRTOn01J6XiRsvn0VfHP6xgP4I5JXvEcyHkyTVYKjk31VCTTUInrY3njW
	Fupx3qQ998/b34eFAZdXbO04HhIHNED92+w4s=
Received: by 10.223.62.145 with SMTP id x17mr8878575fah.21.1314256463156;
	Thu, 25 Aug 2011 00:14:23 -0700 (PDT)
Received: from obol602.omnitel.it ([87.236.194.158])
	by mx.google.com with ESMTPS id 14sm238665faf.32.2011.08.25.00.14.15
	(version=SSLv3 cipher=OTHER); Thu, 25 Aug 2011 00:14:22 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: stefanha@gmail.com
Date: Thu, 25 Aug 2011 09:14:38 +0200
Message-Id: <1314256478-4853-1-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH] disasm: update comment
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
X-List-Received-Date: Thu, 25 Aug 2011 07:14:29 -0000


Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 disas.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/disas.c b/disas.c
index 1334b8e..611b30b 100644
--- a/disas.c
+++ b/disas.c
@@ -137,7 +137,7 @@ print_insn_thumb1(bfd_vma pc, disassemble_info *info)
 
 /* Disassemble this for me please... (debugging). 'flags' has the following
    values:
-    i386 - nonzero means 16 bit code
+    i386 - 1 means 16 bit code, 2 means 64 bit code
     arm  - nonzero means thumb code
     ppc  - nonzero means little endian
     other targets - unused
-- 
1.7.1


