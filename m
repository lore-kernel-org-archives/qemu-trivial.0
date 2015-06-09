Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2HH4-0000Xw-3u
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2015 07:00:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z2HGu-0000TC-NX
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z2HGt-0008H8-Jl
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:00:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z2HGm-000852-VL; Tue, 09 Jun 2015 07:00:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A33940EA1;
	Tue,  9 Jun 2015 14:00:29 +0300 (MSK)
Message-ID: <5576C74D.1050906@msgid.tls.msk.ru>
Date: Tue, 09 Jun 2015 14:00:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1431477807-12220-1-git-send-email-arei.gonglei@huawei.com>
	<555AEA20.3090501@huawei.com> <556C0B7A.3070601@huawei.com>
	<20150601122437-mutt-send-email-mst@redhat.com>
	<556C429F.3070802@redhat.com> <5576428A.4030603@huawei.com>
In-Reply-To: <5576428A.4030603@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 0/6] pci/isa: QOMify
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
X-List-Received-Date: Tue, 09 Jun 2015 11:00:45 -0000

09.06.2015 04:34, Gonglei wrote:
> /mjt, what's your opinion? Thanks

Somehow I thought it is a single patch, and tried to find
it @patchwork.  But it is a series of 6 patches (which I
deleted from my inbox due to routine cleanup procedure).

> Gonglei (6):
>   pci-assign: QOMify
>   piix: piix3 QOMify
>   piix4: QOMify
>   wdt_i6300esb: QOMify
>   xen_pt: QOMify
>   vt82c686: QOMify

Do we care about pci-assign?
Maybe it's better to drop this code completely instead of
fixing it?

Other than that, I think it's okay to apply this series
to -trivial.

Thanks,

/mjt

