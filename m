Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZZvp-00031X-B7
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 04:13:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZZvm-0002zz-Sk
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZZvm-0001R7-4p
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:13:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cZZvg-0001Mk-Tr; Fri, 03 Feb 2017 04:13:17 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFF2D550B1;
	Fri,  3 Feb 2017 09:13:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v139DFIk005437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Feb 2017 04:13:16 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 199341138646; Fri,  3 Feb 2017 10:13:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1485778921-20869-1-git-send-email-thuth@redhat.com>
Date: Fri, 03 Feb 2017 10:13:14 +0100
In-Reply-To: <1485778921-20869-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 30 Jan 2017 13:22:01 +0100")
Message-ID: <87h94bd4d1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 03 Feb 2017 09:13:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/core/register: Mark
 the device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Fri, 03 Feb 2017 09:13:23 -0000

Thomas Huth <thuth@redhat.com> writes:

> The "qemu,register" device needs to be wired up in source code, there
> is no way the user can add this device with the "-device" parameter or
> the "device_add" monitor command yet.

Well, the user can (I tried), but it won't do squat then.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Changed patch description and comment
>
>  hw/core/register.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 4bfbc50..1416691 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -274,9 +274,18 @@ void register_finalize_block(RegisterInfoArray *r_array)
>      g_free(r_array);
>  }
>  
> +static void register_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    /* Needs to be wired up in source code, see register_init_block32() */

Bear with me...  Please phrase this exactly like the similar comments
elsewhere:

       /* Reason: needs to be wired up by register_init_block32() to work */


> +    dc->cannot_instantiate_with_device_add_yet = true;
> +}
> +
>  static const TypeInfo register_info = {
>      .name  = TYPE_REGISTER,
>      .parent = TYPE_DEVICE,
> +    .class_init = register_class_init,
>  };
>  
>  static void register_register_types(void)

With comment and commit message touched up:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

