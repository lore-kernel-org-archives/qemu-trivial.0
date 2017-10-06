Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cR5-0000xH-4r
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR3-0000v7-2z
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR2-0006l8-Fh
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:41 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR0-0006i3-N0; Fri, 06 Oct 2017 19:53:38 -0400
Received: by mail-qk0-x242.google.com with SMTP id w63so11297853qkd.2;
	Fri, 06 Oct 2017 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jIrG+a6KimlGzqMXERmfHO2ieK/rsLvFRe7ABtgy544=;
	b=ISCgSry7u0NSsjcT4JS7WcFdzSmn8owFz9Q62WUW+OMu8DJ02SKX8+edAMjV74EzMA
	0LzLBDNdBay5JDIK3qBP984FhgFPdXb/+4Tfhhpuj7SvnReBaitLDtof2fr5Cjrtdh1n
	LCSwZGvfHU/iiH4WzJmo5QJZnD1a2oz5nRevqihjC1VEk32JsJXxkNXz+3NzOpOjAjBJ
	IUCOIhjn6YJgrJce1ipYWGO7Q6xOd2YrMlOBXF3fbY/uAMpbO1ZQmY9YdhRmsn9k63DJ
	Luih96dF1C2QXyRfkLEvulTrcvIWAo3dbPbh7Dp4QPeFNP7U+gJBT642CJidIW+s0Nm7
	qT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jIrG+a6KimlGzqMXERmfHO2ieK/rsLvFRe7ABtgy544=;
	b=hTW6m/VLzMg0jBHjht08Ro5faG6s0FJtFRGQmMZhCRXnmbsiIio0+4zPemGWmCLe6Q
	inqCZfl/imif6rAxZ57yieuUq28s6JsMfktwaWyIpvJXuS+EiqUV5EOh9kct72o9F/B6
	959rtWKdZafOMwUeanokUW7gf5C7hEK01sR2jdlO+kyr/Aqyby366K2JrSzgNamrpxyH
	+QBiDy1pP6ybnAD6mA4b2zuAQwbQWNS52I5wDFLx1HAuwlyHhWHdbQFBnMnKkq/7jLvg
	ErhE9fmwadtTsJTrzoReA13ZhztqXxb+PLWhVzrOgqBlCskR/uQhAT7yqQQVXjNGhV7V
	LhxQ==
X-Gm-Message-State: AMCzsaVsv01CsdYRPuaHaHMZ9Rhsyr+DmG6ALbMKPvoc53xLTzW4FZb3
	Y45cjlqLtDRXjoLV6UyDMjs=
X-Google-Smtp-Source: AOwi7QCaLGO0Gbp40uk0XD218uquauaqpo9Upsr4mgv4cK5xYQT19sqlblif+maxPIC0vh6yzfnvHw==
X-Received: by 10.55.127.70 with SMTP id a67mr698163qkd.90.1507334018182;
	Fri, 06 Oct 2017 16:53:38 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, qemu trival <qemu-trivial@nongnu.org>,
	qemu-block@nongnu.org
Date: Fri,  6 Oct 2017 20:49:48 -0300
Message-Id: <20171006235023.11952-54-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 53/88] iSCSI: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:42 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 4683f3b244..f9f910168d 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1001,7 +1001,7 @@ static BlockAIOCB *iscsi_aio_ioctl(BlockDriverState *bs,
         return NULL;
     }
 
-    acb->task = malloc(sizeof(struct scsi_task));
+    acb->task = g_new(struct scsi_task, 1);
     if (acb->task == NULL) {
         error_report("iSCSI: Failed to allocate task for scsi command. %s",
                      iscsi_get_error(iscsi));
-- 
2.14.2


