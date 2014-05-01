Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WfrxH-0007tU-12
	for mharc-qemu-trivial@gnu.org; Thu, 01 May 2014 10:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wfrx9-0007hz-93
	for qemu-trivial@nongnu.org; Thu, 01 May 2014 10:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wfrx2-0001Q2-Vo
	for qemu-trivial@nongnu.org; Thu, 01 May 2014 10:27:11 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:34662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wfrwq-0001NC-EE; Thu, 01 May 2014 10:26:52 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so805863wib.11
	for <multiple recipients>; Thu, 01 May 2014 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FeVwH+SAYrdi/2TTd7MCXIVuLUo0h1stZoqhJ7bwpP0=;
	b=qeTiqXeOGecNuV/B4ca9hIAhLvMMKUk1pmMC8mQ1T7QtcYHUJXqyZjfcy3L9sC7sZx
	GWj4sja1IQwMkGxQ9/FYcohi6Z6sOvO4m8BeormpXhifpjDlvlYAU1oymddppB6Vw/aR
	Miww2hH2Kf7tTAjRhQ7Di636uMK6DjAlJhor1bmw1fmx1E3eqcIHvmdX3FIsEPo66PMn
	QtOM52+ODqZGjM9uj/hI8SwDCoUOndroN7Z2NqSGqdoNZ+Bt948sPiTESLyDYbK6RXy7
	IV9xy6u9RtIGMaRsjdg1cRJCwHxv6SiecPA6v9ElauC9QJ3FmuWs75nPWuAtQ3MBmjTl
	/xqw==
X-Received: by 10.194.109.227 with SMTP id hv3mr9469809wjb.10.1398954411214;
	Thu, 01 May 2014 07:26:51 -0700 (PDT)
Received: from localhost.localdomain ([41.103.29.26])
	by mx.google.com with ESMTPSA id
	vp5sm41417501wjc.31.2014.05.01.07.26.48 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 May 2014 07:26:50 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 May 2014 15:26:42 +0100
Message-Id: <1398954402-17826-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, eblake@redhat.com, xiawenc@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] readline: Sort completions before printing
	them.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 May 2014 14:27:17 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 util/readline.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/readline.c b/util/readline.c
index 8441be4..8d2a0d3 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -272,6 +272,11 @@ void readline_set_completion_index(ReadLineState *rs, int index)
     rs->completion_index = index;
 }
 
+static int completion_comp(const void *a, const void *b)
+{
+    return strcmp(*(const char **) a, *(const char **) b);
+}
+
 static void readline_completion(ReadLineState *rs)
 {
     int len, i, j, max_width, nb_cols, max_prefix;
@@ -297,6 +302,8 @@ static void readline_completion(ReadLineState *rs)
         if (len > 0 && rs->completions[0][len - 1] != '/')
             readline_insert_char(rs, ' ');
     } else {
+        qsort(rs->completions, rs->nb_completions, sizeof(char *),
+              completion_comp);
         rs->printf_func(rs->opaque, "\n");
         max_width = 0;
         max_prefix = 0;	
-- 
1.8.3.2


