Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VlZoR-0003NS-9e
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2013 02:45:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VlZoI-0003LF-Qi
	for qemu-trivial@nongnu.org; Wed, 27 Nov 2013 02:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VlZoC-0004gD-RH
	for qemu-trivial@nongnu.org; Wed, 27 Nov 2013 02:45:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VlZoC-0004g3-JY; Wed, 27 Nov 2013 02:45:16 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAR7jDN4023442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 27 Nov 2013 02:45:13 -0500
Received: from [10.66.6.190] ([10.66.6.190])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rAR7jB4U017781; Wed, 27 Nov 2013 02:45:11 -0500
Message-ID: <5295A302.3050403@redhat.com>
Date: Wed, 27 Nov 2013 15:45:06 +0800
From: Fam Zheng <famz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Zhi Yong Wu <zwu.kernel@gmail.com>, qemu-trivial@nongnu.org
References: <1385537726-27219-1-git-send-email-zwu.kernel@gmail.com>
In-Reply-To: <1385537726-27219-1-git-send-email-zwu.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rAR7jDN4023442
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>, mjt@tls.msk.ru,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-net: fix the indent
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
X-List-Received-Date: Wed, 27 Nov 2013 07:45:29 -0000

On 2013=E5=B9=B411=E6=9C=8827=E6=97=A5 15:35, Zhi Yong Wu wrote:
> From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
>
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>   hw/net/virtio-net.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index b75c753..90eca9a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1428,7 +1428,7 @@ static NetClientInfo net_virtio_info =3D {
>       .size =3D sizeof(NICState),
>       .can_receive =3D virtio_net_can_receive,
>       .receive =3D virtio_net_receive,
> -        .cleanup =3D virtio_net_cleanup,
> +    .cleanup =3D virtio_net_cleanup,
>       .link_status_changed =3D virtio_net_set_link_status,
>       .query_rx_filter =3D virtio_net_query_rxfilter,
>   };
>

Reviewed-by: Fam Zheng <famz@redhat.com>

