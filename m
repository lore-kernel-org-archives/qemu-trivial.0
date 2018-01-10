Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZKmL-0003Bz-G3
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jan 2018 13:07:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eZKmJ-0003Ai-1J
	for qemu-trivial@nongnu.org; Wed, 10 Jan 2018 13:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eZKmI-0004qb-3v
	for qemu-trivial@nongnu.org; Wed, 10 Jan 2018 13:07:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eZKmD-0004nO-O9; Wed, 10 Jan 2018 13:07:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B60A75C9D0;
	Wed, 10 Jan 2018 18:06:55 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-117-81.ams2.redhat.com [10.36.117.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A18B665608;
	Wed, 10 Jan 2018 18:06:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 10 Jan 2018 19:06:48 +0100
Message-Id: <1515607608-18250-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 10 Jan 2018 18:06:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui/sdl2: Ignore key repeats for shortcut keys
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
X-List-Received-Date: Wed, 10 Jan 2018 18:07:08 -0000

Holding down a shortcut key currently continuesly triggers the shortcut
event, e.g. holding CTRL-ALT-f continuesly switches between windowed and
fullscreen mode, or holding CTRL-ALT-u even crashes QEMU with a segfault.
This is ugly, we should rather ignore automatic key repeats when handling
the keyboard shortcuts.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/sdl2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8718cf3..18664b4 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -349,7 +349,7 @@ static void handle_keydown(SDL_Event *ev)
     }
     gui_key_modifier_pressed = mod_state;
 
-    if (gui_key_modifier_pressed) {
+    if (gui_key_modifier_pressed && !ev->key.repeat) {
         switch (ev->key.keysym.scancode) {
         case SDL_SCANCODE_2:
         case SDL_SCANCODE_3:
-- 
1.8.3.1


