Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQ3-0008Vb-82
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ1-0008TG-4H
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQ0-0005wK-7c
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:37 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:51468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPu-0005uE-0E; Fri, 06 Oct 2017 19:52:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id q4so34330598qtq.8;
	Fri, 06 Oct 2017 16:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sEAV8iV9XD7HgeDf6osItPPW50MKgd+mg69ytT74yhA=;
	b=e9TzfqdutZffBA7z95ynulVum53IqpYN0d4pseKvcT3v8+PKONTxko5iuCl39jWn7d
	I7xRww4ZN3bRjt95bWlwqSkHPkCjXg2TbWEC9X+n5XYHsheS3bmRRxg64lm6aY/MBRdE
	vrNCnKqMbcYK4N2Rl0CW6KIBWd6vXKgQQPBABHhsRP52gqdtD5sQbNeFrEEc4+JCz0gm
	+BIVlfnL+7ZzPHDaGXFqsoDxW+koroBscj/3p7hXDSbnnCS461L75kCrsYWekt+aCJx4
	Hd2NI/k4sQnsp/lHdysHbcGMm2drsctQx1irQBRluLLhnLvvD2v4HxjwkzP8XrlHBTUD
	OFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sEAV8iV9XD7HgeDf6osItPPW50MKgd+mg69ytT74yhA=;
	b=V/jNApSI/o9eQVHx161X0nETRZBItj12prGxuO+5NCYr1lpdZH+e2d9AJsC7D7M/NW
	6Pa/tTNJZKpKqHkC+AoHe3PtjY5gzHiwEXdoIl9ekr6HPhvMfb+QozVWRwIBtD929bGJ
	XPEEJxVV4oPDzudfXVprRCyf2nnlTAdwYsEHOHJ/dpXs5LWWfmk6LH8aAkZipb3pOmKa
	jS6r7YePWIoIKuzQRJAP/tFE7eWs4Q0GYyEqZNwymID8oTg7YhfbmAKIiyjeLlHfhIn0
	VNb4AAfNKptBrs1777ZdnPOxX+25Q3IZcTyIHnDj/cU25XT91iUCMfqC3QobMbKB5i+y
	lijw==
X-Gm-Message-State: AMCzsaWUD5rANpFz+rzi7sj8Cff2TsizNeTMPxgbSRTk5MB2w8blWoG8
	W+6GSLO+KHrkHwaUOJ6rWaY=
X-Google-Smtp-Source: AOwi7QAdVI+FdZoSwM1LMcEj0hp415IRnlakh35/uqNOA1zdEyZtovYUgve3sU1qGl6tP8ugb0rq8w==
X-Received: by 10.237.36.125 with SMTP id s58mr5558081qtc.24.1507333949465;
	Fri, 06 Oct 2017 16:52:29 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:29 -0300
Message-Id: <20171006235023.11952-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 34/88] qapi: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:38 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/opts-visitor.c           | 2 +-
 qapi/qapi-clone-visitor.c     | 2 +-
 qapi/qapi-dealloc-visitor.c   | 2 +-
 qapi/qobject-output-visitor.c | 2 +-
 qapi/string-input-visitor.c   | 2 +-
 qapi/string-output-visitor.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 324b197495..34ac49f3c2 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -539,7 +539,7 @@ opts_visitor_new(const QemuOpts *opts)
     OptsVisitor *ov;
 
     assert(opts);
-    ov = g_malloc0(sizeof *ov);
+    ov = g_new0(OptsVisitor, 1);
 
     ov->visitor.type = VISITOR_INPUT;
 
diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
index d8b62792bc..3d216e5906 100644
--- a/qapi/qapi-clone-visitor.c
+++ b/qapi/qapi-clone-visitor.c
@@ -145,7 +145,7 @@ static Visitor *qapi_clone_visitor_new(void)
 {
     QapiCloneVisitor *v;
 
-    v = g_malloc0(sizeof(*v));
+    v = g_new0(QapiCloneVisitor, 1);
 
     v->visitor.type = VISITOR_CLONE;
     v->visitor.start_struct = qapi_clone_start_struct;
diff --git a/qapi/qapi-dealloc-visitor.c b/qapi/qapi-dealloc-visitor.c
index ed70a0158b..ad0d0eb7e4 100644
--- a/qapi/qapi-dealloc-visitor.c
+++ b/qapi/qapi-dealloc-visitor.c
@@ -120,7 +120,7 @@ Visitor *qapi_dealloc_visitor_new(void)
 {
     QapiDeallocVisitor *v;
 
-    v = g_malloc0(sizeof(*v));
+    v = g_new0(QapiDeallocVisitor, 1);
 
     v->visitor.type = VISITOR_DEALLOC;
     v->visitor.start_struct = qapi_dealloc_start_struct;
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index d325163e55..7228986c0c 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -229,7 +229,7 @@ Visitor *qobject_output_visitor_new(QObject **result)
 {
     QObjectOutputVisitor *v;
 
-    v = g_malloc0(sizeof(*v));
+    v = g_new0(QObjectOutputVisitor, 1);
 
     v->visitor.type = VISITOR_OUTPUT;
     v->visitor.start_struct = qobject_output_start_struct;
diff --git a/qapi/string-input-visitor.c b/qapi/string-input-visitor.c
index 67a0a4a58b..3a2fe58478 100644
--- a/qapi/string-input-visitor.c
+++ b/qapi/string-input-visitor.c
@@ -356,7 +356,7 @@ Visitor *string_input_visitor_new(const char *str)
     StringInputVisitor *v;
 
     assert(str);
-    v = g_malloc0(sizeof(*v));
+    v = g_new0(StringInputVisitor, 1);
 
     v->visitor.type = VISITOR_INPUT;
     v->visitor.type_int64 = parse_type_int64;
diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
index 7ab64468d9..a7bbbae109 100644
--- a/qapi/string-output-visitor.c
+++ b/qapi/string-output-visitor.c
@@ -341,7 +341,7 @@ Visitor *string_output_visitor_new(bool human, char **result)
 {
     StringOutputVisitor *v;
 
-    v = g_malloc0(sizeof(*v));
+    v = g_new0(StringOutputVisitor, 1);
 
     v->string = g_string_new(NULL);
     v->human = human;
-- 
2.14.2


