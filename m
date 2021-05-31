Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lncQ8-0001om-7B
	for mharc-qemu-trivial@gnu.org; Mon, 31 May 2021 03:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lncQ6-0001ny-NY
 for qemu-trivial@nongnu.org; Mon, 31 May 2021 03:33:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lncQ3-0003RB-JV
 for qemu-trivial@nongnu.org; Mon, 31 May 2021 03:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622446381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5jmnHOWvn+pt2+p5G2jCNsjy2jOigKF3n+UFORfkt28=;
 b=eJ4XUUn5Oj8co9mKZAQmExtgiEODGd7EYXVGGKQDMB0zi3fj+kq0z3Khes3txJvO9cEacD
 Tjzm8r1PJ5uTHq9m15wgLpjCsM6N0/M5pk/N9xRaSlS2pH9zX/upUMgBRhk/qKfjvfADZx
 JxSkdfWmlATeHP6kGvZCm6k/0vtHGTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-FlkdP9seN-6Sdzh5K3yLQg-1; Mon, 31 May 2021 03:33:00 -0400
X-MC-Unique: FlkdP9seN-6Sdzh5K3yLQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261868015F8;
 Mon, 31 May 2021 07:32:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36765D9C0;
 Mon, 31 May 2021 07:32:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] hw/display/macfb: Classify the "nubus-macfb" as display device
Date: Mon, 31 May 2021 09:32:55 +0200
Message-Id: <20210531073255.46286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 31 May 2021 07:33:06 -0000

The "nubus-macfb" currently shows up as uncategorized device in
the output of "-device help". Put it into the display category
to fix this ugliness.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/macfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index ff8bdb846b..d8183b9bbd 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -450,6 +450,7 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
     dc->desc = "Nubus Macintosh framebuffer";
     dc->reset = macfb_nubus_reset;
     dc->vmsd = &vmstate_macfb;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     device_class_set_props(dc, macfb_nubus_properties);
 }
 
-- 
2.27.0


