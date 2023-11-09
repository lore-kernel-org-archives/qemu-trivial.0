Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r18wc-0000EI-7s
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2023 12:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r18wa-0000Am-Cp
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 12:35:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r18wZ-00038X-1z
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 12:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699551350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3kxC4D30sqcqkFVnnnKWCXVXyHn8o6QRk3N4lzZEIyE=;
 b=BRr5mL6haL/mJ8B297p5QLZ6ZlBZ043xxcX76vwHE1gCVY0eKIHYC8kiGs0XbAy5pmhtUK
 VDpfrWcvr9VS6oB6NhXg59LYSE+TxiAFO1ZKAf3bY6Qf+gL4l9nwXdRwVNVQDrcKBTd+4o
 +OvhGeJXHfc30W3YbtSOPWoXm/Eb1E4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-L-ee1XiAMyiONFIqfV4t3w-1; Thu, 09 Nov 2023 12:35:47 -0500
X-MC-Unique: L-ee1XiAMyiONFIqfV4t3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6FF0811E88;
 Thu,  9 Nov 2023 17:35:46 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C14372026D68;
 Thu,  9 Nov 2023 17:35:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] hw/audio/es1370: Avoid four-letter word
Date: Thu,  9 Nov 2023 18:35:44 +0100
Message-ID: <20231109173544.375129-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 09 Nov 2023 17:35:52 -0000

Using certain four-letter words is not good style in source code,
so let's avoid that.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/es1370.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 91c47330ad..bd460c810e 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -670,8 +670,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
     cnt += (transferred + d->leftover) >> 2;
 
     if (s->sctl & loop_sel) {
-        /* Bah, how stupid is that having a 0 represent true value?
-           i just spent few hours on this shit */
+        /* Bah, how stupid is that having a 0 represent true value? */
         AUD_log ("es1370: warning", "non looping mode\n");
     } else {
         d->frame_cnt = size;
-- 
2.41.0


