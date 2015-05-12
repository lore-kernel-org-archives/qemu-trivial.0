Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys14w-0007HT-Hs
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztC-00007C-M6
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzt9-0007pe-HN
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:46 -0400
Received: from mail-pd0-f176.google.com ([209.85.192.176]:35818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzt9-0007pK-DG
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:43 -0400
Received: by pdbqd1 with SMTP id qd1so162917871pdb.2
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dmOwNO820xL9v2+iqcwTEy23Yxo4bdA5aJN7qmoXAdw=;
	b=EvIZqXkF7JanrM7FMUlEUX/eK1Ef1UmhZCERiRl0ypzSKIxkJbl2zYexjOzuSnhtvx
	F7DPoy/ytrPh1cBEsxH8/LSCp5A6NHbMXiwKldIRlIJziT6765lZ2KKiMk/mtjWG89RC
	4q/b0gGyvKOqpKKRcrfIRuOwNaJqe8tu2K+oImpTy92M0MgFRI7PdrCNLn2NwNeuMb6R
	r6mjTFPkoAbMiyxnsetRIGXr9fzMTtACIIHU8JWtfauFrOut3TAJejUSIdcv8YjyLnKp
	bxfYJ0IR28Zl8NgBDPvjKpWaEMbM0ezGTyyHY3V+a8yXbX/rrATdQi71tqozyu8Dh4NO
	sfQg==
X-Gm-Message-State: ALoCoQnorPqFr5k1j+eNQc9uKUECX/JjMAQMz54RNjZyZLwTBnwPvCiUiMbkSiWMhT9KB/LDM4/f
X-Received: by 10.68.57.226 with SMTP id l2mr24222166pbq.104.1431397542784;
	Mon, 11 May 2015 19:25:42 -0700 (PDT)
Received: from localhost ([180.150.141.243])
	by mx.google.com with ESMTPSA id pc9sm14414325pdb.6.2015.05.11.19.25.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:41 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:17 +0800
Message-Id: <1431397521-2316-3-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.176
X-Mailman-Approved-At: Mon, 11 May 2015 23:41:57 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 2/6] hw/virtio/virtio-balloon: Remove
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
X-List-Received-Date: Tue, 12 May 2015 02:25:47 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/virtio/virtio-balloon.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 484c3c3..a3f5709 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -417,16 +417,11 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
     virtio_cleanup(vdev);
 }
 
-static Property virtio_balloon_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void virtio_balloon_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
 
-    dc->props = virtio_balloon_properties;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->realize = virtio_balloon_device_realize;
     vdc->unrealize = virtio_balloon_device_unrealize;
-- 
2.1.0


