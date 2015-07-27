Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJeo9-0001iN-60
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 05:34:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZJeo6-0001fU-Vp
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 05:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZJeo5-0006kG-Nb
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 05:34:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1ZJenz-0006hx-Ee; Mon, 27 Jul 2015 05:34:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A16AD341AC4;
	Mon, 27 Jul 2015 09:34:41 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-151.brq.redhat.com [10.34.1.151])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6R9Ydn6023913; Mon, 27 Jul 2015 05:34:40 -0400
Date: Mon, 27 Jul 2015 11:34:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20150727113438.0c257b0a@nial.brq.redhat.com>
In-Reply-To: <1437761762-19798-2-git-send-email-lersek@redhat.com>
References: <1437761762-19798-1-git-send-email-lersek@redhat.com>
	<1437761762-19798-2-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4-rc3 1/3]
 hw/acpi/ich9: clear smi_en on reset
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
X-List-Received-Date: Mon, 27 Jul 2015 09:34:51 -0000

On Fri, 24 Jul 2015 20:16:00 +0200
Laszlo Ersek <lersek@redhat.com> wrote:

> Otherwise on reboot firmware might think (due to APMC_EN remaining set
> from the previous boot) that SMI support is absent.
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  hw/acpi/ich9.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index f04f6dc..8da5a2d 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -221,6 +221,7 @@ static void pm_reset(void *opaque)
>      acpi_pm_tmr_reset(&pm->acpi_regs);
>      acpi_gpe_reset(&pm->acpi_regs);
>  
> +    pm->smi_en = 0;
>      if (!pm->smm_enabled) {
>          /* Mark SMM as already inited to prevent SMM from running. KVM does not
>           * support SMM mode. */


