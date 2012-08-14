Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1HNr-0002xM-VY
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 09:42:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T1HNp-0002wl-JE
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 09:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T1HNo-0003V6-BG
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 09:42:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T1HNo-0003Ut-3V; Tue, 14 Aug 2012 09:42:08 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7EDfnUe025563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 14 Aug 2012 09:41:50 -0400
Received: from doriath.home (ovpn-113-111.phx2.redhat.com [10.3.113.111])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7EDflWt011110; Tue, 14 Aug 2012 09:41:48 -0400
Date: Tue, 14 Aug 2012 10:42:30 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Alberto Garcia <agarcia@igalia.com>
Message-ID: <20120814104230.64aed4e3@doriath.home>
In-Reply-To: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
References: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] ivshmem,
	qdev-monitor: fix order of qerror parameters
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
X-List-Received-Date: Tue, 14 Aug 2012 13:42:11 -0000

On Tue, 14 Aug 2012 14:41:28 +0300
Alberto Garcia <agarcia@igalia.com> wrote:

> Now that the QERR_ macros no longer contain a json dictionary,
> the order of some parameters needs to be fixed for them to appear
> correctly.
> ---
>  hw/ivshmem.c      |    3 ++-
>  hw/qdev-monitor.c |    2 +-
>  2 ficheiros modificados, 3 adi=E7=F5es(+), 2 eliminados(-)
>=20
> diff --git a/hw/ivshmem.c b/hw/ivshmem.c
> index 0c58161..b4d65a6 100644
> --- a/hw/ivshmem.c
> +++ b/hw/ivshmem.c
> @@ -677,7 +677,8 @@ static int pci_ivshmem_init(PCIDevice *dev)
>      }
> =20
>      if (s->role_val =3D=3D IVSHMEM_PEER) {
> -        error_set(&s->migration_blocker, QERR_DEVICE_FEATURE_BLOCKS_MIGR=
ATION, "ivshmem", "peer mode");
> +        error_set(&s->migration_blocker, QERR_DEVICE_FEATURE_BLOCKS_MIGR=
ATION,
> +                  "peer mode", "ivshmem");

Good catch, Alberto.

Here's the real problem. The original QERR_DEVICE_FEATURE_BLOCKS_MIGRATION =
was:

 "{ 'class': 'DeviceFeatureBlocksMigration', 'data': { 'device': %s, 'featu=
re': %s } }"

This is what was used in a error_set() call, so ordering was device name,
feature name.

However, the human error message format was:

 "Migration is disabled when using feature '%(feature)' in device '%(device=
)'"

So, when constructing the error message, ordering was feature name, device =
name.

However, my script that moved all error messages from qerror.c to the QERR_
just did (as a final result):

 error_set(errp,
           "Migration is disabled when using feature '%s' in device '%s'",
           device_name, feature_name);

Sh?t.

Now, I think that the best way to fix this is to change the error message
instead of fixing callers.

For example, we could have:

 "Migration is disabled when device '%s' is using feature '%s'"

Additionally, we should check all old QERR_ macros to see if anyone else
swaps parameters like this and change them too.

I'll do it.

>          migrate_add_blocker(s->migration_blocker);
>      }
> =20
> diff --git a/hw/qdev-monitor.c b/hw/qdev-monitor.c
> index b22a37a..018b386 100644
> --- a/hw/qdev-monitor.c
> +++ b/hw/qdev-monitor.c
> @@ -443,7 +443,7 @@ DeviceState *qdev_device_add(QemuOpts *opts)
>          bus =3D qbus_find_recursive(sysbus_get_default(), NULL, k->bus_t=
ype);
>          if (!bus) {
>              qerror_report(QERR_NO_BUS_FOR_DEVICE,
> -                          driver, k->bus_type);
> +                          k->bus_type, driver);
>              return NULL;
>          }
>      }


