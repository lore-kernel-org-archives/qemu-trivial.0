Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1K0V-0002lF-1f
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 10:57:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1K0N-0002Lt-NY
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 10:57:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1K0H-0008QF-TM
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 10:57:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36548 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S1K03-0008Op-Ve; Sat, 25 Feb 2012 10:57:32 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 39F549312C;
	Sat, 25 Feb 2012 16:57:31 +0100 (CET)
Message-ID: <4F4904EA.5050002@suse.de>
Date: Sat, 25 Feb 2012 16:57:30 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120208 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Add break statement
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
X-List-Received-Date: Sat, 25 Feb 2012 15:57:57 -0000

Am 25.02.2012 14:57, schrieb Stefan Weil:
> This was not a bug, but it is not common practice to omit the break sta=
tement
> from the last case statement before an empty default case.
>=20
> Any change of the default case would introduce a bug.
>=20
> This was reported as a warning by splint.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-enc-hextile-template.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-templat=
e.h
> index b9f9f5e..a7310e1 100644
> --- a/ui/vnc-enc-hextile-template.h
> +++ b/ui/vnc-enc-hextile-template.h
> @@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_, NAME)(VncSta=
te *vs,
>  	    /* we really don't have to invalidate either the bg or fg
>  	       but we've lost the old values.  oh well. */
>  	}
> +        break;
>      default:

Doesn't that require a fallthrough comment for other tools then?

Andreas

>  	break;
>      }

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

