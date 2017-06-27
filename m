Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPqqF-0008Bm-Qq
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jun 2017 09:47:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqqD-00085r-Q6
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dPqqD-0002MY-6K
	for qemu-trivial@nongnu.org; Tue, 27 Jun 2017 09:47:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dPqq6-00024W-OZ; Tue, 27 Jun 2017 09:47:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0541F42060;
	Tue, 27 Jun 2017 16:47:31 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E6E9C5EB;
	Tue, 27 Jun 2017 16:47:30 +0300 (MSK)
To: Li Ping <li.ping288@zte.com.cn>, mdroth@linux.vnet.ibm.com
References: <1498187863-4937-1-git-send-email-li.ping288@zte.com.cn>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e95d7f8f-c3f2-df17-c79f-fa066092ce14@msgid.tls.msk.ru>
Date: Tue, 27 Jun 2017 16:47:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1498187863-4937-1-git-send-email-li.ping288@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH RESEND] QEMU Guest Agent: Fix memory leak
 of device information set
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
X-List-Received-Date: Tue, 27 Jun 2017 13:47:42 -0000

23.06.2017 06:17, Li Ping wrote:
> The caller of SetupDiGetClassDevs must delete the returned device information
>  set when it is no longer needed by calling SetupDiDestroyDeviceInfoList.

Applied to -trivial, with s/QEMU Guest Agent/qga-win32/ in the Subject.

/mjt

