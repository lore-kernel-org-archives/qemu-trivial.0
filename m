Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kF753-0001Zr-RL
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2020 22:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kF752-0001Z6-LT
 for qemu-trivial@nongnu.org; Sun, 06 Sep 2020 22:40:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31483
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kF750-0004X3-Vj
 for qemu-trivial@nongnu.org; Sun, 06 Sep 2020 22:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599446425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4OIj4jz8LXHEWJ5feeAlUTIZDKQ5O5S7lX7AHvNA6oc=;
 b=GWGLSf+6bOrdEugSZgOSij0mzuQkhYBCX/qfPrVzfhzFxJGI8JAVRYlFDqUeDzX5HdmwxL
 AzzF6FKqDYGfXbbJvTC0/XQomNdVE3JajAWxGbJyi8oblMixBdM+fzkTrp6vT1yUDXoFHI
 xr8b++2qzIMF+eqsffC2jvkQJ3zhuiQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-kb0BI4VhMT6m88NJi2FeMQ-1; Sun, 06 Sep 2020 22:40:24 -0400
X-MC-Unique: kb0BI4VhMT6m88NJi2FeMQ-1
Received: by mail-wr1-f69.google.com with SMTP id j7so3538475wro.14
 for <qemu-trivial@nongnu.org>; Sun, 06 Sep 2020 19:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OIj4jz8LXHEWJ5feeAlUTIZDKQ5O5S7lX7AHvNA6oc=;
 b=W+jFN4G4XkAbZxc8PpdfPa9o01Ay+eFW8HQ2IDNhTkyiqG9QYKnEU9GKjmqtZ0Lgza
 4qZacc1G/NukEeM9LgUcRG7Tve3etsPhjZGaoJso0GM1gJnqyx9GivXDG2dKLDQ2VRUN
 qzrHMmj7IcxmWZRKQSsWTsquPBlekCbErP6AJilzhurCZjgk8q3FXjZHFS7U6b2tkaZg
 9dbkfbclhhbDc8x/H+2sDD1nOzuA3ne4FBxLsxBOrVjZN+lEeWGQ6RhbeSmF0xFxrAR1
 o6hgL7DKY5cp7d6SFbwwypolRHw1jTTkxDLD1a2LQn3OhWNCSeeOLBWtfVM+GwIafn1W
 YPIA==
X-Gm-Message-State: AOAM5323vGs8E82GRCwTza3+bn62taD9TnHDbpyGzfcopuE4Tha/Vqc0
 zRfFY/4se+42uhGucE/YFuKWMKILWx450a1EcsB2YMRpUxI2uqz5m2JyEmdQ1RoUa3DGYgOi9Oh
 mJyLi0nTOOxbWnUDyZw==
X-Received: by 2002:adf:c404:: with SMTP id v4mr18782083wrf.17.1599446423414; 
 Sun, 06 Sep 2020 19:40:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdhbmfejOQRnTYHq/FvUULXHKw2HSDGUiqQAlr9sUy9fovlhOU/lgA5l0QN8+7XEjg08lWRg==
X-Received: by 2002:adf:c404:: with SMTP id v4mr18782062wrf.17.1599446423182; 
 Sun, 06 Sep 2020 19:40:23 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id g2sm25686140wmg.32.2020.09.06.19.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 19:40:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/s390x/css: Remove double initialization
Date: Mon,  7 Sep 2020 04:40:20 +0200
Message-Id: <20200907024020.854465-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 07 Sep 2020 02:40:28 -0000

Fix eventual copy/paste mistake introduced in commit bc994b74ea
("s390x/css: Use static initialization for channel_subsys fields").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/s390x/css.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 519dc91316d..9961cfe7bf6 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -353,7 +353,6 @@ static ChannelSubSys channel_subsys = {
     .pending_crws = QTAILQ_HEAD_INITIALIZER(channel_subsys.pending_crws),
     .do_crw_mchk = true,
     .sei_pending = false,
-    .do_crw_mchk = true,
     .crws_lost = false,
     .chnmon_active = false,
     .indicator_addresses =
-- 
2.26.2


