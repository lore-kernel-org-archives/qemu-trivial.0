Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWgbF-0004sk-0Q
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 03:35:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1YWgbC-0004pk-IT
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 03:35:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1YWgb7-0008Er-Qv
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 03:35:06 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:36756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1YWgb7-0008Dr-M8
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 03:35:01 -0400
Received: by wgra20 with SMTP id a20so4005490wgr.3
	for <qemu-trivial@nongnu.org>; Sat, 14 Mar 2015 00:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=lO/CrLcFpMEiI7KOif0m7VIQAalJWXpxf0nxL0qqct4=;
	b=my9Ay4546bDmNSfUEf8IXNTU8siRc/0ZDwpbYjaT7fAp7Uf8cLhc2OIzarIGDdDOHK
	UDbIixn5PmLtJBn/n0/P6/cPjWHoIw/rL0ME6nIkhBDijsoSBH+xfArNjUCtkhzJ40j5
	2UOmeSYHa7la8GUNDA72KTbF7MQgI7BuwVlMXw7bt9cUB5XQi7fl334MIKuCaFqAFLIh
	ABjj6P8rp0RCaGTTd/VQBQr8jv6nLe+aIJZ6GJtWZp7w9f1nIhoUX/m1crXMfLo6THYk
	LCDzypvT1J+ovE3Z2WjUrgz1KP0PpsZYighf0tYuxzIlREabXRI+/b/37Bx+pZBMJ4XP
	keag==
X-Gm-Message-State: ALoCoQlj+gKzCVcqKhReWnpwogccFu2coR3bqadzW899o8FtwEc5ZCCszIdOYnqcIcJ1QUFTaWWP
X-Received: by 10.194.174.106 with SMTP id br10mr51956208wjc.21.1426318499935; 
	Sat, 14 Mar 2015 00:34:59 -0700 (PDT)
Received: from [192.168.0.102] ([5.144.63.13])
	by mx.google.com with ESMTPSA id hd10sm5890010wib.7.2015.03.14.00.34.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Mar 2015 00:34:59 -0700 (PDT)
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426313974-25607-3-git-send-email-thuth@linux.vnet.ibm.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <1426313974-25607-3-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB8FB283-8330-47DC-93FF-0243A41974D4@daynix.com>
X-Mailer: iPad Mail (12B466)
From: Dmitry Fleytman <dmitry@daynix.com>
Date: Sat, 14 Mar 2015 09:35:03 +0200
To: Thomas Huth <thuth@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.53
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] vmxnet: Remove unused function
	vmxnet_rx_pkt_get_num_frags()
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
X-List-Received-Date: Sat, 14 Mar 2015 07:35:07 -0000

Looks good. Thanks.

> On Mar 14, 2015, at 08:19, Thomas Huth <thuth@linux.vnet.ibm.com> wrote:
>=20
> The function is not used anymore and thus can be deleted.
>=20
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Dmitry Fleytman <dmitry@daynix.com>
> ---
> hw/net/vmxnet_rx_pkt.c |    7 -------
> hw/net/vmxnet_rx_pkt.h |    9 ---------
> 2 files changed, 0 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/net/vmxnet_rx_pkt.c b/hw/net/vmxnet_rx_pkt.c
> index a40e346..acbca6a 100644
> --- a/hw/net/vmxnet_rx_pkt.c
> +++ b/hw/net/vmxnet_rx_pkt.c
> @@ -172,13 +172,6 @@ bool vmxnet_rx_pkt_has_virt_hdr(struct VmxnetRxPkt *p=
kt)
>     return pkt->has_virt_hdr;
> }
>=20
> -uint16_t vmxnet_rx_pkt_get_num_frags(struct VmxnetRxPkt *pkt)
> -{
> -    assert(pkt);
> -
> -    return pkt->vec_len;
> -}
> -
> uint16_t vmxnet_rx_pkt_get_vlan_tag(struct VmxnetRxPkt *pkt)
> {
>     assert(pkt);
> diff --git a/hw/net/vmxnet_rx_pkt.h b/hw/net/vmxnet_rx_pkt.h
> index 6b2c60e..5f8352a 100644
> --- a/hw/net/vmxnet_rx_pkt.h
> +++ b/hw/net/vmxnet_rx_pkt.h
> @@ -114,15 +114,6 @@ bool vmxnet_rx_pkt_is_vlan_stripped(struct VmxnetRxPk=
t *pkt);
> bool vmxnet_rx_pkt_has_virt_hdr(struct VmxnetRxPkt *pkt);
>=20
> /**
> - * returns number of frags attached to the packet
> - *
> - * @pkt:            packet
> - * @ret:            number of frags
> - *
> - */
> -uint16_t vmxnet_rx_pkt_get_num_frags(struct VmxnetRxPkt *pkt);
> -
> -/**
>  * attach data to rx packet
>  *
>  * @pkt:            packet
> --=20
> 1.7.1
>=20

