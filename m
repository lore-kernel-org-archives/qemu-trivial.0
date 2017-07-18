Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLkP-0003H0-H4
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:12:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkM-0003Em-AZ
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkJ-0004J2-5g
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:38 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkJ-0004Io-16; Tue, 18 Jul 2017 02:12:35 -0400
Received: by mail-qt0-x243.google.com with SMTP id 19so1337172qty.1;
	Mon, 17 Jul 2017 23:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=B9nbaOcIa0Ribz6lYF/aBjlcU5ozMLJrrC5Cy2GCnso=;
	b=PFi6b0BSadF/3KoVcVvv+cYkqOcpn+hplp8tI+Zp/5Xcug68967jttvIA0hHiTs3Lo
	eqTD824Jw+EAxVDX26QvjfTMmCswoGr5Y85JiHaf11dxfXTs4j7vzItUkvHws7Plv6H6
	Prcv/e9pcV53QqDzuXXRXT/nYp5FNl0+VM6UYeQsmxfZGTKGdSHxhQgnE+PpBmJIT+6D
	EpGeeckkWh6pXZyIP6R1cXa6D4pO6pybNgbps1YWVY029HUi0wRhfYZg492sBQdpNZqd
	nyiSAQt7/PHB4h7yp4xA+lY1tktQ3nM1Ah9nPYiAQyg6SVEp0S5u4GD64HhiXW9oux3U
	kP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=B9nbaOcIa0Ribz6lYF/aBjlcU5ozMLJrrC5Cy2GCnso=;
	b=eRyV4DdWImBrY1OQsVVZEMHuZ/oERt3VTfZ00aW2XCRmOOooDBFoqCcsRxVg1VoAME
	Pt+abcXNYcKxVL8tvtKlXQ5z1JguxkA2EmqvX0B0hxRoX2ROo1FofXLV7As2A6pI/ZWy
	43Udt+ENou9pBTq//Oo++QHLI+dPJgoPWub/khAhitVhQpBofISs557MP7qxVnuNRQWW
	kqm1Pjl3ExWH8wPV9wrO0g1fyFUw2toSJx0X6AO3RQZG9lMnfNweCHXuVXyYluwVWsPK
	7lBNAczAMIAGyl0oo++z31ezPmh16Up+gm8k4D/qAoER88WgGWPYSTiw7VKa2uNRrGE2
	j9Fg==
X-Gm-Message-State: AIVw11248as2OeVbVwiXLBruwc4lqd/AyRgnVn6rNiJzNTnq8JGQm/M2
	GrzmdNkGdXVPHnC8yFy6xQ==
X-Received: by 10.237.53.176 with SMTP id c45mr1475996qte.191.1500358354358;
	Mon, 17 Jul 2017 23:12:34 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:12:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Tue, 18 Jul 2017 03:09:37 -0300
Message-Id: <20170718061005.29518-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 01/29] coccinelle: add a script to enforce
 qemu/osdep.h macros usage
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
X-List-Received-Date: Tue, 18 Jul 2017 06:12:39 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/use_osdep.cocci | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 scripts/coccinelle/use_osdep.cocci

diff --git a/scripts/coccinelle/use_osdep.cocci b/scripts/coccinelle/use_osdep.cocci
new file mode 100644
index 0000000000..356b36e358
--- /dev/null
+++ b/scripts/coccinelle/use_osdep.cocci
@@ -0,0 +1,60 @@
+// Use macros from qemu/osdep.h
+//
+// Copyright: (C) 2017 Philippe Mathieu-Daudé. GPLv2+.
+// Confidence: High
+// Options: --macro-file scripts/cocci-macro-file.h
+//
+// docker run --rm -v `pwd`:`pwd` -w `pwd` philmd/coccinelle \
+//     --macro-file scripts/cocci-macro-file.h \
+//     --sp-file scripts/coccinelle/add_osdep.cocci \
+//     --keep-comments --in-place \
+//     --use-gitgrep --dir .
+
+// Use QEMU_IS_ALIGNED()
+@@
+typedef uintptr_t;
+uintptr_t ptr;
+expression n, m;
+@@
+(
+-ptr % m == 0
++QEMU_PTR_IS_ALIGNED(ptr, m)
+|
+-n % m == 0
++QEMU_IS_ALIGNED(n, m)
+)
+
+// Use QEMU_ALIGN_DOWN()
+@@
+expression n, m;
+@@
+-n / m * m
++QEMU_ALIGN_DOWN(n, m)
+
+// Use ARRAY_SIZE()
+@@
+expression x;
+@@
+-sizeof(x) / sizeof((x)[0])
++ARRAY_SIZE(x)
+
+// Drop superfluous parenthesis
+@@
+expression n, m;
+@@
+(
+-(QEMU_IS_ALIGNED(n, m))
++QEMU_IS_ALIGNED(n, m)
+|
+-QEMU_IS_ALIGNED((n), m)
++QEMU_IS_ALIGNED(n, m)
+|
+-(QEMU_PTR_IS_ALIGNED(n, m))
++QEMU_PTR_IS_ALIGNED(n, m)
+|
+-QEMU_ALIGN_DOWN((n), m)
++QEMU_ALIGN_DOWN(n, m)
+|
+-(ARRAY_SIZE(n))
++ARRAY_SIZE(n)
+)
-- 
2.13.2


