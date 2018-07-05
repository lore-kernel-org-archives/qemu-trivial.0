Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eW-0004UG-Ew
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eU-0004SI-OE
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eT-00057w-Vd
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:38 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:41967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eT-00057X-Qu; Thu, 05 Jul 2018 11:58:37 -0400
Received: by mail-qk0-x22a.google.com with SMTP id d22-v6so4726080qkc.8;
	Thu, 05 Jul 2018 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7jk0p4Rd3k4Rl38xTVYEubeLyAEXH/6lD0K5gtczN1k=;
	b=TQd4NmSVee9J6sYVVleRoHmvqW+mvXL6hIgqlC8bxK20fOTVgKpJuRJMDA5xbspSd4
	icm8V0X1ahZREGFkGJVuJbpbnWPy6Q7omVOZZNEGXmAYqAyoJrU6iMJVFhPFxvAzjvz+
	vfHdhhz8fKi9cj2DyF9hL5U4aw7sfcYEe/IL0/ZeBgNAkoMP8ALaAR3PlRAZSGG6NO5u
	IAv+lnfZUWxfqhv5my58ls6EDKx80PzX+qPLT2qT3R9ZhZzXvcmGLmSe9Ddyn73iPiEU
	vvOC9FaEfqqgitlEEk/aC58DtVxxUy7IUrFT9wnFNC7H6CapDmZ4XfyMdqXpJjIkmtir
	VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7jk0p4Rd3k4Rl38xTVYEubeLyAEXH/6lD0K5gtczN1k=;
	b=lgBiX6DGZBUL/lnF4H+8resudn2UJJwJ4Du4DENXSW+iaymgh3Tg8QBZReGlaebWie
	UCupGFGV5VtUNbqaRO4xIQHsPB2EXQgNVt5wb6oViv0BbP2N6LeNH0YngL7NCEufb5w5
	2LoXezM1kA5nx5n6ZiO0S1iiwB2jRHvuNBKJqnfB12zgSb35A52PU5o0lli3F+7q3rzL
	NO9IWxvTeq5IuY2YTiv6sBZByltr2bj8+wwUNB530bWnt7TCn12QSke/SoQY/MHbS1S2
	+lDzM4u+InWFEE59+hFi040/dD8SutXVLnfUuWIabYhtgeUfuEjZcZAhX7iFXAgnWGtG
	lZwg==
X-Gm-Message-State: APt69E1oSxqDnjDvHX2cA+NyZ97kzGStqTQK2RwJdKnk9sVkG4XBI6Px
	XNIn4r0d49JfRg6RgwkRGh5A4XTa
X-Google-Smtp-Source: AAOMgpf5cPkhlzFGQkiIoZm6nP/whZVtyBkMh6BeHCZaudgjAj08tlp60fqQ7FSpwgsGoeBj95ZpiQ==
X-Received: by 2002:a37:b507:: with SMTP id e7-v6mr5583091qkf.31.1530806317121;
	Thu, 05 Jul 2018 08:58:37 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu,  5 Jul 2018 12:58:09 -0300
Message-Id: <20180705155811.20366-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH v2 5/7] ui/vnc: Remove useless parenthesis
 around DIV_ROUND_UP macro
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:40 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 ui/vnc-enc-tight.c | 2 +-
 ui/vnc.c           | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index f38aceb4da..0b4a5ac71f 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -979,7 +979,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     }
 #endif
 
-    bytes = (DIV_ROUND_UP(w, 8)) * h;
+    bytes = DIV_ROUND_UP(w, 8) * h;
 
     vnc_write_u8(vs, (stream | VNC_TIGHT_EXPLICIT_FILTER) << 4);
     vnc_write_u8(vs, VNC_TIGHT_FILTER_PALETTE);
diff --git a/ui/vnc.c b/ui/vnc.c
index 359693238b..3361432a51 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2967,7 +2967,8 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
             PIXMAN_FORMAT_BPP(pixman_image_get_format(vd->guest.fb));
         guest_row0 = (uint8_t *)pixman_image_get_data(vd->guest.fb);
         guest_stride = pixman_image_get_stride(vd->guest.fb);
-        guest_ll = pixman_image_get_width(vd->guest.fb) * (DIV_ROUND_UP(guest_bpp, 8));
+        guest_ll = pixman_image_get_width(vd->guest.fb)
+                   * DIV_ROUND_UP(guest_bpp, 8);
     }
     line_bytes = MIN(server_stride, guest_ll);
 
-- 
2.18.0


