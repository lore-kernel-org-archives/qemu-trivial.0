Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys14t-0007CJ-Bh
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzt7-0008PJ-Gy
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzt4-0007nc-4b
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:41 -0400
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzt3-0007nR-Vn
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:38 -0400
Received: by pacyx8 with SMTP id yx8so126701820pac.1
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7LW4C4hgDYei5NIxq8vDNTCV9uDuvCeKCuO+wMr8IKU=;
	b=YAe+qhQSSHuLE/jBkk8XBAMdTq26B3W4bKUBP4B723T2hzeqegkzkkjNsVCyUkE6QB
	Dx879FGoeuarD1VmAslGC2+PvUdFxYIM8WBf9a0aHDU9Y2D6p8FPloF2gQhG8Kf0H1ja
	X8p4nFFxRaLYOm5QSfTocScWeHQsrttIUKJYOeX8gSIo+qfNYP+4lQsDeACc4tub33kZ
	uqYr+gkDc0h81KSUDKA0ynfiRnXb82b6Cm3l91lM8+tzpVlQH9gLja1Sm+aDwaMbueBq
	JfYSOv/h009cmY9kWDdLT0McsVYOIw6X64IatbrrGzc6iGfMMCrgB9d5zadC7E6wUou8
	J3pg==
X-Gm-Message-State: ALoCoQkyMVNBVC6jhDw0VUP9pexiORaDEQJ4TH69gyyfKsdnsA6yr7czM3yQklEgCKjmZ0nSAXjx
X-Received: by 10.68.227.42 with SMTP id rx10mr24041771pbc.28.1431397537553;
	Mon, 11 May 2015 19:25:37 -0700 (PDT)
Received: from localhost ([180.150.141.243]) by mx.google.com with ESMTPSA id
	yn5sm14472675pac.48.2015.05.11.19.25.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:36 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:16 +0800
Message-Id: <1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.41
X-Mailman-Approved-At: Mon, 11 May 2015 23:41:54 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 1/6] hw/s390x/s390-virtio-bus: Remove
	meaningless blank Property
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
X-List-Received-Date: Tue, 12 May 2015 02:25:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/s390x/s390-virtio-bus.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
index 1a72b56..273bd9c 100644
--- a/hw/s390x/s390-virtio-bus.c
+++ b/hw/s390x/s390-virtio-bus.c
@@ -536,17 +536,12 @@ static unsigned virtio_s390_get_features(DeviceState *d)
 
 /**************** S390 Virtio Bus Device Descriptions *******************/
 
-static Property s390_virtio_net_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void s390_virtio_net_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtIOS390DeviceClass *k = VIRTIO_S390_DEVICE_CLASS(klass);
 
     k->realize = s390_virtio_net_realize;
-    dc->props = s390_virtio_net_properties;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 }
 
@@ -575,17 +570,12 @@ static const TypeInfo s390_virtio_blk = {
     .class_init    = s390_virtio_blk_class_init,
 };
 
-static Property s390_virtio_serial_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void s390_virtio_serial_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtIOS390DeviceClass *k = VIRTIO_S390_DEVICE_CLASS(klass);
 
     k->realize = s390_virtio_serial_realize;
-    dc->props = s390_virtio_serial_properties;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -655,17 +645,12 @@ static const TypeInfo virtio_s390_device_info = {
     .abstract = true,
 };
 
-static Property s390_virtio_scsi_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void s390_virtio_scsi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtIOS390DeviceClass *k = VIRTIO_S390_DEVICE_CLASS(klass);
 
     k->realize = s390_virtio_scsi_realize;
-    dc->props = s390_virtio_scsi_properties;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
-- 
2.1.0


