Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE71C982FA
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 20:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x97XQ-0000Ft-Ms; Tue, 22 Sep 2026 16:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x97XM-0000Ee-Cm
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 16:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x97XK-00044Y-Fc
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 16:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790110580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zJR/NT8BjOMY1aXbO2/G7gMDnhetofVnN1p9YGUPxFA=;
 b=hZz6f7o76zgo7HrSHrh4KLlCHcpD1Zbeupy8y+Ie9rGhGbrf/UjYgOEDTBkoaW6dwgYiBU
 biG6oXM+/SDerhvfaNAm7n039nsQQeFGQhLuvi1DTkg78tls3sLrJwz4vmw95wKP7n/PRx
 /WCExdUcHfVjds+14BEsRMjdlKpXHoU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-_tjkLwAoP5ut419U7uzSFg-1; Tue,
 22 Sep 2026 16:56:18 -0400
X-MC-Unique: _tjkLwAoP5ut419U7uzSFg-1
X-Mimecast-MFC-AGG-ID: _tjkLwAoP5ut419U7uzSFg_1790110576
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB67D1977502; Tue, 22 Sep 2026 20:56:15 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.125])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 27D461956086; Tue, 22 Sep 2026 20:56:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 0/8] qapi: convert intros for qga, firmware, etc
Date: Tue, 22 Sep 2026 16:55:57 -0400
Message-ID: <20260922205605.501602-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: K6SyHtlncTQ4Qeoy135dcxYwQysV0jMrANwbkz-yOP8_1790110576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

v2: minor changes (Markus)=0D
    Dropped now irrelevant final patch (Oops)=0D
=0D
John Snow (8):=0D
  qapi: convert/split remaining qapi/qmp intro sections=0D
  qapi: convert intro sections for unit tests=0D
  qapi: convert trivial intros for qga/qapi-schema.json=0D
  qapi: convert simple intros for qga/qapi-schema.json=0D
  qapi: split intros at natural cutoff points for qga/qapi-schema.json=0D
  qapi: split intros for qga/qapi-schema.json=0D
  qapi: convert intro sections for docs/interop/firmware.json=0D
  qapi: convert intro sections for docs/interop/vhost-user.json=0D
=0D
 docs/interop/firmware.json                    |  76 +++---=0D
 docs/interop/vhost-user.json                  |  27 +-=0D
 qapi/block.json                               |   5 +-=0D
 qapi/machine-s390x.json                       |   3 +-=0D
 qapi/machine.json                             |   3 +-=0D
 qapi/net.json                                 |  24 +-=0D
 qga/qapi-schema.json                          | 249 +++++++-----------=0D
 tests/qapi-schema/doc-good.json               |   8 +-=0D
 tests/qapi-schema/doc-good.out                |  15 +-=0D
 tests/qapi-schema/doc-interleaved-section.err |   2 +-=0D
 .../qapi-schema/doc-interleaved-section.json  |   3 +-=0D
 11 files changed, 161 insertions(+), 254 deletions(-)=0D
=0D
--=20=0D
2.55.0=0D
=0D


