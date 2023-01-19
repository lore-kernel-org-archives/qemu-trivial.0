Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIUUN-0007n2-3F
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2023 07:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIUUM-0007mu-Bv
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 07:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIUUL-0002ZT-0Q
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 07:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674133072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=h/3uW24yen8vHmu+W3BIkqk5oyfqWDuW2m0eb0sRbq4=;
 b=XPXu13Gk+Rm7tGR956o4Xs3jBpcfG7tBI+C5dsamG4O1SRO1/K6/b6PW0eZ+GEc+avDYxu
 DOpszAxLD7wAwML9sg3nevulBcqfAeLoBp6Vag+9L00SA8FTcCurWAF6c5H+hn38OW/E6E
 vU94kwIOq/BIpDR9NeEJ4Eqxe1aXIHk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-1wNt8wV9NV2qrqJzE7_pMQ-1; Thu, 19 Jan 2023 07:57:48 -0500
X-MC-Unique: 1wNt8wV9NV2qrqJzE7_pMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15768280BCA5;
 Thu, 19 Jan 2023 12:57:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D60DE492B02;
 Thu, 19 Jan 2023 12:57:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] configs/targets/nios2-softmmu: Add TARGET_NEED_FDT=y to the
 nios2 config
Date: Thu, 19 Jan 2023 13:57:45 +0100
Message-Id: <20230119125745.2028814-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 12:57:54 -0000

qemu-system-nios2 uses the functions from libfdt in hw/nios2/boot.c,
so this target has to be marked with TARGET_NEED_FDT=y in its config
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configs/targets/nios2-softmmu.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 1e93b54cd1..5823fc02c8 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=nios2
 TARGET_ALIGNED_ONLY=y
+TARGET_NEED_FDT=y
-- 
2.31.1


