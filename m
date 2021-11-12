Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlcKD-0003PB-FO
	for mharc-qemu-trivial@gnu.org; Fri, 12 Nov 2021 14:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKB-0003NE-N9
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcK7-0007y7-Gk
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636745693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NbE7WayWwdAGEcPzj8kDVfJsHiYbIeGQpX9BLOYf7Dg=;
 b=MNDhAJkfRL5ccMu/8k6NrEy7sVaD+5neGplcou6zn71RaUn07+hLWf422PLpnVoZL4MWTJ
 ft3RD/N8+mHFuFH5MLGms6CsUu7YsLw+lwIcy8/+uqA+DEThEiwePRg+p4cHTtQQlxHORf
 +Onc5B+P5/ShRujF7/ZN5i01FRJ91KQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-HoJYfpXkP2aBsEOrqkLkbQ-1; Fri, 12 Nov 2021 14:34:49 -0500
X-MC-Unique: HoJYfpXkP2aBsEOrqkLkbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A973618125C0;
 Fri, 12 Nov 2021 19:34:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A917C19724;
 Fri, 12 Nov 2021 19:34:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/2] vdpa: Check for existence of opts.vhostdev
Date: Fri, 12 Nov 2021 20:34:29 +0100
Message-Id: <20211112193431.2379298-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 12 Nov 2021 19:34:59 -0000

Since net_init_vhost_vdpa is trying to open it. Not specifying it in the=0D
command line crash qemu.=0D
=0D
While we're at it, stop using qemu_open_old.=0D
=0D
Eugenio P=C3=A9rez (2):=0D
  vdpa: Replace qemu_open_old by qemu_open at=0D
  vdpa: Check for existence of opts.vhostdev=0D
=0D
 net/vhost-vdpa.c | 6 +++++-=0D
 1 file changed, 5 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


