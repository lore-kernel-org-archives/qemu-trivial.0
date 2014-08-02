Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDZIl-0007uP-76
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 09:24:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZId-0007kk-GN
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZIX-0003CP-Bb
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:24:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XDZIK-00039x-QU; Sat, 02 Aug 2014 09:24:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 336074062B;
	Sat,  2 Aug 2014 17:24:20 +0400 (MSK)
Message-ID: <53DCE684.8080804@msgid.tls.msk.ru>
Date: Sat, 02 Aug 2014 17:24:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Alex Bligh <alex@alex.org.uk>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1405760991-2837-1-git-send-email-alex@alex.org.uk>
In-Reply-To: <1405760991-2837-1-git-send-email-alex@alex.org.uk>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Show length mismatch error is hex
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
X-List-Received-Date: Sat, 02 Aug 2014 13:24:45 -0000

19.07.2014 13:09, Alex Bligh wrote:
> When live migrate fails due to a section length mismatch we currently
> see an error message like:
> 
> Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 10000 in != 20000
> 
> The section lengths are in fact in hex, so this should read
> 
> Length mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x10000 in != 0x20000
> 
> Correct the error string to reflect this.

Applied to -trivial, thank you!

/mjt

