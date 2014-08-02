Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDZKX-0000Z8-7h
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 09:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZKQ-0000Rs-H4
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XDZKL-0003s0-EH
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 09:26:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XDZKA-0003au-11; Sat, 02 Aug 2014 09:26:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A2844060D;
	Sat,  2 Aug 2014 17:26:13 +0400 (MSK)
Message-ID: <53DCE6F5.7010809@msgid.tls.msk.ru>
Date: Sat, 02 Aug 2014 17:26:13 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
 qemu-devel@nongnu.org
References: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 1/1] hexdump: Add null guard on output
 file.
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
X-List-Received-Date: Sat, 02 Aug 2014 13:26:35 -0000

31.07.2014 04:31, Peter Crosthwaite wrote:
> To avoid callsites with optional output having to NULL guard.

Isn't it a bit backwards?  If we don't need output, maybe we should
not call hexdump in the first place?

Thanks,

/mjt

> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
> Noting in-tree is affected by this yet, but I though I'd get this
> out of the way straight-up rather than elongate other series.
> 
>  util/hexdump.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/util/hexdump.c b/util/hexdump.c
> index 969b340..b607236 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -19,6 +19,9 @@ void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
>  {
>      unsigned int b;
>  
> +    if (!fp) {
> +        return;
> +    }
>      for (b = 0; b < size; b++) {
>          if ((b % 16) == 0) {
>              fprintf(fp, "%s: %04x:", prefix, b);
> 


