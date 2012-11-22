Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbXfM-0005GJ-1d
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2012 09:22:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TbXfE-0004tf-G3
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TbXfC-0006hG-S4
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:22:00 -0500
Received: from cantor2.suse.de ([195.135.220.15]:54133 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1TbXew-0006cp-MS; Thu, 22 Nov 2012 09:21:42 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E23F0A52D4;
	Thu, 22 Nov 2012 15:21:41 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1353593796-26823-1-git-send-email-armbru@redhat.com>
Date: Thu, 22 Nov 2012 15:21:38 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <4ECE5034-B4C3-4608-BAED-D599EF287588@suse.de>
References: <1353593796-26823-1-git-send-email-armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Clean up pci_drive_hot_add()'s use of
	BlockInterfaceType
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
X-List-Received-Date: Thu, 22 Nov 2012 14:22:06 -0000


On 22.11.2012, at 15:16, Markus Armbruster wrote:

> pci_drive_hot_add() parameter type has the wrong type: int instead of
> BlockInterfaceType.  It's actually redundant, so we can just drop it.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> hw/device-hotplug.c | 11 ++++-------
> hw/pci-hotplug.c    |  7 +++----
> sysemu.h            |  3 +--
> 3 files changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/device-hotplug.c b/hw/device-hotplug.c
> index eec0fe3..6d9c080 100644
> --- a/hw/device-hotplug.c
> +++ b/hw/device-hotplug.c
> @@ -49,18 +49,16 @@ DriveInfo *add_init_drive(const char *optstr)
> }
>=20
> #if !defined(TARGET_I386)
> -int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
> -                      DriveInfo *dinfo, int type)
> +int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo =
*dinfo)
> {
>     /* On non-x86 we don't do PCI hotplug */
> -    monitor_printf(mon, "Can't hot-add drive to type %d\n", type);
> +    monitor_printf(mon, "Can't hot-add drive to type %d\n", =
dinfo->type);

Can't we expose names instead? I don't really want internal enum =
numbering be part of our external CLI interface :)


Alex

>     return -1;
> }
> #endif
>=20
> void drive_hot_add(Monitor *mon, const QDict *qdict)
> {
> -    int type;
>     DriveInfo *dinfo =3D NULL;
>     const char *opts =3D qdict_get_str(qdict, "opts");
>=20
> @@ -72,14 +70,13 @@ void drive_hot_add(Monitor *mon, const QDict =
*qdict)
>         monitor_printf(mon, "Parameter addr not supported\n");
>         goto err;
>     }
> -    type =3D dinfo->type;
>=20
> -    switch (type) {
> +    switch (dinfo->type) {
>     case IF_NONE:
>         monitor_printf(mon, "OK\n");
>         break;
>     default:
> -        if (pci_drive_hot_add(mon, qdict, dinfo, type)) {
> +        if (pci_drive_hot_add(mon, qdict, dinfo)) {
>             goto err;
>         }
>     }
> diff --git a/hw/pci-hotplug.c b/hw/pci-hotplug.c
> index e7fb780..d2121ee 100644
> --- a/hw/pci-hotplug.c
> +++ b/hw/pci-hotplug.c
> @@ -105,15 +105,14 @@ static int scsi_hot_add(Monitor *mon, =
DeviceState *adapter,
>     return 0;
> }
>=20
> -int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
> -                      DriveInfo *dinfo, int type)
> +int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo =
*dinfo)
> {
>     int dom, pci_bus;
>     unsigned slot;
>     PCIDevice *dev;
>     const char *pci_addr =3D qdict_get_str(qdict, "pci_addr");
>=20
> -    switch (type) {
> +    switch (dinfo->type) {
>     case IF_SCSI:
>         if (pci_read_devaddr(mon, pci_addr, &dom, &pci_bus, &slot)) {
>             goto err;
> @@ -129,7 +128,7 @@ int pci_drive_hot_add(Monitor *mon, const QDict =
*qdict,
>         }
>         break;
>     default:
> -        monitor_printf(mon, "Can't hot-add drive to type %d\n", =
type);
> +        monitor_printf(mon, "Can't hot-add drive to type %d\n", =
dinfo->type);
>         goto err;
>     }
>=20
> diff --git a/sysemu.h b/sysemu.h
> index f5ac664..c1b370b 100644
> --- a/sysemu.h
> +++ b/sysemu.h
> @@ -145,8 +145,7 @@ extern unsigned int nb_prom_envs;
>=20
> /* pci-hotplug */
> void pci_device_hot_add(Monitor *mon, const QDict *qdict);
> -int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
> -                      DriveInfo *dinfo, int type);
> +int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo =
*dinfo);
> void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict);
>=20
> /* generic hotplug */
> --=20
> 1.7.11.7
>=20


