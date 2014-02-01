Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XBh-0000Ms-6D
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:48:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XBZ-0000Dc-O1
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XBT-0006fl-M7
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:48:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XB5-0006c4-F3; Sat, 01 Feb 2014 04:47:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C5BBF40053;
	Sat,  1 Feb 2014 13:47:54 +0400 (MSK)
Message-ID: <52ECC2CA.1010103@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:47:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1390744949-28850-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1390744949-28850-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] hw/ppc: Remove unused defines
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
X-List-Received-Date: Sat, 01 Feb 2014 09:48:31 -0000

Unused in the code indeed.
Thanks, applied to the trivial-patches queue.

/mjt

