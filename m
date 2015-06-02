Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzhcZ-0007oo-BK
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 04:32:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzhcW-0007iZ-0c
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzhcV-0001Yt-AM
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:32:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YzhcP-0001OC-Vp; Tue, 02 Jun 2015 04:32:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D32C740423;
	Tue,  2 Jun 2015 11:32:16 +0300 (MSK)
Message-ID: <556D6A10.6000704@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 11:32:16 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <1432880555-21080-1-git-send-email-saipava@xilinx.com>
	<CAEgOgz5x9Yv7NZyv_aM6=xg=6Rt2M=kG+=5rdX9A5cbx=2iGZQ@mail.gmail.com>
In-Reply-To: <CAEgOgz5x9Yv7NZyv_aM6=xg=6Rt2M=kG+=5rdX9A5cbx=2iGZQ@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	alistai@xilinx.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <pcrost@xilinx.com>
Subject: Re: [Qemu-trivial] [PATCH V1] cadence_gem: Fix Rx buffer size field
	mask
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
X-List-Received-Date: Tue, 02 Jun 2015 08:32:25 -0000

01.06.2015 05:51, Peter Crosthwaite wrote:
> On Thu, May 28, 2015 at 11:22 PM, Sai Pavan Boddu
> <sai.pavan.boddu@xilinx.com> wrote:
>> This patch corrects the Rx buffer size field mask to mask bits 23 to 16
>>
>> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> 
> Matches Xilinx UG585 documentation.
> 
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Can this go via the trivial queue?

Applied to -trivial, with tiny comment change (combining
the two comments, by Sai Pavan Boddy and Peter Crosthwaite,
together).

Thanks,

/mjt

