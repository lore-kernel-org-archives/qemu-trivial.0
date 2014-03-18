Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPuL2-0000Wk-69
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 09:45:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4R-0001wN-T7
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4J-0000Vm-Pj
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:15 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:41280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4J-0000VV-Jh
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:07 -0400
Received: by mail-la0-f50.google.com with SMTP id y1so4485195lam.9
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 23:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/caI9wx9pKVICKG7Qm1cIiWFpNgzTEooFMoz6E3IqwQ=;
	b=I+1t4AXi/m25TLQb7sl9b4+eXjvFRv0FtXq37RDkT9/Qc9by9F6iSLM2GONIZ8zCph
	7wZUdGjY+vass0aQJSG4VOxOeVevxRTRMfx6j+lzzdo4DrbmXNhgppfrX6QF3yAFMIzz
	+uL25ESxDIqcih5Yjpjp4E3DMVSZyCHQlorzQFFahVYH+B4IbbbqeihSU2kFq/K2wthT
	a053MPww0s5hu5Bj5ibWv+m9HU9QnkYeiVBqWnMsSBHZpCrj1+jAos+nhTe/ZnCUeTjd
	U0JOoh4UWymVXL0BklZIhyShBurOceXjbVeX2SphZB1r4lAN6KipZhThcyDwlZOTi6XB
	0btw==
X-Gm-Message-State: ALoCoQlsl7B5UF3cWyPrjkWtW00lTPUw0p6VBhI2F54vmHqIC2fpdeSJMKp18kShM3dYb4gQAoa8
X-Received: by 10.112.22.130 with SMTP id d2mr4594969lbf.33.1395122406723;
	Mon, 17 Mar 2014 23:00:06 -0700 (PDT)
Received: from z1.base.vohkarts.com ([31.134.130.233])
	by mx.google.com with ESMTPSA id
	tq9sm14326202lbb.10.2014.03.17.23.00.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 23:00:06 -0700 (PDT)
From: Maria Kustova <maxa@catit.be>
To: qemu-devel@nongnu.org
Date: Tue, 18 Mar 2014 09:59:18 +0400
Message-Id: <1395122359-28890-3-git-send-email-maria.k@catit.be>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1395122359-28890-1-git-send-email-maria.k@catit.be>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
X-Mailman-Approved-At: Tue, 18 Mar 2014 09:45:48 -0400
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Maria Kustova <maria.k@catit.be>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2 2/3] block: Replaced old error handling
	with error reporting API.
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
X-List-Received-Date: Tue, 18 Mar 2014 06:00:22 -0000

Signed-off-by: Maria Kustova <maria.k@catit.be>
---
Changes v1 -> v2:
 * Removed trailing "\n" from the error string
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 3494c6d..359637e 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -538,8 +538,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     return 0;
 
 out:
-    fprintf(stderr, "CURL: Error opening file: %s\n", state->errmsg);
+    error_setg(errp, "CURL: Error opening file: %s", state->errmsg);
     curl_easy_cleanup(state->curl);
     state->curl = NULL;
 out_noclean:
-- 
1.8.2.1


