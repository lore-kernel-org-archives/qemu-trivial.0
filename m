Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdfL-0000yC-7e
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 11:54:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdfI-0000vc-Eo
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdfH-0003Wu-Lv
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdfC-0003Sy-8u; Thu, 29 Sep 2016 11:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 408194325E;
	Thu, 29 Sep 2016 18:54:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 178D4B0F;
	Thu, 29 Sep 2016 18:54:18 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, Li Qiang <liq3ea@gmail.com>,
	kraxel@redhat.com, qemu-devel@nongnu.org
References: <57df5212.87adc20a.7f06f.fda3@mx.google.com>
	<b12a46ed-a663-9ecb-d401-95fffeb8d42b@redhat.com>
Cc: qemu-trivial@nongnu.org, Li Qiang <liqiang6-s@360.cn>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <41346cb0-df52-3172-f089-e3f8c07df93b@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 18:54:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <b12a46ed-a663-9ecb-d401-95fffeb8d42b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] usb: ehci: fix memory leak in
 ehci_process_itd
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
X-List-Received-Date: Thu, 29 Sep 2016 15:54:29 -0000

Applied to -trivial with comment fix, thanks!

/mjt

