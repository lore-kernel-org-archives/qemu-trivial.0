Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9si-00048w-2A
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9sa-0003yh-QM
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9sU-00069B-FW
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:47:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9sI-000688-9q; Sun, 01 Sep 2013 11:47:38 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D41040132;
	Sun,  1 Sep 2013 19:47:37 +0400 (MSK)
Message-ID: <52236199.5000508@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:47:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1377895451-6603-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1377895451-6603-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com, qemu-devel@nongnu.org,
	benoit@irqsave.net
Subject: Re: [Qemu-trivial] [PATCHv2] qmp: fix integer usage in examples
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
X-List-Received-Date: Sun, 01 Sep 2013 15:48:02 -0000

31.08.2013 00:44, Eric Blake wrote:
> Per the qapi schema, block_set_io_throttle takes most arguments
> as ints, not strings.
>
> * qmp-commands.hx (block_set_io_throttle): Use correct type.  Fix
> whitespace and a copy-paste bug in the process.

Thanks, applied to the trivial-patches queue.

/mjt

