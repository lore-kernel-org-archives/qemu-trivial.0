Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYrAa-0005cU-Aj
	for mharc-qemu-trivial@gnu.org; Mon, 28 Mar 2022 11:20:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYrAZ-0005c6-1P
 for qemu-trivial@nongnu.org; Mon, 28 Mar 2022 11:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYrAU-0000Re-9I
 for qemu-trivial@nongnu.org; Mon, 28 Mar 2022 11:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648480829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XqQhkl4K9hzigj8pIPh9KD+EcMNejVLlcJfRvHSvwE4=;
 b=FX51Pe4MQqNFB3WfcKZtfYi2Tk/nRB0BELkCRJfTwZ4JyEjtRlzeZVvjYmLiSJCDxLnibB
 GIwiWeYLTDf1JTUmgdvNMqRQk0AbBhdkEyB+T0E5e/VxVG8fyoUdYekfujb5sM39Fl1iry
 eYbXLufxh3wh4kBFWwfINykv+FNLoEU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-_yuH8TNdO6qr29t45hJm0w-1; Mon, 28 Mar 2022 11:20:27 -0400
X-MC-Unique: _yuH8TNdO6qr29t45hJm0w-1
Received: by mail-qv1-f72.google.com with SMTP id
 j8-20020ad454c8000000b0044111c17099so11625720qvx.0
 for <qemu-trivial@nongnu.org>; Mon, 28 Mar 2022 08:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqQhkl4K9hzigj8pIPh9KD+EcMNejVLlcJfRvHSvwE4=;
 b=q8qyMbNSMR1NPsDG6kWlGesTwOEbrpZKICE5vdj/ujI2BEyK8mugJMKZ2S92HSn30P
 TwKnmBFbJp0IryQciRUnXTMoOSq+7URbVqnWnLGtiK7oDqgb1Yz9fXvwjqJUfVlt+shi
 VV2SVnXsHIsJcHzvQHgUoGLOwWWORnocoX8uUBjAWEWzDvd0nrQgZjdGXa+EthfBmapj
 lkrfFovsrZ6BwracmnckACL6UCksb4mPX4WqpNSCCH/0CxLvGjsaZgDHan3DfBiEAa7B
 +6sMMFwRhZd09rj1NTIrFKpWRlRYzFdtajxISnlfHqjFXydnY50K9GKG7gkqUajFGCZj
 YSew==
X-Gm-Message-State: AOAM531ba52LdYv/5YWzP0XlIhDfY1ke4WWysj9bh1nVsNs/yiOs9c6M
 fA5fEB8dJDQWmNAiUoC6Jjmjx2/yiFpu2zi+7BvvXjsu4zcKUsioySqu2r5siGcSOfYIgUTVqXi
 rls4VP/9xhbs/nbCQ4g==
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id
 s19-20020a05622a179300b002e1ba410ed2mr22044768qtk.238.1648480826634; 
 Mon, 28 Mar 2022 08:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCxtEQ5rQE2Jyki1NBSuIViSi942YXAcGTBCOtSlRlbyaodoT/bHZqIs0YSpBSvpkN0t0F0A==
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id
 s19-20020a05622a179300b002e1ba410ed2mr22044750qtk.238.1648480826416; 
 Mon, 28 Mar 2022 08:20:26 -0700 (PDT)
Received: from step1.redhat.com (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 m1-20020ae9e001000000b0067d430bba8asm8013298qkk.88.2022.03.28.08.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:20:25 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] vhost-vdpa: fix typo in a comment
Date: Mon, 28 Mar 2022 17:20:22 +0200
Message-Id: <20220328152022.73245-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Mar 2022 15:20:35 -0000

Replace vpda with vdpa.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3779..8adf7c0b92 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -299,7 +299,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     memory_region_unref(section->mr);
 }
 /*
- * IOTLB API is used by vhost-vpda which requires incremental updating
+ * IOTLB API is used by vhost-vdpa which requires incremental updating
  * of the mapping. So we can not use generic vhost memory listener which
  * depends on the addnop().
  */
-- 
2.35.1


