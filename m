Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQxCN-00070P-4I
	for mharc-qemu-trivial@gnu.org; Tue, 21 Apr 2020 14:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jQxCM-0006zi-2I
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 14:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jQxCL-0004DX-2X
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 14:00:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52334
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jQxCK-0004Ch-K8
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 14:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587492039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwpNrYKj/zzgQ1bzbyDvID/w73eI2bj4wJvZ0HwZmO0=;
 b=JgMbZLnlxDty/NRff9UogF7ljURDt8Ci+sZpo2hTC9TQBVr02T+9Sefs0n/XhCCZyHx2b5
 9uL23zCXx/rXQyymblbiuyN5xa+TCJ/ezBOva0o+5hXsGDkjYvYEBKwuYi7TMgZofmrbvT
 xO+EwRvkGRfK9B+TNLdaesgAOlYEsFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-aB9XF869Mta-plaDVrrYDw-1; Tue, 21 Apr 2020 14:00:35 -0400
X-MC-Unique: aB9XF869Mta-plaDVrrYDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE8F2107ACC7;
 Tue, 21 Apr 2020 18:00:30 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 307161001B09;
 Tue, 21 Apr 2020 18:00:26 +0000 (UTC)
Date: Tue, 21 Apr 2020 19:00:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [RFC PATCH 03/17] hw/misc/temp-sensor: Add 'info temp' HMP command
Message-ID: <20200421180024.GL3029@work-vm>
References: <20200421121626.23791-1-f4bug@amsat.org>
 <20200421121626.23791-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200421121626.23791-4-f4bug@amsat.org>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 04:54:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2020 18:00:42 -0000

* Philippe Mathieu-Daud=E9 (f4bug@amsat.org) wrote:
> Add a command to display current devices temperature in the monitor:
>=20
>   (qemu) info temp
>   Temperatures (in C):
>   videocore                          25.00
>   bcm2835-thermal-0                  25.00
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

How do I set the temperature?

> ---
>  include/monitor/hmp.h |  1 +
>  hw/misc/temp-sensor.c | 29 +++++++++++++++++++++++++++++
>  hmp-commands-info.hx  | 11 +++++++++++
>  3 files changed, 41 insertions(+)
>=20
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index e33ca5a911..f023230bd1 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -129,5 +129,6 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict =
*qdict);
>  void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
>  void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
>  void hmp_info_sev(Monitor *mon, const QDict *qdict);
> +void hmp_info_temp(Monitor *mon, const QDict *qdict);
> =20
>  #endif
> diff --git a/hw/misc/temp-sensor.c b/hw/misc/temp-sensor.c
> index 27750c533d..5f591bd9c3 100644
> --- a/hw/misc/temp-sensor.c
> +++ b/hw/misc/temp-sensor.c
> @@ -12,6 +12,8 @@
>  #include "hw/misc/temp-sensor.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/error.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp.h"
> =20
>  static int query_temperature_sensors_foreach(Object *obj, void *opaque)
>  {
> @@ -59,6 +61,33 @@ TemperatureSensorList *qmp_query_temperature_sensors(E=
rror **errp)
>      return list;
>  }
> =20
> +void hmp_info_temp(Monitor *mon, const QDict *qdict)
> +{
> +    TemperatureSensorList *list, *sensor;
> +    Error *err =3D NULL;
> +
> +    list =3D qmp_query_temperature_sensors(&err);
> +    if (!list) {
> +        monitor_printf(mon, "No temperature sensors\n");
> +        return;
> +    }
> +    if (err) {
> +        monitor_printf(mon, "Error while getting temperatures: %s\n",
> +                       error_get_pretty(err));
> +        error_free(err);

Maybe use hmp_handle_error

> +        goto out;
> +    }
> +
> +    monitor_printf(mon, "Temperatures (in C):\n");
> +    for (sensor =3D list; sensor; sensor =3D sensor->next) {
> +        monitor_printf(mon, "%-33s %6.2f\n", sensor->value->name,
> +                       sensor->value->temperature);

See my question on the earlier patch; I'm curious here whether we want
device name, and then subname within that device.

Dave

> +    }
> +
> +out:
> +    qapi_free_TemperatureSensorList(list);
> +}
> +
>  static TypeInfo tempsensor_interface_type_info =3D {
>      .name =3D TYPE_TEMPSENSOR_INTERFACE,
>      .parent =3D TYPE_INTERFACE,
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ca5198438d..77f1c43ce3 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,4 +880,15 @@ SRST
>      Show SEV information.
>  ERST
> =20
> +    {
> +        .name       =3D "temp",
> +        .args_type  =3D "",
> +        .params     =3D "",
> +        .help       =3D "show device temperatures",
> +        .cmd        =3D hmp_info_temp,
> +    },
> =20
> +SRST
> +  ``info temp``
> +    Show device temperatures.
> +ERST
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


