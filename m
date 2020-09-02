Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNon-0005zE-8C
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNom-0005w0-1T
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30851
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNok-0001kw-EP
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqoGra6YF9Ce6QcGdVGR0NnxjhhD6ItqfGW+etggexM=;
 b=Adrm/wh75UZy8CX5RK/re8qVmZ36qETV1bFok/j6Ps6yX5aTRag3LKscDL/zBXfrVQG7bI
 LIIk1UChvuJxH6EReRQj7G1briwJd4re0RiIyV3ioIGoGec20XMzPO1U0GJTH/rPwDnkBn
 HZLK3WV4AQ+fE320O3hKvr89A7T+O7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-5hDBRrVyNcaCXJJhGTCo5g-1; Wed, 02 Sep 2020 04:08:26 -0400
X-MC-Unique: 5hDBRrVyNcaCXJJhGTCo5g-1
Received: by mail-wm1-f69.google.com with SMTP id k12so1108415wmj.1
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qqoGra6YF9Ce6QcGdVGR0NnxjhhD6ItqfGW+etggexM=;
 b=kf3WfAEWgH/20YNSNASQfQoscvfd/ZKEn7DNwBcUXHctnHO8aVGbShKRVUJAZiOLez
 d7ojAO7vaUMYMUKacNgmtLhuvNsMq4igkkf3SaNPm0jQKlI/gNYMinTYqRptrDYTBvtU
 KYD8a4SyFRl3DUiYiRyiSr0vzSQ6v9kzkA9OuYcxKJxcX//vCvZttISFsDZScglkhlT3
 AJi/MQTrgBGOHf5n0e0QHacvwzw2fDKtuUHVWkE0wV3AOpPqLrPfLFGqBSTT+g54aiGB
 E3ntOaD32lrFC20wcPABr12FT0HpSmCQizm0WJ24Duc0tyfpqGOgOC+9dcX8pNCZWLXY
 +rdQ==
X-Gm-Message-State: AOAM5330ddAT6tw6zvTdRgINrMM7VcTNi5qfSL7bTQnHMNmf2HdjB2bb
 zXUyjfpqi8+M4OeZkl1LdHYZ0IS1WTqZfgrVSSkFZ24NyMaMer3WxVJG31Tzy8fj/plbo4S5QCE
 EBJ122slMDb8Mq44LBA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr5304991wmr.76.1599034105338;
 Wed, 02 Sep 2020 01:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhMl1QiX60uBZI3rBLSdHTG2Ml6h8GrTYZUS2VqvWLkBp44hIuMHZxZN5lK/+XKS+Vhksetw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr5304974wmr.76.1599034105170;
 Wed, 02 Sep 2020 01:08:25 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b194sm82986wmd.42.2020.09.02.01.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/5] tcg/tcg: Do not declare local variable only used for
 assertion
Date: Wed,  2 Sep 2020 10:08:00 +0200
Message-Id: <20200902080801.160652-5-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Sep 2020 08:08:32 -0000

This variable is used once in an assertion. Remove single
declaration and access directly in the assert().

See in "qemu/osdep.h":

 *                                  [...] disable assertion is not
 * supported upstream so the risk is all yours.  Meanwhile, please
 * submit patches to remove any side-effects inside an assertion, or
 * fixing error handling that should use Error instead of assert.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tcg/tcg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 62f299e36e5..0bff49e544a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -777,7 +777,6 @@ void tcg_register_thread(void)
 #else
 void tcg_register_thread(void)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
     bool err;
@@ -795,7 +794,7 @@ void tcg_register_thread(void)
 
     /* Claim an entry in tcg_ctxs */
     n = atomic_fetch_inc(&n_tcg_ctxs);
-    g_assert(n < ms->smp.max_cpus);
+    g_assert(n < MACHINE(qdev_get_machine())->smp.max_cpus);
     atomic_set(&tcg_ctxs[n], s);
 
     if (n > 0) {
-- 
2.26.2


