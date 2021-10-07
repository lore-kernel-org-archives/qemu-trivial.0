Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYPZG-000822-Q4
	for mharc-qemu-trivial@gnu.org; Thu, 07 Oct 2021 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPZF-000802-Rj
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPZD-0004Bt-1F
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633598393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D8cU27lq5klMAETnyUf7daQLc2+dsGARPgDFfJ3w2IQ=;
 b=VZEQBGXaHXRuK+6I0HdZzOwm8rm2jPnObAD6gI8V3GPLzHwVvxYFS97TBDQjkgDfQ2shM2
 UrQjvTrdVFtzP2w66mMV9Nd+P9j0jFmrAZLv5tZDNiQg4ruJBUygvY5JW/pu+7VtQ+B9Ya
 XK+3a3gWTlsosLOGebSCHblMn8WD4ZM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-zZTNPsSGNU2A-HZb-Lcj2w-1; Thu, 07 Oct 2021 05:19:52 -0400
X-MC-Unique: zZTNPsSGNU2A-HZb-Lcj2w-1
Received: by mail-wr1-f71.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso4190967wru.11
 for <qemu-trivial@nongnu.org>; Thu, 07 Oct 2021 02:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8cU27lq5klMAETnyUf7daQLc2+dsGARPgDFfJ3w2IQ=;
 b=KJg9sGAaD/afmWOn3TVpIO/1FX8vLgItniQpm3b/dDufb8bdZYkpelpt0uf/CCeJFJ
 WPWw7+v98GT8adKsTVmJJWoyOnsRtE2FYSsj2TGQREej6vQHHqLABtIPEJOUf3DeKB86
 uRne2FVEBt6CiU+rNhiB3emLN4Yo/7/QV9+ZUt9OQJd4JXQSUFWW5DFodJnc4iy2VLRt
 EDU2GvzvvvvExLF9gsIg/zH9UU0ccPlEIMxVdyPu0cN8JsSQSsg0Y8aUnnkJ8r7ra8Ng
 lAv4jGWNCpAIHq6+fODlfQWxdVR5wnRGstx2JtdzugNGeRe/nKji0Zm3MFewzIGq9087
 52rA==
X-Gm-Message-State: AOAM532Xn9tiSe/Muz5u7942hn4BcTmaBJo8CKCXWwvyhFxXOlchFfqG
 F0abWMjeNorXKks6oc3ivncwE1JKkzAegeA5IA1AFZFZvfQgRq3QD0Fs06Rx4tIGdf5XMHrMGxz
 vZI53y/yxim7S++Gpjw==
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr3338371wmz.149.1633598391351; 
 Thu, 07 Oct 2021 02:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkhWFwluJccazTpjGz54OjIEM9xAXrw1Z0CsIEsUEhxehwJlKPisTk8X34W7qzHgFxsjQ7wQ==
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr3338357wmz.149.1633598391174; 
 Thu, 07 Oct 2021 02:19:51 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o1sm10435677wmq.26.2021.10.07.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 02:19:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Add myself as reviewer of the 'Memory API'
Date: Thu,  7 Oct 2021 11:19:49 +0200
Message-Id: <20211007091949.319404-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Oct 2021 09:19:58 -0000

Having developed interest with the Memory API,
volunteer to review the patches.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..32b668e92fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-- 
2.31.1


