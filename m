Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rWudy-0005cf-DE
	for mharc-qemu-trivial@gnu.org; Mon, 05 Feb 2024 03:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rWudu-0005bG-TO
 for qemu-trivial@nongnu.org; Mon, 05 Feb 2024 03:47:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rWuds-0001Yv-OO
 for qemu-trivial@nongnu.org; Mon, 05 Feb 2024 03:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707122872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XF/gzdWkzLb+R4ivMYmVDF1GJmoKIwqQztRxrIvdR8=;
 b=NdUlbb9x3JuVX6nZND2gkttSeCJRqEJk8HWKsv1+7NUie71tBevkdivL4e+y0QB4Xxx3TE
 AiKvObZtWyH2dXBeH7s4F71xwKj1OL3+CM3ybZjK7YG1IsNzOwGwdADLKbEFQmpvvA1rYV
 9KNjwCrppGr5pFaFxCnKY9WEkGvjSng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-GBIOxth5OjKsQO6xHnuznQ-1; Mon, 05 Feb 2024 03:47:49 -0500
X-MC-Unique: GBIOxth5OjKsQO6xHnuznQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85DCD1013661;
 Mon,  5 Feb 2024 08:47:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8391121313;
 Mon,  5 Feb 2024 08:47:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92D8621E66DA; Mon,  5 Feb 2024 09:47:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>
Subject: [PATCH 1/2] MAINTAINERS: Cover qapi/cxl.json
Date: Mon,  5 Feb 2024 09:47:46 +0100
Message-ID: <20240205084747.3623569-2-armbru@redhat.com>
In-Reply-To: <20240205084747.3623569-1-armbru@redhat.com>
References: <20240205084747.3623569-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.361,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 05 Feb 2024 08:47:55 -0000

Commit 415442a1b4a (hw/mem/cxl_type3: Add CXL RAS Error Injection
Support.) created qapi/cxl.json without adding it to MAINTAINERS.  Fix
that.

Cc: Ben Widawsky <ben.widawsky@intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f9741b898..00ada764a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2894,6 +2894,7 @@ S: Supported
 F: hw/cxl/
 F: hw/mem/cxl_type3.c
 F: include/hw/cxl/
+F: qapi/cxl.json
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-- 
2.43.0


