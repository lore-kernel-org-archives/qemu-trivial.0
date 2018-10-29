Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHDhY-00017r-AE
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2018 15:59:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDhW-00016M-FX
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 15:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDhV-0004Jg-Hm
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 15:59:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHDhO-00049U-Gi; Mon, 29 Oct 2018 15:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F104308624E;
	Mon, 29 Oct 2018 19:59:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 977BC60BE7;
	Mon, 29 Oct 2018 19:59:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 29 Oct 2018 20:59:31 +0100
Message-Id: <20181029195931.8747-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 29 Oct 2018 19:59:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Remove bouncing email in ARM
 ACPI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2018 19:59:51 -0000

Shannon Zhao's email at Huawei is bouncing: remove it.

    X-Failed-Recipients: zhaoshenglong@huawei.com
    ** Address not found **
    Your message wasn't delivered to zhaoshenglong@huawei.com because the=
 address couldn't be found, or is unable to receive mail.

Note that the section still contains his personal email (see e59f13d76bb)=
.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d794bd7a66..1aa2728aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
 F: include/hw/*/xlnx*.h
=20
 ARM ACPI Subsystem
-M: Shannon Zhao <zhaoshenglong@huawei.com>
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
--=20
2.17.2


