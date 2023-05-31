Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q4Lza-0001nz-RI
	for mharc-qemu-trivial@gnu.org; Wed, 31 May 2023 09:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1q4LZ3-0003TJ-Fu
 for qemu-trivial@nongnu.org; Wed, 31 May 2023 09:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1q4LYy-0001KF-MP
 for qemu-trivial@nongnu.org; Wed, 31 May 2023 09:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685538508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vuSQkbmc0r+0jBk3EaFQ0xOSSghfs2n8WXIjwIvy8bo=;
 b=VKAgCGvXdLVWX8KKdmEXfWEX0xKVt4V8yV62RdjEBuy/BAXFAAF+eKMNrSMWp9tk8xL7AF
 lWukgfYMBGtegiTaoCKGk8I3ArIUBKjRcfTwz46ahQPCFNZsRSl7Ul9++mlMLg6KQNtTK2
 2h92Uu70y6CZ/2+FpxHYXn+axFEHC1I=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-49HaifILO4OKMjqxgxo3fg-1; Wed, 31 May 2023 09:08:19 -0400
X-MC-Unique: 49HaifILO4OKMjqxgxo3fg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4ecb00906d0so3466436e87.1
 for <qemu-trivial@nongnu.org>; Wed, 31 May 2023 06:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685538497; x=1688130497;
 h=mime-version:user-agent:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vuSQkbmc0r+0jBk3EaFQ0xOSSghfs2n8WXIjwIvy8bo=;
 b=clFztheo5xSzRsfTFnXDF7Rm6oKHX4BnQof1cxRJCQY7eqnN4G7PIJDMjmWPhZ3VGI
 nFhw2bJ4jMTDqH+WfSY8g7mEUc635slf6p8RYAYf6hb0QuJtmzJD6BIZgArZHcoDZMN3
 ZVHkMGJdcYufwzSYB7ieI1CfQjeNxe3rSG+r5erbZTNUDrbayt2RVr/+UfZO3Six492R
 rfudReB6lo9girjH2ZxcVtoY52qnNZdvm6ZcPLGFq1psnWk4qiE579QYU/4T7166T7vd
 uQyMwzloC7dbVidGVBw66QnEn6VUqVaTRSgQjg242TOeA2fKW5UiqLdsQStgZpfuhHK3
 7PYA==
X-Gm-Message-State: AC+VfDz1MZLlEmCl1IWlZYEEjfomGJuorsmFlnlRn9oVfC5BkDbAC1lF
 /EK/82RlH7LOuqTEEsatQSvh5Q324Ln0AJQTdlSy+69lTuTp4IT2NsdDulcEExpVrKULu7X1T/d
 oVHwjeq/FRqSeOeMXrYxYkvrNsdeDMnBnxBHEdOES60qcnxE0I8+TEKpS8zp0S0todFhjlhjUy/
 bapA==
X-Received: by 2002:a05:6512:11e7:b0:4f3:b4ab:d0ee with SMTP id
 p7-20020a05651211e700b004f3b4abd0eemr2359349lfs.42.1685538497373; 
 Wed, 31 May 2023 06:08:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HtwO/77fwqYa8+9V7Q2/h+TU6u8LCEJdAVRLTfJBrBK/hoXlHHOneLP7FJTbe0qR81W1lOw==
X-Received: by 2002:a05:6512:11e7:b0:4f3:b4ab:d0ee with SMTP id
 p7-20020a05651211e700b004f3b4abd0eemr2359329lfs.42.1685538496786; 
 Wed, 31 May 2023 06:08:16 -0700 (PDT)
Received: from nuthatch (ip-77-48-47-2.net.vodafone.cz. [77.48.47.2])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c24cd00b003f4dde07956sm24348287wmu.42.2023.05.31.06.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 06:08:16 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] docs: Fix trivial typos in vhost-user.rst
Date: Wed, 31 May 2023 14:48:31 +0200
Message-ID: <87a5xk7io3.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.163,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 31 May 2023 09:35:57 -0400
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
X-List-Received-Date: Wed, 31 May 2023 13:08:33 -0000

Signed-off-by: Milan Zamazal <mzamazal@redhat.com>
---
 docs/system/devices/vhost-user.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/devices/vhost-user.rst b/docs/system/devices/vhost-user.rst
index 86128114fa..a80e95a48a 100644
--- a/docs/system/devices/vhost-user.rst
+++ b/docs/system/devices/vhost-user.rst
@@ -38,13 +38,13 @@ system memory as defined by the ``-m`` argument.
 Example
 =======
 
-First start you daemon.
+First start your daemon.
 
 .. parsed-literal::
 
   $ virtio-foo --socket-path=/var/run/foo.sock $OTHER_ARGS
 
-The you start your QEMU instance specifying the device, chardev and
+Then you start your QEMU instance specifying the device, chardev and
 memory objects.
 
 .. parsed-literal::
-- 
2.38.5


