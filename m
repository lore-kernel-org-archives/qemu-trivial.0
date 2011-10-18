Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDK7-0008Cu-QX
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:19:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDK4-0007yD-18
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:19:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDK2-0007k6-FL
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:19:27 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:59201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RGDJw-0007iS-9W; Tue, 18 Oct 2011 13:19:20 -0400
Received: by bkat2 with SMTP id t2so1177121bka.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tOfTi7pP5bvfwxb9XiSk3n2nx3KIzuryKpZTPmUhW1w=;
	b=fs2rheh+clJMYVotBbjAnSC67AK5C6kzJ3CbdvfDziycbu+GI8GkZ3NfLNEZPpzXlR
	QKPVGruLg53m4aQ7NTYBLXWYVbk4R5HNqRYW5g+9g0WYlJRuak6rrF6ciZOV0VvPYFw6
	HbXVRFuVpHvHYKrNf8A3NUKPTKq3Qi8WLmuSk=
Received: by 10.204.157.131 with SMTP id b3mr2492985bkx.41.1318958359158;
	Tue, 18 Oct 2011 10:19:19 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-3-205.pppoe.mtu-net.ru.
	[83.237.3.205])
	by mx.google.com with ESMTPS id z9sm2930665bkn.7.2011.10.18.10.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:19:18 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Oct 2011 21:19:03 +0400
Message-Id: <1318958343-14167-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vmdk: vmdk_read_cid returns garbage if
	p_name is NULL
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
X-List-Received-Date: Tue, 18 Oct 2011 17:19:29 -0000

Spotted by Clang Analyzer

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
 block/vmdk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 3969131..a75dcc2 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -207,7 +207,7 @@ static void vmdk_free_last_extent(BlockDriverState *bs)
 static uint32_t vmdk_read_cid(BlockDriverState *bs, int parent)
 {
     char desc[DESC_SIZE];
-    uint32_t cid;
+    uint32_t cid = 0xffffffff;
     const char *p_name, *cid_str;
     size_t cid_str_size;
     BDRVVmdkState *s = bs->opaque;
-- 
1.7.0.4


