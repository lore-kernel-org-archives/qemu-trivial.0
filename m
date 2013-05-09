Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaM8K-000537-Ud
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 04:23:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UaM8I-00050Y-QG
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 04:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UaM8H-0008Ph-GK
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 04:23:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UaM8F-0008Ov-Fg; Thu, 09 May 2013 04:23:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F68840176;
	Thu,  9 May 2013 12:23:18 +0400 (MSK)
Message-ID: <518B5CF4.8090402@msgid.tls.msk.ru>
Date: Thu, 09 May 2013 12:23:16 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1368086030-3847-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1368086030-3847-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, hutao@cn.fujitsu.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] clean unnecessary code: don't check
 g_strdup arg for NULL
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
X-List-Received-Date: Thu, 09 May 2013 08:23:23 -0000

09.05.2013 11:53, Dong Xu Wang wrote:
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Thank you Dong, (re)applied both patches to the trivial patch queue.

/mjt

