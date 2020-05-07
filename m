Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWfNO-0000gT-71
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2020 08:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNM-0000dD-R5
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39898
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNL-0001He-SN
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588853498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWIK2WHkaZ7PoBsR/efTku5ERSpbN52iLBpjRvBRm84=;
 b=aUBk52BXCW/lsdFzxgvClywrgJ0ngBgMVxqi9Kev8My+bSKBAKmIXbnOGSaky99tUpFAtb
 TxstpQ5DUcEdh5pYhSLAxcD3zSjCAmxU/gDZyAIQuF78iF+xHIohR9/kTxB59JDcDkyw4E
 cjWNVVAA7b9ZG9Y7i8vf0p2qr5h+cyY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-VCUHFO0XMwKWpsDJsFkkXw-1; Thu, 07 May 2020 08:11:37 -0400
X-MC-Unique: VCUHFO0XMwKWpsDJsFkkXw-1
Received: by mail-wm1-f70.google.com with SMTP id d134so3966259wmd.0
 for <qemu-trivial@nongnu.org>; Thu, 07 May 2020 05:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkOiz5+/Or/F9UlBm2bD/eJ721rs8ZUrKCeW7YzdojA=;
 b=co1cqGaL8KKy9Tw7r/OSbySGdzCzq2OX3Y+m+0sLF0ky3+2E28c+KdzMPRvrJn6bZX
 4BDY/icG5QnXV5eTwhXdYEfouVQwTkCkVpS8DnRCJ3IQfx5l3zxkRhjGVBHIGDohyc8s
 Cg4p3pHZAmMwDlsN30QjTH9ZWU/wstpnp/AP0iinUtFStJqOvfoXLCySpD73dh+5Cdfl
 saBZ+JAarKJntnG7HA2z9lg+2/o42XLXEdmDxbArmk0y4dwUp+OlOAH3cvwFuRkfuUnX
 huKRVe5FZu2X0dbGQZxmZMMg67O4+m/ulmUj3aA+Jvbz3y5HyVwCgLIzEajgDdM1Xh8u
 C86g==
X-Gm-Message-State: AGi0PubZmVXbdfrmokRA7FoZxCF5K/HRq7C6H3pZEf9W7nvgXmwIxWzl
 ftEj2xv9mxK/h/7QLZKgN1qVrZTiBNJjXBPyf5YUp6eFLTAqqJiG02xsHGghaKzIuqtJTPxi0YU
 yz2UpIg18hV/JXZkXJA==
X-Received: by 2002:adf:e450:: with SMTP id t16mr16420898wrm.301.1588853495917; 
 Thu, 07 May 2020 05:11:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypLoDqmQk78n0oGh5Q7LPEFCvVDqtsjoMbc+seVsA+rilXX6q9Lry+ejELZJgUYNIDTLJHlMvA==
X-Received: by 2002:adf:e450:: with SMTP id t16mr16420879wrm.301.1588853495686; 
 Thu, 07 May 2020 05:11:35 -0700 (PDT)
Received: from x1w.redhat.com (248.red-88-21-203.staticip.rima-tde.net.
 [88.21.203.248])
 by smtp.gmail.com with ESMTPSA id c17sm7889111wrn.59.2020.05.07.05.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 05:11:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
Date: Thu,  7 May 2020 14:11:28 +0200
Message-Id: <20200507121129.29760-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200507121129.29760-1-philmd@redhat.com>
References: <20200507121129.29760-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 07 May 2020 12:11:41 -0000

Fix when building with -Os:

    CC      block/block-copy.o
  block/block-copy.c: In function =E2=80=98block_copy_task_entry=E2=80=99:
  block/block-copy.c:428:38: error: =E2=80=98error_is_read=E2=80=99 may be =
used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
    428 |         t->call_state->error_is_read =3D error_is_read;
        |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block/block-copy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 03500680f7..83e16c89d9 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -418,7 +418,7 @@ out:
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t =3D container_of(task, BlockCopyTask, task);
-    bool error_is_read;
+    bool error_is_read =3D false;
     int ret;
=20
     ret =3D block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
--=20
2.21.3


