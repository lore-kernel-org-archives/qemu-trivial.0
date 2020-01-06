Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobmE-0000vi-MZ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4K-0002JM-Di
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4J-0004ME-6v
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:36 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:44904)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4E-0004Gm-8c; Mon, 06 Jan 2020 13:25:31 -0500
Received: by mail-qt1-x843.google.com with SMTP id t3so43182952qtr.11;
 Mon, 06 Jan 2020 10:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a9jsk8u+/5hibvcbWneMzoArJdAq2nWhpUyUdOQCk1M=;
 b=HogvO3OAHqmXNQNWDvBqNkfr5eN91mMiemuxU5UdLdAjJb5muyyyIsEznFNTt9Ea+q
 DTZkVChOcIWsLAWQqKk/UWwC+Lk3NoJb15mgilFglc7lEbTlgS8aa/25SQhXW2fBpnnT
 jMOG101eQ8ICQw0/M1pnNwaHSGkq8EumOBxFM9lhm90unF4X4lxwZuYYP5L+F9MDLY7o
 Htg0NnhD6bYmxcCdUzAZdEcCNr7X76bnCQIWCl0q6am2rvW6HOzTZdnfR0KnMPbQUwb9
 3ABKOU4DKFxLlB6BhhiQeQC3PvcMXP9o8YD6wqJB9owvrGbt74IXsR7pHe4kgstuo2iG
 cxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a9jsk8u+/5hibvcbWneMzoArJdAq2nWhpUyUdOQCk1M=;
 b=XmWerVyY7t+rI5/XIsfLQxumeDa8loovgFfejZYHW0fss/O9eYwy+uPujIKLtFANm3
 VNXz9DoXTm8rG/x+M+flW+uxAhBo1cNFuCS6eIAzEJPSMIknbkVrKHhSnzvVPTz2KLg+
 b4g+c4QbHwe4VnZcw5aSjTjMWasTgRwnBFMq0/CGLbnwTerXR+2z92ZQlAgxCY5zQvu9
 FqY9706vmTMd5zpgIAHPPpCVaIuY1LBfjgG3SSzS5htXohp3YokEeHDIqk06+qOHjvVc
 yg1iukMiQfJ+j5O3/BtbIRvL3N8bdc+xwgSh6ShitL2FulLwZHc277wFKlaYih/1/nzW
 MrcA==
X-Gm-Message-State: APjAAAWEzrCFjVBPAp9SWETdbhFkIzyY0LC8sPBRwQ1BfWpNuwgIkdIU
 XWZko4veW7lli2OAAuYcBX8Kx7M+
X-Google-Smtp-Source: APXvYqzKjaRzSrLUDb5OgrpFLF8q43Lcha4CSMKbMWZawaidR3nbPVnUEDfKMRgcd9g1WNdLHGLAhw==
X-Received: by 2002:aed:2be4:: with SMTP id e91mr77977865qtd.148.1578335129743; 
 Mon, 06 Jan 2020 10:25:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v1 21/59] block/backup.c remove unneeded 'out' label in
 backup_run()
Date: Mon,  6 Jan 2020 15:23:47 -0300
Message-Id: <20200106182425.20312-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-List-Received-Date: Mon, 06 Jan 2020 18:25:38 -0000

'out' can be replaced by 'return ret' and 'return -ECANCELED'.

CC: John Snow <jsnow@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/backup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index cf62b1a38c..e73294872c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -254,13 +254,12 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
 
         for (offset = 0; offset < s->len; ) {
             if (yield_and_check(s)) {
-                ret = -ECANCELED;
-                goto out;
+                return -ECANCELED;
             }
 
             ret = block_copy_reset_unallocated(s->bcs, offset, &count);
             if (ret < 0) {
-                goto out;
+                return ret;
             }
 
             offset += count;
@@ -284,7 +283,6 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
         ret = backup_loop(s);
     }
 
- out:
     return ret;
 }
 
-- 
2.24.1


