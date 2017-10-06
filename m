Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQ3-0008WH-PG
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ1-0008Th-Jk
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ0-0005x2-RO
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:37 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPx-0005vC-2i; Fri, 06 Oct 2017 19:52:33 -0400
Received: by mail-qt0-x242.google.com with SMTP id o52so34324241qtc.9;
	Fri, 06 Oct 2017 16:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bw7665vpljTXEkTpy+0QhVuCAEzaJ+jXXbYxz5ZxUMo=;
	b=fskHiP1WnzTe2UAIltLkhg+glt3D63bhriP0K31lJ0dn9FNud7+LMIXaoTE/bo2VC2
	JQEv1/z7zZDu9kA0EuIxNd1czJSLEScaDqKNLdeWf2YJc2YNIQKAAWHWlezYmqAM7sd/
	cU9cp8fGMWlmnz6MDH2y1vZI48MfjbiCNmFJS9r0Nplvy9xkmijLCEQabPmc3grbc/Jx
	Zv971bKfs1pCeYozWgD3AQpwE6Vv9R9MVCDFnW3wCfOscbWuwTqpmB+YPwRYAnbY9dPi
	HiVH5eybFdpPjupU7aPtPbNQNfqjEjzRxVOMjtEHGyx9clg8IB33oddUSLn8YTjaOr53
	3pLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=bw7665vpljTXEkTpy+0QhVuCAEzaJ+jXXbYxz5ZxUMo=;
	b=RaVaFmoXhLOCmmIpSzdhjuMfTrruzMx1XCoLxXeRe4m+ND77xCVMqkOkoWz14GC9yh
	w6QIDQOpWgisOHKde4qD/Akat//VyIgmtQX0IgjfX6zYOyL6aUtzCZ2BUScM7aCzu3rc
	Rqna8VnP835/lTx7P76XFghxkLl2ZBMF77XE7jBfPwi09btFXc9bsNk7cw3016TaNJbK
	kq4Zbl8aVPgN43+CUzDjdxNftKK4Mcjls8PqArlIjo3btG0r4LonNpbmlK24P0ZfecQ1
	cfeh79Aighpig8lqmnIbIzQuKgT0xtsOaCmFIOLppYIwGUecoK6ixDv7aYfmyn8gyxIU
	XTHQ==
X-Gm-Message-State: AMCzsaVS2FXu4swI7Nz1ClGT0qUkjU3e4+OcPOqnAr2fmcKXZ4HDLQDl
	Be1F4Ma7TJ1mMTOH3dZsFuo=
X-Google-Smtp-Source: AOwi7QAUHsFFevavnLr1++yXnx/Xrq/uiVb/ZPMSdRZBsLzjbe8We5HCWzO3D2YnHfAzgVfOWXyBZQ==
X-Received: by 10.200.44.167 with SMTP id 36mr5580503qtw.285.1507333952537;
	Fri, 06 Oct 2017 16:52:32 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:30 -0300
Message-Id: <20171006235023.11952-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 35/88] Record/replay: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:38 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 replay/replay-char.c   |  4 ++--
 replay/replay-events.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/replay/replay-char.c b/replay/replay-char.c
index cbf7c04a9f..b8ed5c51d1 100755
--- a/replay/replay-char.c
+++ b/replay/replay-char.c
@@ -51,7 +51,7 @@ void replay_register_char_driver(Chardev *chr)
 
 void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
 {
-    CharEvent *event = g_malloc0(sizeof(CharEvent));
+    CharEvent *event = g_new0(CharEvent, 1);
 
     event->id = find_char_driver(s);
     if (event->id < 0) {
@@ -86,7 +86,7 @@ void replay_event_char_read_save(void *opaque)
 
 void *replay_event_char_read_load(void)
 {
-    CharEvent *event = g_malloc0(sizeof(CharEvent));
+    CharEvent *event = g_new0(CharEvent, 1);
 
     event->id = replay_get_byte();
     replay_get_array_alloc(&event->buf, &event->len);
diff --git a/replay/replay-events.c b/replay/replay-events.c
index 94a6dcccfc..c72dcaa708 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -128,7 +128,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
         return;
     }
 
-    Event *event = g_malloc0(sizeof(Event));
+    Event *event = g_new0(Event, 1);
     event->event_kind = event_kind;
     event->opaque = opaque;
     event->opaque2 = opaque2;
@@ -239,17 +239,17 @@ static Event *replay_read_event(int checkpoint)
         }
         break;
     case REPLAY_ASYNC_EVENT_INPUT:
-        event = g_malloc0(sizeof(Event));
+        event = g_new0(Event, 1);
         event->event_kind = read_event_kind;
         event->opaque = replay_read_input_event();
         return event;
     case REPLAY_ASYNC_EVENT_INPUT_SYNC:
-        event = g_malloc0(sizeof(Event));
+        event = g_new0(Event, 1);
         event->event_kind = read_event_kind;
         event->opaque = 0;
         return event;
     case REPLAY_ASYNC_EVENT_CHAR_READ:
-        event = g_malloc0(sizeof(Event));
+        event = g_new0(Event, 1);
         event->event_kind = read_event_kind;
         event->opaque = replay_event_char_read_load();
         return event;
@@ -259,7 +259,7 @@ static Event *replay_read_event(int checkpoint)
         }
         break;
     case REPLAY_ASYNC_EVENT_NET:
-        event = g_malloc0(sizeof(Event));
+        event = g_new0(Event, 1);
         event->event_kind = read_event_kind;
         event->opaque = replay_event_net_load();
         return event;
-- 
2.14.2


