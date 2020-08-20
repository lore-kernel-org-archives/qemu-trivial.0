Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k8o4v-0002Ge-51
	for mharc-qemu-trivial@gnu.org; Thu, 20 Aug 2020 13:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8o4t-0002GS-I1
 for qemu-trivial@nongnu.org; Thu, 20 Aug 2020 13:10:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31626
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8o4r-0007jN-5t
 for qemu-trivial@nongnu.org; Thu, 20 Aug 2020 13:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597943412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=89jXPVPv2kkdtYzqNRsIdICSTxnn4TeU97yfa4KTTPA=;
 b=JJfeGLNG49TUVFhalql7q9fRJKgC/xjmWKb/D3cun4XQKo/UCQO/uJTviPXEsqEAYrijpz
 qgK2e/4j+WaSEAyPKgg/V0boUJGd5NHlknpOaeKDAmgPQaybOJuah++l4j48p+z36T2V0j
 G74s9bwWiuiYu6+SQv7kNII7rADY4Fk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-qOyxirfKNiGwZAI8E5Y0aw-1; Thu, 20 Aug 2020 13:10:10 -0400
X-MC-Unique: qOyxirfKNiGwZAI8E5Y0aw-1
Received: by mail-wr1-f71.google.com with SMTP id o10so864260wrs.21
 for <qemu-trivial@nongnu.org>; Thu, 20 Aug 2020 10:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89jXPVPv2kkdtYzqNRsIdICSTxnn4TeU97yfa4KTTPA=;
 b=lKsxYWHs0dFFS2YaZ6wU5KqmWYq+ge+xJH7WLLngCbTJq1rXP9krcWXkzAo/c8VCF/
 sbyEewn1m3ZG0wb9bkFA4ciZOt3aJmqSQNDc0L4YoQU9cbbtWbkuesxESZ1ZkUwiqe9d
 O344lW1n/Bx4XhswkbOhLwu4gSC089uh3Ftsddwuk9ymPlPkAyplP93s8FecdhPSretp
 VyD7Krdm9YEMMtnt+PsK5cIhfkVQc1X40tyISa4eMHatbA0JQNK3fWjng4hqO+LVAlKH
 Um/chwV0UPaaavoWf6LvL4l3ol5NYzKeAOHfk8H5dobz79MVWZmXYCk5SnpQm3EOrS91
 B6vQ==
X-Gm-Message-State: AOAM531ISGYlMQnqKcp0VV3ZCzmMjEmXYbmRq4C5bLGihygZP28niC0N
 StmQy6/0YQDtSQ89HGkvGQiI/bcVHuxYmfQ3IdWvzZZYrRK28vOd5CaSTdKmoqvEThj4RQpVQEL
 4G88pSDhy4Sy9PKOIlQ==
X-Received: by 2002:a7b:c15a:: with SMTP id z26mr4322653wmi.35.1597943408657; 
 Thu, 20 Aug 2020 10:10:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6vkc/ENYEyyhE4ftbqk24JUQ0Qp4VGz2Q3SbBQ6VwkezIHv1bpIW0ANwviU60jSvBcGDRdg==
X-Received: by 2002:a7b:c15a:: with SMTP id z26mr4322630wmi.35.1597943408390; 
 Thu, 20 Aug 2020 10:10:08 -0700 (PDT)
Received: from x1w.redhat.com (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id k204sm5658211wma.21.2020.08.20.10.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 10:10:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] util/vfio-helpers: Unify trace-events size format
Date: Thu, 20 Aug 2020 19:10:06 +0200
Message-Id: <20200820171006.1140228-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Aug 2020 17:10:15 -0000

Some 'qemu_vfio_*' trace events sizes are displayed using
decimal notation, other using hexadecimal notation:

  qemu_vfio_ram_block_added s 0xaaaaf2448d90 host 0xffff5bc00000 size 0x4000000
  qemu_vfio_dma_map s 0xaaaaf2448d90 host 0xffff5bc00000 size 67108864 temporary 0 iova (nil)
  qemu_vfio_find_mapping s 0xaaaaf2448d90 host 0xffff5bc00000
  qemu_vfio_new_mapping s 0xaaaaf2448d90 host 0xffff5bc00000 size 67108864 index 4 iova 0x114000
  qemu_vfio_do_mapping s 0xaaaaf2448d90 host 0xffff5bc00000 size 67108864 iova 0x114000

As it is hard to follow, unify using hexadecimal for all sizes:

  qemu_vfio_ram_block_added s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4000000
  qemu_vfio_dma_map s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4000000 temporary 0 iova (nil)
  qemu_vfio_find_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000
  qemu_vfio_new_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4000000 index 4 iova 0x114000
  qemu_vfio_do_mapping s 0xaaaaf1c60d90 host 0xffff2bc00000 size 0x4000000 iova 0x114000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/trace-events | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/trace-events b/util/trace-events
index 0ce42822eba..d9a0b4f8c63 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -79,7 +79,7 @@ qemu_vfio_dma_reset_temporary(void *s) "s %p"
 qemu_vfio_ram_block_added(void *s, void *p, size_t size) "s %p host %p size 0x%zx"
 qemu_vfio_ram_block_removed(void *s, void *p, size_t size) "s %p host %p size 0x%zx"
 qemu_vfio_find_mapping(void *s, void *p) "s %p host %p"
-qemu_vfio_new_mapping(void *s, void *host, size_t size, int index, uint64_t iova) "s %p host %p size %zu index %d iova 0x%"PRIx64
-qemu_vfio_do_mapping(void *s, void *host, size_t size, uint64_t iova) "s %p host %p size %zu iova 0x%"PRIx64
-qemu_vfio_dma_map(void *s, void *host, size_t size, bool temporary, uint64_t *iova) "s %p host %p size %zu temporary %d iova %p"
+qemu_vfio_new_mapping(void *s, void *host, size_t size, int index, uint64_t iova) "s %p host %p size 0x%zx index %d iova 0x%"PRIx64
+qemu_vfio_do_mapping(void *s, void *host, size_t size, uint64_t iova) "s %p host %p size 0x%zx iova 0x%"PRIx64
+qemu_vfio_dma_map(void *s, void *host, size_t size, bool temporary, uint64_t *iova) "s %p host %p size 0x%zx temporary %d iova %p"
 qemu_vfio_dma_unmap(void *s, void *host) "s %p host %p"
-- 
2.26.2


