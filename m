Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rhr3F-0007Xx-Ok
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2024 08:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhr3A-0007Va-0O
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 08:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhr2y-00040A-Qg
 for qemu-trivial@nongnu.org; Wed, 06 Mar 2024 08:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709730659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OeIczCJNZmwCv/njtBrIao4tE+5cgzDEYZtpXGmb80U=;
 b=bclLu+7VC9AR9isw1dVc11iLK4xzfsuTvHMycVU1m39ICgf5tNDdyTynrxU1s7zqwkP63f
 C8CZ4qQrTRP13gkAVH6bdaZ1jLZuaVmDEnAnp7ca3S7ZKJ3dKB852MXU47U5lOAEb5lqJ5
 x6nBQRGQbZPLbxD4VL8V0m8L0z2QcuU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-xnjgpXd3Nu6V1exW1dJxQw-1; Wed,
 06 Mar 2024 08:10:56 -0500
X-MC-Unique: xnjgpXd3Nu6V1exW1dJxQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CEAD38157A4;
 Wed,  6 Mar 2024 13:10:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB2F111DCFF;
 Wed,  6 Mar 2024 13:10:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A6DF21E6A24; Wed,  6 Mar 2024 14:10:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH 0/2] blockdev: Fix block_resize error reporting for op blockers
Date: Wed,  6 Mar 2024 14:10:53 +0100
Message-ID: <20240306131055.2460378-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Mar 2024 13:11:13 -0000

PATCH 2 requires my "[PATCH] char: Slightly better error reporting
when chardev is in use" posted earlier today, PATCH 1 does not.

Based-on: <20240306081505.2258405-1-armbru@redhat.com>

Markus Armbruster (2):
  blockdev: Fix block_resize error reporting for op blockers
  qerror: QERR_DEVICE_IN_USE is no longer used, drop

 include/qapi/qmp/qerror.h | 3 ---
 blockdev.c                | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.44.0


