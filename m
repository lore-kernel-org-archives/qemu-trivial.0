Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPk58-0007o2-FE
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 06:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPk57-0007mU-1Z
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 06:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPk55-0006lf-Ef
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 06:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601979626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HekdKEga8XzGGk8AvnlQk/FKItrDV2L0PcjzfELbkfY=;
 b=JHfY8smigN7kfHx25JWJ5/SdcWHiuJGpUCmQteR9BFBRpY8ECyzhmu4A0xMFV7BFi+Wg48
 iTrboxcEsKahJil9ouMFRfkTm+FiLaQvr76NlnWHUkz43g+d5WCC1AE+G6YmszybtdkPEA
 2MwBC+8BNI4XR9CzqluzWUq7K8B33ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-PXmRc7gYPHKDK4PcskFQGw-1; Tue, 06 Oct 2020 06:20:22 -0400
X-MC-Unique: PXmRc7gYPHKDK4PcskFQGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA72104D3F6;
 Tue,  6 Oct 2020 10:20:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEC1810013BD;
 Tue,  6 Oct 2020 10:20:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] version.texi.in: remove
Date: Tue,  6 Oct 2020 06:20:20 -0400
Message-Id: <20201006102020.334094-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
X-List-Received-Date: Tue, 06 Oct 2020 10:20:29 -0000

This is not needed anymore, since there aren't any more Texinfo
sources.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 version.texi.in | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 version.texi.in

diff --git a/version.texi.in b/version.texi.in
deleted file mode 100644
index 0a723b8be6..0000000000
--- a/version.texi.in
+++ /dev/null
@@ -1,2 +0,0 @@
-@set VERSION @VERSION@
-@set CONFDIR @qemu_confdir@
-- 
2.26.2


