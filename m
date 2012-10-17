Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOV80-0004o0-TW
	for mharc-qemu-trivial@gnu.org; Wed, 17 Oct 2012 11:01:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOV7q-0004HH-Ch
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 11:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOV7i-0001ZU-MW
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 11:01:38 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49923 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TOV7W-0001XA-J9; Wed, 17 Oct 2012 11:01:18 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id EF26BA24CA;
	Wed, 17 Oct 2012 17:01:17 +0200 (CEST)
Message-ID: <507EC7FF.90603@suse.de>
Date: Wed, 17 Oct 2012 17:00:15 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Tim Hardeck <thardeck@suse.de>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-3-git-send-email-thardeck@suse.de>
In-Reply-To: <1350220128-10140-3-git-send-email-thardeck@suse.de>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu queue: fix
	uninitialized removals
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
X-List-Received-Date: Wed, 17 Oct 2012 15:01:46 -0000

Tim,

Am 14.10.2012 15:08, schrieb Tim Hardeck:
> When calling QTAILQ_REMOVE or QLIST_REMOVE on an unitialized list
> QEMU segfaults.

Can this be reproduced by a user today? Or is this just fixing the case
that a developer forgot to initialize a list?

Regards,
Andreas

> Check for this case specifically on item removal.
>=20
> Signed-off-by: Tim Hardeck <thardeck@suse.de>
> ---
>  qemu-queue.h |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/qemu-queue.h b/qemu-queue.h
> index 9288cd8..47ed239 100644
> --- a/qemu-queue.h
> +++ b/qemu-queue.h
> @@ -141,7 +141,9 @@ struct {                                           =
                     \
>          if ((elm)->field.le_next !=3D NULL)                           =
    \
>                  (elm)->field.le_next->field.le_prev =3D               =
    \
>                      (elm)->field.le_prev;                             =
  \
> -        *(elm)->field.le_prev =3D (elm)->field.le_next;               =
    \
> +        if ((elm)->field.le_prev !=3D NULL) {                         =
    \
> +            *(elm)->field.le_prev =3D (elm)->field.le_next;           =
    \
> +        }                                                             =
  \
>  } while (/*CONSTCOND*/0)
> =20
>  #define QLIST_FOREACH(var, head, field)                               =
  \
> @@ -381,7 +383,9 @@ struct {                                           =
                     \
>                      (elm)->field.tqe_prev;                            =
  \
>          else                                                          =
  \
>                  (head)->tqh_last =3D (elm)->field.tqe_prev;           =
    \
> -        *(elm)->field.tqe_prev =3D (elm)->field.tqe_next;             =
    \
> +        if ((elm)->field.tqe_prev !=3D NULL) {                        =
    \
> +            *(elm)->field.tqe_prev =3D (elm)->field.tqe_next;         =
    \
> +        }                                                             =
  \
>  } while (/*CONSTCOND*/0)
> =20
>  #define QTAILQ_FOREACH(var, head, field)                              =
  \


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

