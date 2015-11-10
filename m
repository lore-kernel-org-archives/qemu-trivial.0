Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFLC-00075l-63
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:16:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFL7-0006xX-4Q
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFL6-0005Gs-3c
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwFL2-0005Fl-EX; Tue, 10 Nov 2015 15:16:20 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 06B475A08F;
	Tue, 10 Nov 2015 20:16:20 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-38.ams2.redhat.com [10.36.6.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKGBop029221; Tue, 10 Nov 2015 15:16:16 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2015 21:16:08 +0100
Message-Id: <1447186571-27672-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1447186571-27672-1-git-send-email-thuth@redhat.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/4] hw/ide: Remove superfluous return
	statements
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
X-List-Received-Date: Tue, 10 Nov 2015 20:16:28 -0000

The "return;" statements at the end of functions do not make
much sense, so let's remove them.

Cc: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/atapi.c | 1 -
 hw/ide/macio.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 747f466..347c6e7 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -737,7 +737,6 @@ static void cmd_inquiry(IDEState *s, uint8_t *buf)
  out:
     buf[size_idx] = idx - preamble_len;
     ide_atapi_cmd_reply(s, idx, max_len);
-    return;
 }
 
 static void cmd_get_configuration(IDEState *s, uint8_t *buf)
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 893c9b9..8a56115 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -288,8 +288,6 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
 done:
     block_acct_done(blk_get_stats(s->blk), &s->acct);
     io->dma_end(opaque);
-
-    return;
 }
 
 static void pmac_ide_transfer_cb(void *opaque, int ret)
-- 
1.8.3.1


