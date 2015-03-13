Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWP49-0000Kf-1p
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 08:51:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP46-0000Gk-TC
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP45-0001GD-UO
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YWP45-0001Fr-MQ; Fri, 13 Mar 2015 08:51:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DCpfSS006942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 08:51:41 -0400
Received: from [10.36.112.55] (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DCpZhw008489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 13 Mar 2015 08:51:37 -0400
Message-ID: <5502DD56.6080103@redhat.com>
Date: Fri, 13 Mar 2015 13:51:34 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/net/e1000: fix integer endianness
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
X-List-Received-Date: Fri, 13 Mar 2015 12:51:47 -0000



On 13/03/2015 06:21, Shannon Zhao wrote:
> It's detected by coverity.In is_vlan_packet s->mac_reg[VET] is
> unsigned int but is dereferenced as a narrower unsigned short.
> This may lead to unexpected results depending on machine
> endianness.

Sounds good.  CCing Stefan, net/ maintainer.

> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/net/e1000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index a207e21..59d73cd 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -578,7 +578,7 @@ static inline int
>  is_vlan_packet(E1000State *s, const uint8_t *buf)
>  {
>      return (be16_to_cpup((uint16_t *)(buf + 12)) ==
> -                le16_to_cpup((uint16_t *)(s->mac_reg + VET)));
> +                le16_to_cpu(s->mac_reg[VET]));
>  }
>  
>  static inline int
> @@ -711,7 +711,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
>          (tp->cptse || txd_lower & E1000_TXD_CMD_EOP)) {
>          tp->vlan_needed = 1;
>          stw_be_p(tp->vlan_header,
> -                      le16_to_cpup((uint16_t *)(s->mac_reg + VET)));
> +                      le16_to_cpu(s->mac_reg[VET]));
>          stw_be_p(tp->vlan_header + 2,
>                        le16_to_cpu(dp->upper.fields.special));
>      }
> 

