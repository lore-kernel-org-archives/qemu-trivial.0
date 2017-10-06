Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOf-0007AA-EJ
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOc-00076Z-7V
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOb-0004vy-FV
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:10 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43024)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOX-0004su-7m; Fri, 06 Oct 2017 19:51:05 -0400
Received: by mail-qt0-x243.google.com with SMTP id a43so28407500qta.0;
	Fri, 06 Oct 2017 16:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QFQO2pEGeljoVMreopkHiTyK9sShOOuO55Xl79EuYfs=;
	b=vPdbVXAlpUAiP2vA827EXNZTjJYpLgoyClHnxuXmAo6wsCcS5rcQpZ1y49UnlJvI2m
	ZE42ozAJ+QuwBYr33e99JpPQq/03YBxXJcmgQOD0fFrvsZRfmJ51sGS4Q0paOfEJHVms
	I6wHhA8cqyrcMCF/BZsUYFrPrlNcu4k4MqpcTVqHqe5R6dXttqS1Kic1Bjg3rsfbyLso
	JKeQGK5fLiVS1Q6uWnLKw34ZWHZL2wQPWZzH3u51LYM5e8ydNQ3dMouiYbwF5+uTKK8L
	t2bdgGrHe0RUrowhe2BPrepWl77hMWpmjtfjGFuDJJ3/nSvUj/gQMwEJ1qrue3ZO1Lsl
	UO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QFQO2pEGeljoVMreopkHiTyK9sShOOuO55Xl79EuYfs=;
	b=hj4ASAZQp+WhOICoJKqcWmY8otbwkajLw/Ek5MQGmQcC7ljVzbkOYqWvAm0p5HQQWj
	hqBYKeaic3d7IYF2gTJcTcUjTfOMnS8CWdnFg5DyZ34l2zzOJ7qyJ0frWD58uA+P4bOv
	uPxyBBlZymvwPzpcyNYcpGFsB5M6qkqwVl1Usqe4Jkt9//XCXOTrnpG9d9HR28QlBMj4
	ldzkQuH2H5PYiTVmlGI+57YK/6AGmW13PcZzi5BABobJ+GGkxGxGy0Z3YtnTzBXdJrI4
	WhOo+Ng1ze0iGYSCU0rqdT3uigamDQ5pIFf3jlqkuu5UkOUs6q70V04pkSWptuQDD+6v
	dXPQ==
X-Gm-Message-State: AMCzsaUghgelLAxmQ3rVU7+G5SRca1UIcA5HoTMePaaRGT5Hh3SofXRO
	xTBvmQorSuMtV9wAhOA8X1A=
X-Google-Smtp-Source: AOwi7QCHU6SrjGR1gqvq5LuXila7CSIaBptadmXRMdDeWHuCqCE9a6H1tsjUr1UEnNZhE1CmYJ7vEg==
X-Received: by 10.200.8.53 with SMTP id u50mr5631925qth.260.1507333864658;
	Fri, 06 Oct 2017 16:51:04 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gonglei <arei.gonglei@huawei.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:04 -0300
Message-Id: <20171006235023.11952-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 09/88] Bootdevice: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:11 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 bootdevice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bootdevice.c b/bootdevice.c
index 1141009114..a2936503da 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -165,7 +165,7 @@ void add_boot_device_path(int32_t bootindex, DeviceState *dev,
 
     del_boot_device_path(dev, suffix);
 
-    node = g_malloc0(sizeof(FWBootEntry));
+    node = g_new0(FWBootEntry, 1);
     node->bootindex = bootindex;
     node->suffix = g_strdup(suffix);
     node->dev = dev;
-- 
2.14.2


