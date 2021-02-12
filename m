Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAYsl-0004JB-2C
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2021 08:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYsj-0004ET-61
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 08:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYsg-0006ZH-AQ
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 08:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613137989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2dZABqeKdZ7JT4xFbrdLI7awTxQsWDnBFCKzlv+ROWw=;
 b=cZnAdrJ8t0mefe/YU9lZXdgDZXwoaTcXraoPB7cLRaibTtQxkHa0hBrcSsjuOU2u+QEQNi
 wnkD7STkpUQ1EduzsT+XURr0s8rUWG34bb9xm+bFTrD8HoRs9XeX4pvU0YyQce0dY0OD3b
 J3T/zOi4oqGyfLzOmVG7C+so1muvoX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-zRWxp00wOMad5Iq78nyRlA-1; Fri, 12 Feb 2021 08:53:06 -0500
X-MC-Unique: zRWxp00wOMad5Iq78nyRlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DFC107ACC7;
 Fri, 12 Feb 2021 13:53:04 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8FA639A61;
 Fri, 12 Feb 2021 13:52:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 benh@kernel.crashing.org, zhengxiang9@huawei.com, quintela@redhat.com,
 alex.williamson@redhat.com, jfreimann@redhat.com
Subject: [PATCH v3 0/4] failover: trivial cleanup and fix
Date: Fri, 12 Feb 2021 14:52:46 +0100
Message-Id: <20210212135250.2738750-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 12 Feb 2021 13:53:13 -0000

The first patch removes a duplicate assignment to=0D
allow_unplug_during_migration, and simplify the code.=0D
=0D
The second patch fixes a dangling object in failover_add_primary()=0D
that prevents to cleanup the internal structure after the object has=0D
been unplugged.=0D
=0D
v2: add PATCH 3=0D
=0D
Report a warning if the failover device is not found=0D
=0D
v4: add PATCH 4=0D
=0D
Fix a problem in pcie slot link status that makes the kernel=0D
to unplug the card while the virtio-net driver hotplugs it.=0D
=0D
Laurent Vivier (4):=0D
  pci: cleanup failover sanity check=0D
  virtio-net: add missing object_unref()=0D
  failover: really display a warning when the primary device is not=0D
    found=0D
  pcie: don't set link state active if the slot is empty=0D
=0D
 hw/net/virtio-net.c | 18 +++++++++---------=0D
 hw/pci/pci.c        |  6 ++----=0D
 hw/pci/pcie.c       | 19 +++++++++----------=0D
 3 files changed, 20 insertions(+), 23 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


