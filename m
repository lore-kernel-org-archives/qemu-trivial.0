Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0Oep-00082W-L3
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 03:34:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b0Oem-0007wZ-Pt
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 03:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b0Oel-0000Q9-9R
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 03:34:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1b0Oeg-0000Og-IV; Wed, 11 May 2016 03:34:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2077863164;
	Wed, 11 May 2016 07:34:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4B7Xx4I031573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 11 May 2016 03:34:00 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C0B721132D8A; Wed, 11 May 2016 09:33:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
References: <1462895369-1508-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 11 May 2016 09:33:58 +0200
In-Reply-To: <1462895369-1508-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Tue, 10 May 2016 16:49:29 +0100")
Message-ID: <8737ppjbfd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 11 May 2016 07:34:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Specify
 the units for -machine kvm_shadow_mem
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
X-List-Received-Date: Wed, 11 May 2016 07:34:10 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> The -machine kvm_shadow_mem option takes a size in bytes; say
> so explicitly in its documentation.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Tobi (github.com/tobimensch)
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 6106520..0b86d9f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -35,7 +35,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                kernel_irqchip=on|off controls accelerated irqchip support\n"
>      "                kernel_irqchip=on|off|split controls accelerated irqchip support (default=off)\n"
>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
> -    "                kvm_shadow_mem=size of KVM shadow MMU\n"
> +    "                kvm_shadow_mem=size of KVM shadow MMU in bytes\n"
>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>      "                iommu=on|off controls emulated Intel IOMMU (VT-d) support (default=off)\n"

Won't hurt, but makes me wonder: we have several size-valued option
parameters where we don't bother to clarify the unit in the description.
Sometimes the param=value string gives a hint, e.g. sndbuf=nbytes.

Things would be less confusing if the suffixless unit of a size was the
same everywhere, but we've screwed that up pretty comprehensively.

