Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobls-0000Wv-E1
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4E-0002A2-4W
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4D-0004Fn-3R
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:30 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:46975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX48-0004BY-SC; Mon, 06 Jan 2020 13:25:24 -0500
Received: by mail-qk1-x744.google.com with SMTP id r14so40253712qke.13;
 Mon, 06 Jan 2020 10:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pow/5Z2bAbGCDH4hbr5Mur0CSZ4ZY/agAkg/ACDkDZ0=;
 b=O6ArrT20JB0/YZXuReV5drE66ncq7KfKgtG8G6AlTLIwqMGmnO475rEpkucFjrTPYv
 wWARQwKOSDhQsCDhiekVFrmO9KCiTzr5Kat9RVZvE/NmDWVJQwaV0k+1h0X5dW91CeC+
 DW72POEdFxKAMJFPhBT7FRlaqXxypExV/pSz1beW5g619qBGgdvMyV53OglJbIpUCv14
 Yu7i0l8Y7/gZ7jupfhBRdeFWFGeXxBeP6WE1Ml1p1JVXVfbv5pJ+8l0cVwznBy5d+cLK
 tqeCFjbQ4QIpvVna6eblN3TddJ8xY/0soEHHUYff8uYqHHxVpeLlWt3h+De1ZEhSQu/q
 plOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pow/5Z2bAbGCDH4hbr5Mur0CSZ4ZY/agAkg/ACDkDZ0=;
 b=H4hINKhTWqJNtiSPQJoxV9D3x2SQnyclyhrzqvHV81w8kw0dvQO5YDuGiUWYb995PT
 xnTnWYYwrp5YD0eloq5+3BSbaYd7IeP76hYi7Gd5fepv+zuqhzqlMscVaOknmSXMLuEj
 4vqUZu4pe9mjoF06d+X/rSv4ogUWGVpuboj2wTfaojgLkW+oQ1/BubappQgKI/GOGeKo
 yFNRWDU09gaXMlKbkfRRQTHlHwyOo0nGCjfE+lNtxOswjKtXWMo7nWazxNk+cWwhaE+7
 5AVnCH2Xj2r3Mx2TMY7OjIKgrKblpvXh5vhgoqmdLtWHhExRTRw22hkxchMU2IVSULBs
 ppnw==
X-Gm-Message-State: APjAAAXdDBzmmOzcZ3glkJNxLU1tOFTh5OLA17yEJKHOY2YudC26Ywkk
 nRU8M+jqxYaU/mt0v90lYo46voHx
X-Google-Smtp-Source: APXvYqwTQSm0S+pxsKqQKEDTkChAA5zcEGP4fQuGs0g4MI6u+vnRzeP0qhLoy59GQyQd/aUTo8xhvw==
X-Received: by 2002:a05:620a:6b8:: with SMTP id
 i24mr86399499qkh.9.1578335124342; 
 Mon, 06 Jan 2020 10:25:24 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v1 18/59] qcow2-refcount.c: remove unneeded 'fail' label in
 qcow2_refcount_init()
Date: Mon,  6 Jan 2020 15:23:44 -0300
Message-Id: <20200106182425.20312-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 18:25:32 -0000

'fail' label can be replaced by 'return ret' and 'return -ENOMEM'
calls.

CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/qcow2-refcount.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f67ac6b2d8..1fe66677d1 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -111,22 +111,19 @@ int qcow2_refcount_init(BlockDriverState *bs)
 
     if (s->refcount_table_size > 0) {
         if (s->refcount_table == NULL) {
-            ret = -ENOMEM;
-            goto fail;
+            return -ENOMEM;
         }
         BLKDBG_EVENT(bs->file, BLKDBG_REFTABLE_LOAD);
         ret = bdrv_pread(bs->file, s->refcount_table_offset,
                          s->refcount_table, refcount_table_size2);
         if (ret < 0) {
-            goto fail;
+            return ret;
         }
         for(i = 0; i < s->refcount_table_size; i++)
             be64_to_cpus(&s->refcount_table[i]);
         update_max_refcount_table_index(s);
     }
     return 0;
- fail:
-    return ret;
 }
 
 void qcow2_refcount_close(BlockDriverState *bs)
-- 
2.24.1


