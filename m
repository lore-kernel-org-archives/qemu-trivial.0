Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn4JN-0003Bu-Od
	for mharc-qemu-trivial@gnu.org; Tue, 16 Nov 2021 14:40:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4JJ-0003AU-9H
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 14:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4JH-00052D-5a
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 14:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vUm/TldBGul3tXTFoBTYvPf/CBw3dYy/5GqR7NLE5aM=;
 b=N4N2g2iIyXof+U9nBqg3SXdYqTFdls0Fky8GrC4XJRq298hJIFe7FSW7qYf8A+YGhlkkDF
 Wdi9LH5AYI4AGzLz7JLYNxIKyuRAP0eyS1O7QztVPSLIKSv/mPkrP8PLpZsTqHQYXKOuCA
 pMxLBkr1goTortUOsbTR6kuUc7pe4g0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-9ivLqXTqNEWqYvbNfPwSGg-1; Tue, 16 Nov 2021 14:39:58 -0500
X-MC-Unique: 9ivLqXTqNEWqYvbNfPwSGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so571048wrg.3
 for <qemu-trivial@nongnu.org>; Tue, 16 Nov 2021 11:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vUm/TldBGul3tXTFoBTYvPf/CBw3dYy/5GqR7NLE5aM=;
 b=FYnDsIiIyoHxlQgtUeBydHVqnt+IdB/yKHrSXsj/I+tckZ1d4oZndRnc4a6VQUyVG+
 QYeVIPVvwmJ24jsVmdLgHsXAv7QdiNAeZ1kMuPKNHABgp1keH+hrPFaIcCJP9sZznjUz
 0RG3R/lGVxULjcQn5+iQIFPjhCgtAQMPEOls3PzqDoK2uVJ5zF6o9lL+Pg5PxAhi2COp
 w4aigCgEJGnqwDS/7lL0alqPmxiJXokNLH2t28GtR/8OdBuctyWTzOFqdr73UaZnFqEZ
 2MsueJKy114vsgkVMcHVYndB2wzAj+BXniGc47g10pZj5iYFlURPvHoXVrD5Yy+ODsyw
 aPag==
X-Gm-Message-State: AOAM533CwGqqlMUFWMqLW8Loco+2OAxdY0nY7eChSpzQKURafkKJScvK
 9cn9gf19EkcmaHNo84LGaujGiIdymJPDARMUmCIzvPIVOi2PoXwcFSFJRSxfsuIj92yyfsew4zW
 +KN9q48vpC4DO/icpMw==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr12099843wrs.270.1637091596791; 
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjY6Ggy48Sz4Z7KSFG/UEcnlEmgFThlxSG+OeC1hX1jIxFW4ooC+TV0bBUU9e86E9prClV6w==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr12099825wrs.270.1637091596610; 
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j19sm18354634wra.5.2021.11.16.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
Date: Tue, 16 Nov 2021 20:39:55 +0100
Message-Id: <20211116193955.2793171-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
X-List-Received-Date: Tue, 16 Nov 2021 19:40:07 -0000

QEMU coding style mandates to not use Linux kernel internal
types for scalars types. Replace __u32 by uint32_t.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5a698bde19a..13f8e30c2a5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->edx = cpu->hyperv_limits[2];
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        __u32 function;
+        uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
         for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
-- 
2.31.1


