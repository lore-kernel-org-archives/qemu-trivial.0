Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyKvC-0006a6-2K
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 09:01:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyKv0-0006HR-UB
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 09:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyKur-0008Pb-T3
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 09:01:18 -0400
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:50873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WyKuV-0008Jc-Qw; Sat, 21 Jun 2014 09:00:48 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so4063569pab.36
	for <multiple recipients>; Sat, 21 Jun 2014 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=tM2QOtgCKLtzq/jo/BIDYYSvXaztdFXT2jJx8sNYJaA=;
	b=iPcPMfUlwARZJQuXnDoid4NGYzwjPv8BABgOf72DYy3sw0krj8l9ZprCXR1OQebudO
	9yECup9DmEIzwBzcMNIuoZjw3L2BZbfQZs7Bys4YiMOIV83xklDO/kbDmdum2vIwb8uX
	XdNbW3f5N0K3wIIV7DBxnWGEPwXeZsZUIjNX9pQ0wSj/YqpoiV5G8tH+MvBXpSRu1XUb
	Znu4xnoRvJ/vavVgUwxqQKktfbLaADOtBhVncvALpSbrVb8cnxrbDrlNydlx8+cnISwU
	bi0IYd3lSNh6MX+0FR02HcdNWxV067YqOGXUNQtsKj/EG/QBTbbeIuqUAAEqYGN81aDc
	p9Wg==
X-Received: by 10.66.237.8 with SMTP id uy8mr12964832pac.95.1403355645900;
	Sat, 21 Jun 2014 06:00:45 -0700 (PDT)
Received: from [192.168.1.103] ([223.72.65.2]) by mx.google.com with ESMTPSA id
	uv5sm18124039pbc.52.2014.06.21.06.00.43 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 21 Jun 2014 06:00:45 -0700 (PDT)
Message-ID: <53A581FC.6050305@gmail.com>
Date: Sat, 21 Jun 2014 21:00:44 +0800
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
X-Received-From: 2607:f8b0:400e:c03::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial] block.c: Remove useless 'buf'
	variable
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
X-List-Received-Date: Sat, 21 Jun 2014 13:01:28 -0000

'buf' is not used actually, so remove it and related snprintf() statement.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 block.c | 2 --
 dtc     | 1 -
 2 files changed, 3 deletions(-)
 delete mode 160000 dtc

diff --git a/block.c b/block.c
index 43abe96..74af8d7 100644
--- a/block.c
+++ b/block.c
@@ -5595,7 +5595,6 @@ void bdrv_img_create(const char *filename, const char *fmt,
         if (backing_file) {
             BlockDriverState *bs;
             uint64_t size;
-            char buf[32];
             int back_flags;
 
             /* backing files always opened read-only */
@@ -5616,7 +5615,6 @@ void bdrv_img_create(const char *filename, const char *fmt,
             bdrv_get_geometry(bs, &size);
             size *= 512;
 
-            snprintf(buf, sizeof(buf), "%" PRId64, size);
             qemu_opt_set_number(opts, BLOCK_OPT_SIZE, size);
 
             bdrv_unref(bs);
diff --git a/dtc b/dtc
deleted file mode 160000
index bc895d6..0000000
--- a/dtc
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit bc895d6d09695d05ceb8b52486ffe861d6cfbdde
-- 
1.7.11.7

