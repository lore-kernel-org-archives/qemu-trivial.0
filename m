Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jegGU-000730-B1
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jegGS-00072g-SI
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 10:45:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24123
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jegGS-0007QT-9U
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 10:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590763539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uZ5avydEok38jkLiXkwYgoDlMrrhEULZRVYLSC/xxGw=;
 b=S659CFU7QWgfUYXF5pgzTAneTjLx6WWkBV6bJ49mWkraNgSi5/8P3R/MDlm+DJWtXy4d02
 SFVVZ/pnKm/I702NB8UfmHgP6M2Eq5c+RBVMiSaKhxJojDxQWKblTo0X4oboun9wop7LtG
 0lVRqZw36EQQeFxYURojjxNL68jUDCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-jjX_LXNPPseopkBqxxI2tw-1; Fri, 29 May 2020 10:45:35 -0400
X-MC-Unique: jjX_LXNPPseopkBqxxI2tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE75107ACCA;
 Fri, 29 May 2020 14:45:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EE1E2C26B;
 Fri, 29 May 2020 14:45:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] qemu-img: Fix doc typo for 'bitmap' subcommand
Date: Fri, 29 May 2020 09:45:27 -0500
Message-Id: <20200529144527.1943527-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:34:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 29 May 2020 14:45:41 -0000

Prefer a consistent naming for the --merge argument.

Fixes: 3b51ab4bf
Signed-off-by: Eric Blake <eblake@redhat.com>
---

I'm happy for this to go in through my bitmaps queue or through the
trivial tree, whichever picks it up first.

 docs/tools/qemu-img.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 69cd9a30373a..7f0737488ade 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -300,7 +300,7 @@ Command description:

   ``--disable`` to change *BITMAP* to stop recording future edits.

-  ``--merge`` to merge the contents of *SOURCE_BITMAP* into *BITMAP*.
+  ``--merge`` to merge the contents of the *SOURCE* bitmap into *BITMAP*.

   Additional options include ``-g`` which sets a non-default
   *GRANULARITY* for ``--add``, and ``-b`` and ``-F`` which select an
-- 
2.26.2


