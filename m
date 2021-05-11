Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPqK-0006KY-KG
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 06:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPqG-0006Jg-Va
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPqC-0002Jj-MV
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVG2n9XotM2KhddIex7o7vuIKhUEP78KP392Bahm1XY=;
 b=UPanS0g4D3a5cbSki+2Ynu0JZNQhwURKgSGgpAyKON1iBBoMJ+mX0ad3PGLeZDU5TR9jjO
 p0zSz/nR/3CTO+MY9+Z97BLw++zVyqyyIvzRnx//tbfVbT//tzzmsywlsdpGfxhi5fHSAw
 2dy3dI0jAmucwV3JLrOJdf2elPRjSG4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-frNcQrEAPBGgZE9sOizHOw-1; Tue, 11 May 2021 06:42:14 -0400
X-MC-Unique: frNcQrEAPBGgZE9sOizHOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so8545895wre.22
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVG2n9XotM2KhddIex7o7vuIKhUEP78KP392Bahm1XY=;
 b=ROwoxp5epbOK3Vofq6bhJMLLHe3B++2uX3saqTRtYnjGnLSwneA/XsVy5kfAHpU3XT
 +x9rl+XlHu66OFlqXDCX5TF5SusVn4pAVpKgjwqNSctEXo9po2PEiPZCnuCo+wOtB1lm
 KYdmnKtF3VJ5Mz8zopPHriLy7OAFJ/uGd/YWT+Pc+KLreeKy5NZjfD0LGULsUYbb6Shd
 YpMwMGI6rg14Lo9gnUbeYMCn4lDKS/fyScIkxBae6pqVJZwGQystr9GTH6avGeccFKk4
 ImI7KPnDj39q9R3tDHJ3xL75UA/11BLenVFodk4YNgs93c7HsrK8TvUJkqzaTBDo8ZHq
 JQMQ==
X-Gm-Message-State: AOAM5320j8WVlymBkSKH/Z8Cv3h3s2NuHpezK1Sm5GHm8zMWyz1V3Q7n
 NyLAUif1O+kCimE7IjihOLNJBXeuMatUouQ3pxVzRXMVe5m9SXZjXKFqOf0dnTvKsQhC5smj6V0
 7Wv3TZY9KEMGh5qhpWA==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr37706207wrt.164.1620729732678; 
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqXkOs+visRNo76+/+kYzrI/MSr5X+AGkyAdK8wmYBSilwONUYlx/BMa7vx3Q39/CT9fGfPg==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr37706196wrt.164.1620729732569; 
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v15sm3101362wmj.39.2021.05.11.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/3] virtio-net: Constify VirtIOFeature feature_sizes[]
Date: Tue, 11 May 2021 12:41:57 +0200
Message-Id: <20210511104157.2880306-4-philmd@redhat.com>
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
X-List-Received-Date: Tue, 11 May 2021 10:42:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff45118..6b7e8dd04ef 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -89,7 +89,7 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
     {.flags = 1ULL << VIRTIO_NET_F_STATUS,
-- 
2.26.3


