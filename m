Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggqeq-0002O3-Vi
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 07:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggqeo-0002Mj-PK
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggqem-0004Dq-RX
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:38:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ggqed-0003eK-6Z; Tue, 08 Jan 2019 07:38:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E44B821C3;
	Tue,  8 Jan 2019 12:38:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600EA10018FB;
	Tue,  8 Jan 2019 12:38:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E12E61138648; Tue,  8 Jan 2019 13:38:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,  mjt@tls.msk.ru,
	laurent@vivier.eu,
	=?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1545633323-10818-1-git-send-email-dongli.zhang@oracle.com>
Date: Tue, 08 Jan 2019 13:38:35 +0100
In-Reply-To: <1545633323-10818-1-git-send-email-dongli.zhang@oracle.com>
	(Dongli Zhang's message of "Mon, 24 Dec 2018 14:35:23 +0800")
Message-ID: <87ef9nnx2s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 08 Jan 2019 12:38:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] qdev: rename
 qdev_create() argument to sync with qdev_try_create()
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
X-List-Received-Date: Tue, 08 Jan 2019 12:38:59 -0000

Dongli Zhang <dongli.zhang@oracle.com> writes:

> The second argument used by qdev_create() is typename and 'name' is very
> confusing. Rename it from 'name' to 'type', which is the same used by
> qdev_try_create().
>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  hw/core/qdev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 6b3cc55..1d65e8f 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -113,17 +113,17 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
>  /* Create a new device.  This only initializes the device state
>     structure and allows properties to be set.  The device still needs
>     to be realized.  See qdev-core.h.  */
> -DeviceState *qdev_create(BusState *bus, const char *name)
> +DeviceState *qdev_create(BusState *bus, const char *type)
>  {
>      DeviceState *dev;
>  
> -    dev = qdev_try_create(bus, name);
> +    dev = qdev_try_create(bus, type);
>      if (!dev) {
>          if (bus) {
> -            error_report("Unknown device '%s' for bus '%s'", name,
> +            error_report("Unknown device '%s' for bus '%s'", type,
>                           object_get_typename(OBJECT(bus)));
>          } else {
> -            error_report("Unknown device '%s' for default sysbus", name);
> +            error_report("Unknown device '%s' for default sysbus", type);
>          }
>          abort();
>      }

Yes, @name is rather generic.  The sub-par function comment doesn't
really help.

You rename the parameter in the definition, but not in the declaration
(qdev-core.h).  Better keep them consistent.

Note that qdev_create() is just one instance of the "variables
containing type names are confusingly named" pattern.  Let's start with
just qdev-core.h:

* qdev_create() parameter @name.

* qdev_try_create() parameter @name.  The definition in qdev.c calls it
  @type.

* qbus_create_inplace() parameter @typename.

* qbus_create() parameter @typename.  The definition in bus.c calls it
  @name.

Let's pick a single identifier and use it consistently.  Picking
@typename would minimize churn, and be consistent with object_new() &
friends.  Philippe, Paolo, what do you think?

