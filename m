Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5EZo-0006y3-Ji
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 08:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V5EZX-0006s4-Va
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 08:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V5EZO-00037d-B0
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 08:35:07 -0400
Received: from e32.co.us.ibm.com ([32.97.110.150]:53237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V5EZO-000376-3y
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 08:34:58 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Fri, 2 Aug 2013 06:34:55 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Aug 2013 06:34:53 -0600
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D08B41FF0055;
	Fri,  2 Aug 2013 06:29:28 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r72CYqk0285166; Fri, 2 Aug 2013 06:34:52 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r72CbYTs025333; Fri, 2 Aug 2013 06:37:34 -0600
Received: from localhost6.localdomain6 ([9.49.221.255])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r72CbPfq025068; Fri, 2 Aug 2013 06:37:27 -0600
Message-Id: <201308021237.r72CbPfq025068@d03av06.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1375216883-23969-1-git-send-email-sw@weilnetz.de>
Date: Fri, 02 Aug 2013 12:34:42 -0000
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13080212-5406-0000-0000-00000B06FE92
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.150
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.6] tci: Fix broken build (compiler
 warning caused by redefined macro BIT)
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
X-List-Received-Date: Fri, 02 Aug 2013 12:35:23 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


