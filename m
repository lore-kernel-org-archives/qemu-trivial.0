Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOEAH-000065-8U
	for mharc-qemu-trivial@gnu.org; Sun, 22 May 2011 15:18:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QOEAD-00005w-6X
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 15:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QOEAC-0007iM-9s
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 15:18:09 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:53811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QOEAB-0007i3-V5; Sun, 22 May 2011 15:18:08 -0400
Received: from [192.168.178.20] (p5086EED0.dip.t-dialin.net [80.134.238.208])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MHYWy-1QN8lT13bI-003Pom; Sun, 22 May 2011 21:18:03 +0200
Message-ID: <4DD9616A.3040804@mail.berlios.de>
Date: Sun, 22 May 2011 21:18:02 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
	<20110522190642.GA15285@redhat.com>
In-Reply-To: <20110522190642.GA15285@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:/3z8z2jK6HvrO3WbIrK5tFp27ZzPOShu5rNdMML9Duq
	LxDFWbrHzzuAB7O7cwLJ88p5o7G9WTsUHGg81UUQGHpFghY1VF
	JvIo+zm/4i2uCSczKWI1X3qYyUQHH2huEOBjk3OeIVXm7Igube
	5VzYXSQ0dN0F7xwPsbZzn4RfC7Tx1u9tOv8POW4IcVqtELK3JT
	t0ceFRSvOUudk9ZwhN5YkyTJW6F5DzOcDiDMCnEWxTCafMP3Nf tN9bPTieLNtAo
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>, Isaku Yamahata <yamahata@valinux.co.jp>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] piix_pci: fix
	piix3_set_irq_pic()
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
X-List-Received-Date: Sun, 22 May 2011 19:18:12 -0000

Am 22.05.2011 21:06, schrieb Michael S. Tsirkin:
> On Mon, May 16, 2011 at 07:50:55PM +0800, TeLeMan wrote:
>> If pic_irq is greater than 7, the irq level is always 0 on 32bits.
>>
>> Signed-off-by: TeLeMan <geleman@gmail.com>
>
>
> Good catch
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>

The patch fixes the regression in Linux networking with 32 bit hosts.
Tested with w32 and linux 32 bit hosts.

Tested-by: Stefan Weil <weil@mail.berlios.de>

