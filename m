Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9tYl-0007eS-1R
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2021 12:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYW-0007c4-PC
 for qemu-trivial@nongnu.org; Wed, 10 Feb 2021 12:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYT-0000zn-IL
 for qemu-trivial@nongnu.org; Wed, 10 Feb 2021 12:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612979130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vM+20U7m78/bHGcf1xMRnRFl8DSpPabWBuWEsgFCAgI=;
 b=EEFToJpdBX/yNXhaMI+YB+Pfj61ZO6tj9dzmgRSZAOLwGP8yh7dQe2rB4TwB4NtQpc3CC3
 mlloZKhsC6gummhWrjBOBbIQQyU2NEkSmE0EHhnMB+kGye84NW5twrYELtTwFqWqkXf0Ag
 yxK0D3+UGpinyK72BGBHIn0X6bBivmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-JsKLQYOaOxWgiqmgFEEcjg-1; Wed, 10 Feb 2021 12:45:29 -0500
X-MC-Unique: JsKLQYOaOxWgiqmgFEEcjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64ED520D;
 Wed, 10 Feb 2021 17:45:27 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0502B19CAD;
 Wed, 10 Feb 2021 17:45:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 quintela@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jfreimann@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PATCH v2 0/3] failover: trivial cleanup and fix
Date: Wed, 10 Feb 2021 18:45:15 +0100
Message-Id: <20210210174518.2493928-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Feb 2021 17:45:47 -0000

The first patch removes a duplicate assignment to=0D
allow_unplug_during_migration, and simplify the code.=0D
=0D
The second patch fixes a dangling object in failover_add_primary()=0D
that prevents to cleanup the internal structure after the object has=0D
been unplugged.=0D
=0D
v2: add a third patch=0D
=0D
The third patch reports a warning if the failover device is not found=0D
=0D
Laurent Vivier (3):=0D
  pci: cleanup failover sanity check=0D
  virtio-net: add missing object_unref()=0D
  failover: really display a warning when the primary device is not=0D
    found=0D
=0D
 hw/net/virtio-net.c | 18 +++++++++---------=0D
 hw/pci/pci.c        |  6 ++----=0D
 2 files changed, 11 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


