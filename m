Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4F606A326
	for <qemu-trivial@archiver.kernel.org>; Thu,  5 Nov 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sNeXTOZK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xOzMn-0004Sf-Je; Thu, 05 Nov 2026 10:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzMl-0004SI-FD
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2026 10:27:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzMj-0000wG-3Z
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2026 10:27:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so18573375e9.3
 for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2026 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793892416; x=1794497216; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=boIE/CvpxAW++uDAFl070rHVEYkZYfB/D0jeTT0yYnw=;
 b=sNeXTOZKqWRa6SRILCFoDyV7gp0UuvFS6/TUg5haNQWbbujRabaS/37kfHpW1WU65p
 KA6/CsOhVb5S3fvNIO3W8l1Wh1gfpx7zAKL+oRCiIlPN2XMEoauSwNkLBYQ59IJJ0Hkh
 Q72DYtt5CTpg0daztRqmMvt4oj0kCyWA73po7rH361mEZSCPBoxk+G1++JQS6aqD38nx
 s2Uix+Z4DEvodwm2QdAJfPmfX0K/ksDSHFqtH0+0tnmJjK2uNWwHW5lBMM/bXCToqZJW
 sIbqkpn3mMH3LHmEf0DLtIVkvZZ0Ouz158SL9i9fCMlpFAWDJJ8ETBAgCWawQpSmJM9F
 I4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793892416; x=1794497216;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=boIE/CvpxAW++uDAFl070rHVEYkZYfB/D0jeTT0yYnw=;
 b=e1BwIHnIuqu6rrpc6XcsVISU3kLFGybXPANxKbZat3OyUbQ7rTzd9dIqnfkQinjBXG
 4+Buc+MO2tatYybj1WXJF5qHwrQdfkG0mziwGSOQDfkkf/opTJO88ZOpU9n4RMYKCFav
 jKUziLmm853tMAGw9RxM7k4w8ZqY9KUWTxJdqqiLrCgwR9rIZg0UwKgXwbVh8YQq6jyz
 WUEEA8gVXWI6h9nvpJpziXTHa+RkCgioJYHnMf/tR4RRL9bZxlLfL+zTWVReihvPuaxr
 Ev83egq/yHk2eEr+/AzDC94qeuBG8LLHS+tayl/Vn1EBb2qWY2ro3Pfxfsr/9fIWub8k
 5MPg==
X-Gm-Message-State: APuU4Z+UUcVbL2p/HDfg+7FpVbgbM5hphjD+bCLuBjBNp9YD7BKdaOHQ
 Xzus3GKDUnJ26XCIqpyxXavQFZcirSGj4hWPCnRIsVn6skxDo9c+4uWm8Im7TCTyUYf9WDc4bBf
 +/2+q
X-Gm-Gg: AYBFou2eO5hOdU/SeVm8GQIpPv74/7VVuilkPTUNlhecKMucQDGuIH6wAvdOUHTD4Mv
 Xzv7sN/S+9z1P75lNkDxh8CpOTyVXVYDIepDL8ySNLW6ppI5OnOLstrgeiT3Vpb7QfZftWn0u/t
 tse0GOYYly6TsjWL3z8fC+99Gi7orWxb33Y6Zn3uM0wgrMpJbJrBu7hko1BonPyF36+jPYBY5dw
 VpPrpGjiXTXKUSRBDqpt+YPtDT+gsUD6iG/SPMmoPP2NJX91ginQy7cKbvtAIHtsf5fU5cAZ7Qw
 /reR2Itxobu7FAtF/ynT/1iOfJ2qjA/VrD79lD8D2HTLEtjbwZ6m6Q8rzeNYT1u8BVVpfqR1ZQN
 RNf5b9VUHzKSXzuq+aDNR1RtP6BILSrMAQ5IGZaoDZEQo1/pTclCWJ+9l9g7C+A42WpKK7tVfh5
 GQc9jl1e5ysgioDuqZCuL8X77GZ4S0yx2CzFZ74xm/UmiSGAc0vvrCRBfIbq2rDp4K0q3qG86vG
 ihw2MvP6c8q55G1sDsfkVWIKNsmagsZqZi2u+fkyO8DHrTWGriIDh9HiEwzm0hJjL5mLT+7zqJ0
 Ayuc4Z1q96Hv3fq50jGa30fAI0/tKA==
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id
 5b1f17b1804b1-4ac1719112emr416260595e9.9.1793892416537; 
 Thu, 05 Nov 2026 07:26:56 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56fca2a4fsm77974715e9.15.2026.11.05.07.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:26:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 99D285F8AF;
 Thu, 05 Nov 2026 15:26:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] MAINTAINERS: fix typo in Gerd's name
Date: Thu,  5 Nov 2026 15:26:46 +0000
Message-ID: <20261105152647.2458298-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 198ed583650..3fac3e0f99e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2945,7 +2945,7 @@ F: tests/qtest/vmgenid-test.c
 
 VM Launch Update
 M: Ani Sinha <anisinha@redhat.com>
-M: Gerd Hoffman <kraxel@redhat.com>
+M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: hw/misc/vmlaunchupdate.c
 F: include/hw/misc/vmlaunchupdate.h
-- 
2.47.3


