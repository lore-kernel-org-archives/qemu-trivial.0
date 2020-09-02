Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDNoR-0005GN-Kh
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2020 04:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoQ-0005Eq-5Q
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44779
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDNoO-0001go-0H
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2020 04:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CbYixINhpQModzpfyZXayzanTCK/bGB3UBj1WchAysQ=;
 b=L4z29lFn8wOsflYmhxf0/6gFPvm5NAm334cVE46r9hjD1/R56UHis+8xBUa3EiGI7FW/qE
 q/7BdUDdC8MzGLwdtmJPt4kDsMpSGy9ZQJ22/v/Nh7PKwvUgY5HKyXv/ZolRbt+FSFVsUj
 M8WCs7NYd6Gih9VX7BcqcdyM5JSXRQw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467--lT52Si0Pj6C9Bys3gypDg-1; Wed, 02 Sep 2020 04:08:05 -0400
X-MC-Unique: -lT52Si0Pj6C9Bys3gypDg-1
Received: by mail-wr1-f72.google.com with SMTP id v12so1647013wrm.9
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2020 01:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbYixINhpQModzpfyZXayzanTCK/bGB3UBj1WchAysQ=;
 b=uQPkljSAlmIpjtZ5/zFkUiguFVI8uzWIZ6JD3OJjfP8zlqdv6bcwRRvdMIfW5IMRJj
 RRfFnltDFILWPTEEL1Ve0B8aSD5sRqFOYNIImC2lbJ73GwogdQf3mHnr87uX+rvZEkww
 nRkEfFUnuGuafSfk4wdVidh0OCk+i/y/PUphU9COXvNUfdveOAKpM5OO21IPOyOo+cZT
 3J5pmHTZ0/MEMZXe/SFNMb8zJs06sO86TYlW9sPJcxyE5Xao7i4TONpEyw1AeQBLU+1F
 uDe1TWF/LTbJvVH5sCPQAuZYfpHnR58T0ORjVtJwCV3Brx9Q3LwVbqMnCCUqn8GFRSIZ
 HISw==
X-Gm-Message-State: AOAM531xLnyTO06lctI0MgTYDklv0rkSF9HN6RkBuKEC8QSU9+A+aOK5
 7c4cs8rOizmPtHrGMICBxfGNIiiWz+RkE15crBP5ZQLKs7YeTa+u6iwlN8MKgSM1+1uBITQPKWc
 VrepeUtEdyBQjvOWq6g==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr5644652wrw.87.1599034084238;
 Wed, 02 Sep 2020 01:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0hnTmjf6TyPZSDic3rqSM/zVRo8gg6Pg9xJwOuEUnahBeEP++Lc5CrrB+7/xZ1WzO1k66rA==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr5644628wrw.87.1599034084046;
 Wed, 02 Sep 2020 01:08:04 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id c4sm6054281wrp.85.2020.09.02.01.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 01:08:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <minyard@acm.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] misc: Reduce assert side-effects
Date: Wed,  2 Sep 2020 10:07:56 +0200
Message-Id: <20200902080801.160652-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Wed, 02 Sep 2020 08:08:10 -0000

Fix a Coverity warning in qtest,
do not declare local variable only used for assertions
(use them directly).

Philippe Mathieu-Daudé (5):
  tests/qtest/ipmi-kcs: Fix assert side-effect
  hw/pci-bridge: Do not declare local variable only used for assertion
  hw/ppc/spapr: Do not declare local variable only used for assertion
  tcg/tcg: Do not declare local variable only used for assertion
  util/qsp: Do not declare local variable only used for assertion

 hw/pci-bridge/pci_bridge_dev.c | 4 +---
 hw/ppc/spapr.c                 | 3 +--
 tcg/tcg.c                      | 3 +--
 tests/qtest/ipmi-kcs-test.c    | 3 ++-
 util/qsp.c                     | 4 +---
 5 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.26.2


