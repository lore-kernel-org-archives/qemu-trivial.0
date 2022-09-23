Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obhMK-0001mq-Q7
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 08:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhMA-0001gP-Ad
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 08:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obhM8-0000Cg-0u
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 08:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g0vSaJhK5RRfnpXTQoX4uwBWUTPfhXjK1+TW7tzf6U0=;
 b=TCzvou9UBsEQf/RygiRHI76C8WqlZzr//qUgkVZq2vo1r8r3dTxZDU8gI2b/VRPQ7gJY0t
 p/3YgrOlq8zVzEi0/COvfgRgfxEcgO3gPdt69DoeKceQodbbOnrag+ZJswhxhokSPvrqLu
 ceG2CR3FkTL+Rt1ZWZMsFhlAXXBccms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-SEX_1i-wPnybZu9ORrZP6g-1; Fri, 23 Sep 2022 08:00:27 -0400
X-MC-Unique: SEX_1i-wPnybZu9ORrZP6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84845185A794;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5875140C6E13;
 Fri, 23 Sep 2022 12:00:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2365721E6900; Fri, 23 Sep 2022 14:00:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 0/3] Drop useless casts from void * to pointer
Date: Fri, 23 Sep 2022 14:00:22 +0200
Message-Id: <20220923120025.448759-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 12:00:34 -0000

Markus Armbruster (3):
  hw/core: Tidy up unnecessary casting away of const
  Drop useless casts from g_malloc() & friends to pointer
  Drop more useless casts from void * to pointer

 bsd-user/elfload.c                      | 2 +-
 contrib/plugins/cache.c                 | 8 ++++----
 contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
 hw/arm/nseries.c                        | 4 ++--
 hw/char/exynos4210_uart.c               | 2 +-
 hw/core/qdev-clock.c                    | 2 +-
 hw/core/sysbus-fdt.c                    | 5 +++--
 hw/display/blizzard.c                   | 2 +-
 hw/hyperv/vmbus.c                       | 2 +-
 hw/misc/cbus.c                          | 6 +++---
 hw/net/cadence_gem.c                    | 2 +-
 hw/net/virtio-net.c                     | 2 +-
 hw/nvme/ctrl.c                          | 4 ++--
 hw/nvram/eeprom93xx.c                   | 2 +-
 hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
 hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
 hw/usb/ccid-card-emulated.c             | 2 +-
 hw/virtio/virtio-iommu.c                | 3 +--
 linux-user/syscall.c                    | 2 +-
 target/i386/hax/hax-all.c               | 2 +-
 target/i386/kvm/kvm.c                   | 3 +--
 target/i386/whpx/whpx-all.c             | 5 ++---
 target/s390x/kvm/kvm.c                  | 2 +-
 tests/tcg/aarch64/system/semiheap.c     | 4 ++--
 ui/vnc-enc-hextile.c                    | 4 ++--
 util/coroutine-ucontext.c               | 2 +-
 util/vfio-helpers.c                     | 2 +-
 27 files changed, 43 insertions(+), 48 deletions(-)

-- 
2.37.2


