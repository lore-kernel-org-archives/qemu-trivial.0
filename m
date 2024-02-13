Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZrW9-0007lT-Ek
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 07:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUg-0005WH-VF
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUb-00018v-Pj
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-410ed9f8621so13076815e9.1
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 04:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825745; x=1708430545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ayrp4O65NFcTDb1yTi4BL/BlCGOiYywukaah937eUcY=;
 b=HiV6BISjM+zoVA8SKp6gxi8xRAFvar/AkpFSrgnoC3exQpi3nWVyc6Q2SRBiZDfXcd
 nAqIANlZr+xG1gz92noBInKeUlsuAn3Xr0ohG3txe6vRDz6xgZw4hKMSCHG/46kzNPV1
 grJ9tLesbiDgTvkHn0v/HxI3PlLIN8JxN97W9Kzy6b3UtKhcjXN+cSt0oe1m0S7uiXgn
 VMFGSHDiMs4KoZNvy89g/GcMG+aqgFwWA5V60//I7mMQ7l4ILVuy9Wsg6fajCFE8clf0
 VsQSzhNpoeq4OCG2ZPGOqnPqA6se3W8H2xj56Z5lyElj/Q5Jz/Mq1xBpopK7Bpc5eLeL
 DI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825745; x=1708430545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ayrp4O65NFcTDb1yTi4BL/BlCGOiYywukaah937eUcY=;
 b=AlNSxh3L55hiOGf6PsBuhM+yfkGRwymcn1iDqv4uLcJUPkv2IOx9s5jz9mDaF9MUKR
 E+Wg6V2LekfS1VKUunfdcYcpmLyffBSJt2tzL1BVgKMT7NPVdWUQY1sbrpdW/ztjZi67
 ZZD7CI4FOlNqhlbHztpCfNH71u3Ub84ORbQtCig8hVGH1KpLX3dHSycAtI5hTQknAoxI
 kSnnKnh1s1CpagEBvaiTEy0xouqmudjaFj4wA4LeO0Azgs6F60sdrzk1UhjhYVxb4Zfi
 sWlR/SuwkxuzzxS17Q0yKeqV4Pwu5obAAQolYd9lLi2fauTRJGeBDgIfya0Oifvb5zQ7
 CJwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhjI47z2gyYEyDT+43sPPal58R895mlGkQhSvj9BXtMohDi35dDc5B0hNybKN0WX2HdT7CMuvdFnvZ5Zttf6kpl/fNduJ2jQ==
X-Gm-Message-State: AOJu0Yx9VSxMszg4qWzCKxJdqmWsGgUk/MXwmc67OFihqusVMzXZb2EE
 5PBWUW6E2ce2Seam9PS28utYr6DmCYatJ5fztmWsNN3eSeTsb2RuOBUP3PZ+d/k=
X-Google-Smtp-Source: AGHT+IEhgXxFSfF5jytNoRCpqYbguZHENlv19t38CTxp68Q/OiCRo3pOp4kKAzjLLdHZodrBuQPPHg==
X-Received: by 2002:a05:600c:1e29:b0:411:d253:55dd with SMTP id
 ay41-20020a05600c1e2900b00411d25355ddmr48957wmb.8.1707825745599; 
 Tue, 13 Feb 2024 04:02:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvSyhAoTvZy/VW8haaGsPIaOu52Ie3GGnfaR0VW8l/5EuaRxD6uoSfmvQ46/aENAJ4TwJTQG6qB9x5jXpCS/JDB7SazEVUTwoQy/Gssz0tC2tAp0C7QeSjIjjSGotUQu4St0POXPYMplr8b3rqT9JNMrIEyeZpacm/3E6yzKk9laVlj8xmmrZkr/iPEKL4vU2e1IScsi9+0Bjtk97loZNjKa2gCjvi7E197LzutuJnDpT8LhfGLAN+5gC5zrZF6uq9Piymm0cnPBk6pHMuUf4KqLzEKYcw1Z9msDOqS+lZavvUyxbDaR4fbTh0vs5WVkPSGftz2FU=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 jg8-20020a05600ca00800b00410820995dcsm10995292wmb.23.2024.02.13.04.02.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 04:02:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/7] hw/i386/port92: Add missing 'hw/isa/isa.h' header
Date: Tue, 13 Feb 2024 13:01:50 +0100
Message-ID: <20240213120153.90930-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213120153.90930-1-philmd@linaro.org>
References: <20240213120153.90930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Feb 2024 12:02:50 -0000

TYPE_PORT92 inherits TYPE_ISA_DEVICE, so need to include
"hw/isa/isa.h" to get its declarations (currently we
indirectly include this header via "hw/i386/pc.h").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/port92.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index 1070bfbf36..b25157f6e4 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -10,6 +10,7 @@
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
 #include "trace.h"
 #include "qom/object.h"
-- 
2.41.0


