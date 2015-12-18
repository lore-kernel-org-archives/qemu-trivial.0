Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9uca-00079r-2m
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 07:58:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9ucY-00078J-Dl
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9ucX-00076z-Mz
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:58:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9ucS-00075v-KL; Fri, 18 Dec 2015 07:58:48 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 32EA78F4F6;
	Fri, 18 Dec 2015 12:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-44.phx2.redhat.com
	[10.3.113.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBICwki6020357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 07:58:47 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 68BE6303F81B; Fri, 18 Dec 2015 13:58:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
References: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
Date: Fri, 18 Dec 2015 13:58:45 +0100
In-Reply-To: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
	(marcandre lureau's message of "Fri, 18 Dec 2015 11:06:12 +0100")
Message-ID: <87mvt7ewvu.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: spelling
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
X-List-Received-Date: Fri, 18 Dec 2015 12:58:55 -0000

Copying maintainer just for completeness.  I'm sure Luiz won't at all
mind this going through trivial ;)

Let's clarify the commit message:

    monitor: Spelling fix

With that:

Reviewed-by: Markus Armbruster <armbru@redhat.com>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ---
>  monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/monitor.c b/monitor.c
> index e7e7ae2..51ec4c3 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -311,7 +311,7 @@ static void monitor_flush_locked(Monitor *mon)
>              return;
>          }
>          if (rc > 0) {
> -            /* partinal write */
> +            /* partial write */
>              QString *tmp =3D qstring_from_str(buf + rc);
>              QDECREF(mon->outbuf);
>              mon->outbuf =3D tmp;

