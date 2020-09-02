Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNoV-0005LB-R4
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoU-0005Jp-Hc
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58207
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoS-0001hm-U0
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPF1JmHQsw2mw4z7BQY/4JOe6Rk75NCWTSoQBVL6aXM=;
 b=RbyLJH4RXi2VcDu7JSpuqS7RIOtiyaEfdh4Prv6Bpfix9yaaAt8d6/vmZQuNJUwU9rSnvm
 K6HNGgvDrlK4vm1IoeZhUBJQfI+VXYpNhB1RWrPdQnjoaBOMqc3/B8xQUJnoqN3xcvjxWL
 OGd6549vCft1y6HFBdKGy4bAoZ5Ih+Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-GC3lxSAgOReXN2LO4D8kew-1; Wed, 02 Sep 2020 04:08:10 -0400
X-MC-Unique: GC3lxSAgOReXN2LO4D8kew-1
Received: by mail-wm1-f71.google.com with SMTP id m125so1528383wmm.7
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPF1JmHQsw2mw4z7BQY/4JOe6Rk75NCWTSoQBVL6aXM=;
 b=CqvKKXzOWwubxvegVbF7NiIKwLxdlT8uRGv+MP3ivUKGyO9kvvC1pKMp4/RPFwwZN0
 mdGw4fB5qYMM1T1VsBscc1o5VcUqp33MHjro5tftB3l57W6GAWlrcnCsNobiXpEe51vV
 eiA5g/ZFMpFQqNHn91uJ87JJ3u9HX3WNyJrGFqAlqWLrUhNQ+Dl7AmgBojl0HYWsPssP
 xPcosFJQ0K/BL2NkGTpT3MbiRHU9SwOjuF15cC/d4Fa6UoPyy3/bqATYk6Z8TWlmxr6r
 d77PkAWTjkzUqXvw+Za4fqYsca9M7rFpJg/l+NHa9Mai7U/F4QRNJkchlwn7poqQPeZz
 DHWg==
X-Gm-Message-State: AOAM532kRx5lzFI6r6N30X7Qms2hQtJMime8l5hYRUIZjCrSeWtzXXLg
 tJe/BQBEb2QlpwqWj9KVcVfOu8Hti+FmrUns7zD7krwJ+BKLiwEj07WT+09bfYOKp3hyvvDIWWT
 RzJfFKrsXelCsSDcPXw==
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr5834674wma.53.1599034089428; 
 Wed, 02 Sep 2020 01:08:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW0XYpgcnPnvy8YKh/9V5gsyJxMZdgNgUKfw5PiBuuQ1ZE0VXGs6olHM8kzbTBpoZq7XIpfw==
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr5834649wma.53.1599034089270; 
 Wed, 02 Sep 2020 01:08:09 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q6sm5093038wmq.19.2020.09.02.01.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/5] tests/qtest/ipmi-kcs: Fix assert side-effect
Date: Wed,  2 Sep 2020 10:07:57 +0200
Message-Id: <20200902080801.160652-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902080801.160652-1-philmd@redhat.com>
References: <20200902080801.160652-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 02 Sep 2020 08:08:14 -0000

Fix assert side-effect reported by Coverity:

  /qemu/tests/qtest/ipmi-kcs-test.c: 84 in kcs_wait_obf()
  83         while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
  >>>     CID 1432368:  Incorrect expression  (ASSERT_SIDE_EFFECT)
  >>>     Argument "--count" of g_assert() has a side effect.  The containing function might work differently in a non-debug build.
  84             g_assert(--count != 0);

Reported-by: Coverity (CID 1432368)
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/ipmi-kcs-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index 693a6aacb52..fc0a918c8d1 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -81,7 +81,8 @@ static void kcs_wait_obf(void)
 {
     unsigned int count = 1000;
     while (IPMI_KCS_CMDREG_GET_OBF() == 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
     }
 }
 
-- 
2.26.2


