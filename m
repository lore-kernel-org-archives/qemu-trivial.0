Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8w0N-0006dM-TC
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 12:01:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8w0D-0006Mb-Go
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 12:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8w05-000647-JO
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 12:01:41 -0500
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:40240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1U8w05-00063X-1K
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 12:01:33 -0500
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Sat, 23 Feb 2013 02:54:04 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 23 Feb 2013 02:54:02 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id B0D782CE802D;
	Sat, 23 Feb 2013 04:01:25 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r1MGmrni51380420; Sat, 23 Feb 2013 03:48:54 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r1MH1OcA006198; Sat, 23 Feb 2013 04:01:24 +1100
Received: from localhost6.localdomain6 (sig-9-49-153-3.mts.ibm.com
	[9.49.153.3])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r1MH1MAW006133; Sat, 23 Feb 2013 04:01:23 +1100
Message-Id: <201302221701.r1MH1MAW006133@d23av04.au.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
In-Reply-To: <1361514481-26164-1-git-send-email-sw@weilnetz.de>
Date: Fri, 22 Feb 2013 17:01:21 -0000
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13022216-0260-0000-0000-000002923D12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.140
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] ui/gtk: Fix build (missing include for
	setlocale)
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
X-List-Received-Date: Fri, 22 Feb 2013 17:01:51 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


