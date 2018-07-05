Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eQ-0004Nz-Hb
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eN-0004Lq-HR
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eM-000542-F9
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:31 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:36002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eM-00053q-AK; Thu, 05 Jul 2018 11:58:30 -0400
Received: by mail-qk0-x22c.google.com with SMTP id a132-v6so4735451qkg.3;
	Thu, 05 Jul 2018 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mTEgAavugFFaJ/KhTLXhJrZDg0FNd1Qm8UYWTyNoG0s=;
	b=QonmLs0TshlGqjt82zKcSOLGoXfmslPASagPazD8+dSJi9CGB79hIe2iUp4XUCusLw
	PdjYhVxhpxkqf8ho9IjfVp3z/fgXvGbemBH3CGOOMUsdofYIEl5QhDSc9zvsbryPLbpO
	z4w78OJUUpeorSM0taSG8+SRWa7VSSyLgMdn9QC9HB5CGG7oofClUfWzOC/uKeXO1EU/
	gbgAQmLeaOwQXpKeg/naP7mrYQy5cceatzHaRLEADuSsEYbGCqdXhLR2F1QCjqyxwqiN
	CCcI1BcW8oKqJoepTHRJYuo6tW5NK4MEOHEDOOSlnUQTV8CSXBcD04A9dA6aBA+xcfHB
	YZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mTEgAavugFFaJ/KhTLXhJrZDg0FNd1Qm8UYWTyNoG0s=;
	b=QrRHu0ueJJpLzbOPs4IZVOnUwfPL0zI0cSzmmD9CExEWpEid/QWBpDGMwwbyPX7/7O
	dHqdU5qqvpyVrsTVgm7NCn2V1es5kQskFMOZhJRWlysA8V4HPdxImf3GapePRePyEW4z
	a8x2zX5YXlrHjgkay38RNcTQGsARmSg9CZvX6LQ25ThWOo35GLI685h0q4Mj4hlIxcPX
	IlB+h5kp5Lnqi8KtlxsdjcyZTo6/W4QE48SSHQPRMdID+z/GE7iGEUBVNSYULvrpg8Rm
	RjHlw7YFWYla3mjQ4xkvXUsOvqYpdWOn0AxE57UibNPmle22Z8Va0MDveHAQB4GdCSGe
	5K4w==
X-Gm-Message-State: APt69E3l5cgHv0J8Ix3+W2qeWAvpKNo/Uiif+a3zHg1awZJsdQaK4v8J
	3O3Aq3tvB80Q1L9O+vIM4P2eJG/I
X-Google-Smtp-Source: AAOMgpd6rmrWQaMeIIxiZ4pKJXWMTbSPZhHwqoVfSedFTskIUl3fVMxSOFZMZhR459Xb/9oJFRvMOw==
X-Received: by 2002:a37:2ac7:: with SMTP id
	q68-v6mr5634870qkq.374.1530806309544; 
	Thu, 05 Jul 2018 08:58:29 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org (open list:virtio-ccw)
Date: Thu,  5 Jul 2018 12:58:06 -0300
Message-Id: <20180705155811.20366-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH v2 2/7] error: Remove NULL checks on
 error_propagate() calls
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 15:58:32 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/s390x/virtio-ccw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index b92a85d0b0..7ddb378d52 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1836,11 +1836,9 @@ static void vhost_vsock_ccw_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 {
     VHostVSockCCWState *dev = VHOST_VSOCK_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
-    Error *err = NULL;
 
     qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", &err);
-    error_propagate(errp, err);
+    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
 }
 
 static void vhost_vsock_ccw_class_init(ObjectClass *klass, void *data)
-- 
2.18.0


