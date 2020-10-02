Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOFwT-0001ed-Qj
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 03:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kOFwS-0001eT-MZ
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 03:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kOFwR-0006gt-35
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 03:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601625442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GUZ3nahLtsN6ysOXUaTD5/IBM8hbjZ2M6e1FnNyYS/s=;
 b=csaxUOVskfS9eCJ9PeJYDvrbo0uBTQgRmFXGj+cq1ngBVzaPrCjJt5P2siBiAGY0kGsFCi
 Zzv0GdpvQ57ykO0Cb2qP5cg6J0aKMuT34aNMqqcWVZE/dqR/pjUOUV3UIDR/ztzfoRcFdD
 Lwlin61W9sOWHdrB5JCCijR7TfGncWA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-5qarue7JNRa4Gu1NmEFc5Q-1; Fri, 02 Oct 2020 03:57:20 -0400
X-MC-Unique: 5qarue7JNRa4Gu1NmEFc5Q-1
Received: by mail-wr1-f71.google.com with SMTP id r16so243969wrm.18
 for <qemu-trivial@nongnu.org>; Fri, 02 Oct 2020 00:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GUZ3nahLtsN6ysOXUaTD5/IBM8hbjZ2M6e1FnNyYS/s=;
 b=satralt4talTVnkSZFejWVyRaGVR7I60DPeMukCKtvuFhbP2DwpmP7+L7wIfm/nIyo
 SD16W3UugK1RIk8lSVqelWdByNMxxXmuZamP+Iz808G3SrpnBMRR+GqNQOnptWs16lmD
 pyfzlxNb92YIIzG9yvC2t+NCCWTjkPw8dxQeuxvbxiA7CLHHAWpFEKKhwdB6SmgkrxIS
 1uUSzjHMaYxH/5yYNijbYcTjoYQPOlAA8NKK2d5hkC/JhCAfkXAuqBQwm/JDlDE0vF00
 o784JAHOBkKLFaAb8KIC7n9MkOOLxw8Wi6NtJfYPo+OL+XIf2b0Fo8fZWcdWacgJdgXy
 r09w==
X-Gm-Message-State: AOAM532ACIlGJM23h7CstVIMERVrZxMfWJ0VW67xIAqXnKz385i8yWsO
 JPqjDJDvL6vgv8ti9t0uqitEmQ+SAB0ukvDRqK2SBI05yAhvxkL49kxn4MFOIh6ydU0/KpGnZfi
 onDkbeZ20ocwAz7DrWw==
X-Received: by 2002:adf:e690:: with SMTP id r16mr1484182wrm.15.1601625439428; 
 Fri, 02 Oct 2020 00:57:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkCX3qCe54u1P+ctBCOUhXnodSBAE5w3a9lLFpCTlRGMggsdzPcKIlXvdsYjWUyoKNcccwFA==
X-Received: by 2002:adf:e690:: with SMTP id r16mr1484163wrm.15.1601625439195; 
 Fri, 02 Oct 2020 00:57:19 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id g14sm802943wrv.25.2020.10.02.00.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 00:57:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/block/nvme: Simplify timestamp sum
Date: Fri,  2 Oct 2020 09:57:16 +0200
Message-Id: <20201002075716.1657849-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 02 Oct 2020 07:57:24 -0000

As the 'timestamp' variable is declared as a 48-bit bitfield,
we do not need to wrap the sum result.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 63078f6009..44fa5b9076 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1280,12 +1280,7 @@ static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
 
     union nvme_timestamp ts;
     ts.all = 0;
-
-    /*
-     * If the sum of the Timestamp value set by the host and the elapsed
-     * time exceeds 2^48, the value returned should be reduced modulo 2^48.
-     */
-    ts.timestamp = (n->host_timestamp + elapsed_time) & 0xffffffffffff;
+    ts.timestamp = n->host_timestamp + elapsed_time;
 
     /* If the host timestamp is non-zero, set the timestamp origin */
     ts.origin = n->host_timestamp ? 0x01 : 0x00;
-- 
2.26.2


