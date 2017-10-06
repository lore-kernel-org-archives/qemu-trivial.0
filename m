Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOk-0007DK-VN
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOf-0007Al-Uu
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOf-0004ya-6N
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:14 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOd-0004xM-AX; Fri, 06 Oct 2017 19:51:11 -0400
Received: by mail-qt0-x241.google.com with SMTP id 6so25226992qtw.3;
	Fri, 06 Oct 2017 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gr3+CCvBB9HyJAmqrgGCtgfE3qzCQoKb90L1xybpd1I=;
	b=AxXer6TU/HtYBaEcidtI4EpRNUJSySKy2xNwnO44ZIZM3NbFm5gt9RnuR8xlJxrLJn
	nFqzjEPnkBj4D3iornzTXpoRphyz9fXDp5UBkcQzqvapuFhQJXZLSqYgdzyxqhGfZn0L
	gpCkXpENMw2b0N/SkbpEUAvmLeJ3X5znnoQMvKxxLhQY9GLeemnM5qgCzRkRlN6smAIn
	vINiDo9qPJFrp0EqzvuXuOsqet867/P4CcUC7+UP0dw313a2leSYaeHdBD/xpj38uiAU
	E0+d3Bjd0amHkLVfCwD+dUx3gJGP/7zln1plNMBX/eU/EHlsY67R+aNwvH6Heul0iJIW
	qUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Gr3+CCvBB9HyJAmqrgGCtgfE3qzCQoKb90L1xybpd1I=;
	b=msFYllPI33S7HpoGHBz7tashvVx8luST6D7yyQsqqV+mozRPtGkIzsKBsRZ7eqTr3Z
	QH5q6VCj5g/Kw41cCNudQdtdLo9Sa7wqYNposkFIBZ8fZUbzDJQ03OmgQZczpqRkvnuR
	EWPNPeExKxQufb37pmzXW3RQxqybCzCwfDEcUAQE1vpRFGiJipJn50SJDCsNQh0QwqPw
	XlaKP3+zEyS6u6tR6HlphIutZlbgiLH8I5VUBi7oQGzMTkAGZ41fF/nRic8hk/htYXGd
	buqKAJvXKMgFgGdH5Nqndeboz48ce8WhuhQDYaZLvqzJ1+3rUgK2rGL7lPP5s5ot0jTD
	kFrw==
X-Gm-Message-State: AMCzsaUuu2n+XrgnhhbgYuTeVndVnB1mNSEGu+TAZJHJhUhWWtkOVqTh
	rJpNPM7gNAdyZF57YUg+djI84zSx
X-Google-Smtp-Source: AOwi7QAuYf9Bd2wjOLzrHIcNzm+g8PHdCsO4WsC5z7a909pXh1Y/V2QUIT5pDcIuEMkPB3hTgeFQsA==
X-Received: by 10.200.63.167 with SMTP id d36mr5650146qtk.7.1507333870758;
	Fri, 06 Oct 2017 16:51:10 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gonglei <arei.gonglei@huawei.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:06 -0300
Message-Id: <20171006235023.11952-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 11/88] Cryptodev Backends: use g_new() family
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:17 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/cryptodev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 67edfa5328..44f693f58b 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -42,7 +42,7 @@ cryptodev_backend_new_client(const char *model,
 {
     CryptoDevBackendClient *cc;
 
-    cc = g_malloc0(sizeof(CryptoDevBackendClient));
+    cc = g_new0(CryptoDevBackendClient, 1);
     cc->model = g_strdup(model);
     if (name) {
         cc->name = g_strdup(name);
-- 
2.14.2


