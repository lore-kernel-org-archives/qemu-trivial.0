Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKJa2-0004aO-5O
	for mharc-qemu-trivial@gnu.org; Mon, 21 Sep 2020 07:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKJa0-0004Z5-Jb
 for qemu-trivial@nongnu.org; Mon, 21 Sep 2020 07:01:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49507
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKJZy-0005a1-UY
 for qemu-trivial@nongnu.org; Mon, 21 Sep 2020 07:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600686113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wV4+WdW4FWzUt71VT+Q4JOE9A0gMJkMnKTuWpyklnGw=;
 b=V/keHLnEy5i0+sUr7J/jBlxEGH9Oy7DHLazvwmddX2qHDpXN+/VWX5nOZxRKuoeQbQ3Mst
 +DDgZEB2DhjttLOc2Z8OoznJV508XhbhNYhBvmZVvJMAN13zSoKY1x/m40jRQKUchuPDrT
 GgPwzIy9klWWqDxrAM0vSgPl0Kqx7c0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-XNQj54LVOPOHFu3A7FLv1A-1; Mon, 21 Sep 2020 07:01:49 -0400
X-MC-Unique: XNQj54LVOPOHFu3A7FLv1A-1
Received: by mail-wm1-f70.google.com with SMTP id r10so3563102wmh.0
 for <qemu-trivial@nongnu.org>; Mon, 21 Sep 2020 04:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wV4+WdW4FWzUt71VT+Q4JOE9A0gMJkMnKTuWpyklnGw=;
 b=RLa6P6xPEjtj8kJ/+wHSUJYfD20Hz7o0jlLR7IgtzFTXWFA2ADtzn8kmugcs5Z5Umh
 RhW8KvZBuQZKmR0zfqedRVxwBnPVrL7ai68rgb9OuXtxlAuZht23ZKHG1SLoIwuvpccE
 MBUXpwuPwUTFjGVfBGZgZGuOrTcreghM6+xDsh7JZj9Vi1oWrhikwYtexIEDSsNM+ckW
 WZiKGXZiD+8b82ZXPnv7q94Mg7kkzefmIw/QHUrvMSkdpf21Xy8TFvTR1Nqv1PMjQcmM
 2c/XCx9q97ne00lxysm4raWY8D9D5jfnpansceTVyCuiXa0IrEqLV3rFpeUfvLV0MV03
 4x6g==
X-Gm-Message-State: AOAM531Mt5gBu+fRDpOKd66/orEFJ5Pwb8lV8UzEkTUAckSlZU1Zkw+n
 KHEwdOGSM6QZSnJuwsh207qDKdFq0A/K/rtLCL0i7sX+TSzorn2qjhzvwnnpttyEk0XdozB7odt
 0Cxt1hE8Wha7jY/mZxA==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr11890534wmk.87.1600686108330; 
 Mon, 21 Sep 2020 04:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHoNAzVcwsm2gbND4w/6goazRsLqMZZCIUS7TbpWeTxrshxPc2QRbyTetetlpst811HtZeBg==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr11890505wmk.87.1600686108154; 
 Mon, 21 Sep 2020 04:01:48 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id z11sm20001837wru.88.2020.09.21.04.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 04:01:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liu Yuan <namei.unix@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 sheepdog@lists.wpkg.org, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] block/sheepdog: Replace magic val by NANOSECONDS_PER_SECOND
 definition
Date: Mon, 21 Sep 2020 13:01:45 +0200
Message-Id: <20200921110145.520944-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 21 Sep 2020 11:01:56 -0000

Use self-explicit NANOSECONDS_PER_SECOND definition instead
of magic value.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/sheepdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index cbbebc1aaf2..cbc655a1a05 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -740,7 +740,7 @@ static coroutine_fn void reconnect_to_sdog(void *opaque)
         if (s->fd < 0) {
             trace_sheepdog_reconnect_to_sdog();
             error_report_err(local_err);
-            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000000ULL);
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, NANOSECONDS_PER_SECOND);
         }
     };
 
-- 
2.26.2


