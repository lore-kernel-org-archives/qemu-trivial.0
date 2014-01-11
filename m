Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W22YK-0002o9-Nl
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jan 2014 12:40:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyU-0002Th-UI
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1W1uyM-0004Kr-G5
	for qemu-trivial@nongnu.org; Sat, 11 Jan 2014 04:35:26 -0500
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f]:56959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>)
	id 1W1uy5-000479-GA; Sat, 11 Jan 2014 04:35:01 -0500
Received: by mail-la0-f47.google.com with SMTP id eh20so1697822lab.20
	for <multiple recipients>; Sat, 11 Jan 2014 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aqnFBVeopVY0zhZHNciJmIBl0RS3GPShIhL6AYXnkyM=;
	b=I7KN0XD2uqV2IiMs51SGe7v2bd3g1Qm6U8KEjuZpWZ0VFsdHLK0ttRyB/Zv67wUx3m
	sKaOBLlipBW5sF1+W2/qoSR+Q2vll/z4d7sTvJYFnJ/CbhVOZBUgWlUsG/Ns7nmbFA4I
	Au6+OPwns2qLvCAl8+7NXD0+ttNI5OMweiYQ+d5mL7OwCWBL9nKaxPhGz3gyCnLEzEKv
	Z1WIwtT2DRZoNfvabfEG+rUJaTAhnZJ002mZkKaP7c4gRfQC/hk2iJlQlc7vBXY4a1bA
	oNYUm7ywCd2xpwbwvqLJZQB0PWNJ/RgUai4Z7kQ7j9QPFf7wInwOzZgN6cAxZ28lj/iX
	c+QQ==
X-Received: by 10.152.4.230 with SMTP id n6mr5568406lan.1.1389432899873;
	Sat, 11 Jan 2014 01:34:59 -0800 (PST)
Received: from localhost.localdomain ([188.244.44.2])
	by mx.google.com with ESMTPSA id qx1sm5082926lbb.15.2014.01.11.01.34.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 01:34:59 -0800 (PST)
From: pavel.zbitskiy@gmail.com
To: qemu-devel@nongnu.org
Date: Sat, 11 Jan 2014 13:34:08 +0400
Message-Id: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22f
X-Mailman-Approved-At: Sat, 11 Jan 2014 12:40:55 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] Fix networking for s390x-user
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
X-List-Received-Date: Sat, 11 Jan 2014 09:35:35 -0000

Pavel Zbitskiy (3):
  linux-user: fixed s390x clone() argument order
  linux-user: fixed getsockopt() optlen
  linux-user: fixed recvfrom() addrlen

 linux-user/s390x/syscall.h | 2 +-
 linux-user/syscall.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)



