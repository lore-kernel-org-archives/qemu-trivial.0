Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WlZSV-00061r-3q
	for mharc-qemu-trivial@gnu.org; Sat, 17 May 2014 03:55:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZSO-0005qW-9U
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZSI-00052j-5s
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:55:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WlZS5-00050x-KH; Sat, 17 May 2014 03:54:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CF124171A;
	Sat, 17 May 2014 11:54:40 +0400 (MSK)
Message-ID: <537715BF.90005@msgid.tls.msk.ru>
Date: Sat, 17 May 2014 11:54:39 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, quintela@redhat.com, 
	owasserm@redhat.com, pbonzini@redhat.com, mst@redhat.com, 
	Eric Blake <eblake@redhat.com>
References: <536E20CC.4030401@gmail.com>
In-Reply-To: <536E20CC.4030401@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Simplify code for
	load_xbzrle()
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
X-List-Received-Date: Sat, 17 May 2014 07:55:06 -0000

10.05.2014 16:51, Chen Gang wrote:
> For xbzrle_decode_buffer(), when decoding contents will exceed writing
> buffer, it will return -1, so need not check the return value whether
> large than writing buffer.
> 
> And when failure occurs within load_xbzrle(), it always return -1
> without any resources which need release.
> 
> So can remove the related checking statements, and also can remove 'rc'
> and 'ret' local variables,

Just one comment below.

> @@ -933,18 +932,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>      qemu_get_buffer(f, xbzrle_decoded_buf, xh_len);
>  
>      /* decode RLE */
> -    ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
> -                               TARGET_PAGE_SIZE);
> -    if (ret == -1) {
> +    if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
> +                             TARGET_PAGE_SIZE) == -1) {

Can we compare like '< 0' here, not like '== -1' ?
Are there any other possible return values from xbzrle_decode_buffer()
which are less than zero but non-error?

To me, anything less than zero is always error (unless it is one of the
possible non-error values, like offset for example which can be negative).

Especially having in mind that in the future, some function may extend
its error return to include the actual error code (like -errno), in which
case code which compares with -1 will not work anymore.

Is it okay to me to apply this with s/== -1/< 0/ ?

Thanks,

/mjt

