Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rRzoI-0007t8-32
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jan 2024 14:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rRzoG-0007qW-4E
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 14:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rRzoE-0004cF-P7
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 14:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705951094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3u6Yy9CfrVqwRHpuhwl3ZEXeFccWfWXdnHXfJdqu0U=;
 b=OFwv1eqR9lB9B0N5+RyELcFIrh9Cz8FuSWM+LnU2Un1N9Hy/3qTSvQWd3HdkHbVn0YEtgz
 /h34Nn3y7teeJhytsw2kmskE/d5QQu7XOl2Bq+iaAnIi3p3SX4gUEpqHEXYMMbrwKqgQB/
 ybQVpWcft0Zc8jhQx3K4LtuT3vG9/wc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-yVRBcxsbNu2UAsUKFqchqw-1; Mon,
 22 Jan 2024 14:18:11 -0500
X-MC-Unique: yVRBcxsbNu2UAsUKFqchqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F9F28EA6E5;
 Mon, 22 Jan 2024 19:18:05 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B332492BC6;
 Mon, 22 Jan 2024 19:18:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
Subject: [PATCH 5/5] util/uri: Remove unused macros ISA_RESERVED() and
 ISA_GEN_DELIM()
Date: Mon, 22 Jan 2024 20:17:53 +0100
Message-ID: <20240122191753.103118-6-thuth@redhat.com>
In-Reply-To: <20240122191753.103118-1-thuth@redhat.com>
References: <20240122191753.103118-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Jan 2024 19:18:16 -0000

They are not used anywhere, so there's no need to keep them around.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/uri.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index 5f5ca79792..2deab91da3 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -163,19 +163,6 @@ static void uri_clean(URI *uri);
      ((*(p) == '+')) || ((*(p) == ',')) || ((*(p) == ';')) ||                  \
      ((*(p) == '=')) || ((*(p) == '\'')))
 
-/*
- *    gen-delims    = ":" / "/" / "?" / "#" / "[" / "]" / "@"
- */
-#define ISA_GEN_DELIM(p)                                                       \
-    (((*(p) == ':')) || ((*(p) == '/')) || ((*(p) == '?')) ||                  \
-     ((*(p) == '#')) || ((*(p) == '[')) || ((*(p) == ']')) ||                  \
-     ((*(p) == '@')))
-
-/*
- *    reserved      = gen-delims / sub-delims
- */
-#define ISA_RESERVED(p) (ISA_GEN_DELIM(p) || (ISA_SUB_DELIM(p)))
-
 /*
  *    unreserved    = ALPHA / DIGIT / "-" / "." / "_" / "~"
  */
-- 
2.43.0


