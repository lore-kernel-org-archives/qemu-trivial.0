Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQtBl-0002GM-Ry
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jun 2017 06:30:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dQtBk-0002F9-7L
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 06:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dQtBj-00081J-Fh
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 06:30:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43180)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dQtBd-0007tf-5m; Fri, 30 Jun 2017 06:30:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F397EB9C8;
	Fri, 30 Jun 2017 10:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F397EB9C8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2F397EB9C8
Received: from [10.36.116.66] (ovpn-116-66.ams2.redhat.com [10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B32E60BE8;
	Fri, 30 Jun 2017 10:30:01 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
References: <149881713243.18888.18140083803237379387.stgit@bahia>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <74e3d68d-d7b0-a3f2-c798-056d6b405740@redhat.com>
Date: Fri, 30 Jun 2017 12:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149881713243.18888.18140083803237379387.stgit@bahia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 30 Jun 2017 10:30:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] spapr: refresh
 "platform-specific" hcalls comment
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
X-List-Received-Date: Fri, 30 Jun 2017 10:30:13 -0000

On 30.06.2017 12:05, Greg Kurz wrote:
> We have more of these since the addition of KVMPPC_H_LOGICAL_MEMOP in 2012.

Right, and we don't need one for virtio :-)

> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr.h |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index a66bbac35242..1826cc4fd696 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -377,9 +377,8 @@ struct sPAPRMachineState {
>   * as well.
>   *
>   * We also need some hcalls which are specific to qemu / KVM-on-POWER.
> - * So far we just need one for H_RTAS, but in future we'll need more
> - * for extensions like virtio.  We put those into the 0xf000-0xfffc
> - * range which is reserved by PAPR for "platform-specific" hcalls.
> + * We put those into the 0xf000-0xfffc range which is reserved by PAPR
> + * for "platform-specific" hcalls.
>   */
>  #define KVMPPC_HCALL_BASE       0xf000
>  #define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)

Reviewed-by: Thomas Huth <thuth@redhat.com>

