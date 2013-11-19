Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VirW1-0008SK-0U
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2013 15:03:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VirVt-0008Rp-Lh
	for qemu-trivial@nongnu.org; Tue, 19 Nov 2013 15:03:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VirVn-0000s5-K5
	for qemu-trivial@nongnu.org; Tue, 19 Nov 2013 15:03:09 -0500
Received: from fldsmtpe02.verizon.com ([140.108.26.141]:21503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1VirVn-0000rx-F8; Tue, 19 Nov 2013 15:03:03 -0500
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi03.verizon.com) ([166.68.71.145])
	by fldsmtpe02.verizon.com with ESMTP; 19 Nov 2013 20:02:00 +0000
From: Don Koch <dkoch@verizon.com>
X-IronPort-AV: E=Sophos;i="4.93,731,1378857600"; d="scan'208";a="596053466"
Received: from unknown (HELO MIA20725CAS892.apps.tmrk.corp) ([162.47.0.51])
	by fldsmtpi03.verizon.com with ESMTP; 19 Nov 2013 20:02:00 +0000
Received: from yoyo.cloudswitch.com (10.25.25.113) by
	MIA20725CAS892.apps.tmrk.corp (10.1.3.224) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 19 Nov 2013 15:01:59 -0500
Message-ID: <528BC3B7.2090205@terremark.com>
Date: Tue, 19 Nov 2013 15:01:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial
	<qemu-trivial@nongnu.org>, Anthony Liguori <aliguori@amazon.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.108.26.141
Subject: [Qemu-trivial] [PATCH v2] Don't crash on keyboard input with no
	handler
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
X-List-Received-Date: Tue, 19 Nov 2013 20:03:16 -0000

Prevent a call to put_kbd if null.

On shutdown of some OSes, the keyboard handler goes away before the
system is down. If a key is typed during this window, qemu crashes.

Signed-off-by: Don Koch <dkoch@verizon.com>
---
v2: punt printf()

 ui/input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/input.c b/ui/input.c
index 10d8c05..1c70f60 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -414,7 +414,7 @@ void kbd_put_keycode(int keycode)
     if (!runstate_is_running() && !runstate_check(RUN_STATE_SUSPENDED)) {
         return;
     }
-    if (entry) {
+    if (entry && entry->put_kbd) {
         entry->put_kbd(entry->opaque, keycode);
     }
 }
-- 
1.8.1.4


