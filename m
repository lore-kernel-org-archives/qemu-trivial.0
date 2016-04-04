Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an9aY-0004yu-Jz
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 14:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1an9aS-0004qO-5C
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1an9aR-00030h-63
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:50:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1an9aH-000307-KW; Mon, 04 Apr 2016 14:50:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EEB67F096;
	Mon,  4 Apr 2016 18:50:44 +0000 (UTC)
Received: from localhost (vpn1-5-40.gru2.redhat.com [10.97.5.40])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u34Ioghl016069; Mon, 4 Apr 2016 14:50:43 -0400
Date: Mon, 4 Apr 2016 15:50:41 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20160404185041.GC22665@thinpad.lan.raisama.net>
References: <1458714100-28885-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1458714100-28885-1-git-send-email-hpoussin@reactos.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] ps2kbd: default to scancode_set 2,
	as with KBD_CMD_RESET
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
X-List-Received-Date: Mon, 04 Apr 2016 18:51:00 -0000

On Wed, Mar 23, 2016 at 07:21:40AM +0100, Herv=E9 Poussineau wrote:
> This line has been added in commit ef74679a810fe6858f625b9d52b68cc3fc61=
eb3d with
> other initializations. However, scancode set 0 doesn't exist (only 1, 2=
, 3).
> This works well as long as operating system is resetting keyboard, or o=
verwriting
> the current scancode set with the one it wants.
>=20
> This fixes IBM 40p firmware, which doesn't bother sending KBD_CMD_RESET=
 or KBD_CMD_SCANCODE.
>=20
> Signed-off-by: Herv=E9 Poussineau <hpoussin@reactos.org>

Matches reset behavior documented at
http://www.computer-engineering.org/ps2keyboard/ (the best source
I could find for the PS/2 specs).

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Michael, do you want to merge this through the PC tree?

> ---
>  hw/input/ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 58892d5..a8aa36f 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -628,7 +628,7 @@ static void ps2_kbd_reset(void *opaque)
>      ps2_common_reset(&s->common);
>      s->scan_enabled =3D 0;
>      s->translate =3D 0;
> -    s->scancode_set =3D 0;
> +    s->scancode_set =3D 2;
>  }
> =20
>  static void ps2_mouse_reset(void *opaque)
> --=20
> 2.1.4
>=20

--=20
Eduardo

