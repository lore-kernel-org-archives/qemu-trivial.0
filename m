Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIdx6-0004HT-VE
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2011 06:09:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RIdx2-00045y-Lu
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 06:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RIdx1-0000If-Ef
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 06:09:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RIdwv-0000El-Ch; Tue, 25 Oct 2011 06:09:37 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9PA9ZDp021046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Oct 2011 06:09:35 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9PA9YK1013122; Tue, 25 Oct 2011 06:09:35 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 3126D6006D; Tue, 25 Oct 2011 12:09:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1319530938-8298-1-git-send-email-rep.dot.nop@gmail.com>
Date: Tue, 25 Oct 2011 12:09:34 +0200
In-Reply-To: <1319530938-8298-1-git-send-email-rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Tue, 25 Oct 2011 10:22:18
	+0200")
Message-ID: <m3ty6xwffl.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Documentation: fix typo
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
X-List-Received-Date: Tue, 25 Oct 2011 10:09:46 -0000

Best to cc: qemu-trivial@nongnu.org for trivial patches.

Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  qemu-doc.texi |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 7ce8999..f34c76f 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -225,7 +225,7 @@ QEMU uses YM3812 emulation by Tatsuyuki Satoh.
>  QEMU uses GUS emulation(GUSEMU32 @url{http://www.deinmeister.de/gusemu/})
>  by Tibor "TS" Sch=C3=BCtz.
>=20=20
> -Not that, by default, GUS shares IRQ(7) with parallel ports and so
> +Note that, by default, GUS shares IRQ(7) with parallel ports and so
>  qemu must be told to not have parallel ports to have working GUS
>=20=20
>  @example

