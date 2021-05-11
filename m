Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPqB-0006Ev-FN
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 06:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq9-00068d-Pc
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq8-0002Fa-Db
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1iTG1yjolMhBDy0+VNZDVcooHD0ZAJOzdWx2SUtTQk=;
 b=ZWoieGlmTX+RXh/At+wVfZmG3Bei5S3RPVAF6wI+JhHAgfmV5IycksLpw6alVmIHJ4cyCL
 Jl12y6Ocyx7Jm8FNsfWDJPPy1GuZv9zxzbxUopJqPnKOm70X66FQvUdaxJV/76Ij6uji8e
 MwGGHcvlpeUcSHSmx2LdN9u61SXsIRI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-6Ibh72vzMNKEbLCClR823g-1; Tue, 11 May 2021 06:42:09 -0400
X-MC-Unique: 6Ibh72vzMNKEbLCClR823g-1
Received: by mail-wr1-f72.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so8609605wrc.5
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 03:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1iTG1yjolMhBDy0+VNZDVcooHD0ZAJOzdWx2SUtTQk=;
 b=Uk2Uk4oQGvlC4oWDHxprMeI7Cky8nl+3tOZbWx3kW8lPXclTvEKIGg6hKnaLZCxxkj
 dboiQqRxsVxOXXVX7rNs7e/oPFeG27HTwY3wsdmhnFEHA5ysQR9nEyMwc0iWS+h0gRyW
 UsTiOpVM2FXVMLb1b1XJgkUEqozP7rsG/e1wPImlkfI4Z8DyKGHRYyG6MWCGhGPmXAU4
 FECner2a2LiuN+0AkCGTuKpdO8/iPmhYYUk6Bf+mRWDuUPS/BLqgu8yy2IbiMvVfWYEa
 u4YQunfX7xpQ5CIxqQgEguuh7Y2BYfT344Inw3OUtpogR30ksN0ukO+DlqHpAJ9KJyUC
 OdpA==
X-Gm-Message-State: AOAM530Bi5+h/jgm7XUnoa6ypxVAbWpa+534NYrHLya0dxZmDh7FaRX4
 exhzBjv/GXHpkC4A3Ss0iLIYXbvJoPHUcQeRPY1WE7u57oKaC/xaxVRMI9N1vdnbRtlUx7dpwgy
 h/YMmJUxOPtylA5r4mA==
X-Received: by 2002:adf:e510:: with SMTP id j16mr37794828wrm.28.1620729728335; 
 Tue, 11 May 2021 03:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv5XBBZ0qMOazznFfZigWz5hluW3ryczVSzJckCIkkWIplwaxlHe9vrbqbQHM2e8YxGory/A==
X-Received: by 2002:adf:e510:: with SMTP id j16mr37794809wrm.28.1620729728226; 
 Tue, 11 May 2021 03:42:08 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r18sm1394695wmp.0.2021.05.11.03.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:42:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/3] virtio-blk: Constify VirtIOFeature feature_sizes[]
Date: Tue, 11 May 2021 12:41:56 +0200
Message-Id: <20210511104157.2880306-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
References: <20210511104157.2880306-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 11 May 2021 10:42:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index d28979efb8d..f139cd7cc9c 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -40,7 +40,7 @@
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
  */
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-- 
2.26.3


