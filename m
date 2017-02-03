Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZZrm-000189-KZ
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 04:09:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZZrk-00017L-Ht
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZZrj-0007m2-NV
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:09:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cZZre-0007lB-In; Fri, 03 Feb 2017 04:09:06 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8531CC04B92B;
	Fri,  3 Feb 2017 09:09:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v13994bt026635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Feb 2017 04:09:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3C74A1138646; Fri,  3 Feb 2017 10:09:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1485778972-20924-1-git-send-email-thuth@redhat.com>
Date: Fri, 03 Feb 2017 10:09:03 +0100
In-Reply-To: <1485778972-20924-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 30 Jan 2017 13:22:52 +0100")
Message-ID: <87lgtnd4k0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 03 Feb 2017 09:09:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/core/or-irq: Mark the
 device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Fri, 03 Feb 2017 09:09:13 -0000

Thomas Huth <thuth@redhat.com> writes:

> The "or-irq" device needs to be wired up in source code, there is no
> way the user can add this device with the "-device" parameter or the
> "device_add" monitor command yet.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Changed patch description and comment
>
>  hw/core/or-irq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
> index 1ac090d..808c8d1 100644
> --- a/hw/core/or-irq.c
> +++ b/hw/core/or-irq.c
> @@ -89,6 +89,9 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
>      dc->props = or_irq_properties;
>      dc->realize = or_irq_realize;
>      dc->vmsd = &vmstate_or_irq;
> +
> +    /* Reason: Needs to be wired up in source code, e.g. see stm32f205_soc.c */

This line is a bit long, and it could be shortened easily: drop "in
source code", or replace it by "to work".  This is how similar comments
elsewhere are phrased.

> +    dc->cannot_instantiate_with_device_add_yet = true;
>  }
>  
>  static const TypeInfo or_irq_type_info = {

Preferably with the comment touched up:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

