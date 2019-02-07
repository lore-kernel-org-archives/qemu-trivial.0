Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grjWM-0004HP-LA
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 08:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWK-0004Fk-Vx
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWJ-0007j6-Bu
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1grjW9-0007Z8-Je; Thu, 07 Feb 2019 08:15:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39FF57AE8B;
	Thu,  7 Feb 2019 13:15:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 077C57C82B;
	Thu,  7 Feb 2019 13:14:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu,  7 Feb 2019 14:14:54 +0100
Message-Id: <1549545296-18903-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 07 Feb 2019 13:15:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] Deprecation patches
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
X-List-Received-Date: Thu, 07 Feb 2019 13:15:13 -0000

A fix for a wrongly resolved merge conflict in qemu-deprecated.texi,
and the removal of the deprecated -clock option.

Thomas Huth (2):
  qemu-deprecated: Remove -virtioconsole and -no-frame for good
  qemu-options: Remove deprecated option -clock

 qemu-deprecated.texi | 17 -----------------
 qemu-options.hx      |  3 ---
 vl.c                 |  6 ------
 3 files changed, 26 deletions(-)

-- 
1.8.3.1


