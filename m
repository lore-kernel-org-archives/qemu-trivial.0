Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYydJ-0008VG-Gf
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 11:47:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZYydH-0008QL-0H
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 11:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZYydG-0000Gg-6n
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 11:46:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:54237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZYydB-0000GM-Sl; Mon, 07 Sep 2015 11:46:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 07170ABCF;
	Mon,  7 Sep 2015 15:46:52 +0000 (UTC)
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <55EDB16B.6080205@suse.de>
Date: Mon, 7 Sep 2015 17:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object.h: remove some
	child/parent doc
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
X-List-Received-Date: Mon, 07 Sep 2015 15:46:59 -0000

Am 04.09.2015 um 23:01 schrieb marcandre.lureau@redhat.com:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> It looks like this documentation is obsolete: a child object may lookup
> its parent stored in the Object struct.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qom/object.h | 3 ---
>  1 file changed, 3 deletions(-)

Either once again you are trying to do stuff behind my back, or your
setup is really broken: I double-checked that include/qom/ is listed in
MAINTAINERS, so I should've been CC'ed rather than just -trivial.

It's been a valid rule not to mess with these internal fields, therefore
this is not trivial at all, and that's one reason why my x86 CPU series
using it was an RFC. We should either come up with a proper wrapper
function object_get_parent(), or with a wrapper function adding a link<>
property (where we would need to be careful with ref counts) - long time
only the composition tree needed to mess with an object's parent.

If you have a concrete use case of parent access, please point to it.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=
=C3=BCrnberg)

