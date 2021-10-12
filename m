Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maMw9-0002kU-QE
	for mharc-qemu-trivial@gnu.org; Tue, 12 Oct 2021 14:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maK3G-0004YC-NW
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 11:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maK3D-0001Rv-S2
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 11:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634053847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hie7ihJp5vsW+tBoz9GNIrezyiWAreBOrIsvKLSDb84=;
 b=IrAkxchg9XZ0Tfr8RmCnlkfsCaSDh0xgNUkLw/+Lz18mNtAc2QDo1/Cuo4NgMdQEZOvDoG
 xHsN1plSDtHHthZzPN5Fdh//eBSBhVNp0VA+hIWXbPaYNHjWihg/rui+Dwn7UgrWml7jJa
 ep2kh6bnYylija5yqWRJ6WBbD12Yk7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-6Ikk1iJUOeSRg2AAmZmdDg-1; Tue, 12 Oct 2021 11:50:44 -0400
X-MC-Unique: 6Ikk1iJUOeSRg2AAmZmdDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC51E1922962;
 Tue, 12 Oct 2021 15:50:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52AF369CBE;
 Tue, 12 Oct 2021 15:50:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 0/1] util: Make some iova_tree functions parameters const
Date: Tue, 12 Oct 2021 17:50:00 +0200
Message-Id: <20211012155001.811160-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Oct 2021 14:55:34 -0400
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
X-List-Received-Date: Tue, 12 Oct 2021 15:50:51 -0000

Some guidelines misses I found while working on Shadow Virtqueue, that=0D
uses these functions at this moment.=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  util: Make some iova_tree parameters const=0D
=0D
 include/qemu/iova-tree.h |  8 ++++----=0D
 hw/i386/intel_iommu.c    |  2 +-=0D
 util/iova-tree.c         | 10 +++++-----=0D
 3 files changed, 10 insertions(+), 10 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


