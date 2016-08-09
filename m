Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bX1RU-0004lU-HA
	for mharc-qemu-trivial@gnu.org; Tue, 09 Aug 2016 03:27:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bX1RP-0004gl-EK
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 03:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bX1RJ-0002Jb-PC
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 03:27:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1bX1RC-0002D6-Jw; Tue, 09 Aug 2016 03:26:58 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0530C811A2;
	Tue,  9 Aug 2016 07:26:57 +0000 (UTC)
Received: from [10.72.4.112] (vpn1-4-112.pek2.redhat.com [10.72.4.112])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u797Qq7I011816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 9 Aug 2016 03:26:54 -0400
To: chaojianhu <chaojianhu@hotmail.com>, qemu-devel@nongnu.org
References: <BLU436-SMTP98842C445B9A4E4B033261DB1C0@phx.gbl>
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a00d4a5d-02f4-51a5-cad4-ec6018a30f96@redhat.com>
Date: Tue, 9 Aug 2016 15:26:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP98842C445B9A4E4B033261DB1C0@phx.gbl>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 09 Aug 2016 07:26:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/net: Fix a heap overflow in
 xlnx.xps-ethernetlite
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
X-List-Received-Date: Tue, 09 Aug 2016 07:27:15 -0000



On 2016=E5=B9=B408=E6=9C=8809=E6=97=A5 11:52, chaojianhu wrote:
> The .receive callback of xlnx.xps-ethernetlite doesn't check the length
> of data before calling memcpy. As a result, the NetClientState object i=
n
> heap will be overflowed. All versions of qemu with xlnx.xps-ethernetlit=
e
> will be affected.
>
> Reported-by: chaojianhu <chaojianhu@hotmail.com>
> Signed-off-by: chaojianhu <chaojianhu@hotmail.com>
>
> ---
>   hw/net/xilinx_ethlite.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 54db2b8..35de353 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -197,6 +197,10 @@ static ssize_t eth_rx(NetClientState *nc, const ui=
nt8_t *buf, size_t size)
>       }
>  =20
>       D(qemu_log("%s %zd rxbase=3D%x\n", __func__, size, rxbase));
> +    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
> +        D(qemu_log("ethlite packet is too big, size=3D%x\n", size));
> +        return -1;
> +    }
>       memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
>  =20
>       s->regs[rxbase + R_RX_CTRL0] |=3D CTRL_S;

Applied, thanks.

