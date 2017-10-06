Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOu-0007Lm-AF
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOs-0007JV-F4
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOp-00055J-C2
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:26 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:53646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOn-00054K-2V; Fri, 06 Oct 2017 19:51:21 -0400
Received: by mail-qt0-x244.google.com with SMTP id n61so6361497qte.10;
	Fri, 06 Oct 2017 16:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JdpHKL0Vafr+p5ghpOud2FOvXeUjkLarsFvUMM/s7zY=;
	b=jxak0Im1LI3skYaYSFypi83dGWgh8+Er7rnlBw5opL4Oobk/nl9bWYbE8S1c/OFrwC
	bt2MYTQE1SVR0jZpbRFU/0tjNDpeScWBIcAbsk+/XRMXkeaRbzxLkvYuze0//Rk70S3Y
	WCcVjp/aSm0mhTdxTo5H6drVUTgM5oP3cKjbFi6BpYi7SVbrsD5ziZSr42iQfSlHl1EG
	RGfgCNUcmI2DfxB+EIQDHoL1LDM03I4JLtRZHXWS84jcgxRfGNs0Rlc4awIDTBzR6lE/
	OPqgq5uYooaXxJtcWJrTFgwLiNDkeaCOVaDkLAJmnKgqA/qREbxh31ricZSvVb/SQIna
	CDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JdpHKL0Vafr+p5ghpOud2FOvXeUjkLarsFvUMM/s7zY=;
	b=bo+7D/bXFLs4HghAUfHeLQGR2UHo6zUqxExk/KBT9Y5TcL5DkRmedGL/e3yHfG8K7w
	LvpWO6GyDwTBnewPOWhOefXhpJcIE/eEA2VuDD3rHpipngPEKpOAxKJGkC9NHJRY1ooF
	9wZ54PC4wYkUH85RbY6N6LjnECacgmDHnv4mwZ7Xp9YSei+oOiTTKlOiKOxZFNssg537
	bBwZsUQ1JmtKn5A3DuV+LMUnwNEpeHxZrQQKOzTHb7U85hKuE1Jk2a7omxDPmhQ8ktxa
	Ack69BnqkHxgQo8z8QNlTXG37BUDb51sy0gaRQpdYZLjeBnmotboEeOIA2aTDut+ITJu
	xgLA==
X-Gm-Message-State: AMCzsaWmMucmMoNqHfH9yYeXU9KVTk3tO8WlvvQMZEaAsQ1IbqoJez+H
	VXgAH7GHo5+7OlXJkI1cyUI=
X-Google-Smtp-Source: AOwi7QCR6z8WRB/tZRZig7i1RlX3H/ZMPMFM0HEI94accrVX85SbndSCPxr5EhwBNMaNZIwG6vWTHw==
X-Received: by 10.237.37.76 with SMTP id w12mr174846qtc.201.1507333880574;
	Fri, 06 Oct 2017 16:51:20 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:09 -0300
Message-Id: <20171006235023.11952-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 14/88] ui/vnc: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:27 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: renamed 'Graphics' -> ui/vnc, added ui/vnc.c and ui/vnc-palette.c]
---
 ui/vnc-enc-tight.c | 2 +-
 ui/vnc-palette.c   | 2 +-
 ui/vnc.c           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index f38aceb4da..48ec584098 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -1475,7 +1475,7 @@ static int send_sub_rect(VncState *vs, int x, int y, int w, int h)
 #endif
 
     if (!color_count_palette) {
-        color_count_palette = g_malloc(sizeof(VncPalette));
+        color_count_palette = g_new(VncPalette, 1);
         vnc_tight_cleanup_notifier.notify = vnc_tight_cleanup;
         qemu_thread_atexit_add(&vnc_tight_cleanup_notifier);
     }
diff --git a/ui/vnc-palette.c b/ui/vnc-palette.c
index dc7c0ba997..284e118715 100644
--- a/ui/vnc-palette.c
+++ b/ui/vnc-palette.c
@@ -56,7 +56,7 @@ VncPalette *palette_new(size_t max, int bpp)
 {
     VncPalette *palette;
 
-    palette = g_malloc0(sizeof(*palette));
+    palette = g_new0(VncPalette, 1);
     palette_init(palette, max, bpp);
     return palette;
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 9f8d5a1b1f..b021fb398b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -231,7 +231,7 @@ static VncServerInfo *vnc_server_info_get(VncDisplay *vd)
         return NULL;
     }
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(VncServerInfo, 1);
     vnc_init_basic_info_from_server_addr(vd->lsock[0],
                                          qapi_VncServerInfo_base(info), &err);
     info->has_auth = true;
@@ -316,7 +316,7 @@ static VncClientInfo *qmp_query_vnc_client(const VncState *client)
     VncClientInfo *info;
     Error *err = NULL;
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(VncClientInfo, 1);
 
     vnc_init_basic_info_from_remote_addr(client->sioc,
                                          qapi_VncClientInfo_base(info),
@@ -3047,7 +3047,7 @@ void vnc_display_init(const char *id)
     if (vnc_display_find(id) != NULL) {
         return;
     }
-    vd = g_malloc0(sizeof(*vd));
+    vd = g_new0(VncDisplay, 1);
 
     vd->id = strdup(id);
     QTAILQ_INSERT_TAIL(&vnc_displays, vd, next);
-- 
2.14.2


