Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXvr0-0000ZU-AJ
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2013 11:55:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXvqx-0000XH-Cq
	for qemu-trivial@nongnu.org; Thu, 02 May 2013 11:55:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXvqt-0002nj-Th
	for qemu-trivial@nongnu.org; Thu, 02 May 2013 11:55:27 -0400
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:46495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXvqt-0002mR-Bj
	for qemu-trivial@nongnu.org; Thu, 02 May 2013 11:55:23 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Fri, 3 May 2013 01:47:14 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 3 May 2013 01:47:02 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id D4C052CE804A;
	Fri,  3 May 2013 01:55:07 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r42FfNji19988604; Fri, 3 May 2013 01:41:23 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r42Ft7Qd021214; Fri, 3 May 2013 01:55:07 +1000
Received: from localhost6.localdomain6 (titi.austin.ibm.com [9.41.105.190])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r42Ft5PY021191; Fri, 3 May 2013 01:55:06 +1000
Message-Id: <201305021555.r42Ft5PY021191@d23av03.au.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Jesse Larrew <jlarrew@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
In-Reply-To: <1367250772-17928-1-git-send-email-jlarrew@linux.vnet.ibm.com>
Date: Thu, 02 May 2013 15:55:05 -0000
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13050215-5490-0000-0000-000003626DD4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.144
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] libqtest: only call fclose() on open
	files
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
X-List-Received-Date: Thu, 02 May 2013 15:55:28 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


