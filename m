Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIdv8-0003j0-HA
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2011 06:07:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RIdv1-0003UG-U9
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 06:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RIduw-0008DH-6A
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 06:07:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RIdup-00089k-B9; Tue, 25 Oct 2011 06:07:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9PA7Png020639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Oct 2011 06:07:25 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9PA7NcK011828; Tue, 25 Oct 2011 06:07:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id B28F96006D; Tue, 25 Oct 2011 12:07:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>
References: <1319485958-4849-1-git-send-email-hpoussin@reactos.org>
Date: Tue, 25 Oct 2011 12:07:22 +0200
In-Reply-To: <1319485958-4849-1-git-send-email-hpoussin@reactos.org>
	(=?utf-8?Q?=22Herv=C3=A9?=
	Poussineau"'s message of "Mon, 24 Oct 2011 21:52:38 +0200")
Message-ID: <m3y5w9wfj9.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/12] Fix typo: buf -> bus
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
X-List-Received-Date: Tue, 25 Oct 2011 10:07:44 -0000

Best to cc: qemu-trivial@nongnu.org for trivial patches.

Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:

> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  hw/audiodev.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/hw/audiodev.h b/hw/audiodev.h
> index 8e930b2..d60c349 100644
> --- a/hw/audiodev.h
> +++ b/hw/audiodev.h
> @@ -11,7 +11,7 @@ int Adlib_init(qemu_irq *pic);
>  int GUS_init(qemu_irq *pic);
>=20=20
>  /* ac97.c */
> -int ac97_init(PCIBus *buf);
> +int ac97_init(PCIBus *bus);
>=20=20
>  /* cs4231a.c */
>  int cs4231a_init(qemu_irq *pic);

