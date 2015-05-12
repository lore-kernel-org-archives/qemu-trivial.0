Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys150-0007PZ-DF
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:42:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztR-0000el-KP
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztO-0007ty-FK
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:26:01 -0400
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztO-0007tA-BD
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:58 -0400
Received: by pabsx10 with SMTP id sx10so126770672pab.3
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kagn2pKM34wYBmaaSSklxyVa9qOkXCnOm96wrVPEgDk=;
	b=S4jjx5H4OwZ23ezxT5rSvQZaw2iPTLUeJjMau3XcN33JSR1sqFipVXVfeqYxrvxtsQ
	C4FCKVOfMs1JkzVV4uZszM8ebMw+DAyBltbqQPdnN0xztd0ld2Snig8zykaFsr+NqS00
	6LrKaVvB/7WRzNyT3bWGTE8l8JkkRt3VK2ER1rawrVuf4IgWemfjXNznp19N9XTDYb62
	NnGUScrAWaBKdz4iLvbZP1/CJ09paqQ/ICFXCljA9murPWZs+bn25ePgkVoPOoqxBXmJ
	/MKQaN/7X2WRwHnEH0b5a8ddYLleZ63U8nTowhiYdcrHFOPw75mxAEipV2BjAiFmcfJ6
	1xfQ==
X-Gm-Message-State: ALoCoQmt7PKQLA57pIwvOM35r8gF755ioNJ3YSd05ToYeenTXq7xKuJ6LmhaB1Qk8G9gxn5SSWtY
X-Received: by 10.66.251.165 with SMTP id zl5mr23782488pac.93.1431397557927;
	Mon, 11 May 2015 19:25:57 -0700 (PDT)
Received: from localhost ([180.150.141.243])
	by mx.google.com with ESMTPSA id y4sm14414793pdm.9.2015.05.11.19.25.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:57 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:20 +0800
Message-Id: <1431397521-2316-6-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.53
X-Mailman-Approved-At: Mon, 11 May 2015 23:42:01 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 5/6] hw/arm/spitz: Remove meaningless blank
	Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 02:26:02 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/spitz.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5bf032a..fdb1010 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1060,10 +1060,6 @@ static VMStateDescription vmstate_spitz_kbd = {
     },
 };
 
-static Property spitz_keyboard_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1071,7 +1067,6 @@ static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 
     k->init = spitz_keyboard_init;
     dc->vmsd = &vmstate_spitz_kbd;
-    dc->props = spitz_keyboard_properties;
 }
 
 static const TypeInfo spitz_keyboard_info = {
-- 
2.1.0


