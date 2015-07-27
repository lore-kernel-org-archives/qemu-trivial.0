Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJewe-00055O-NN
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 05:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZJewc-00052f-LW
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 05:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ZJewb-00027s-Pj
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 05:43:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1ZJewW-000254-Ki; Mon, 27 Jul 2015 05:43:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3482E4C0A6;
	Mon, 27 Jul 2015 09:43:32 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-151.brq.redhat.com [10.34.1.151])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6R9hTSY020625; Mon, 27 Jul 2015 05:43:30 -0400
Date: Mon, 27 Jul 2015 11:43:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20150727114329.595ffae0@nial.brq.redhat.com>
In-Reply-To: <1437761762-19798-3-git-send-email-lersek@redhat.com>
References: <1437761762-19798-1-git-send-email-lersek@redhat.com>
	<1437761762-19798-3-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4-rc3 2/3]
 hw/acpi/ich9: clean up stale comment about KVM not supporting SMM
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
X-List-Received-Date: Mon, 27 Jul 2015 09:43:39 -0000

On Fri, 24 Jul 2015 20:16:01 +0200
Laszlo Ersek <lersek@redhat.com> wrote:

> Commit fba72476c6 ("ich9: add smm_enabled field and arguments") detached
> SMM availability from kvm_enabled(). However, the comment in pm_reset()
> was not updated; let's do it now.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ich9.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 8da5a2d..1c7fcfa 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -223,8 +223,7 @@ static void pm_reset(void *opaque)
>  
>      pm->smi_en = 0;
>      if (!pm->smm_enabled) {
> -        /* Mark SMM as already inited to prevent SMM from running. KVM does not
> -         * support SMM mode. */
> +        /* Mark SMM as already inited to prevent SMM from running. */
>          pm->smi_en |= ICH9_PMIO_SMI_EN_APMC_EN;
>      }
>      pm->smi_en_wmask = ~0;


