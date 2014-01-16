Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3kXx-0002kv-3S
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 05:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3kXp-0002cH-7F
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 05:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3kXj-0007uC-2I
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 05:51:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3kXW-0007nl-PF; Thu, 16 Jan 2014 05:51:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0E9A24154B;
	Thu, 16 Jan 2014 14:51:10 +0400 (MSK)
Message-ID: <52D7B99E.5020102@msgid.tls.msk.ru>
Date: Thu, 16 Jan 2014 14:51:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1388215871-4977-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1388215871-4977-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pc-bios: Remove execute flag from BIOS
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
X-List-Received-Date: Thu, 16 Jan 2014 10:51:35 -0000

28.12.2013 11:31, Stefan Weil wrote:
> BIOS files are not directly executable, so they don't need this flag.
> All other BIOS files don't use the execute flag.

Thanks, applied.

/mjt

