Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnvnM-0005ab-JG
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:10:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnvnF-0005Nq-Lw
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnvn9-00084H-Ir
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:10:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wnvmw-0007lM-PZ; Fri, 23 May 2014 16:09:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 39BCD42B94;
	Sat, 24 May 2014 00:09:58 +0400 (MSK)
Message-ID: <537FAB16.70101@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:09:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Saravanakumar <saravanakumar.punith@gmail.com>, 
 qemu-devel@nongnu.org
References: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
In-Reply-To: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] pci: move dereferencing of root only
 after verifying valid root pointer.
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
X-List-Received-Date: Fri, 23 May 2014 20:10:24 -0000

22.05.2014 15:33, Saravanakumar wrote:
> Move dereferencing of root only after verifying valid root pointer.

Applied to -trivial, after removing duplicate commit comment.
Thank you!

/mjt


