Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nJh7k-00025C-EH
	for mharc-qemu-trivial@gnu.org; Mon, 14 Feb 2022 14:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7X-00021p-Kg
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 14:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7T-0003nn-8Y
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 14:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644867276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1n9AQ37W0b14xZXad/BfVMGr5Wd3DU/6I9HeKxTuVj0=;
 b=XXfkjk0+pR1kAsgMFMY5+2lJ2fjPeMJ2uUiD0EQijYRGbg+FxhZy8I6ibU/dGr8Cn7P+Cp
 /QsZQ9+CwXyxmPbi+l7xOWAla76ADhKdkKMQsSNr3tyIQJYRLnRWJAbCSNHf4vbIrZq4Hs
 xvQqYBUc0SZ7PYuikrdzeh18zx8dKQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-kwy39YLbOP6R6QJrcoz7Tw-1; Mon, 14 Feb 2022 14:34:35 -0500
X-MC-Unique: kwy39YLbOP6R6QJrcoz7Tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DF2383DBE2;
 Mon, 14 Feb 2022 19:34:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75BA5F4F6;
 Mon, 14 Feb 2022 19:34:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 1/1] vdpa: Make ncs autofree
Date: Mon, 14 Feb 2022 20:34:15 +0100
Message-Id: <20220214193415.1606752-2-eperezma@redhat.com>
In-Reply-To: <20220214193415.1606752-1-eperezma@redhat.com>
References: <20220214193415.1606752-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 14 Feb 2022 19:34:50 -0000

Simplifying memory management.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4125d13118..4befba5cc7 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 {
     const NetdevVhostVDPAOptions *opts;
     int vdpa_device_fd;
-    NetClientState **ncs, *nc;
+    g_autofree NetClientState **ncs = NULL;
+    NetClientState *nc;
     int queue_pairs, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
@@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
             goto err;
     }
 
-    g_free(ncs);
     return 0;
 
 err:
@@ -310,7 +310,6 @@ err:
         qemu_del_net_client(ncs[0]);
     }
     qemu_close(vdpa_device_fd);
-    g_free(ncs);
 
     return -1;
 }
-- 
2.27.0


