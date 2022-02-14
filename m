Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nJh7l-00025g-D7
	for mharc-qemu-trivial@gnu.org; Mon, 14 Feb 2022 14:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7X-00022J-Re
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 14:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJh7T-0003nj-7y
 for qemu-trivial@nongnu.org; Mon, 14 Feb 2022 14:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644867274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WbZkGO9qyjq6RDpnrsDF29OORphhT1cLxLl0CsElxKg=;
 b=EuUTQBDC0gkv+H5pMj7g8WYk/xLwIcWe7IR5orcgSiisWFSOqwEK0/0rxXXh+cLosj2fRS
 4M0vXIxjMK+E5sxDf8RIixirk8MMBrgJhMKvD3YtDjz0+G2P9ijsaTfSBc9AM6n5GTfE6P
 M2DM0Xe21/zUu5XZn0SgIjoK5SK/WNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-D54XxXb-PPms2SY-bxYDnA-1; Mon, 14 Feb 2022 14:34:33 -0500
X-MC-Unique: D54XxXb-PPms2SY-bxYDnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3122F25;
 Mon, 14 Feb 2022 19:34:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AFF75F4EA;
 Mon, 14 Feb 2022 19:34:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/1] vdpa: Make ncs autofree
Date: Mon, 14 Feb 2022 20:34:14 +0100
Message-Id: <20220214193415.1606752-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Feb 2022 19:34:50 -0000

Trivial patch extracted from [1] series. It helps to simplify the memory=0D
management of the function when adding exit paths following the qemu=0D
guidelines.=0D
=0D
Thanks!=0D
=0D
[1] https://patchwork.kernel.org/project/qemu-devel/patch/20220121202733.40=
4989-30-eperezma@redhat.com/=0D
=0D
Eugenio P=C3=A9rez (1):=0D
  vdpa: Make ncs autofree=0D
=0D
 net/vhost-vdpa.c | 5 ++---=0D
 1 file changed, 2 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


