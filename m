Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFU6-0006Hf-7x
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU2-0006GT-SJ
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU1-0002Gj-8k
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21054
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFU0-0002Cb-Qu
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
 b=DSkWiBpP3LMLoTusaVQGbgc8A4fDzt8MWk41wKtL6TiWIuGZVn3yXipa0bN3hM5k37s1/F
 IwaE8Z19YayL1Bi0GBwtsufXHsLQY6nnKWYThaUeaU/3DuuJSjBaLXv2CMfB4wUVPS5usG
 wREhOaB6lrmN8ot25AKygWOltTEcSGs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-fRSjUxQhONS6zPP932GmSA-1; Wed, 22 Apr 2020 09:32:06 -0400
X-MC-Unique: fRSjUxQhONS6zPP932GmSA-1
Received: by mail-wr1-f71.google.com with SMTP id o8so603724wrm.11
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ez+E9s5mwrT8B9y8nVUYgFPf3iN6ckUcWWVa90evmD4=;
 b=BwqEM+w7DlljYUszAAL0LYzQhtte/nJH3neuUgOEMgJ6+104dN5jgwkJcdI7uKrnm4
 xcgbRhaBLrOyW01teSZZ1WzojbckFzUE4TgT6KfpELLdr7HbDncT4nPbR9V9owkT1bz/
 w1WdL4s+YE43CudpXyqzSZnwI6InZDtLmAYfQF4SYxBerw50Kw/HQ+b5BeyGMbensP99
 mpVIHcn+WdTgBcxjMUHYh4KphTt9jnxrG/Xhv+aS4LLP2I1CV4p5wwvqqr84sqStOFoy
 DSGo47iEmUtYiSsoJpYsjByvc7Cduz7RiNyz0dM4uPQSbGhffRf0grrrBOgbm48JAa1y
 Urzw==
X-Gm-Message-State: AGi0PuYn9S/G4y2FhV1VWij6iKhX0ksJcD20wG3g5qLtS9CSCVMVzb/h
 8OOGL7VV0XaUbamSHH/TyxxnlzKgGjJL4akmI5e/H8AtUmMm9FFlAN2BwJ8bLmCKvXQzKVMiKZN
 AMBNkd1wp29HB2X0PkA==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr11344964wmg.65.1587562325530; 
 Wed, 22 Apr 2020 06:32:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypLEMtqlGM7tlPDkeJxSPb7125x+W85cCCPYOZelLyU8UzBj4cOszGUa++XN2tBEWSaTPl4QZQ==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr11344924wmg.65.1587562325181; 
 Wed, 22 Apr 2020 06:32:05 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id b82sm8326135wmh.1.2020.04.22.06.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH v3 2/9] blockdev: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:45 +0200
Message-Id: <20200422133152.16770-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:12 -0000

Fix warning reported by Clang static code analyzer:

    CC      blockdev.o
  blockdev.c:2744:5: warning: Value stored to 'ret' is never read
      ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index fa8630cb41..6effd5afaa 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2741,7 +2741,7 @@ void qmp_block_resize(bool has_device, const char *de=
vice,
     }
=20
     bdrv_drained_begin(bs);
-    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
     bdrv_drained_end(bs);
=20
 out:
--=20
2.21.1


