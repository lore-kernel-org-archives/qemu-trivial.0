Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOg-0007BL-Lt
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOd-00078K-LU
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOc-0004x8-SZ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:11 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:54803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOa-0004vF-Ee; Fri, 06 Oct 2017 19:51:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id i13so34322831qtc.11;
	Fri, 06 Oct 2017 16:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZOe/uBesE5oQrH2gITAOw1oHGOzwjO+th/DgyqiJanw=;
	b=nPJ9PIJRjudcPAY/oixx5n8jfOIcs94dl2pKGX/S1RwwCMOr3b92pcLkxY2KLGphOm
	yzPbElIazm2inKWGOsQgXrZoeCM6zsBlQiF3L7+d0MwxgnQSwfHxjUYg4WztyKyK1dxn
	b5/O7DpohLGRAxfY4W5/+Da/lkdvymcOrZck0GBDLCgMELnn53BcLas9aYRbikK721O6
	NIKijiVi972SAnQ6B7Ih8DDvrePL5L2uFAmkyJXYZb2Sc37Dv+ZvfmqgOPKOyvA1W+Zw
	mE07vSTGwWJCRrICpzjqtjsWmRAyIgwc9rdY/CT4ZnvyrWnmyipRXRcIscYjVA0BlCMr
	pn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZOe/uBesE5oQrH2gITAOw1oHGOzwjO+th/DgyqiJanw=;
	b=nFwbnINg17XDV8BkLluDZk2Oj5YUw2d5U6lmbWizFqW70JsI9vHyaK0CM9kbQcAYWC
	0Gt7AOC8KpRJoUWmEslZhFAhNlg22HpEeF7yqrzn5w1mEz1iT9142mV6YKIp+9cmkwt+
	Kx8JKdFm70pm2v7RQ5fUnLwkgPm6v3aL+EEWsPjhLXlJ40oyH6JFvC0ENMK4Lm83fYLX
	s1zvvNRN6Z2jHYzX/qP7obzFg3VVLXy/VhEMoHjIpjmVzb3ChsKX1DD952ExhkBZyynv
	K3jkyEGxDHd8VRJJQZOathsw03Ixpw5+E5/LApB97Cob500R1pAl/BJFjBpMs/8mEw90
	Luiw==
X-Gm-Message-State: AMCzsaUxmoOimdki12O7MHjkgWYmnZW36NN5IBGFotxMxiod5hyN800x
	qH3qxls6kSkXdhxmOAclq7A=
X-Google-Smtp-Source: AOwi7QCLxKFG+HWYG1MaNy4ipWJr3UyPOGTjinQU6iUdgpJil/TGQ8LxS/NexP4slR2JQjjtApirlg==
X-Received: by 10.200.39.205 with SMTP id x13mr5236262qtx.287.1507333867948;
	Fri, 06 Oct 2017 16:51:07 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:05 -0300
Message-Id: <20171006235023.11952-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 10/88] Character devices: use g_new() family
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:12 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed PC Chipsets: parallel + serial]
---
 hw/char/parallel.c  | 2 +-
 hw/char/serial.c    | 4 ++--
 hw/char/sh_serial.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index f79dc76543..da8566538e 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -614,7 +614,7 @@ bool parallel_mm_init(MemoryRegion *address_space,
 {
     ParallelState *s;
 
-    s = g_malloc0(sizeof(ParallelState));
+    s = g_new0(ParallelState, 1);
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     s->it_shift = it_shift;
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 376bd2f240..dcc25d649f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -978,7 +978,7 @@ SerialState *serial_init(int base, qemu_irq irq, int baudbase,
 {
     SerialState *s;
 
-    s = g_malloc0(sizeof(SerialState));
+    s = g_new0(SerialState, 1);
 
     s->irq = irq;
     s->baudbase = baudbase;
@@ -1034,7 +1034,7 @@ SerialState *serial_mm_init(MemoryRegion *address_space,
 {
     SerialState *s;
 
-    s = g_malloc0(sizeof(SerialState));
+    s = g_new0(SerialState, 1);
 
     s->it_shift = it_shift;
     s->irq = irq;
diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 835b5378a0..0d1a67d450 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -365,7 +365,7 @@ void sh_serial_init(MemoryRegion *sysmem,
 {
     sh_serial_state *s;
 
-    s = g_malloc0(sizeof(sh_serial_state));
+    s = g_new0(sh_serial_state, 1);
 
     s->feat = feat;
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
-- 
2.14.2


