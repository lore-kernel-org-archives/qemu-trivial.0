Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnWyT-0002LK-WF
	for mharc-qemu-trivial@gnu.org; Mon, 02 Dec 2013 12:07:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnWyN-00027s-1u
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 12:07:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnWyF-00031M-U9
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 12:07:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VnWxt-0002sf-8K; Mon, 02 Dec 2013 12:07:21 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A2D8405E8;
	Mon,  2 Dec 2013 21:07:20 +0400 (MSK)
Message-ID: <529CBE48.8060801@msgid.tls.msk.ru>
Date: Mon, 02 Dec 2013 21:07:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384722683-17205-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384722683-17205-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] libcacard/cac: Remove unused statement
 (value stored is never read)
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
X-List-Received-Date: Mon, 02 Dec 2013 17:07:57 -0000

18.11.2013 01:11, Stefan Weil wrote:
> Warning from ccc-analyzer:
> 
> libcacard/cac.c:192:13: warning: Value stored to 'ret' is never read
>             ret = VCARD_DONE;
>             ^     ~~~~~~~~~~
> 
> Here 'ret' is assigned a value inside of a switch statement and also after
> that switch statement.

Applied to trivial patches, thank you!

/mjt

