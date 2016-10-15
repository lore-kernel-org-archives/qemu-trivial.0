Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvOHf-0003xd-Ju
	for mharc-qemu-trivial@gnu.org; Sat, 15 Oct 2016 08:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOHd-0003uS-2r
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOHX-0005Fw-5y
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:41:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvOHS-0005Az-CK; Sat, 15 Oct 2016 08:41:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 245FE41D00;
	Sat, 15 Oct 2016 15:41:34 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 409A8B2A;
	Sat, 15 Oct 2016 15:41:33 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, Keith Busch <keith.busch@intel.com>,
	qemu-devel@nongnu.org
References: <1476285520-1985-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ca1ddffd-b130-0ca1-71f5-4090cfa819e9@msgid.tls.msk.ru>
Date: Sat, 15 Oct 2016 15:41:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476285520-1985-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/block/nvme: Simplify if-statements a
 little bit
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Oct 2016 12:41:50 -0000

12.10.2016 18:18, Thomas Huth wrote:
> The condition  '!A || (A && B)' is equivalent to '!A || B'.

Applied to -trivial, thanks!

/mjt

