Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRs-0001lR-8F
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRo-0001ho-6Z
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRn-0007Tw-Ip
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:28 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:49217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRl-0007Rr-IY; Fri, 06 Oct 2017 19:54:25 -0400
Received: by mail-qt0-x243.google.com with SMTP id o3so34351066qte.6;
	Fri, 06 Oct 2017 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V6LQStLLjNwrTr4nz30zd9NXMYDu5ss73KTOL73Tm5Q=;
	b=kgoelH7JZ3ewE9//MNRvtQndgeLlL74GF1i58/nmJmOQeaWrE0xnTnFkJTdrp2Zp+S
	P3wZZSNKX0RzK+gaCjii5eN72NPurlZA9syXxlB5Slpq4K8o0qE0l0dW8VGfzy/DSs6C
	PRwlmpepa740CxSwNDzsRV3uPRO2MXc1quStfAMqpqCuHr3IQzkUhQZXJycb/TCq1vjL
	iQ+XoAoRCnwbyA2nElIVNz9h2Q6/bJJSGbuxnR4+Xw66mWDcx2eLT+mAdXmSTJaNrg02
	r3qoh6RgcTENNAC/Ua1x8Ore71hlcxw/BUPS/0D+np2RfOlQJH2RiNp5hF6xs3K6QASv
	sE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=V6LQStLLjNwrTr4nz30zd9NXMYDu5ss73KTOL73Tm5Q=;
	b=TfpwnvftF/Z+3iluKs0Q6rhuCUk2JIJK6f6e2XiWXlVooqYxP3B5jaLIPC9uu8L1cR
	CmUnQxp+qgzhtC3eLCjSY9dkOW7RyA/dPIaFd1GD4fbd4sih3qA8y7J7AnZapobk8GoN
	9n9UXLsl/bsNzpXonjlStngs6Zw/guMsEHwsyOSTbQRdgXZJcFOeboNbrdzGZEEFMHgd
	UZ6yuy41oYtSs633D+IrRntzbHQNekfoN4cYZ7wNW0tAHgl+pETvA0c8Uvd6FFzyCrn5
	jd9MCZ937ReQSSD4E9QfsscFZOktRQCt26fkeRG9QogBFwzU4wpD+68Ixrbxd3HCWPYW
	UwvQ==
X-Gm-Message-State: AMCzsaWyin46PdtTDpRaetMYwlIhIkOxb2s+fca80KOTCootNnoQbE5o
	DEm61mpiKlp0DVd9x8ZSc0Q=
X-Google-Smtp-Source: AOwi7QBJYabAzNHx5QM3v9SmEK5wJMd4O9Y6O7hTtfEk84D0w5uVW5z16k/VFcCUVuLjNK+qSiCCWQ==
X-Received: by 10.200.27.163 with SMTP id z32mr1012073qtj.8.1507334065043;
	Fri, 06 Oct 2017 16:54:25 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:01 -0300
Message-Id: <20171006235023.11952-67-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 66/88] util/qemu-thread-win32: use g_new()
 family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:31 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/qemu-thread-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 94f3491a87..098fddb2af 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -394,7 +394,7 @@ void qemu_thread_create(QemuThread *thread, const char *name,
     HANDLE hThread;
     struct QemuThreadData *data;
 
-    data = g_malloc(sizeof *data);
+    data = g_new(struct QemuThreadData, 1);
     data->start_routine = start_routine;
     data->arg = arg;
     data->mode = mode;
-- 
2.14.2


