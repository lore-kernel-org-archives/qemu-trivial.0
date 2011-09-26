Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R83L9-00038H-KX
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 01:02:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R83L6-0002w2-1A
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 01:02:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R83L5-0004MS-4p
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 01:02:47 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:41684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R83L2-0004Lm-ET; Mon, 26 Sep 2011 01:02:44 -0400
Received: by mail-bw0-f45.google.com with SMTP id zv15so5503531bkb.4
	for <multiple recipients>; Sun, 25 Sep 2011 22:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=n8XRR49uWaJ3FupfwKgeOl1hhLMNaswXcftBNPPFS2s=;
	b=mnza5K0zBeQRxQFVIdvfI74Yjghuhnf66KURToYLiE/7DVD9eiCeHLMV/wARDVqyI8
	GMmTzpdLQY9K4C93mkOfCuVREZRsLR0hx+qlxWD8JjRkBFrjM2Ckvu30xuhrq29H3Hfm
	JK93G5IQ6MaulS1BW9o5MiFraj/GMbmAqEAQg=
Received: by 10.204.139.219 with SMTP id f27mr4206287bku.288.1317013363867;
	Sun, 25 Sep 2011 22:02:43 -0700 (PDT)
Received: from localhost.localdomain (ppp95-165-19-215.pppoe.spdop.ru.
	[95.165.19.215])
	by mx.google.com with ESMTPS id t13sm8055426fae.0.2011.09.25.22.02.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 22:02:43 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Sep 2011 09:02:38 +0400
Message-Id: <1317013358-19839-2-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1317013358-19839-1-git-send-email-antonynpavlov@gmail.com>
References: <1317013358-19839-1-git-send-email-antonynpavlov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [Qemu-trivial] [PATCH 2/2] gt64xxx.c: remove reference to
	non-existing ISD_handle field
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
X-List-Received-Date: Mon, 26 Sep 2011 05:02:49 -0000

The commit fc2bf44972349b078d8310466c3866615500e67f
removed ISD_handle field from struct GT64120State,
so remove the field from DPRINTF too.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/gt64xxx.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/gt64xxx.c b/hw/gt64xxx.c
index 1defb6d..35dc1cd 100644
--- a/hw/gt64xxx.c
+++ b/hw/gt64xxx.c
@@ -275,8 +275,9 @@ static void gt64120_isd_mapping(GT64120State *s)
     check_reserved_space(&start, &length);
     length = 0x1000;
     /* Map new address */
-    DPRINTF("ISD: "TARGET_FMT_plx"@"TARGET_FMT_plx" -> "TARGET_FMT_plx"@"TARGET_FMT_plx", %x\n", s->ISD_length, s->ISD_start,
-            length, start, s->ISD_handle);
+    DPRINTF("ISD: "TARGET_FMT_plx"@"TARGET_FMT_plx
+        " -> "TARGET_FMT_plx"@"TARGET_FMT_plx"\n",
+        s->ISD_length, s->ISD_start, length, start);
     s->ISD_start = start;
     s->ISD_length = length;
     memory_region_add_subregion(get_system_memory(), s->ISD_start, &s->ISD_mem);
-- 
1.7.5.4


