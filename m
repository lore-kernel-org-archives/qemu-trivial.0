Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRIH-0004SO-Hc
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:19:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRIF-0004O3-HJ
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRIE-00064C-Q0
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRIC-00063R-VD; Thu, 03 Mar 2016 06:19:41 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B4406013;
	Thu,  3 Mar 2016 11:19:40 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BJb31008495
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:19:39 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-6-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81DC9.7010706@redhat.com>
Date: Thu, 3 Mar 2016 12:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-6-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 03 Mar 2016 11:19:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 5/6] spapr: fix possible Negative array
	index read
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
X-List-Received-Date: Thu, 03 Mar 2016 11:19:44 -0000



On 03/03/2016 10:43, Gonglei wrote:
> fix CID 1351391.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/ppc/spapr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e9d4abf..57d19ab 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2221,6 +2221,10 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
>          if (*errp) {
>              return;
>          }
> +        if (node < 0 || node >= MAX_NODES) {
> +            error_setg(errp, "Invaild node %d", node);
> +            return;
> +        }
>  
>          /*
>           * Currently PowerPC kernel doesn't allow hot-adding memory to
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

