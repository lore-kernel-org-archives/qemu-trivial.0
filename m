Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNot-0006Fh-Ir
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNor-0006BA-TF
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoq-0001lm-4z
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPGPiB1QKs5CSZ+0D2TKHKMlGexrsgYUk0usBoV2JpU=;
 b=V7eLTBbMPQK7wLs4HZi5AZSM7Ss3Zf5v5CC1dLXVxa2zsQww62n3WFthG5UYx9AajvnatZ
 1RD851mDW00Azj1f3zV9Fk8ZLgexflNjhFZwEqx/4E89l8ezgmxkTcWVPW1dTBSHcaAcbP
 oUIyQK5HeDaJ4Z1RWUBjcGFCSsidNOg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-1961Fe7TMIugx2KpI2JN8Q-1; Wed, 02 Sep 2020 04:08:34 -0400
X-MC-Unique: 1961Fe7TMIugx2KpI2JN8Q-1
Received: by mail-wr1-f72.google.com with SMTP id 33so1657228wre.0
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPGPiB1QKs5CSZ+0D2TKHKMlGexrsgYUk0usBoV2JpU=;
 b=Hhtm3iAmVQjuOklAmgUNGXi/oGag4Yp/dDdoOakUlQP2eCGTyc67ES9Vgkq1He3MZB
 kuU3ISH4SFqp9oCItSWgfsnRpIvPeN1YSSr3hoDdu5iUGqaGLcAMo/RqGvMnyKOvAJBs
 kCcmbeS96otJHuoysfBjtzPcMlxWJvCcaoSvpU5X8/8c5q3JslebQjNO+ET29hYlQBKX
 6gkC0piqzGMuyj/Lhuj8OgGDK/BfWqVLhesPqTab6Mwtip0Dx7RgsrsM6e8ILLZRyPLm
 T3YGMf34KQNedlTn+xFf4PVSIZOE0f4uPkvK6i296xjKegzG7J1NUaQ6YX80hvAa1psV
 DVsA==
X-Gm-Message-State: AOAM531NMYBC02kN1TGmZe2RISsb19cGYZ2pXCW7wiyoR2rOQxD7pPqd
 YaXSAnv2M6Uo2eRDap5NPkza1RisuJaeSKC2dFde95nVbSGv+xTeseL+0wM6/5AW80wtjKkqAly
 u6XRU5t1EEAbhLh0drw==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr1493756wrs.27.1599034110190;
 Wed, 02 Sep 2020 01:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWlP3zIU6c2cv0vrpsCyddH9464yfvzmcKWfRGRoxhqImfNkE+p33PY74ZHfGcY0Zao6U0kw==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr1493740wrs.27.1599034109985;
 Wed, 02 Sep 2020 01:08:29 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id a15sm2887216wrn.3.2020.09.02.01.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 5/5] util/qsp: Do not declare local variable only used for
 assertion
Date: Wed,  2 Sep 2020 10:08:01 +0200
Message-Id: <20200902080801.160652-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902080801.160652-1-philmd@redhat.com>
References: <20200902080801.160652-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 01:13:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 02 Sep 2020 08:08:38 -0000

This variable is used once in an assertion. Remove single
declaration and access directly in the assert().

See in "qemu/osdep.h":

 *                                  [...] disable assertion is not
 * supported upstream so the risk is all yours.  Meanwhile, please
 * submit patches to remove any side-effects inside an assertion, or
 * fixing error handling that should use Error instead of assert.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/qsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/util/qsp.c b/util/qsp.c
index 7d5147f1b20..1db044ecedd 100644
--- a/util/qsp.c
+++ b/util/qsp.c
@@ -560,9 +560,7 @@ static void qsp_iter_diff(void *p, uint32_t hash, void *htp)
 
     /* No point in reporting an empty entry */
     if (new->n_acqs == 0 && new->ns == 0) {
-        bool removed = qht_remove(ht, new, hash);
-
-        g_assert(removed);
+        g_assert(qht_remove(ht, new, hash));
         g_free(new);
     }
 }
-- 
2.26.2


