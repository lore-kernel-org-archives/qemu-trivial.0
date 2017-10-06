Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSg-0002d1-HM
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSc-0002Z8-P7
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSc-0008Iv-0g
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:18 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:56451)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSZ-0008F1-Qs; Fri, 06 Oct 2017 19:55:15 -0400
Received: by mail-qt0-x242.google.com with SMTP id 34so17244413qtb.13;
	Fri, 06 Oct 2017 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jUgAq/rANFUl3pqOXoOpjdwp9+jJcKT99eGcyhEwxm8=;
	b=BtGUvHExTVbLYWrJzcp9bVKk56AiZpTULOBc4TVOAQD0eJeX3fMcpcn/2xo1GEByFx
	m06uiOMK8yswvgSY3KbP/xGwi/WCmDbotfX575khazW5cgvd+HEoUbzylrQrafopioT6
	Y2Ih2nM5fR67xUs0ugMafVwBFc+LUST4+sfE4iPXu371Buz+EBQLjbmhVuiVLwR/H+KB
	PQETeloYzLbsstdcw2sQqLXNYFM5awF7RsGvDxdJee0tgA+lEoJXLInOMt3XbZXbUvjH
	c8ylBF4BWb63aIy40izfb3pk9Q4A5I72pCnVBVYEg/30YPaVRTMpJIqhyWrgW0iVGd74
	AJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jUgAq/rANFUl3pqOXoOpjdwp9+jJcKT99eGcyhEwxm8=;
	b=rGLRp0wGP0cEtQrgYJ4pKXygdvnA4chWxUvmnYqtWpsK0bzus4W8Lyl0Ofah6QXZCw
	YpQ714N7ATbB4ex5owZ6fP+nvHdbJgdrL2rCQIZ03bAlcUwjxBP5cnh2bAtg7gRUzt5M
	ZCl5TZ8K/QoU1xiVA014WiX6WiFRk/qJDx1GWGPuLVGIKwowkAmuVq0k85xd9KhOz93x
	+/5dovEtpxmvdE6uVBMF1mjp65UiY2jZtPsQRi0fX2ctEVnII8mCFQYYyP3pDHd+89mG
	H6tvWyh+aMnXnD8ov1BdshlSUkETPAyTaiF0JVzvyMrH23C4RkbhQYUBI12ZDj5GsqTa
	MTQw==
X-Gm-Message-State: AMCzsaUIez2p3mcbEQyftLtGD1SlJy0Lfe/mcyQvTKwYo7LHA6+SC/4G
	RaCTvi2U/ytn2iEMRm7Uzm4=
X-Google-Smtp-Source: AOwi7QCWTQYa+sSQEr2u/SAq6t97ArTIGBKBR+0SOdyK0u1mfdagxi9392p6INBjU4aIbwUsGg6r0g==
X-Received: by 10.237.33.203 with SMTP id m11mr5557180qtc.123.1507334115336;
	Fri, 06 Oct 2017 16:55:15 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:15 -0300
Message-Id: <20171006235023.11952-81-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 80/88] numa: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:19 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/numa.c b/numa.c
index 100a67febf..35df996738 100644
--- a/numa.c
+++ b/numa.c
@@ -66,7 +66,7 @@ void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node)
         return;
     }
 
-    range = g_malloc0(sizeof(*range));
+    range = g_new0(struct numa_addr_range, 1);
     range->mem_start = addr;
     range->mem_end = addr + size - 1;
     QLIST_INSERT_HEAD(&numa_info[node].addr, range, entry);
-- 
2.14.2


