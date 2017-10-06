Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQn-0000ii-Dv
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQk-0000ff-7c
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQj-0006aN-AD
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:22 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:50913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQh-0006Xw-3Z; Fri, 06 Oct 2017 19:53:19 -0400
Received: by mail-qt0-x242.google.com with SMTP id f15so34352210qtf.7;
	Fri, 06 Oct 2017 16:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k0eXN00AQ8GTUou7mfAYYCN+s5gjdW17Nycg9K+gzqE=;
	b=f15xcgSU3SAjrh8Bza/5pgEWQ0zlTUrwouzuMn3UIfRcu/NcgCAGAYiQ5BmdPHXBAC
	XwvE/IFIw57SLWBA37PeX4z1cHgqntkrgv/rc51TSbSUczwnXeurqk8vhYbcoROVOjYB
	mvWf9tfC67Vbw/CDjwJYau8gltZ/QNOY6VPSPOIb9hPSJt8Bygp4a2T/xqbZ9pSbSxwq
	vZGlyz+VOslbC49AJ4n/0eBtIHz0Y7gl935M1Mi9QX9+kL/hWspj027oNZjjXpOWL9r0
	y1bRtq2ozlEd1DyEZ4bFbSgj0QXBlyyNXtPRoGuJ1l0q6oTH61ca9MboGcg5okouu22z
	fyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k0eXN00AQ8GTUou7mfAYYCN+s5gjdW17Nycg9K+gzqE=;
	b=pmQK4khPmXRhfUk7eg7yK0kaMfP0KeZS6TIWK3TeiMr6BMbqUh2BLZN7Kz172nBmQn
	aT4MTXEzLX30/a1duYfUtYBskkTRHksz/VAGzgdaf14qamSmYHqvwSUlOBK48xG8s5CG
	dwXSYC4vbc4o6+ac3fjt1hxlJgW8q937CJzw1zIA1VfOn76V6xzYI6r5prCNm6VwKQe4
	/zGbH+U7WDlSqxO+zlFWXe9ji8YCam1jq4vljeGZZTsCP3bLpDy7kZ6DAL3jSUbYwg7x
	NhHwCn1pKpciCdwDTZssPwLFZdLl20Lg1GFkz9aLz0vShZgjYdrtIKsqrOtloYaKSGh4
	IKpg==
X-Gm-Message-State: AMCzsaWBmUKYHZCupdgbAUOfxmF+fVTmGKFfoLSbRzSOI79hwWP+YEjz
	QW3tQU8i7GdWzBYGQaUa3z4=
X-Google-Smtp-Source: AOwi7QDFv+2ZjKBfRbAPLVhGzEF8ZbpFju2Trxgob2H3DIBf38VZHUuGLQIj2N7A4+chsbjNLgn1qg==
X-Received: by 10.200.56.108 with SMTP id r41mr5068034qtb.143.1507333998543;
	Fri, 06 Oct 2017 16:53:18 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"M : Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:43 -0300
Message-Id: <20171006235023.11952-49-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 48/88] hw/input: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:23 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed hw/input/pxa2xx_keypad.c]
---
Andrzej: can you add an entry for tsc2005.c in MAINTAINERS? (or tell me where)

 hw/input/pckbd.c         | 2 +-
 hw/input/ps2.c           | 4 ++--
 hw/input/pxa2xx_keypad.c | 2 +-
 hw/input/tsc2005.c       | 3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index c479f827b6..ef9e055b1d 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -465,7 +465,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask)
 {
-    KBDState *s = g_malloc0(sizeof(KBDState));
+    KBDState *s = g_new0(KBDState, 1);
 
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index dff3f1e024..3e8f5ee98d 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1296,7 +1296,7 @@ static QemuInputHandler ps2_keyboard_handler = {
 
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
-    PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
+    PS2KbdState *s = g_new0(PS2KbdState, 1);
 
     trace_ps2_kbd_init(s);
     s->common.update_irq = update_irq;
@@ -1318,7 +1318,7 @@ static QemuInputHandler ps2_mouse_handler = {
 
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
-    PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
+    PS2MouseState *s = g_new0(PS2MouseState, 1);
 
     trace_ps2_mouse_init(s);
     s->common.update_irq = update_irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 2b70bbb95c..016b095e94 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -310,7 +310,7 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
-    s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
+    s = g_new0(PXA2xxKeyPadState, 1);
     s->irq = irq;
 
     memory_region_init_io(&s->iomem, NULL, &pxa2xx_keypad_ops, s,
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index eb5320af40..34dd4ea0da 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -485,8 +485,7 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
-    s = (TSC2005State *)
-            g_malloc0(sizeof(TSC2005State));
+    s = g_new0(TSC2005State, 1);
     s->x = 400;
     s->y = 240;
     s->pressure = false;
-- 
2.14.2


