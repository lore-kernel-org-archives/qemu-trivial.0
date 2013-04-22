Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUAOZ-0002I6-Vx
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 02:38:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1UUAOU-0002C8-Oz
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 02:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1UUAOQ-0002sL-RJ
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 02:38:30 -0400
Received: from afflict.kos.to ([92.243.29.197]:52442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>)
	id 1UUAOI-0002qf-Ky; Mon, 22 Apr 2013 02:38:18 -0400
Received: by afflict.kos.to (Postfix, from userid 1000)
	id 22A6726546; Mon, 22 Apr 2013 08:38:18 +0200 (CEST)
Date: Mon, 22 Apr 2013 09:38:18 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130422063818.GA13425@afflict.kos.to>
References: <1366547403-16480-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1366547403-16480-1-git-send-email-peter.maydell@linaro.org>
X-message-flag: Warning: message not sent with a DRM-Certified client
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 92.243.29.197
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user: fix compile error due to
 stray colon at end of #ifdef line
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
X-List-Received-Date: Mon, 22 Apr 2013 06:38:35 -0000

On Sun, Apr 21, 2013 at 01:30:03PM +0100, Peter Maydell wrote:
> Remove a stray colon from the end of a #ifdef line. Some versions
> of gcc complain about this:
>  linux-user/syscall.c: In function =E2=80=98do_syscall=E2=80=99:
>  linux-user/syscall.c:7606:28: error: extra tokens at end of #ifdef dir=
ective [-Werror]
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-By: Riku Voipio <riku.voipio@linaro.org>

> ---
> Obviously this is 1.5 material; don't care whether it goes through
> linux-user or qemu-trivial or direct commit.
>=20
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c705960..30e93bc 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7603,7 +7603,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
>  #endif
>  #else
>      case TARGET_NR_sendfile:
> -#ifdef TARGET_NR_sendfile64:
> +#ifdef TARGET_NR_sendfile64
>      case TARGET_NR_sendfile64:
>  #endif
>          goto unimplemented;
> --=20
> 1.7.11.4

