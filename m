Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPK-0007rQ-CL
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPH-0007jD-ON
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPF-0005Lw-Af
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:50 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:49203)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPC-0005KP-Ua; Fri, 06 Oct 2017 19:51:46 -0400
Received: by mail-qt0-x242.google.com with SMTP id o3so34344958qte.6;
	Fri, 06 Oct 2017 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TSOIb6UWglCUSbOLZ6JOHx7L9Tkf9d3xpqZyVUtFJEU=;
	b=V2NZfTuS7DgggavRXy9usI8jU3rN7O2Q9GPdN2WBsGOermcCI0ZAMcHapngQZCQ5fq
	ofvDjZ5c/UJnuMTP6Xy9I9Yo/miW9EG5CtrftfNUIaE7yNwIaLsK7WFZ/Iwy8KBm4gM2
	5wXRzu0j9OfAaWhYltou7C+w1kYSOu4YywYlrmK25sdAU1OgENSJP759HipXIcCjIJwW
	gQ6J8IvCnyOGPawqi0wzkZL1zz4D4yv1oCqsbwcCcUxFMamITWyTFNOO9Gm0/LQTyqfe
	18FHRH1hioUppaY3xSXTIq6LmEcTnVwGV0Sw8xe+KuTdUk87YNJE5/yktVwBFiOR38UW
	10qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TSOIb6UWglCUSbOLZ6JOHx7L9Tkf9d3xpqZyVUtFJEU=;
	b=V00KP/XMuyA7ddNiigTP17voX5kCJiLwPteLOuwMcYTSSB03u13Vw7M3vwlyhShoAs
	u6NYoMUwFJ8VpuhC4ZLP5EVbZPGXu9W51RlXtudBdk1mB02EEyYOeYx9drC4oVBlo1Zv
	su2tKRW5cYmbtS6RnkOH1FiS/bn1NCSad2zBCVN5ACcLzQTH0KL4WVbQDEGwMW6rk3on
	z/xmDwu2KUMFNSeYFNJddtwW/4umutUz9x+fcb/YR8aKz8gXC4Shw9MLkBguRM6m75ND
	uVR2QPey9FgOsUYt7iK3fYnm8IVobTN8AS7oqMADq9ktunVtjfHEpcBzy/hCWvPLuYan
	K2gg==
X-Gm-Message-State: AMCzsaV0Zzd2AuDoqy80dRiiz7o+i7H9NOK0TRzht4A32a0SvVXbTuwQ
	lNl8ouJiIU/kpQw/FOtJdwo=
X-Google-Smtp-Source: AOwi7QBf6P0tD8uu9RNTw7GVPxB+TgHAcKcRCHrlPbBss9ui/XX3F5koQ7+SirrpG45XAAxk+oNEAA==
X-Received: by 10.200.22.231 with SMTP id y36mr5539624qtk.31.1507333906419;
	Fri, 06 Oct 2017 16:51:46 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:16 -0300
Message-Id: <20171006235023.11952-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 21/88] NBD: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:53 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 nbd/server.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 993ade30bb..b74cc6ab7e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1047,7 +1047,7 @@ NBDExport *nbd_export_new(BlockDriverState *bs, off_t dev_offset, off_t size,
 {
     AioContext *ctx;
     BlockBackend *blk;
-    NBDExport *exp = g_malloc0(sizeof(NBDExport));
+    NBDExport *exp = g_new0(NBDExport, 1);
     uint64_t perm;
     int ret;
 
@@ -1539,7 +1539,7 @@ void nbd_client_new(NBDExport *exp,
     NBDClient *client;
     Coroutine *co;
 
-    client = g_malloc0(sizeof(NBDClient));
+    client = g_new0(NBDClient, 1);
     client->refcount = 1;
     client->exp = exp;
     client->tlscreds = tlscreds;
-- 
2.14.2


