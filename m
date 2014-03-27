Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WT2YF-0001Cf-Ae
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 01:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WT2Y8-0001CZ-5h
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 01:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WT2Y2-0001Og-8C
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 01:08:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WT2Xq-0001LN-24; Thu, 27 Mar 2014 01:08:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CF576435D3;
	Thu, 27 Mar 2014 09:07:53 +0400 (MSK)
Message-ID: <5333B229.6070603@msgid.tls.msk.ru>
Date: Thu, 27 Mar 2014 09:07:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: "Li, Zhen-Hua" <zhen-hual@hp.com>
References: <1395736938-13402-1-git-send-email-zhen-hual@hp.com>
In-Reply-To: <1395736938-13402-1-git-send-email-zhen-hual@hp.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/1] virtio-blk: Use a req pool instead
 of malloc/free
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
X-List-Received-Date: Thu, 27 Mar 2014 05:08:26 -0000

25.03.2014 12:42, Li, Zhen-Hua wrote:
> From: "Li, ZhenHua" <zhen-hual@hp.com>
> 
> In virtio-blk module, when there is new request, new req structure
> will be created by malloc.  Use a req pool instead of this, will increase
> performance;

Um.  This does not qualify neither as a trivial change nor as a stable bugfix.
In my opinion anyway.

Thanks,

/mjt

