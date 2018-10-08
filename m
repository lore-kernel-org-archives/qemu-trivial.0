Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9VLG-0006lR-53
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 09:12:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1g9L5y-0002qm-AO
	for qemu-trivial@nongnu.org; Sun, 07 Oct 2018 22:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1g9L5x-0003em-4W
	for qemu-trivial@nongnu.org; Sun, 07 Oct 2018 22:16:30 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1g9L5o-0003Sy-SU; Sun, 07 Oct 2018 22:16:20 -0400
Received: by mail-pg1-x543.google.com with SMTP id y18-v6so7124603pge.0;
	Sun, 07 Oct 2018 19:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d3GfhjVv75yGlLIp/j87dkrvzKfrEKnUMCx7aJo9tO0=;
	b=GeIE/qu9FUT/6jmKPoaWHMkLvVqZ/evEzN+z8S1C6vUbDIsJA7Nk5jSRptzZ0eYwd+
	KHxjtb44j9lnDdjcLu+b5cflH1qx4Ar77cTeeHibCdnrTC3sPJz9ZmGC2LG7fb/DwKAN
	YqCiu2AiKqWYxHhktd/IEzJKIuTRdqnPVEc7VL2Xj3ddYSQaSWo0+Ewv0ivh5C1Xu9VW
	Ui440zfEwXxT/j64NPTDteUhmY8x1Pqqo+HV3kAw54MyJkOr2B7fL0tpYOikIA2IWTFG
	MT20oQy2QOJNKH5xkdyMwwb8ag10lYuuMAQvtCfpF1KiG6A8HtUaAKbKcw5PQPC4Ncfp
	f8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d3GfhjVv75yGlLIp/j87dkrvzKfrEKnUMCx7aJo9tO0=;
	b=alJVK26ipKHBK1ojsomR7AuCz1z25jXJrffMOYt4argncB2MCbh8Hc7TFsXS6/Z/XR
	RBSnFxd44u0S4kEHbMgv9vQW5/f4TNDY3AoVoi+HtHuj79oPJjIT+VHmFtlzbKBVWxmo
	3E7v/QPRn10VYlnDXpeNgLs2zkOEF6r1koamC/+cG5vs2aXwc52UNe7+GZ0lsXmbZNYq
	AsD2PnGqPwBjFIFiOWdNNOtEz+7fXshxSWIKM2RT3HsrpAp8ZLyt1zuLs0UanCvKIDLI
	RfBQYbrqGvrHfwVoNgi3uiRYFhVZpS5oVihLv4h0sWyZafRaylcnJdTjI4gxJT16tJsF
	/X2Q==
X-Gm-Message-State: ABuFfoisXQLULKlk2bcr611c3iFUF9AENsAZvOUH05FT5SF7dEiSh0Di
	DnvKIejFnebSUn4b97rcfgs=
X-Google-Smtp-Source: ACcGV62N4eo0nH7VcSCC7bAyXwX5d0ZJoo9URLSq2j5xri+EqepcmrLueAzArGRLzPrNX32A27lWPA==
X-Received: by 2002:a63:4e11:: with SMTP id
	c17-v6mr19089649pgb.6.1538964978892; 
	Sun, 07 Oct 2018 19:16:18 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([103.65.40.65])
	by smtp.gmail.com with ESMTPSA id
	n63-v6sm12156892pfn.9.2018.10.07.19.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Oct 2018 19:16:18 -0700 (PDT)
From: Li Qiang <liq3ea@gmail.com>
To: stefanha@redhat.com,
	famz@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Sun,  7 Oct 2018 19:16:12 -0700
Message-Id: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-Mailman-Approved-At: Mon, 08 Oct 2018 09:12:57 -0400
Subject: [Qemu-trivial] [PATCH] util: aio-posix: fix a typo
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
X-List-Received-Date: Mon, 08 Oct 2018 02:16:33 -0000

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 util/aio-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 621b302..51c41ed 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -40,7 +40,7 @@ struct AioHandler
 
 #ifdef CONFIG_EPOLL_CREATE1
 
-/* The fd number threashold to switch to epoll */
+/* The fd number threshold to switch to epoll */
 #define EPOLL_ENABLE_THRESHOLD 64
 
 static void aio_epoll_disable(AioContext *ctx)
-- 
1.8.3.1


