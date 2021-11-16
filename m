Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn4In-0002Uj-Eh
	for mharc-qemu-trivial@gnu.org; Tue, 16 Nov 2021 14:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4Ik-0002PP-E6
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 14:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4Ig-0004yj-Dc
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 14:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GIpUvbEKDGJYwbOfsTk6d6DEwisEvrspb/CuiSeCHVA=;
 b=IH+KXMUdxS/l6YmhrU9OwL9ngMUDKF9fy95NxPfr75GJw285E4XfjSTx0/zUGDEUOxZWrz
 DJm9w66XjQnajoovWMamUQvSlPZuJrrJ8iKH6judLK+YypU9X/4ud7E9ytTkpMHqpVbA1d
 WEcxNRs7aMdryNYQG5f1lWUsGyI8bc0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-XbwSiPT0ONK6rrs6AUcM0A-1; Tue, 16 Nov 2021 14:39:18 -0500
X-MC-Unique: XbwSiPT0ONK6rrs6AUcM0A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so181014wmr.3
 for <qemu-trivial@nongnu.org>; Tue, 16 Nov 2021 11:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIpUvbEKDGJYwbOfsTk6d6DEwisEvrspb/CuiSeCHVA=;
 b=MCLLXsUr4wz8cl2GIYinKDXrI9GAPmEqJQZeWeOA1tp5DCmYJ6zs4gX04OaR8dWm/S
 1VP0XT8d/wL0zGCAmdgxJqkWX292bMdT1jlJ4IcZpcBV+SUjsEDN0LIPBhDS/yJalE6G
 kGD26AgnbjnTD1G2igl3Jfmg6GQxgVqpGf090UF0wEhw+1QeIOYuvxgzGAuAs+8JCI7I
 HpIcYDjTBgzj7TJSXQLiU7Ju9V/RsyaqDF5Pbh7JlzmW2LjMHxsGKh2mRnOPT6bsb4cQ
 N7Up3URUkLh94968KTCHurOFe0lk9hnEcIgM8d+mzXsy7UyMgchfU4Wszpk7WD3YBqa9
 LAig==
X-Gm-Message-State: AOAM532Fp2mbDalyiRrJipgadORPjiJCra6I1bfZoFGAQjVvhFLvQj5a
 FqQZ1ZjjHWSCkeg+V2DL3FjFw9NGv3Ptc2vHlslJI8OBzI2gDdpKN28aQPVc75VHBbK7E13LFBo
 hhd71xFUilowt3GySCg==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr10605739wmq.62.1637091557446; 
 Tue, 16 Nov 2021 11:39:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxYZhdZbg6ZIVKy9F0viwLO8PKJrjjd0VFOyKVlcPGxVOZf9ya4tZ8iiMYdQfdMqieJIQE+Q==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr10605693wmq.62.1637091557098; 
 Tue, 16 Nov 2021 11:39:17 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 x1sm18388004wru.40.2021.11.16.11.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:39:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org,
 Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-7.0] hw/net/rocker: Remove unused definitions
Date: Tue, 16 Nov 2021 20:39:15 +0100
Message-Id: <20211116193915.2792721-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 19:39:31 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/rocker/rocker.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index 412fa44d017..d22bbd2bf80 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -36,13 +36,8 @@ static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
 }
 #endif
 
-#define __le16 uint16_t
-#define __le32 uint32_t
-#define __le64 uint64_t
-
 #define __be16 uint16_t
 #define __be32 uint32_t
-#define __be64 uint64_t
 
 static inline bool ipv4_addr_is_multicast(__be32 addr)
 {
-- 
2.31.1


