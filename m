Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHzOR-0005m1-QY
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 14:04:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHzOM-0005gI-Nz
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 14:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHzOI-000493-Ee
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 14:04:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XHzO9-00047y-IX; Thu, 14 Aug 2014 14:04:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B4D5A42EAF;
	Thu, 14 Aug 2014 22:04:34 +0400 (MSK)
Message-ID: <53ECFA31.3030509@msgid.tls.msk.ru>
Date: Thu, 14 Aug 2014 22:04:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Riku Voipio <riku.voipio@iki.fi>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-8-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814133135.GB30317@afflict.kos.to>
In-Reply-To: <20140814133135.GB30317@afflict.kos.to>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, stefanha@redhat.com,
	pbonzini@redhat.com, lcapitulino@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 07/10] linux-user: check
 return value of malloc()
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
X-List-Received-Date: Thu, 14 Aug 2014 18:04:55 -0000

14.08.2014 17:31, Riku Voipio wrote:
> On Thu, Aug 14, 2014 at 03:29:18PM +0800, zhanghailiang wrote:
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Acked-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Applied to linux-user as Michael seemed wary of passing these via
> trivial.

I'm not.  It is just that mst said it shoudn't go to trivial ;)

/mjt

