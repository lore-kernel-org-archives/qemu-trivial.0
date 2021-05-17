Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lif07-0006Ul-At
	for mharc-qemu-trivial@gnu.org; Mon, 17 May 2021 11:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lif03-0006Lc-C3
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 11:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lif00-0005sI-BS
 for qemu-trivial@nongnu.org; Mon, 17 May 2021 11:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621264659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmZt2+BHkEoRkkk4UXUpNMZeaaK0Bg6JdFlKV6MLN8c=;
 b=E6s0VyjYVw6zoYWn/GiPhOq6hBw2H1HFK44CnO/ClmrQM5z39MxZ9/DsI64W2ecbUdjzNt
 1JmhnFSHeex5nW/GEwfo6Or3EZP/dOq7w9XO4ww/xMscMfpvHhelTf5HWzxMlScGnNeMF6
 p9z6VTdaGQ0jyqKQOcBrrP4FnaxPBMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-EGWi-VsiNZyIr2Le7nX_gQ-1; Mon, 17 May 2021 11:17:37 -0400
X-MC-Unique: EGWi-VsiNZyIr2Le7nX_gQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0DF107ACC7;
 Mon, 17 May 2021 15:17:36 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-84.ams2.redhat.com
 [10.36.115.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 316C960BE5;
 Mon, 17 May 2021 15:17:35 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH 5/5] docs: fix references to docs/devel/s390-dasd-ipl.rst
Date: Mon, 17 May 2021 17:17:02 +0200
Message-Id: <20210517151702.109066-6-sgarzare@redhat.com>
In-Reply-To: <20210517151702.109066-1-sgarzare@redhat.com>
References: <20210517151702.109066-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
X-List-Received-Date: Mon, 17 May 2021 15:17:45 -0000

Commit cc3d15a5ea ("docs: rstfy s390 dasd ipl documentation")
converted docs/devel/s390-dasd-ipl.txt to docs/devel/s390-dasd-ipl.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/s390-dasd-ipl.txt/s390-dasd-ipl.rst/ \
      $(git grep -l docs/devel/s390-dasd-ipl.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 pc-bios/s390-ccw/dasd-ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
index 71cbae2f16..254bb1a15e 100644
--- a/pc-bios/s390-ccw/dasd-ipl.c
+++ b/pc-bios/s390-ccw/dasd-ipl.c
@@ -205,7 +205,7 @@ static void run_ipl2(SubChannelId schid, uint16_t cutype, uint32_t addr)
 
 /*
  * Limitations in vfio-ccw support complicate the IPL process. Details can
- * be found in docs/devel/s390-dasd-ipl.txt
+ * be found in docs/devel/s390-dasd-ipl.rst
  */
 void dasd_ipl(SubChannelId schid, uint16_t cutype)
 {
-- 
2.31.1


