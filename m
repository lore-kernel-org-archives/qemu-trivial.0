Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReU3-0007WE-4z
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:18:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YReU1-0007T9-Bl
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YReU0-0002bL-Gj
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:18:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YReTv-0002a8-FK; Sat, 28 Feb 2015 05:18:47 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6B11843EE1;
	Sat, 28 Feb 2015 13:18:46 +0300 (MSK)
Message-ID: <54F19606.4090609@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 13:18:46 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>	<54F18FE7.50602@msgid.tls.msk.ru>
	<54F19194.6050805@huawei.com>
In-Reply-To: <54F19194.6050805@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:18:54 -0000

28.02.2015 12:59, Gonglei wrote:
> On 2015/2/28 17:52, Michael Tokarev wrote:
>> This patch does not apply to current tree.
>>
> You meant this one should be accepted by arm tree?

Nope. I mean this patch does not apply to my tree.  I found the
problem -- it is because of "Remove superfluous '\n' around error_report()"
series which changed the context slightly.  I applied this one
too.

Thanks,

/mjt

