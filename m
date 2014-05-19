Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmIUx-0005rS-OH
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 04:00:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIUp-0005m2-Mt
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 04:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIUj-0002nJ-Im
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 04:00:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WmIUV-0002kV-PA; Mon, 19 May 2014 04:00:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 225E941BE6;
	Mon, 19 May 2014 12:00:10 +0400 (MSK)
Message-ID: <5379BA0A.7080200@msgid.tls.msk.ru>
Date: Mon, 19 May 2014 12:00:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com,
	kwolf@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] nbd: Don't export a block device
 with no medium.
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
X-List-Received-Date: Mon, 19 May 2014 08:00:38 -0000

18.05.2014 14:50, Hani Benhabiles wrote:
> The device is exported with erroneous values and can't be read.
> 
> Before the patch:
> $ sudo nbd-client localhost -p 10809 /dev/nbd0 -name floppy0
> Negotiation: ..size = 17592186044415MB
> bs=1024, sz=18446744073709547520 bytes
> 
> $ sudo mount /dev/nbd0 /mnt/tmp/
> mount: block device /dev/nbd0 is write-protected, mounting read-only
> mount: /dev/nbd0: can't read superblock
> 
> After the patch:
> (qemu) nbd_server_add ide0-hd0
> (qemu) nbd_server_add floppy0
> Device 'floppy0' has no medium

I'm not sure this is the right direction.  Maybe we should actually
allow exporting devices with no medium to be able to insert medium
later without re-starting the server?  Especially with -t (persistent).
I dunno.  At least this is the decision which should not be left to
a -trivial tree.

Thank you!

/mjt

