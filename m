Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLv-0001C4-R7
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLk-0000hf-At
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLj-0006z6-AC
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29837
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLj-0006yo-6S
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHjWSXQJGHXqNSVRp2m+ndgaVWWtzd8pKBpNi2noriY=;
 b=Mpl3RDRywQ1UotyXVxOub0+Vjm+6EzGOtnbAPbpwBpSf9Oqcl/1SmJA3cRu4OaGhRR9ilp
 rw8oGpmPmogChHJINz9xavorxMSTIWhJHGUHGehdWckYJNr054YUXd5TqQQ+kdy9J85z+N
 5DOMy/LSV7a3gtYkDbdUcALiTp0HTWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-LDZpAb0HP_-jVWk62yYdjw-1; Wed, 04 Mar 2020 17:18:41 -0500
X-MC-Unique: LDZpAb0HP_-jVWk62yYdjw-1
Received: by mail-wr1-f69.google.com with SMTP id w11so1425845wrp.20
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37TekRuQ1Sj7bzipU9xMQGxHx7Oe/Uk9FNfgupkTT1U=;
 b=ZV20kag2DE2T/lPh5TPsJAwKDkKdsYGeITwddj/feqRokEelZTW6XnhR+vPP/IVUDs
 cgnOrj8ubvfRcuvxs6ET5u9sGcPWBS0rhJ5PHR4SyjtB3Gv5NhdkTVnGGMR7GSmNajqB
 CrRrt9qaOSJpmofsB8BbFvH/rorX+Tpq3imybTw10lJe8c7axo+16hWGeQbt8p53UwDT
 WMgOLcsDqllxk21KuvYfjW2efSG1/s8I3K/7BvyY70mPLK+IrXZSwUCKMoZ66/rE2l88
 YY7WB1OgmdJSRCbHGRnrVgOKeN5WBjSCOCw+/7Jf/PL137L+7DDoxVJ6jqqAh0Ua3rmg
 8hrw==
X-Gm-Message-State: ANhLgQ2KqOu+kQwGb1l2HnP1YErJI0WhhZ7mG3DuHLyEwDHQ5k+IC1qS
 wh6Zj+S4MVnLz84Epf+YKN2ix4bsxf27m21V0HIDoGjPrGp6SvQ2FP6NSocDq7NtdAZRDGR7e3x
 YuynOEYz/OM3rnGRhNw==
X-Received: by 2002:a1c:49d5:: with SMTP id w204mr5809807wma.55.1583360320034; 
 Wed, 04 Mar 2020 14:18:40 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtOyc7p4gYjJFDvQtmH81U0uCFCbPF2K0vdpDiKNOiykLu2BoveuujIYG0oQbz2cnxOnxpr4Q==
X-Received: by 2002:a1c:49d5:: with SMTP id w204mr5809777wma.55.1583360319639; 
 Wed, 04 Mar 2020 14:18:39 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b82sm6438319wmb.16.2020.03.04.14.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 6/6] ui/curses: Move arrays to .heap to save 74KiB of .bss
Date: Wed,  4 Mar 2020 23:18:07 +0100
Message-Id: <20200304221807.25212-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304221807.25212-1-philmd@redhat.com>
References: <20200304221807.25212-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2020 22:18:45 -0000

We only need these arrays when using the curses display.
Move them from the .bss to the .heap (sizes reported on
x86_64 host: screen[] is 64KiB, vga_to_curses 7KiB).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 ui/curses.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index 3bafc10c1c..a59b23a9cf 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -54,13 +54,13 @@ enum maybe_keycode {
 };
=20
 static DisplayChangeListener *dcl;
-static console_ch_t screen[160 * 100];
+static console_ch_t *screen;
 static WINDOW *screenpad =3D NULL;
 static int width, height, gwidth, gheight, invalidate;
 static int px, py, sminx, sminy, smaxx, smaxy;
=20
 static const char *font_charset =3D "CP437";
-static cchar_t vga_to_curses[256];
+static cchar_t *vga_to_curses;
=20
 static void curses_update(DisplayChangeListener *dcl,
                           int x, int y, int w, int h)
@@ -405,6 +405,8 @@ static void curses_refresh(DisplayChangeListener *dcl)
 static void curses_atexit(void)
 {
     endwin();
+    g_free(vga_to_curses);
+    g_free(screen);
 }
=20
 /*
@@ -783,6 +785,8 @@ static void curses_display_init(DisplayState *ds, Displ=
ayOptions *opts)
     if (opts->u.curses.charset) {
         font_charset =3D opts->u.curses.charset;
     }
+    screen =3D g_new0(console_ch_t, 160 * 100);
+    vga_to_curses =3D g_new0(cchar_t, 256);
     curses_setup();
     curses_keyboard_setup();
     atexit(curses_atexit);
--=20
2.21.1


