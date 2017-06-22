Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dNwkA-0005jZ-GK
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 03:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1dNwk8-0005hv-30
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 03:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1dNwk7-0007Hs-BJ
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 03:41:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:38319 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1dNwjs-0007CH-2q; Thu, 22 Jun 2017 03:41:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 041C9ABF2;
	Thu, 22 Jun 2017 07:41:12 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu, 22 Jun 2017 09:41:35 +0200
Message-Id: <1498117295-162030-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: [Qemu-trivial] [PATCH] hid: Reset kbd modifiers on reset
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
X-List-Received-Date: Thu, 22 Jun 2017 07:41:33 -0000

When resetting the keyboard, we need to reset not just the pending keystrokes,
but also any pending modifiers. Otherwise there's a race when we're getting
reset while running an escape sequence (modifier 0x100).

Cc: qemu-stable@nongnu.org
Signed-off-by: Alexander Graf <agraf@suse.de>
---
 hw/input/hid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index 93887ec..0d049ff 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -487,6 +487,7 @@ void hid_reset(HIDState *hs)
         memset(hs->kbd.keycodes, 0, sizeof(hs->kbd.keycodes));
         memset(hs->kbd.key, 0, sizeof(hs->kbd.key));
         hs->kbd.keys = 0;
+        hs->kbd.modifiers = 0;
         break;
     case HID_MOUSE:
     case HID_TABLET:
-- 
1.8.5.6


