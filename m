Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8Ex-0000Lp-Ut
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 10:39:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8Eq-00005Z-67
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:39:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8Ej-0004S0-Vl
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:39:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YG8Ec-0004FA-LC; Tue, 27 Jan 2015 10:39:22 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 82DDE42F85;
	Tue, 27 Jan 2015 18:39:21 +0300 (MSK)
Message-ID: <54C7B129.90308@msgid.tls.msk.ru>
Date: Tue, 27 Jan 2015 18:39:21 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Chen Gang S <gang.chen@sunrus.com.cn>, riku.voipio@iki.fi
References: <54C21D76.8050808@sunrus.com.cn>
In-Reply-To: <54C21D76.8050808@sunrus.com.cn>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Fix typo issue for
 using target_vec[i].iov_len instead of target_vec[i].iov_base
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
X-List-Received-Date: Tue, 27 Jan 2015 15:39:39 -0000

23.01.2015 13:07, Chen Gang S wrote:
> It is only a typo issue, need use tswapal(target_vec[i].iov_len) for the
> len.

My suggestion:

Subject: linux-user/syscall.c: unlock_iovec: fix typo misuse of iov_base instead of iov_len

without further explanation in the message body.

Applied as-is to trivial, thank you!

/mjt

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a66c2ae..8260ed7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1896,7 +1896,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
>      if (target_vec) {
>          for (i = 0; i < count; i++) {
>              abi_ulong base = tswapal(target_vec[i].iov_base);
> -            abi_long len = tswapal(target_vec[i].iov_base);
> +            abi_long len = tswapal(target_vec[i].iov_len);
>              if (len < 0) {
>                  break;
>              }
> 


