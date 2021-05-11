Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPq7-0005z4-6u
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 06:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq4-0005qH-Qj
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq3-0002CD-B2
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guuOznVmgMt5Msd5BdcbUpq7g6SfjX+AgvERcmwMxV8=;
 b=XF+A49W8RBSCYu3Z/Pm4uMDZilduh7pIcTSKFUrlfFn8pGusDckXnOSp7/aky5tgfcfvNy
 NWjme0UQEceZTQYdBecd+5/TrtIREid/RBbq+Da3K6xW8JT8w/1atTxA7Ijqg9Wg72Y1RL
 z0o7RE6bq/YQohW2/DoUT+rXxhuGoGI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-uluLG3rhM5GrxVxCmZgQrA-1; Tue, 11 May 2021 06:42:05 -0400
X-MC-Unique: uluLG3rhM5GrxVxCmZgQrA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso8566476wrf.7
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 03:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guuOznVmgMt5Msd5BdcbUpq7g6SfjX+AgvERcmwMxV8=;
 b=qtWkMVFAI7cLG24uXT0YrXCucrTI6a7iyIqvjoXREIgcdDOQMYHgKqYwqV2qTA53vP
 mE0den2TZ5HCMMIOFPCz5jnuQfLNk6ly5+aVOw/ZZnW6BbrsJAEBPdWkiO9EEGKRQwMU
 EWDCNJL4ba3JWHtwLdxu9pEHhIJyBk6l/08BJhuUF1Zqhk3a0a5I7vj+uH17TCQ5xGuK
 GLydPw93rz5y5LWMuit6Ql/54/Q9E4t1NVqh47FHHCGSqUe5C84Kmo9Xg/6fOYfCuCRC
 V0koybK1XgIcN/I3o1DGqOBOs4GXdaTHqn7bO6F7qRhYU5+qW64xx/paclJYgufmbRSQ
 RFVA==
X-Gm-Message-State: AOAM532Mh1YiGCOask/GyiPutFjOnf1ogj7+x+GFgzBkNU12klR8pR4D
 eH3eZ3TSNMw/KMHzEQNi2NQO1uCj32UEOV33y1VdK8jfhFp/wsHOzqU7RAakF3q1jzBfcUhksxS
 VFEkymqvjdaV4n+Msxg==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr37025542wrx.82.1620729723985; 
 Tue, 11 May 2021 03:42:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG0+rR3OxuIyKac0sbNFqHgHpRAu66113zstocWkjyedi+qgGAn6TgGowvckH1AI5gNTPRIg==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr37025516wrx.82.1620729723760; 
 Tue, 11 May 2021 03:42:03 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x11sm665178wrl.13.2021.05.11.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/3] hw/virtio: Pass virtio_feature_get_config_size() a const
 argument
Date: Tue, 11 May 2021 12:41:55 +0200
Message-Id: <20210511104157.2880306-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 May 2021 10:42:09 -0000

The VirtIOFeature structure isn't modified, mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio.h | 2 +-
 hw/virtio/virtio.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a89..8bab9cfb750 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -43,7 +43,7 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
-size_t virtio_feature_get_config_size(VirtIOFeature *features,
+size_t virtio_feature_get_config_size(const VirtIOFeature *features,
                                       uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e13cb9e3ad..e02544b2df7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2981,7 +2981,7 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(VirtIOFeature *feature_sizes,
+size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
                                       uint64_t host_features)
 {
     size_t config_size = 0;
-- 
2.26.3


