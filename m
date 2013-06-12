Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umm1W-0003l1-5V
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 10:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umm1T-0003ki-MY
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umm1Q-000340-Hq
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:27:39 -0400
Received: from mail-pd0-f182.google.com ([209.85.192.182]:57741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umm1Q-00033d-Bc
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:27:36 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so3861650pdi.41
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 07:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=dNRxTxQJKRb15ghLsr5C+N9gzDwr5OvYVmb7YXpc6GU=;
	b=MPX/2PvH/5EE8A8IhGkQTM33gm/wDgA4JPxSc+wvvJdE6tcnoWRFR3BtsmXIKh/7ox
	g721u/WFS48UXlp8lv2SzEFOUJ9JgYJKnpIFpkP04z6MmUTXIQSy1ER0EWjqYDscLlis
	dmqbpSmd+iy7ja5Df88H22qM4wbYYKUfF/R7di6BRaJJXAM3oZBK6z88dF4ecdOIWd4X
	y9T+TMnwZfzEYu4qnd85dsgsKY/SkANmKDTGKJlms9WvKgwCGOTZPwPl33LLlNX5yBuS
	iRra64vXPML/pXLTa6XGHfTzN+3WeRCLyukolFWD2NY210io9d/hRhb91MOyfAMycD8c
	Fnvw==
X-Received: by 10.68.132.34 with SMTP id or2mr19826725pbb.99.1371047255266;
	Wed, 12 Jun 2013 07:27:35 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	so3sm21530926pac.14.2013.06.12.07.27.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 07:27:33 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2013 00:27:25 +1000
Message-Id: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlqmu7/1/hNqvo/R823tSN55nGRgaaO8L4yWXI8nQ7Nj6raC2jfbgxXeIA1+5pZlowDI4kH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.182
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] spapr: add yet another maintainer
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 14:27:41 -0000

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13c0cc5..1e00bb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
 sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
 M: Alexander Graf <agraf@suse.de>
+M: Alexey Kardashevskiy <aik@ozlabs.ru>
 L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/spapr*
-- 
1.7.10.4


