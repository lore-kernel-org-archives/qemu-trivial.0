Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJdhx-0006QB-3k
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 03:19:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJdhp-0006A2-4e
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJdhi-0004o1-Se
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:19:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJdhW-0004mV-Ar; Tue, 19 Aug 2014 03:19:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 72C6B43B10;
	Tue, 19 Aug 2014 11:19:24 +0400 (MSK)
Message-ID: <53F2FA7C.4040401@msgid.tls.msk.ru>
Date: Tue, 19 Aug 2014 11:19:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>	<53F1E842.60009@msgid.tls.msk.ru>
	<20140818201710.GB1121@redhat.com>
In-Reply-To: <20140818201710.GB1121@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, stefanha@redhat.com,
	pbonzini@redhat.com, lcapitulino@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 03/10] virtio-blk: fix reference a
 pointer which might be freed
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
X-List-Received-Date: Tue, 19 Aug 2014 07:19:51 -0000

19.08.2014 00:17, Michael S. Tsirkin wrote:
[]
> By the way, could you please add Cc qemu-stable on bugfixes
> you have queued?
> These are likely appopriate for 2.1.1.

Actually I've added Cc: qemu-stable@ in the commit message.
So it will go to stable (or should) once I'll send a pull
request.

Thanks,

/mjt

