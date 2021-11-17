Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnI2O-0004re-U5
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 05:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2N-0004q5-ML
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2L-0000fX-NQ
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02PE816bbNWzxpNCS1kraRI3EkuQsyuCCKVq+Ha8Pdk=;
 b=NVbDZ1XPZn2UCTmp7WtMH8RH30lB+0uFCD1nx/BOVmOG5ClcCBVmT0J1xm4q3bvWB2Yh7X
 HldLXpog3k1oCXN4PHOl9h2Lk5tmSkVPVRnlKp4f1xOt9KCp2VPrLW0o5Jj40piJqbjndK
 RC3k8qjDaHRQpcK4f5wlWeFDFqIYtXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-072_90eEN9-pQgJVSyyOKg-1; Wed, 17 Nov 2021 05:19:25 -0500
X-MC-Unique: 072_90eEN9-pQgJVSyyOKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 825E21023F4D;
 Wed, 17 Nov 2021 10:19:24 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCA02ADCD;
 Wed, 17 Nov 2021 10:19:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/6] target/s390x/cpu.h: Remove unused SIGP_MODE defines
Date: Wed, 17 Nov 2021 11:19:16 +0100
Message-Id: <20211117101921.622242-2-thuth@redhat.com>
In-Reply-To: <20211117101921.622242-1-thuth@redhat.com>
References: <20211117101921.622242-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 10:19:31 -0000

These are unused since commit 075e52b816648f21 ("s390x/cpumodel:
we are always in zarchitecture mode") and it's unlikely that we
will ever need them again. So let's simply remove them now.

Message-Id: <20211015124219.1330830-1-thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3153d053e9..ca3845d023 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -674,11 +674,6 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
 #define SIGP_STAT_INVALID_ORDER     0x00000002UL
 #define SIGP_STAT_RECEIVER_CHECK    0x00000001UL
 
-/* SIGP SET ARCHITECTURE modes */
-#define SIGP_MODE_ESA_S390 0
-#define SIGP_MODE_Z_ARCH_TRANS_ALL_PSW 1
-#define SIGP_MODE_Z_ARCH_TRANS_CUR_PSW 2
-
 /* SIGP order code mask corresponding to bit positions 56-63 */
 #define SIGP_ORDER_MASK 0x000000ff
 
-- 
2.27.0


