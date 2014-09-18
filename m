Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUizB-0006eF-SF
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 17:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTN-0003J9-PB
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTE-0006XA-PC
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:17 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:49664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTE-0006WK-JY
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:08 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so424519wib.17
	for <qemu-trivial@nongnu.org>; Thu, 18 Sep 2014 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type;
	bh=ON3UjC6VWTPD/fhCFpRzd56GIHtQ/Vu76xqBHnpyIRo=;
	b=EmE5gUvvjUVnvI0vf4Jvkg8YjnsOg92T1P4afQSog75pvnnBXYTnYpIALuTBsOdWEC
	10GHUD+rG4U7neU2ZQknyBBCAfvy8ynfTKCTFeeRvxaUig0/k2XWS9YklBQMkwht0y6f
	L2n5NsRWifsaR5JGw28qbLTSosk/mOsBHZZoLZLf3OJE8zsyqFy7kkkgfPmIw2fESIHR
	RrTgUiEpNdZTMjLKqrgQi/cuqNP3gwu+Jba4HXCKfFF07rjoEOSVtEa/KJ8tCHNz23xb
	gOAF+BK1D1bd+LRozDJHoHPho294eu2R+XT80NXkynTxpIWUUauwYOYepBTUawrWh+dM
	8Vjw==
X-Received: by 10.194.58.69 with SMTP id o5mr5471689wjq.89.1411053482518;
	Thu, 18 Sep 2014 08:18:02 -0700 (PDT)
Received: from localhost.localdomain ([89.46.161.178])
	by mx.google.com with ESMTPSA id ec2sm3321441wib.19.2014.09.18.08.18.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Sep 2014 08:18:01 -0700 (PDT)
From: Adelina Tuvenie <adelinatuvenie@gmail.com>
X-Google-Original-From: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>
To: qemu-trivial@nongnu.org
Date: Thu, 18 Sep 2014 18:17:43 +0300
Message-Id: <1411053464-12666-1-git-send-email-atuvenie@cloudbasesolutions.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1.9.1"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
X-Mailman-Approved-At: Thu, 18 Sep 2014 17:11:28 -0400
Cc: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>, aliguori@us.ibm.com
Subject: [Qemu-trivial] [PATCH 0/1] qemu-img: Cannot create fixed vhdx image
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
X-List-Received-Date: Thu, 18 Sep 2014 15:18:26 -0000

This is a multi-part message in MIME format.
--------------1.9.1
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


*** BLURB HERE ***

Adelina Tuvenie (1):
  qemu-img: Cannot create fixed vhdx image

 block/vhdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


--------------1.9.1--
