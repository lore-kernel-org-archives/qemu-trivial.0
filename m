Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSx-0002tM-VY
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSw-0002rV-4Y
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSv-0000EH-I9
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:38 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSt-0000Ba-L5; Fri, 06 Oct 2017 19:55:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id z12so9702454qkb.0;
	Fri, 06 Oct 2017 16:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zx9Yv1rXev8ni/gFyCEvG5EolqzbzAdH4XpesCfpiZI=;
	b=MAjy37BHYEn8l3Bn6jKIO8Jk1Bh5HAZQ9jF34V9yPZDeanG49+DwB+WRG4clTYuBxi
	jpevIC+DY6X6SEXuTzf5LXCqYSLX/RjiindPppfD6BpEH/+tvabGypEFW2nTDQf883f3
	WWgo5Mr3RCIj2ffnRjnB30h6wNtUO8CDFY767pS7IBJJloQDkI6KM0Ff49lr4/z7BdVs
	B4Uqa3k9TRg5HbfViZRa5kUsffl/xyvgcKX3j2X+UeThPdVYOyStV7H/jRFS9unjaX36
	YXlmZxEfHOAy7aFgl9NCch9JHRmlsWwov1WyJCbVyuJWQdXKaT44+zootD49ijK1NByl
	crng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zx9Yv1rXev8ni/gFyCEvG5EolqzbzAdH4XpesCfpiZI=;
	b=UkCgClgCsS669BQgc7M/xx9ui7R1mFF25vSwzDVI4QMJ2FI9OeTjJseaV9RxyrL6iO
	E9RwGO/yKRcNJIvGxmaRYL6PZ9g5ykiYRgMgg7PNYewssKkEvAZboIFtSTE9mEEGd5vS
	VN+mjzs6jSTTUtaansXGXC7SAGMqoBh7Cr5KSLdnHp7Hr47XE/MPqxTr/Ef7pa35wCG/
	v1OwlhMM7/uB7W3ct/RqwpqWqZwcyGU/uxO4+pOH+nWPkWRZL9CLBDBV64MVESV5iC1k
	yGNIdkBUK2JHl6i0reqAGEVRVeY2YZDuEpLxwhXXoF3IDO4iQXKBAMErCvO0Vw4BXfJy
	Tc1Q==
X-Gm-Message-State: AMCzsaWGzWehu72W59jS0g+lF6TPgCKvts5g7Mgjydw7vSWUmPSu67SG
	6sP7uXJY90kywCNGSWkqD6c=
X-Google-Smtp-Source: AOwi7QBeui9q774tQc8bRbCbPQWwpcZWLf+k2MEQKcYu8VJev3V1r/jgCy3jkPJfWM1aqT3gSifDGw==
X-Received: by 10.55.181.129 with SMTP id e123mr771327qkf.128.1507334135133;
	Fri, 06 Oct 2017 16:55:35 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:21 -0300
Message-Id: <20171006235023.11952-87-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 86/88] net/hub: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:39 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 net/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/hub.c b/net/hub.c
index 14b4eec68f..1c403859c6 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -79,7 +79,7 @@ static NetHub *net_hub_new(int id)
 {
     NetHub *hub;
 
-    hub = g_malloc(sizeof(*hub));
+    hub = g_new(NetHub, 1);
     hub->id = id;
     hub->num_ports = 0;
     QLIST_INIT(&hub->ports);
-- 
2.14.2


