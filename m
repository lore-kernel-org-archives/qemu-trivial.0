Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys14z-0007Mg-4t
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:42:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztM-0000Uh-Nr
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztJ-0007rv-Ih
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:56 -0400
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztJ-0007rq-DM
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:53 -0400
Received: by pacyx8 with SMTP id yx8so126708952pac.1
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oJVXgg9MPVKLGaCh418p6/WnFZd7kHWkPSmt/gZ/uEM=;
	b=AJzJM7o35zMxtnAw0PSQE24QenNXZPSevcVDMqxckofycpMLuFddYrWEYhEuusEejQ
	R8Jf9DwitmOB9PgZ+vEPeCSZWD5d0GGnS7yTKQ2+Wz7C0Z/xNG3jx8BlG52ZcFgObN+W
	SqvJTxWqLgtzwJ50SqnyKU+fdkW2b+5OJnNsSS1IxNFt3DKKetT7NpaiVUKAftY0MJoZ
	owJistSbmkAwg7pD23rCDfBt8eyFZr8+/RXEMcRvGGv1eIldP4YMcW845jzC1LhzLyZJ
	abeOEP8cCx5OoT9rKv+SkDIWx3s3Mz95rJXdf7+P1Eo/RbMWkjdyK/YEoYeqbxmT2LN0
	Cuvg==
X-Gm-Message-State: ALoCoQn5uE0Zwi/HjBx6OZp39+n3fGNU/teLkY0/PZlXwH58DqdFFp5sE4D0X4Yyr17GYxtPWec3
X-Received: by 10.66.228.130 with SMTP id si2mr23970195pac.92.1431397553031;
	Mon, 11 May 2015 19:25:53 -0700 (PDT)
Received: from localhost ([180.150.141.243])
	by mx.google.com with ESMTPSA id sb7sm5489260pbb.94.2015.05.11.19.25.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:51 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:19 +0800
Message-Id: <1431397521-2316-5-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.41
X-Mailman-Approved-At: Mon, 11 May 2015 23:41:58 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 4/6] hw/gpio/zaurus: Remove meaningless blank
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
X-List-Received-Date: Tue, 12 May 2015 02:25:57 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/gpio/zaurus.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 24a7727..aa8ee5f 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -235,10 +235,6 @@ static const VMStateDescription vmstate_scoop_regs = {
     },
 };
 
-static Property scoop_sysbus_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void scoop_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -247,7 +243,6 @@ static void scoop_sysbus_class_init(ObjectClass *klass, void *data)
     k->init = scoop_init;
     dc->desc = "Scoop2 Sharp custom ASIC";
     dc->vmsd = &vmstate_scoop_regs;
-    dc->props = scoop_sysbus_properties;
 }
 
 static const TypeInfo scoop_sysbus_info = {
-- 
2.1.0


