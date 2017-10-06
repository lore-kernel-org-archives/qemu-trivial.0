Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOn-0007GK-L3
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOl-0007DP-2L
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOk-000520-7S
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:19 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:49200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOg-0004yz-Jg; Fri, 06 Oct 2017 19:51:14 -0400
Received: by mail-qt0-x244.google.com with SMTP id o3so34343731qte.6;
	Fri, 06 Oct 2017 16:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t6PylHwwP4tyIHa16G3nTSUTK3+PoDs11uzf54Udm7s=;
	b=dNTzOZIzbO1pxogV9yer1Obeh1t5rpHfYUZgM+a8OCijfYhWoBN/Ko3ONMVvXi0Bq3
	E6D5mVdhgpUzk6ZIiRI4BHMzr6EDZ5Z0Y4jhNe/YbwTXh2PcCSY0QJxJtCDZt4osSlmv
	L9IrVGSTLI3M8FObQ3c0Y89iy+6ee5rxROfs9irRG26bjAjEOtqsKT2HrCKN8CDp0erT
	XA2ey2iqiCzbhF8ostMmuK1FwCnzpxEDO3pqfuirCZM/h7TXTFFC3Mh6qNGr2HAMRZrP
	gdfkQ0TT1jdqKMxy1O2ZB4R98R6VKfWQBjapeDd3ZTpn9l8M+XxPLJTzWoGftOQO7504
	ePnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=t6PylHwwP4tyIHa16G3nTSUTK3+PoDs11uzf54Udm7s=;
	b=cOqe2CnRqvf0weMDwU2aHgxxTEfV/4dM2oUa9HE/HuAPXo+60iXaanB6w7Bg0gi9pf
	PPOSyI5dJmcmETvQJeh5Lg/zX2v1soG6l0FVqR4tD4FVPthKQGAudFHIHuUwuz0X+Hzx
	6meITuQe5YZl/i0jAaEvlKAa5NgdrS0dOEAjwhfK6aqz6VZANdQfzkkZiT8CSl+L4YQj
	LOS8Yt6cvtq2aX56k1dRKT22i9Qj2zj5HN308rQThN17Slxiv5V35qcxnqomCl7o2ARp
	pt/u/dThKbnhXrGE9ew4uioJNVypfntm6R+ufWE+uAkbLlGJ6cvc65RXK7q3Wpz6xR2Q
	Romw==
X-Gm-Message-State: AMCzsaVGSe97PMo3PVezmKVYhKwf3Lc8g27sf/UrXVlqudVoYOX2al08
	HmSe4N7IX0RRvTIJDdI6qk0=
X-Google-Smtp-Source: AOwi7QBDO3HowqXhsmcgOO0hSJsJbz0AEFE6Xy3dmxTQs8mZEH10+yPWgLEqq4MQvyLWlzGGli2ggw==
X-Received: by 10.200.44.118 with SMTP id e51mr5501675qta.171.1507333874107;
	Fri, 06 Oct 2017 16:51:14 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:07 -0300
Message-Id: <20171006235023.11952-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 12/88] backends/hostmem: use g_new() family
 of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:20 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 backends/hostmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index ee2c2d5bfd..6a12f920c2 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -78,7 +78,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    *node = g_malloc0(sizeof(**node));
+    *node = g_new0(uint16List, 1);
     (*node)->value = value;
     node = &(*node)->next;
 
@@ -88,7 +88,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
             break;
         }
 
-        *node = g_malloc0(sizeof(**node));
+        *node = g_new0(uint16List, 1);
         (*node)->value = value;
         node = &(*node)->next;
     } while (true);
-- 
2.14.2


