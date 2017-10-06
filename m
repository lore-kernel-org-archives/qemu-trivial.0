Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQu-0000mU-Fy
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQs-0000kX-Nx
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQr-0006dS-Ue
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:30 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQn-0006c0-Pe; Fri, 06 Oct 2017 19:53:25 -0400
Received: by mail-qk0-x243.google.com with SMTP id z14so12861450qkg.3;
	Fri, 06 Oct 2017 16:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O9bKfudW6f8SNHCIhSKJI9NDcD4/xEssUfEFcjfdl6A=;
	b=kfnMle9lNyryo9JVBRMVPhGOwuU245wLYMNfGtjPtJoaOZpIWmIXqWZpJxK6I1gtE6
	GLNscjUSKt1XqM9kZhFfWuu1iLBAo4j7f5o2NcfVJF/C646LSVGiZ+MfcldmxZsbZyQq
	WS6aig2MGKG7n8y16Jes7vfp+hJNYVYoA9hUM0+x2wUeo92t/e1G42Tk7WpdPrTMqfnS
	V3JJLLyupraMsnPCWjHVIHnzpSx1TaR0ZqVoopwaccf46IvSKFQFjrf6OvyADTmT2FU5
	HvVhAXydeh9c9Rz+Yfz4ohKWMun4tX85Zfnewdb6rh+BmaMFVOIiaHX8jFMBl62b91x9
	iGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=O9bKfudW6f8SNHCIhSKJI9NDcD4/xEssUfEFcjfdl6A=;
	b=FtxfijK7nejO2alD53INHEQrhrMc1Ncw1wEwebdtivQdf+XmG9sjuQI2NKaNK0EghT
	SADRBeRwwrcbBRz7DYTeGUGCGi8kfvbs1ynEf6Ry/jlRuq4D+MdLZtejtFFV0KIGEl4Q
	UFwmsuQ8JIf2n8vXAQCKPjfuOkwfNxNdm17TCJD34B7t1M34JtUZrJsolvI9X6LMLyO0
	RJNXVo03Z89qz27gLVzFfZTzzunu9+Wb4sxa79SXIBEAbMM5rH5LjHNKlKO/hH8PYRz3
	4kXmG3yJIeYs0QD5Mcv13tEWx2h6LskSCBfwWtkYSs5mL/++OF7O+nRyY73fe12g+nTh
	oKsg==
X-Gm-Message-State: AMCzsaUmLipnDU7adj25rHc5pxcnl1kWo0NwiuY/komjc7v0Bv3lV5cA
	kY5sBZHUkfu0kgHtq96QXC4=
X-Google-Smtp-Source: AOwi7QBIkJxOpkQ7aXI9n0YCVYFfrAGcDE+rWhrx/tPCmCdPQsZrJ2mL1QmgqbUdzVcYn6fuhYxILA==
X-Received: by 10.55.22.38 with SMTP id g38mr730372qkh.98.1507334005255;
	Fri, 06 Oct 2017 16:53:25 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:45 -0300
Message-Id: <20171006235023.11952-51-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 50/88] ivshmem: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:31 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index b3ef3ec1e3..9dd432a295 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -429,7 +429,7 @@ static void resize_peers(IVShmemState *s, int nb_peers)
     assert(nb_peers > old_nb_peers);
     IVSHMEM_DPRINTF("bumping storage to %d peers\n", nb_peers);
 
-    s->peers = g_realloc(s->peers, nb_peers * sizeof(Peer));
+    s->peers = g_renew(Peer, s->peers, nb_peers);
     s->nb_peers = nb_peers;
 
     for (i = old_nb_peers; i < nb_peers; i++) {
@@ -753,7 +753,7 @@ static void ivshmem_reset(DeviceState *d)
 static int ivshmem_setup_interrupts(IVShmemState *s, Error **errp)
 {
     /* allocate QEMU callback data for receiving interrupts */
-    s->msi_vectors = g_malloc0(s->vectors * sizeof(MSIVector));
+    s->msi_vectors = g_new0(MSIVector, s->vectors);
 
     if (ivshmem_has_feature(s, IVSHMEM_MSI)) {
         if (msix_init_exclusive_bar(PCI_DEVICE(s), s->vectors, 1, errp)) {
-- 
2.14.2


