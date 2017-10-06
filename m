Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSe-0002b4-Le
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSa-0002Wm-Sn
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSZ-0008Ei-Gj
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:16 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cST-00088d-ML; Fri, 06 Oct 2017 19:55:09 -0400
Received: by mail-qk0-x244.google.com with SMTP id a12so10184558qka.4;
	Fri, 06 Oct 2017 16:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E9QAonZdxIIAc9ONzCRJ49sOsao4lPdhwqHRuykkNvw=;
	b=feDxnGyvipqnDSTHdYjVLBaX67+u3A9pylDVZ/dqD/msYXfY1DSY3HhU18qcvso3+e
	ejXY4X0KKBBrihDhV2S6A+2YebfO341m06YjC0TNZFI5f61yUmxvuRzK7o0fepjhOrR0
	1QEi+8SnXGVWQJBwZIPrbZgYCkeZ8hGo9JEI5RLI2YBtpyRkqcmCYZuEvjqO30Ngl5Sn
	X+krLkB0rcfB9HmFqeRfQIe5Og2KF3xaTdfhndsRy+eTZK6YjfJdG/cmb9DetxMddRGK
	V5fVzY/ikWUKoFSEI/vRJItTqxmyW7OWwaTOhLUjrC97MZS24hA6ev5HDj6EosliDkYR
	U6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=E9QAonZdxIIAc9ONzCRJ49sOsao4lPdhwqHRuykkNvw=;
	b=ZiW5rQMAnpkkBoVbUsideCQ8rnuyppbPDLOeU2RUPxvYEG0j2sNEoRo2Q1DjWO+jYK
	zv1bewP9H+pT2HBlWK4utZAhujoTswBbXWuSj4iCJ7RQoE7Dc/Xf0lZNMmZAfEkOH1iC
	ssjyRiV4qdKDxD2H+EN3pkLH2Xn0WjtcO9laxbJCAohUDi/dnJpmWuwmniwvOJXGSXRa
	nv9FIQPpiTOs3k0BvYzmI+oSlIqwYs7yEuGRuL47pjultVUpMkCODbxEqsMtZqel7Mxi
	kL55LPK2JNX8/W3BDruISnM2xU7Cu1KQGjhwE+yue3K/efJ3usN+PZkuzDPb9OLx4dKA
	MBUg==
X-Gm-Message-State: AMCzsaWuOrwX4XyeaxbwvZxxCvNwFwu2AZOds03J4VcCaHV+KfeeiYrl
	9AQ23TtDObDbForS5iL3CTw=
X-Google-Smtp-Source: AOwi7QD7kxo0Kc+RgyHcBobUvL98BgVe6HVWWSLgylyB6JPEufr+jTLzdkOcAlXEgJEvGc7+kk2pDA==
X-Received: by 10.55.207.11 with SMTP id e11mr709700qkj.89.1507334109183;
	Fri, 06 Oct 2017 16:55:09 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:13 -0300
Message-Id: <20171006235023.11952-79-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 78/88] gdb: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:17 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 2a94030d3b..5f0d8af1c0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1786,7 +1786,7 @@ static void gdb_accept(void)
     /* set short latency */
     socket_set_nodelay(fd);
 
-    s = g_malloc0(sizeof(GDBState));
+    s = g_new0(GDBState, 1);
     s->c_cpu = first_cpu;
     s->g_cpu = first_cpu;
     s->fd = fd;
@@ -1980,7 +1980,7 @@ int gdbserver_start(const char *device)
 
     s = gdbserver_state;
     if (!s) {
-        s = g_malloc0(sizeof(GDBState));
+        s = g_new0(GDBState, 1);
         gdbserver_state = s;
 
         qemu_add_vm_change_state_handler(gdb_vm_state_change, NULL);
-- 
2.14.2


