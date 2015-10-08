Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOt-0005RU-Rj
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZkKC1-0002C3-AR
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 19:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZkKBQ-0000Lb-UO
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 19:01:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:53426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZkCZQ-0007MR-VJ; Thu, 08 Oct 2015 10:53:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 78961ABB1;
	Thu,  8 Oct 2015 14:53:22 +0000 (UTC)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <1444043060-22835-1-git-send-email-dgilbert@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <56168363.7060206@suse.de>
Date: Thu, 8 Oct 2015 16:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444043060-22835-1-git-send-email-dgilbert@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] tests: Unique test path for
	/string-visitor/output
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
X-List-Received-Date: Thu, 08 Oct 2015 23:02:51 -0000

Am 05.10.2015 um 13:04 schrieb Dr. David Alan Gilbert (git):
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Newer GLib's want unique test paths, and thus moan at dupes.
> (Seen on Fedora 23 which has glib 2.46)
>=20
> Uniqueify the paths.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/test-string-output-visitor.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Same problem on openSUSE Tumbleweed,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

