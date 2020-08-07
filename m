Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3zTq-00025c-AW
	for mharc-qemu-trivial@gnu.org; Fri, 07 Aug 2020 06:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1k3zTo-00024Y-UR
 for qemu-trivial@nongnu.org; Fri, 07 Aug 2020 06:20:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58455
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1k3zTm-0008R8-Kq
 for qemu-trivial@nongnu.org; Fri, 07 Aug 2020 06:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596795601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U3jgB8f4t32FScXD2bE8GEWWu2d3d9v8tTQoHldZkrQ=;
 b=gMawRPc4K5VUBTVnvuOIAKAou9NzLgBTQ8tuysVrB0VFu9yNvsAyQnCY5B3Y/96ehF4nbK
 9nMfZRGb/NboOlSxMigzMBJ0j/5RQBM8BdhA4BiPbA3pXr6M00enWzGdKILWThoVm8BSDt
 aFQVypyzMjXN0VSOlhzMQ8C8Jr+5GEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-2gtjRhr1NM2ZFTLL0Oeu5w-1; Fri, 07 Aug 2020 06:17:41 -0400
X-MC-Unique: 2gtjRhr1NM2ZFTLL0Oeu5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B2E102C7ED;
 Fri,  7 Aug 2020 10:17:40 +0000 (UTC)
Received: from hansolo.redhat.com (ovpn-13-81.pek2.redhat.com [10.72.13.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1FFF2DE77;
 Fri,  7 Aug 2020 10:17:38 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	laurent@vivier.eu,
	Han Han <hhan@redhat.com>
Subject: [PATCH] docs: Fix broken links
Date: Fri,  7 Aug 2020 18:17:36 +0800
Message-Id: <20200807101736.3544506-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hhan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=hhan@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Aug 2020 10:20:05 -0000

Signed-off-by: Han Han <hhan@redhat.com>
---
 docs/amd-memory-encryption.txt | 4 ++--
 docs/pvrdma.txt                | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index 43bf3ee6a5..80b8eb00e9 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -95,10 +95,10 @@ References
 -----------------
 
 AMD Memory Encryption whitepaper:
-http://amd-dev.wpengine.netdna-cdn.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
+https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
 
 Secure Encrypted Virtualization Key Management:
-[1] http://support.amd.com/TechDocs/55766_SEV-KM API_Specification.pdf
+[1] http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf
 
 KVM Forum slides:
 http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
diff --git a/docs/pvrdma.txt b/docs/pvrdma.txt
index 0f0dd8a7e5..5c122fe818 100644
--- a/docs/pvrdma.txt
+++ b/docs/pvrdma.txt
@@ -18,7 +18,7 @@ over-commit and, even if not implemented yet, migration support will be
 possible with some HW assistance.
 
 A project presentation accompany this document:
-- http://events.linuxfoundation.org/sites/events/files/slides/lpc-2017-pvrdma-marcel-apfelbaum-yuval-shaia.pdf
+- https://blog.linuxplumbersconf.org/2017/ocw/system/presentations/4730/original/lpc-2017-pvrdma-marcel-apfelbaum-yuval-shaia.pdf
 
 
 
-- 
2.27.0


