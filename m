Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyMm4-0006CX-7A
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 11:00:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyMlt-0005yC-6Z
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyMlj-0004Xd-8l
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:00:01 -0400
Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d]:37229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WyMlQ-0004SA-J0; Sat, 21 Jun 2014 10:59:32 -0400
Received: by mail-pb0-f45.google.com with SMTP id rr13so4149925pbb.32
	for <multiple recipients>; Sat, 21 Jun 2014 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=blbhI+EfzCaLiNNGSXnxyUs1BBHQKGrcg/dx7Zy/LcE=;
	b=UaDtz8WgUdW78AzM6yaawO14umdBeRRRBlj9PbNWJOduMyr/2jUCodAeP56aIKX/9O
	blLBV5tQqPewJgLcXTtriEQ0yysOs+Uhkhg8y1QIGOMudlIdHWndDCn6HCKnuYc0Q8LM
	sOO/KjsK/tsIR2bm9EChm2a82XXykeTbrF4V+qu2Bk6FwhlsDYPV0/jlbDw4HS/Pluu5
	q8rxMDahixbCI6wYQQmyjhjoyYHTjbVeFXm0k/iQmmWl8zUMkzciwdqtdIypZPG9BSAp
	TYGr/LvhJJbg4/mf+OIUPT9ElPp2mFOd7EZZ7c0l5a7rz/9iXqtLnG9m2+E/W2L/qA1p
	feag==
X-Received: by 10.68.139.194 with SMTP id ra2mr13737065pbb.20.1403362771336;
	Sat, 21 Jun 2014 07:59:31 -0700 (PDT)
Received: from [192.168.1.101] ([223.72.65.76])
	by mx.google.com with ESMTPSA id
	eh4sm18538107pbc.79.2014.06.21.07.59.28 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 21 Jun 2014 07:59:30 -0700 (PDT)
Message-ID: <53A59DD1.2020706@gmail.com>
Date: Sat, 21 Jun 2014 22:59:29 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: kwolf@redhat.com, stefanha@redhat.com, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial] block.c: Correct the return value
 and the failure object when failure occurs
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
X-List-Received-Date: Sat, 21 Jun 2014 15:00:10 -0000

When failure occurs, 'ret' need be set, or may return 0 to indicate success.
And error_propagate() also need be called only one time within a function.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 74af8d7..12ce4e4 100644
--- a/block.c
+++ b/block.c
@@ -1497,7 +1497,7 @@ int bdrv_open(BlockDriverState **pbs, const char *filename,
     if (snapshot_flags) {
         bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
         if (local_err) {
-            error_propagate(errp, local_err);
+            ret = -1;
             goto close_and_fail;
         }
     }
-- 
1.7.11.7

