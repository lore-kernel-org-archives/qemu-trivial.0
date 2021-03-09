Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJf8z-00012a-NY
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 11:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJf8T-0000qs-PX
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 11:23:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJf8Q-0002xr-7L
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 11:23:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id 7so16853596wrz.0
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBewBnTfMkgPBQhT3YpBMAvGkh7+L4IITUeQXmeYAZ0=;
 b=iF84CXsn7f4Tpu3Ot2d1w/sBDfj5oDgAlNTTKQz0Qr7EgfBJscXHvlmoFTEIiwxPyO
 CiVQXJxjXAN9b8VxL2zcsvoQ1lsYDkSCSbvl1QHY25UmiRGkHq81QuByZdwBdiG1Jy7O
 qpzA0VOEA5LVxwa8ycQIlo98DO72C/w02vQCMKorXIZp8b+CN6yq/VS523HWKkvun1b4
 a1UVPXT3emXlQE6SKliUzOnrpPn/9d2a/ZvOQoqig6xWBoi7q+m/lrncM3Jaz1HarMH4
 XJDC9eScNKwYM/23au6fyVvjrCz9dJDfWyzAYW962C1uMNR/Od27+MiO1m0ju/N4Jc4S
 j/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBewBnTfMkgPBQhT3YpBMAvGkh7+L4IITUeQXmeYAZ0=;
 b=qLb5UQrrKl49HzaJrc+mnQMNr/EB87kzLfGXMD2GaCzHGZiYxmfs+/vCTrj0pC+cIv
 fFd3JFLF54dwuBPFInk4jjrXNFyuHWTYOJL1AVNtQDAecqrFjfrbu2B8KWdmCsQUGCZz
 yXGyyYXHMDTIjYUyyW+Fq7yA84dAV0lpzp6bVGhsnq1FdCaBDK1Q+ch3niwUcfk9adB5
 NRkhhh8cSFXgMlmaat0EdjDPRatFHOpah8WEK2ZH4Mmj3Qe8JzsGDoebtJ6se6GEhMx+
 uY5NM+p7Nb3GOrM4BB+OfkQ1ZSlFvFNGATX6MdXpuc/TyAfAEWtFdMsuQ9IX99HaOSY2
 /Eaw==
X-Gm-Message-State: AOAM531+AtP0OPTQJPiGOYfxnUyqzgqrSDPOjIffYa8mJ45320mbsWQY
 wrUNi81kaqCNZzv2TiTjsJsx2w==
X-Google-Smtp-Source: ABdhPJzvwzNXsBZksJiUiPxx9h1kf9tyjyKErsj0LGDpxYspEZ4lLse5c93mG5/WMprWNIB3s4Lu5w==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr28570053wrw.367.1615306980690; 
 Tue, 09 Mar 2021 08:23:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r7sm25345030wre.25.2021.03.09.08.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:23:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] qemu-common.h: Update copyright string to 2021
Date: Tue,  9 Mar 2021 16:22:58 +0000
Message-Id: <20210309162258.28633-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 09 Mar 2021 16:23:08 -0000

Update the common copyright string that we use in
-version reports, About dialogs, etc, to 2021.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 654621444ec..73bcf763ed8 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.20.1


