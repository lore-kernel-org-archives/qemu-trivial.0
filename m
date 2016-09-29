Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdwG-0008KR-FJ
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 12:12:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdwE-0008Id-Im
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:11:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdwA-00016m-Av
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:11:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdvz-00012T-IC; Thu, 29 Sep 2016 12:11:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 652AC4325E;
	Thu, 29 Sep 2016 19:11:40 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 3981CB0F;
	Thu, 29 Sep 2016 19:11:39 +0300 (MSK)
To: Wei Yang <richard.weiyang@gmail.com>, corentincj@iksaif.net
References: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e0efac7a-8b69-2ae7-efea-b2bdf6676459@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 19:11:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] bitmap: refine and move
 BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Thu, 29 Sep 2016 16:11:59 -0000

05.03.2016 16:47, Wei Yang wrote:
> According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
> BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.
>
> This patch takes this change and also move them all in header file.

Applied to -trivial, thank you!

/mjt

