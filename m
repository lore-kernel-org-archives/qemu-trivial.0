Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckl6r-0006e8-Ar
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 00:23:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ckl6o-0006ce-Ul
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 00:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ckl6n-0008Tc-W5
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 00:22:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42238)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1ckl6j-0008Sl-Fe; Mon, 06 Mar 2017 00:22:53 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74FC763144;
	Mon,  6 Mar 2017 05:22:53 +0000 (UTC)
Received: from [10.72.5.134] (vpn1-5-134.pek2.redhat.com [10.72.5.134])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v265Ml6k030559
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Mar 2017 00:22:51 -0500
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
References: <1488427170-28050-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0266affa-397d-41ca-f14b-ba08b7b31398@redhat.com>
Date: Mon, 6 Mar 2017 13:22:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488427170-28050-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 06 Mar 2017 05:22:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] net/filter-mirror: Follow CODING_STYLE
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
X-List-Received-Date: Mon, 06 Mar 2017 05:22:59 -0000



On 2017=E5=B9=B403=E6=9C=8802=E6=97=A5 11:59, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> ---
>   net/filter-mirror.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index aa0aa98..72fa7c2 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -49,7 +49,7 @@ static int filter_mirror_send(CharBackend *chr_out,
>   {
>       int ret =3D 0;
>       ssize_t size =3D 0;
> -    uint32_t len =3D  0;
> +    uint32_t len =3D 0;
>       char *buf;
>  =20
>       size =3D iov_size(iov, iovcnt);
> @@ -77,8 +77,9 @@ err:
>       return ret < 0 ? ret : -EIO;
>   }
>  =20
> -static void
> -redirector_to_filter(NetFilterState *nf, const uint8_t *buf, int len)
> +static void redirector_to_filter(NetFilterState *nf,
> +                                 const uint8_t *buf,
> +                                 int len)
>   {
>       struct iovec iov =3D {
>           .iov_base =3D (void *)buf,

Applied, thanks.

