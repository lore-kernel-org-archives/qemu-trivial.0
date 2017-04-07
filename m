Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwcFv-00082l-OK
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 18:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFu-00081L-7c
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFr-00054r-JK
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:22 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFp-00054R-Ic; Fri, 07 Apr 2017 18:21:17 -0400
Received: by mail-qt0-x242.google.com with SMTP id x35so11506603qtc.1;
	Fri, 07 Apr 2017 15:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n8P/IH7BEEhbOCW+/Bn7SebjwtfiGvKFqU2HF9lfAkg=;
	b=X5/w6F4fNkUk5NC64RGiPiSLYqJTt1mvSBw7SQK5yPXpSfTg49scSGW6Na4eV2Wuix
	A/vMR9+K2BYWz6hDBrEB8KJxgtsoWrXBJYxcR2f1f6C+9+AiICFcBNaaVPidlhUSNB40
	FhzzrEcJi6T5+8Nec92e5H4PVLnaSVyXIB3ER51ez1s9Lg9KI0Bj2w49K0VxKJSb0fwF
	cFvuIQtKPSPVGlyxTXr9jOscyEiC4ZvOFp1hweTV0yr2Ml0480vKlOYvlJdLlIaEUbPY
	adsWe6oa7VHaSDcIuS1EG/ZnfACk7WVa810LKezdpZngROrtM7dun+xnsEqKDBMyniWJ
	Gsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=n8P/IH7BEEhbOCW+/Bn7SebjwtfiGvKFqU2HF9lfAkg=;
	b=Kk1qTkDI553PL80HWQ/c7nDVHlwAaZWwC7P9TV/+Ij+M20V91mhsOF72+Y/A3RAtaP
	q6Cse7FBVQAakVVdTQMIwWaN3TVUbNeIpTcn04bRC+Sw10BRaomkKJlUM+mahkAtkZYo
	jscgAbo+gxb7DTFjVve609pMls2arOIdgdJtMAzv2ixrztjZx9KAi3JAt+KBfxdRpHtV
	utF6ObbuVnbWKBi5gxiauN37EO56wcNMvyuHmYS7iVKHnE1JDucxwIyi8v8HCPLcUSue
	s30VjDQcCJQzTpwx+yykax4i5Rn3TUCbD3PyixO1NR1n1Y0RjzdgESnrTUQH194A85eo
	ZlQA==
X-Gm-Message-State: AN3rC/4mpaCtGc8ZrJb6m+Btt5UOwmw1cJOWQ5GTRfSx5jv/vdQq5PjPT+pTgXgBuUTNcQ==
X-Received: by 10.237.36.105 with SMTP id s38mr1401617qtc.185.1491603677027;
	Fri, 07 Apr 2017 15:21:17 -0700 (PDT)
Received: from yoga.lan ([138.117.48.226]) by smtp.gmail.com with ESMTPSA id
	d133sm1442146qke.9.2017.04.07.15.21.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 15:21:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  7 Apr 2017 19:20:14 -0300
Message-Id: <20170407222016.15308-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170407222016.15308-1-f4bug@amsat.org>
References: <20170407222016.15308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 2/4] device_tree: fix compiler warnings
 (clang 5)
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
X-List-Received-Date: Fri, 07 Apr 2017 22:21:23 -0000

static code analyzer complain:

device_tree.c:155:18: warning: Null pointer passed as an argument to a 'nonnull' parameter
    while ((de = readdir(d)) != NULL) {
                 ^~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 device_tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/device_tree.c b/device_tree.c
index 6e06320830..a24ddff02b 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -148,6 +148,7 @@ static void read_fstree(void *fdt, const char *dirname)
     d = opendir(dirname);
     if (!d) {
         error_setg(&error_fatal, "%s cannot open %s", __func__, dirname);
+        return;
     }
 
     while ((de = readdir(d)) != NULL) {
-- 
2.11.0


