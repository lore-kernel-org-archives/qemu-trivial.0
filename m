Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqnCD-00044V-6c
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 16:49:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnCA-00042N-OA
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC9-0000Z4-QE
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:26 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC7-0000Xf-Lt; Wed, 22 Mar 2017 16:49:23 -0400
Received: by mail-qt0-x241.google.com with SMTP id n37so26892215qtb.3;
	Wed, 22 Mar 2017 13:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VOX8vCm02+TZHvHjc4PaeSf5kYt386OJ030cl11LrV0=;
	b=oa+4Vyw3j8AZtOtJKwNpuKnenNELoo9HP3cmyBKa59NR0TbQbehKPcfpQwTsK+PKUX
	8zBYelkgjzSWQqUqsqhDVNppRiHtR/2nAp02uKSo0iodz9khvDAHYIRiF15tcyCEvl8p
	Q1PHN3pIKKfd8qR0rtLV4GgUTXA/Fxk4zLXWZK6RBlekx9rPYkSbrqC16FqEpJPbdPBo
	kxXXY4Ryki2p0w4/JCyydeFFfWyzyyGpVuNswWCn5XZWxqKJCeaTZAoPrCJKn8IE921k
	hVo8JpJRbiT/cWWzx+cpdrwI7mx4mzP12P8qA6JpdQ3+wRkoMe5AaC9lYsPZCHn+0Jdn
	mt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VOX8vCm02+TZHvHjc4PaeSf5kYt386OJ030cl11LrV0=;
	b=c1aJbmZkV5lz1EzZZ1raxFi1aaImFRESSGaHcLMW3lul3m2b2p6kbzTtH03thmXwl4
	uP9f7EYgG/MZIG6VMk6TlRIjBTitfVnREtFBItMnjk/a/bybidenf3eHjb0XwgUNI/DH
	dDu51PbDDaUUj74jHtDdE4OtrQKxs2Te6b1oQUHQJP671cuRjiTu00qwqObJ/m/5gX5p
	1uhMKCLdQCAvlD0sfCQkyo8nwWXatsShq2/NTwLNbwUOOGh7PRcmLrt46GFzoOqbPm0G
	9DK+BnlivcaohXmtGuzoaFjH/kzsVWJrlXjkGfu3lAJnuQp6JKrvY4sL4LHpyGHOEYV9
	tobA==
X-Gm-Message-State: AFeK/H1Vrf8WP2d7Xm43M75Z5vQpYTU4RQspb09H2NHtdCocPz0GlCH5NKmkbihHl/UP4w==
X-Received: by 10.237.37.229 with SMTP id y34mr40264128qtc.30.1490215762956;
	Wed, 22 Mar 2017 13:49:22 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	u43sm1767263qtc.11.2017.03.22.13.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 13:49:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 22 Mar 2017 17:48:44 -0300
Message-Id: <20170322204844.446-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170322204844.446-1-f4bug@amsat.org>
References: <20170322204844.446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH RESEND 3/3] qga: fix compiler warnings (clang
 5)
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
X-List-Received-Date: Wed, 22 Mar 2017 20:49:27 -0000

static code analyzer complain:

qga/commands-posix.c:2127:9: warning: Null pointer passed as an argument to a 'nonnull' parameter
        closedir(dp);
        ^~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 73d93eb5ce..8028141534 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2122,9 +2122,11 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
          * we think this VM does not support online/offline memory block,
          * any other solution?
          */
-        if (!dp && errno == ENOENT) {
-            result->response =
-                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
+        if (!dp) {
+            if (errno == ENOENT) {
+                result->response =
+                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
+            }
             goto out1;
         }
         closedir(dp);
-- 
2.11.0


