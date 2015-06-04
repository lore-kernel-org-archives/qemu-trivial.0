Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0SMi-0000hJ-2l
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 06:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0SMf-0000dV-RK
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 06:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0SMe-0001Cn-Rg
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 06:27:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0SMZ-00016P-OM; Thu, 04 Jun 2015 06:27:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BD3AE40895;
	Thu,  4 Jun 2015 13:20:17 +0300 (MSK)
Message-ID: <55702661.9020907@msgid.tls.msk.ru>
Date: Thu, 04 Jun 2015 13:20:17 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Alistair Francis <alistair.francis@xilinx.com>, 
 qemu-trivial@nongnu.org
References: <14e62e727b01a64c188921b7ef2862f0f92734e4.1432711923.git.alistair.francis@xilinx.com>
	<CAKmqyKNT8GChxJOcWE4c3TR_A9edxtvM6yF6OcD05rHJCGeKJA@mail.gmail.com>
In-Reply-To: <CAKmqyKNT8GChxJOcWE4c3TR_A9edxtvM6yF6OcD05rHJCGeKJA@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, saipava@xilinx.com,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v1 1/1] xilinx_axidma.c: Fix up the
	stream_running() function
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
X-List-Received-Date: Thu, 04 Jun 2015 10:27:11 -0000

03.06.2015 10:00, Alistair Francis wrote:
> On Wed, May 27, 2015 at 5:37 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Previously the stream_running() function didn't check
>> if the DMA was halted. This caused hangs in recent versions
>> of MicroBlaze u-boot. Correct stream_running() to check
>> DMASR_HALTED as well as DMACR_RUNSTOP.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Sai Pavan Boddu <saipava@xilinx.com>
> 
> Ping!
> 
> Also add QEMU Trivial.

As far as I can see, Peter Crosthwaite had some rather long
comment about this patch.  Maybe we should have some conclusion
before applying?

https://patchwork.ozlabs.org/patch/476977/

Thanks,

/mjt

