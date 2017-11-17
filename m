Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFWgo-0003Ow-U5
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2017 21:47:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1eFWgn-0003Nf-AI
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 21:47:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1eFWgm-0000vS-MZ
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 21:47:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1eFWgh-0000tY-8I; Thu, 16 Nov 2017 21:47:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F4632D0FC1;
	Fri, 17 Nov 2017 02:47:26 +0000 (UTC)
Received: from [10.72.12.163] (ovpn-12-163.pek2.redhat.com [10.72.12.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA2A17CEB;
	Fri, 17 Nov 2017 02:47:24 +0000 (UTC)
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20171116194902.5887-1-sw@weilnetz.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <52eaa698-87e1-e40a-5bf1-db4b62412838@redhat.com>
Date: Fri, 17 Nov 2017 10:47:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171116194902.5887-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 17 Nov 2017 02:47:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] MAINTAINERS: Add
 missing entry for eepro100 emulation
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
X-List-Received-Date: Fri, 17 Nov 2017 02:47:34 -0000



On 2017=E5=B9=B411=E6=9C=8817=E6=97=A5 03:49, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   MAINTAINERS | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ffd77b461c..83434e09af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1183,6 +1183,11 @@ M: Dmitry Fleytman <dmitry@daynix.com>
>   S: Maintained
>   F: hw/net/e1000e*
>  =20
> +eepro100
> +M: Stefan Weil <sw@weilnetz.de>
> +S: Maintained
> +F: hw/net/eepro100.c
> +
>   Generic Loader
>   M: Alistair Francis <alistair.francis@xilinx.com>
>   S: Maintained

Applied.

Thanks

