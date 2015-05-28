Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwRo-0004L3-Kp
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:58:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwRn-0004Ib-9h
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwRl-0007QQ-QN
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:58:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwRg-0007Og-KS; Thu, 28 May 2015 07:57:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CA50042715;
	Thu, 28 May 2015 14:57:55 +0300 (MSK)
Message-ID: <556702C3.30609@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:57:55 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
	<1432811625-13392-4-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432811625-13392-4-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 3/4] hw/ppc/e500.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 11:58:04 -0000

28.05.2015 14:13, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/ppc/e500.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index c10e1b5..f74e6f2 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1027,9 +1027,11 @@ void ppce500_init(MachineState *machine, PPCE500=
Params *params)
>                                    NULL, NULL);
>          if (kernel_size < 0) {
>              fprintf(stderr, "qemu: could not load firmware '%s'\n", fi=
lename);
> +            g_free(filename);
>              exit(1);
>          }
>      }
> +    g_free(filename);

Hm.  This is probably the patch I was thinking about when saying
you _removed" g_free() before exit(), but you're _adding_ one=E2=80=A6 ;)
My bad.

Anyway, I don't think there's any reason to add such free() before
exiting.  Second g_free() is okay, first is unnecessary.  I think.

Thanks,

/mjt

