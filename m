Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2Dbs-0002Wc-PP
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 05:15:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2Dbq-0002TW-Hh
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:15:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2Dbp-0004cW-Pv
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:15:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2Dbj-0004YB-Rt; Sun, 23 Apr 2017 05:15:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2333241F10;
	Sun, 23 Apr 2017 12:15:03 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0AA6C3F8;
	Sun, 23 Apr 2017 12:15:03 +0300 (MSK)
To: "sochin.jiang" <sochin@aliyun.com>, berrange@redhat.com
References: <1490365705-2912-1-git-send-email-sochin@aliyun.com>
Cc: qemu-devel@nongnu.org, sochin.jiang@huawei.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <03e2cdb8-0c47-71e8-92f8-f6b6dce3581e@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 12:15:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490365705-2912-1-git-send-email-sochin@aliyun.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] channel-file: fix wrong parameter
 comments
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
X-List-Received-Date: Sun, 23 Apr 2017 09:15:11 -0000

24.03.2017 17:28, sochin.jiang wrote:
> From: "sochin.jiang" <sochin@aliyun.com>
> 
>     fix wrong parameter comments in channel-file.h.

Applied to -trivial.  Please don't duplicate subject and commit comment,
it's enough to leave commit empty if everything is said in the subject :)

Thanks,

/mjt

