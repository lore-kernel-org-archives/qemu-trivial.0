Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKCK5-0000qL-Ud
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:36:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SKCJz-0000Xv-Jq
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SKCJv-0004uv-9D
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:36:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1SKCJl-0004tS-Eo; Tue, 17 Apr 2012 13:35:53 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3HHZnTT004441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 17 Apr 2012 13:35:49 -0400
Received: from doriath.home (ovpn-113-173.phx2.redhat.com [10.3.113.173])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3HHZlYj025515; Tue, 17 Apr 2012 13:35:48 -0400
Date: Tue, 17 Apr 2012 14:35:59 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120417143559.3a323dd9@doriath.home>
In-Reply-To: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-ga: generate missing stubs for
	fsfreeze
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
X-List-Received-Date: Tue, 17 Apr 2012 17:36:11 -0000

On Tue, 17 Apr 2012 12:07:38 -0500
Michael Roth <mdroth@linux.vnet.ibm.com> wrote:

> When linux-specific commands (including guest-fsfreeze-*) were consolidat=
ed
> under defined(__linux__), we forgot to account for the case where
> defined(__linux__) && !defined(FIFREEZE). As a result stubs are no longer
> being generated on linux hosts that don't have FIFREEZE support. Fix
> this.
>=20
> Tested-by: Andreas F=E4rber <afaerber@suse.de>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qga/commands-posix.c |   36 ++++++++++++++++++++----------------
>  1 files changed, 20 insertions(+), 16 deletions(-)
>=20
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index faf970d..087c3af 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -881,46 +881,50 @@ error:
> =20
>  #else /* defined(__linux__) */
> =20
> -GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
> +void qmp_guest_suspend_disk(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
> =20
> -int64_t qmp_guest_fsfreeze_freeze(Error **err)
> +void qmp_guest_suspend_ram(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
> =20
> -int64_t qmp_guest_fsfreeze_thaw(Error **err)
> +void qmp_guest_suspend_hybrid(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
> =20
> -void qmp_guest_suspend_disk(Error **err)
> +GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>  {
> -    error_set(err, QERR_UNSUPPORTED);
> +    error_set(errp, QERR_UNSUPPORTED);
> +    return NULL;
>  }
> =20
> -void qmp_guest_suspend_ram(Error **err)
> +#endif
> +
> +#if !defined(CONFIG_FSFREEZE)
> +
> +GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
> =20
> -void qmp_guest_suspend_hybrid(Error **err)
> +int64_t qmp_guest_fsfreeze_freeze(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
> =20
> -GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
> +int64_t qmp_guest_fsfreeze_thaw(Error **err)
>  {
> -    error_set(errp, QERR_UNSUPPORTED);
> -    return NULL;
> +    error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
> =20
>  #endif


