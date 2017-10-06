Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRk-0001eG-Rq
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRj-0001cM-2o
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRi-0007Nq-B2
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:23 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRe-0007Je-1m; Fri, 06 Oct 2017 19:54:18 -0400
Received: by mail-qk0-x244.google.com with SMTP id z14so12862194qkg.3;
	Fri, 06 Oct 2017 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ojw9HEM77nCTJ0wr1WnMr5fYm5yldE5FoKqI3zTeQUg=;
	b=QIrMAbViWSO5gZiMb+q4GmbLVG6thsrzPMifvdq3J05sfj988YzrvihJgE0rAwIAXT
	//LAgzeQdoUxHQwM0IIcU1V+Q9378g2cQm0fSaP5TTjY9wHcl+KJvlc1WMOHSm667wGn
	VfqhPaH7OZONgshtbUMx3xsRGXqJ7KT67Bio3HaWOSHooZ8cKJ9CtJk1f1siep/foWNU
	LJxrXy/rRFVThMpxYGNu5XFrqNwFDZyXMyn59N9bakO6xflkbEMyDWdbHgnZlr9wncso
	p5bBHBcQ9URwn9oHmGj/Mp2u/pGMFGcj0JthivVRkGrokMTla6lvXrq2SJ3BQHLWJMQg
	nK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ojw9HEM77nCTJ0wr1WnMr5fYm5yldE5FoKqI3zTeQUg=;
	b=MXuz9u3F7tfs3PBwHLkhBf1EUqx0+HVIWol2bs1RrB9hD5ATemr8ZGfG31waZwJSN4
	0NK15kcpj5zBIMU3UaIIVufjsNIO3wZXcGggn3rCNUDcYWDtB2Q88xrFZHS7ACmOzBB/
	pC1Cu1/0SKca5fTL8SF8+4jJlUv3Sdku78uSHWWgEgAMmJT3qT9fE1u20J7NL0tYDT9+
	pNilSpTvyVDA/EPNWSnL/WiqDd5MuMNGgN10lw4D7/fYOheAfRKHpcg9+XNDvJvszSVd
	Gs8XwJ4k9j6f28YKRIJY3uvohJT+HEfbi0nv+bdGYPEzBLiNIiU+udHmpJ/1p5Ev6zly
	ydww==
X-Gm-Message-State: AMCzsaUmJUHdqvBMYGTE4XVSD6lxTPGeiMDzprs+wPyKHgyZirhCfUNl
	oPWgKi5a3hrvzwsaqfFYv8E=
X-Google-Smtp-Source: AOwi7QDXfZ4PiXxASegeEzDtJ21zOzmDJLhVvaBSZzbkbcYq9jIwrauXoNGPf3MWYBP1fEE1QI1wMA==
X-Received: by 10.55.100.67 with SMTP id y64mr735735qkb.252.1507334057519;
	Fri, 06 Oct 2017 16:54:17 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:59 -0300
Message-Id: <20171006235023.11952-65-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 64/88] user: use g_strfreev()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:24 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 bsd-user/main.c   | 6 +-----
 linux-user/main.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 836daac15c..fb0a4e48cb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -947,11 +947,7 @@ int main(int argc, char **argv)
         _exit(1);
     }
 
-    for (wrk = target_environ; *wrk; wrk++) {
-        g_free(*wrk);
-    }
-
-    g_free(target_environ);
+    g_strfreev(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
diff --git a/linux-user/main.c b/linux-user/main.c
index 829f974662..f1e799f570 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4426,11 +4426,7 @@ int main(int argc, char **argv, char **envp)
         _exit(EXIT_FAILURE);
     }
 
-    for (wrk = target_environ; *wrk; wrk++) {
-        g_free(*wrk);
-    }
-
-    g_free(target_environ);
+    g_strfreev(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         qemu_log("guest_base  0x%lx\n", guest_base);
-- 
2.14.2


