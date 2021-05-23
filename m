Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lkkbL-0003fA-Np
	for mharc-qemu-trivial@gnu.org; Sun, 23 May 2021 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lkkbK-0003eg-1f
 for qemu-trivial@nongnu.org; Sun, 23 May 2021 05:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lkkbH-00049H-He
 for qemu-trivial@nongnu.org; Sun, 23 May 2021 05:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621762846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l/srWcdbIelU+Cf/uD7ox1LabteZtPhwyCo62ZgjXfs=;
 b=OVt7f5iHi+EOkJsMVpRAmZEiWFLg0A11u9PjbQ6tXji32CCi/JbCA+Ggk77FNPTcdS25gG
 IX3HMcqdM+8tkcs36/6265M2Mgji99ohJJxH4YaFn+h/N4DnGjgigv8P8Ayw7dco8iNRDA
 Q/InYpG9clQ2oqdqj2u+LoMLVqZigfM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-pvqNWy7CMKqwiIWc52qoRQ-1; Sun, 23 May 2021 05:40:43 -0400
X-MC-Unique: pvqNWy7CMKqwiIWc52qoRQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c15-20020a05640227cfb029038d710bf29cso7862821ede.16
 for <qemu-trivial@nongnu.org>; Sun, 23 May 2021 02:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/srWcdbIelU+Cf/uD7ox1LabteZtPhwyCo62ZgjXfs=;
 b=RtmmIGlS9hsv5CuR+Ugq9OaiuTopJXCIaCoyvrn/xGCuVSxpCX1HploJCFofrsIHbJ
 /JDReo3KznrUhCwdpAj8s9F5yEtMC+SudcXN8INkPMOesvE7gKztJu7L5EyV4W86aIId
 jGVy50vM0/r+imDCl5r1UjD8WYHNMaXo4UG6o7t1bJwR8KBTnhlotxCc2IrGk3m5YmbN
 KqNLivw6o+2v4RtbRfvqm1T3dXvjV9+3fI2T+pApol6xPo+YFVAPzcHRNJZaaz2MmH8U
 qIvUScI6ek3wNPvRh6x/9l99ERf+FqvK9TJqnS3yZgOtg3nzKi4uN7thiVOddMB+JuTq
 hEag==
X-Gm-Message-State: AOAM530cm6I/xAyH2osg2+7jqVK5Al1i7fT84sVDbGfeT9PWHKqEF0+N
 1pxuWmGHiqZ0VdRyoBYhudAVNMGASqQ5lojF3DCDqOt7wm8qx/TUVI13wUNF/fnpHFY+w4HxqOc
 hGwH7CPp+VL28xvF2Pw==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr19764506edv.315.1621762841959; 
 Sun, 23 May 2021 02:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3uMxU61e0PG8/u8JR/p8mSE7qqj/8U5YovHt2hc93HAAlsNtHgxYEiugKVwsFIkuFw6zNeQ==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr19764494edv.315.1621762841782; 
 Sun, 23 May 2021 02:40:41 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id qo14sm6479143ejb.47.2021.05.23.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 02:40:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Date: Sun, 23 May 2021 11:40:40 +0200
Message-Id: <20210523094040.3516968-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
X-List-Received-Date: Sun, 23 May 2021 09:40:50 -0000

Such comments make reviewing this file somehow easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: only one space before end of comment (mst)
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..130e3568409 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
     }
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     uint16_t old, new;
@@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
     return vring_need_event(off, new, old);
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     VRingPackedDescEvent e;
-- 
2.26.3


