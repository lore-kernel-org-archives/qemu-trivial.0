Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilt49-0004Ux-O0
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2019 06:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilt3z-0004Sv-K8
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 06:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilt3s-0008SY-Ic
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 06:18:17 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23816
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilt3s-0008S9-Ce
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 06:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577704691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4kTG5ZqN2/PAmEoRVFs6v7U1ZnC1Ba9MP0oHqjlTJfc=;
 b=S2DqfNzPZFWmahTbWQ8tSKgWQG0vRABSzjGm6DjIMWYhBukPcmFunxjyjYSSLoY2LFmmJ8
 8+7ITMuLOjdpYt2kUEyHsXX1TOrd85HH2tIPx1iG6WHS+qZ3aoNWLwwWPYIGuHkvK5ilTb
 Nb6DVJVFMAlK0T3AAF97EKvJ02dJlCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Kv5g1z8-MWaVswYBBVbgew-1; Mon, 30 Dec 2019 06:18:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA008017DF;
 Mon, 30 Dec 2019 11:18:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-185.ams2.redhat.com [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C1E1081303;
 Mon, 30 Dec 2019 11:18:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Remove Claudio Fontana bouncing email
Date: Mon, 30 Dec 2019 12:18:00 +0100
Message-Id: <20191230111801.26315-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Kv5g1z8-MWaVswYBBVbgew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 30 Dec 2019 11:18:28 -0000

Claudio Fontana Huawei email is bouncing, remove it.

  The message you sent to claudio.fontana@huawei.com couldn't be
  delivered due to: Recipient email address is possibly incorrect.

  Further information:
    5.1.1 Error: invalid recipients

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 387879aebc..8db4de6b9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2383,7 +2383,6 @@ F: plugins/
 F: tests/plugin
=20
 AArch64 TCG target
-M: Claudio Fontana <claudio.fontana@huawei.com>
 M: Claudio Fontana <claudio.fontana@gmail.com>
 S: Maintained
 L: qemu-arm@nongnu.org
--=20
2.21.0


