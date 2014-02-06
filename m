Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBKVg-0003DS-M0
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2014 03:40:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBKVZ-000375-08
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:40:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBKVS-0005ye-Up
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:40:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WBKVG-0005rB-IK; Thu, 06 Feb 2014 03:40:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A6E140B79;
	Thu,  6 Feb 2014 12:40:07 +0400 (MSK)
Message-ID: <52F34A67.7060902@msgid.tls.msk.ru>
Date: Thu, 06 Feb 2014 12:40:07 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
In-Reply-To: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sparc/leon3: Initialize stack pointer
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
X-List-Received-Date: Thu, 06 Feb 2014 08:40:35 -0000

03.02.2014 13:18, Sebastian Huber wrote:
> A lot of real world LEON3 systems are shipped with the GRMON boot
> loader.  This boot loader initializes the stack pointer with the end of
> RAM address.  The application can use this to detect the RAM size of a
> particular board variant.

I don't really know much about sparc or leon3 stuff.  But having a
reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
really sure why it can't go to sparc tree instead.

Thanks,

/mjt

