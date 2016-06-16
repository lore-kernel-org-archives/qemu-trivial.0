Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDSUW-00088p-Vn
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jun 2016 04:17:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1bDSUU-0007zn-Ni
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 04:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1bDSUT-0004Nz-Qu
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 04:17:30 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:43274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1bDSUP-0004Mb-Eg; Thu, 16 Jun 2016 04:17:25 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
	<1466007277-17525-5-git-send-email-lvivier@redhat.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <22667d49-cbd6-3805-7c1c-5f28396de2cc@mail.uni-paderborn.de>
Date: Thu, 16 Jun 2016 10:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-5-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.3.0.2556906, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.6.16.80917
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/7] tricore: remove useless
 cast
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
X-List-Received-Date: Thu, 16 Jun 2016 08:17:31 -0000

On 06/15/2016 06:14 PM, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/typecast.cocci
> 
> CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/tricore/tricore_testboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
   Bastian


