Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rhr3V-0007fO-Q0
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2024 08:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhr3N-0007Yy-Qv
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 08:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhr2y-000408-Bn
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 08:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709730659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ltkx3BBtc9arwvY9tCwOlWcFMt/QB+slR1GXlGoRos=;
 b=Ot1ep0eA8PBzv3F722tQvVoQeCMXBpaNjZmEsrBuQaRZrcJubRN8+snd9J4RB2sbe74XBa
 LfEU5jgjrtCg8GQ7YolyeCRz+PRjGFPeD84rS6ktq9pajOzYJgcKHv1BlirmQv5If73UbG
 GWp86dBTXuwXHZIvuJGr+bHHKIqhnLc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-5JD8qTPPMq2CLJtZK0Nagg-1; Wed, 06 Mar 2024 08:10:56 -0500
X-MC-Unique: 5JD8qTPPMq2CLJtZK0Nagg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D408800268;
 Wed,  6 Mar 2024 13:10:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB18492BFA;
 Wed,  6 Mar 2024 13:10:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C08521E6A28; Wed,  6 Mar 2024 14:10:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH 1/2] blockdev: Fix block_resize error reporting for op blockers
Date: Wed,  6 Mar 2024 14:10:54 +0100
Message-ID: <20240306131055.2460378-2-armbru@redhat.com>
In-Reply-To: <20240306131055.2460378-1-armbru@redhat.com>
References: <20240306131055.2460378-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 06 Mar 2024 13:11:28 -0000

When block_resize() runs into an op blocker, it creates an error like
this:

        error_setg(errp, "Device '%s' is in use", device);

Trouble is @device can be null.  My system formats null as "(null)",
but other systems might crash.  Reproducer:

1. Create two block devices

    -> {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk0", "filename": "64k.img"}}
    <- {"return": {}}
    -> {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk1", "filename": "m.img"}}
    <- {"return": {}}

2. Put a blocker on one them

    -> {"execute": "blockdev-mirror", "arguments": {"job-id": "job0", "device": "blk0", "target": "blk1", "sync": "full"}}
    {"return": {}}
    -> {"execute": "job-pause", "arguments": {"id": "job0"}}
    {"return": {}}
    -> {"execute": "job-complete", "arguments": {"id": "job0"}}
    {"return": {}}

   Note: job events elided for brevity.

3. Attempt to resize

    -> {"execute": "block_resize", "arguments": {"node-name": "blk1", "size":32768}}
    <- {"error": {"class": "GenericError", "desc": "Device '(null)' is in use"}}

Broken when commit 3b1dbd11a60 made @device optional.  Fixed in commit
ed3d2ec98a3 (block: Add errp to b{lk,drv}_truncate()), except for this
one instance.

Fix it by using the error message provided by the op blocker instead,
so it fails like this:

    <- {"error": {"class": "GenericError", "desc": "Node 'blk1' is busy: block device is in use by block job: mirror"}}

Fixes: 3b1dbd11a60d (qmp: Allow block_resize to manipulate bs graph nodes.)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 blockdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f8bb0932f8..d8fb3399f5 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2252,8 +2252,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
     }
 
     bdrv_graph_co_rdlock();
-    if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
-        error_setg(errp, QERR_DEVICE_IN_USE, device);
+    if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, errp)) {
         bdrv_graph_co_rdunlock();
         return;
     }
-- 
2.44.0


