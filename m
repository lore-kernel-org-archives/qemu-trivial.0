Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua3pu-0007sv-R4
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 08:51:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ua3ps-0007qM-N5
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 08:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ua3pn-00023c-SY
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 08:51:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ua3ph-00022V-B4; Wed, 08 May 2013 08:50:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 751B8405C3;
	Wed,  8 May 2013 16:50:56 +0400 (MSK)
Message-ID: <518A4A2E.200@msgid.tls.msk.ru>
Date: Wed, 08 May 2013 16:50:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Trival <wdongxu@linux.vnet.ibm.com>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
In-Reply-To: <1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] remove needless semicolon
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
X-List-Received-Date: Wed, 08 May 2013 12:51:09 -0000

08.05.2013 13:46, Trival wrote:
> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
> ---
>  block/nbd.c                 | 2 +-
>  fsdev/virtfs-proxy-helper.c | 4 ++--
>  hw/9pfs/virtio-9p-local.c   | 2 +-
>  hw/i386/pc_q35.c            | 2 +-
>  hw/intc/imx_avic.c          | 2 +-
>  hw/usb/host-linux.c         | 4 ++--
>  qga/channel-win32.c         | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Applied to the trivial queue.  I renamed the patch to be
"remove double semicolons", to better describe what it does.

Thank you!

/mjt


