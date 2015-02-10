Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLFv8-0003Be-T9
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 13:52:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLFv4-00035G-CA
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 13:52:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLFv3-0003fL-GY
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 13:52:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLFuy-0003du-5O; Tue, 10 Feb 2015 13:52:16 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C6A31419B0;
	Tue, 10 Feb 2015 21:52:14 +0300 (MSK)
Message-ID: <54DA535E.9030302@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 21:52:14 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
	<54D81D70.8060508@huawei.com>
In-Reply-To: <54D81D70.8060508@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefano.stabellini@eu.citrix.com" <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2] xen_pt: fix two Coverity defects
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
X-List-Received-Date: Tue, 10 Feb 2015 18:52:26 -0000

09.02.2015 05:37, Gonglei wrote:
> On 2015/1/31 15:27, Gonglei (Arei) wrote:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Gonglei (2):
>>   xen-pt: fix Negative array index read
>>   xen-pt: fix Out-of-bounds read
>>
>>  hw/xen/xen_pt_config_init.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> Ping...

I thought you want to change the second patch, did I misunderstand?

Thanks,

/mjt

