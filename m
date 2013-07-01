Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Utdwa-0007Fj-L8
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2013 09:15:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UtdwX-00079s-Rc
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 09:14:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UtdwV-0006C3-34
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 09:14:57 -0400
Received: from e8.ny.us.ibm.com ([32.97.182.138]:53150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UtdwU-0006Bs-WD
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 09:14:55 -0400
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Mon, 1 Jul 2013 14:14:53 +0100
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 1 Jul 2013 14:14:51 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 746F6C90045;
	Mon,  1 Jul 2013 09:14:49 -0400 (EDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r61DEmNq350010; Mon, 1 Jul 2013 09:14:48 -0400
Received: from d03av05.boulder.ibm.com (loopback [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r61DEkXd013796; Mon, 1 Jul 2013 07:14:46 -0600
Received: from localhost6.localdomain6 (sig-9-48-84-176.mts.ibm.com
	[9.48.84.176])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r61DEjFg013715; Mon, 1 Jul 2013 07:14:45 -0600
Message-Id: <201307011314.r61DEjFg013715@d03av05.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@us.ibm.com>
In-Reply-To: <1372072012-30305-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Mon, 01 Jul 2013 13:14:38 -0000
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13070113-0320-0000-0000-00000021055E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [PATCH] vl: convert -smp to qemu_opts_parse()
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
X-List-Received-Date: Mon, 01 Jul 2013 13:14:59 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


