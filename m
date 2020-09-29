Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKAW-0004Iq-DQ
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2020 14:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNKAP-0004HW-21
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 14:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNKAK-0003FX-I4
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 14:15:56 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601403350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/14icxDoim5+ppQr30Q6aMGsbb+jHdVRSBxZtSImQE=;
 b=KloUErBWIOJ4nY9WzG8VLCvpd67zIwvCLuKvEPycpWKbsFQQQOUP4x7IBOje+u7N2aBkrP
 sYelYDI1FJusF52BCceQtEUW47Lt4exGf5l1nCQHtzhhqpjzC5ZNdsjF0lL09KF4Aqq4NC
 ssrajDnZ5gDDqpWEAigvjiEmAxqnIU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-1RDIuzwIMLCqfnzcYZB_Jw-1; Tue, 29 Sep 2020 14:15:48 -0400
X-MC-Unique: 1RDIuzwIMLCqfnzcYZB_Jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C138797D4;
 Tue, 29 Sep 2020 18:15:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 738417C83D;
 Tue, 29 Sep 2020 18:15:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 0/1] docs: repair broken references
Date: Tue, 29 Sep 2020 14:15:44 -0400
Message-Id: <20200929181545.1030256-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 29 Sep 2020 18:15:58 -0000

Found while doing other work for the QAPI generator.=0D
=0D
John Snow (1):=0D
  docs: repair broken references=0D
=0D
 docs/devel/multi-thread-tcg.rst | 2 +-=0D
 docs/devel/testing.rst          | 2 +-=0D
 2 files changed, 2 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


