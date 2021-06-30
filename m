Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lyVwp-0001Ta-KC
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jun 2021 04:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyVwo-0001SK-3d
 for qemu-trivial@nongnu.org; Wed, 30 Jun 2021 04:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyVwl-0003ru-Jx
 for qemu-trivial@nongnu.org; Wed, 30 Jun 2021 04:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625043108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KOwakb4DbYF5Oj5MfGQL9K1iGVKbFN+e5xYjmd/dnvU=;
 b=jIzPbTT284hib8kwwzE0RF897ibZA0uSUtBt8xt5220B6rptjNOBf8IDcEL93Q/w0E2TZu
 5eOhY5pEyB8Wm3Jyp1vM5RzANHDnzP3j4LbNfhhG9RidfFo+4L+BERFLwH5YUr/R0fsQE/
 bjNpzQ9ILFumL8tq+E/B9W10D+6No3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-D-SckNKTPNGMoBji1ZKFuA-1; Wed, 30 Jun 2021 04:51:47 -0400
X-MC-Unique: D-SckNKTPNGMoBji1ZKFuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3549A61364;
 Wed, 30 Jun 2021 08:51:46 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1B060843;
 Wed, 30 Jun 2021 08:51:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Cc: qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH] softmmu/vl: Remove obsolete comment about the "frame"
 parameter
Date: Wed, 30 Jun 2021 10:51:38 +0200
Message-Id: <20210630085138.351920-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 30 Jun 2021 08:51:54 -0000

The frame parameter has been removed along with the support for
SDL 1.2.

Fixes: 09bd7ba9f5 ("Remove deprecated -no-frame option")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index d99e2cbdbf..cee6339580 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1062,8 +1062,6 @@ static void parse_display(const char *p)
          * sdl DisplayType needs hand-crafted parser instead of
          * parse_display_qapi() due to some options not in
          * DisplayOptions, specifically:
-         *   - frame
-         *     Already deprecated.
          *   - ctrl_grab + alt_grab
          *     Not clear yet what happens to them long-term.  Should
          *     replaced by something better or deprecated and dropped.
-- 
2.27.0


