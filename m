Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cft6O-0001pJ-8u
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2017 13:54:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.maffione@gmail.com>) id 1cfr8t-0001Bt-QW
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 11:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.maffione@gmail.com>) id 1cfr8t-0001dg-7E
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 11:48:51 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36699)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <v.maffione@gmail.com>)
	id 1cfr8n-0001Ze-1r; Mon, 20 Feb 2017 11:48:45 -0500
Received: by mail-wm0-x244.google.com with SMTP id r18so15369234wmd.3;
	Mon, 20 Feb 2017 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7NTKqJKQSvrumCUsrSWOlNSHg0uqQrqxxY1cFFV59iQ=;
	b=RoXtUEOSzCeXE0PreWfUIJ/XK0+7wImt32J6OuIUz7ijdImFQiLpRxmVoTi2eVtnpQ
	ubkDqL/sZE5QIsvIPGS2Ix/2aZI/QCD/OaM0XnfF/5nLUyQnnnVMUZZuQ1662xb+TcCU
	Ni86scvY/T670F580Cz+vP1sUBryXFM5elUe8xWF7OPv52PXn3SEUEyMlQAudelZ3KiT
	qdlWbFe/1w4CUJr8nSTvoyXNAbSY/mwv6AALWDr2U4rUecEYVS7X27h6r6DbTEXxh1Be
	nEIQL1q86Y/9PO0xr5YAWHCSwxQ8K3/A5xd2ZhsP60ZbY2VWlRTUrn+b4G7JRZn1GET0
	L6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7NTKqJKQSvrumCUsrSWOlNSHg0uqQrqxxY1cFFV59iQ=;
	b=VejsRV5VXF0oSFi8KRHTFBn6G/J7GhCr0ldAllN6SnKIaU1o8GTh41igaXlwb9jnjP
	dkGLMzxiOJf9P4+7N2ysR7VK5NnuqdM7FlweYffjq5cLTw8wJ6TcGYuwD8PTTFv4tk7k
	QcHj8/yN4KWwONYenEa2E93bh5QIWMWxy9Rq9VYU57Vsgh+aZDq0NpA467GOJHkAuiJn
	exeyuH4V3qH1AYSnO094fAZzfcEb7OGfzuyvtldNmXtx+FDYO4CVDzCdG87dOqNkrAmi
	bPlogOTt+v3M4LpMWQ5yMsYb5Lns3x/CslRbUmBDVl6o7qrGNqENHillf7FK32+Etj24
	/bRg==
X-Gm-Message-State: AMke39ldN6kLM7YPTzd+ThKMWypfrfaV26yfxyMjvOGOocpQY+eVpcWaJbsWo09OLfY6pQ==
X-Received: by 10.28.68.10 with SMTP id r10mr11691784wma.68.1487609323642;
	Mon, 20 Feb 2017 08:48:43 -0800 (PST)
Received: from localhost.localdomain (prova.iet.unipi.it. [131.114.58.86])
	by smtp.gmail.com with ESMTPSA id
	u189sm14146442wmu.1.2017.02.20.08.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 08:48:42 -0800 (PST)
From: Vincenzo Maffione <v.maffione@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Vincenzo Maffione <v.maffione@gmail.com>
Date: Mon, 20 Feb 2017 17:45:09 +0100
Message-Id: <20170220164509.27868-1-v.maffione@gmail.com>
X-Mailer: git-send-email 2.11.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
X-Mailman-Approved-At: Mon, 20 Feb 2017 13:54:23 -0500
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: add missing id=chr0 chardev
 argument in vhost-user example
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
X-List-Received-Date: Mon, 20 Feb 2017 16:48:52 -0000

In the vhost-user example, a chardev with id chr0 is referenced by the
vhost-user net backend, but the id is not specified in the chardev option.

Signed-off-by: Vincenzo Maffione <v.maffione@gmail.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 5633d3914f..ed22fc479a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2127,7 +2127,7 @@ Example:
 @example
 qemu -m 512 -object memory-backend-file,id=mem,size=512M,mem-path=/hugetlbfs,share=on \
      -numa node,memdev=mem \
-     -chardev socket,path=/path/to/socket \
+     -chardev socket,id=chr0,path=/path/to/socket \
      -netdev type=vhost-user,id=net0,chardev=chr0 \
      -device virtio-net-pci,netdev=net0
 @end example
-- 
2.11.1


