Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgSQa-0006tL-B2
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 03:00:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZgSQX-0006pp-D7
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 03:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZgSQW-0002L1-Ds
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 03:00:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZgSQR-0002BG-MY; Mon, 28 Sep 2015 03:00:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 1519CC0B64C2;
	Mon, 28 Sep 2015 07:00:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8S70a9T010078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 28 Sep 2015 03:00:38 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E5AC2303F90D; Mon, 28 Sep 2015 09:00:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
Date: Mon, 28 Sep 2015 09:00:35 +0200
In-Reply-To: <1443211950-8207-1-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Fri, 25 Sep 2015 22:12:30 +0200")
Message-ID: <871tdjni3w.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
	and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 07:00:46 -0000

Stefan Weil <sw@weilnetz.de> writes:

> On Windows, getpid() always returns an int value, but pid_t (which is
> expected by the format string) is either a 32 bit or a 64 bit value.
>
> Without a type cast (or a modified format string), the compiler prints
> a warning when building for 64 bit Windows and the resulting trace_file_n=
ame
> will include a wrong pid:
>
> trace/simple.c:332:9: warning:
>  format =E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long lon=
g int=E2=80=99,
>  but argument 2 has type =E2=80=98int=E2=80=99 [-Wformat=3D]
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  trace/simple.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/trace/simple.c b/trace/simple.c
> index 11ad030..56a624c 100644
> --- a/trace/simple.c
> +++ b/trace/simple.c
> @@ -329,7 +329,8 @@ bool st_set_trace_file(const char *file)
>      g_free(trace_file_name);
>=20=20
>      if (!file) {
> -        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, getpid());
> +        /* Type cast needed for Windows where getpid() returns an int. */
> +        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, (pid_t)ge=
tpid());
>      } else {
>          trace_file_name =3D g_strdup_printf("%s", file);
>      }

First we go to the trouble of defining a platform-dependent FMT_pid, and
then we get to cast anyway.  Meh.

Can you explain why osdep.h's

    #define FMT_pid "%" PRId64

is appropriate for Windows?

