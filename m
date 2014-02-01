Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9X7p-0005AV-77
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9X7h-00051m-Ii
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:44:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9X7b-0005SN-54
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:44:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40460)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9X7C-0005NM-TW; Sat, 01 Feb 2014 04:43:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 38C424001A;
	Sat,  1 Feb 2014 13:43:44 +0400 (MSK)
Message-ID: <52ECC1D0.7050205@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:43:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1391205924-28586-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1391205924-28586-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] i386: Add missing include file for
	QEMU_PACKED
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
X-List-Received-Date: Sat, 01 Feb 2014 09:44:31 -0000

01.02.2014 02:05, Stefan Weil wrote:
> Instead of packing BiosLinkerLoaderEntry, an unused global variable called
> QEMU_PACKED was created (detected by smatch static code analysis).
> 
> Including qemu-common.h gets the right definition and also includes some
> standard include files which now can be removed here.

A good one.

Thanks, applied to the trivial patches queue.

/mjt

