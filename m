Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMBUS-00073u-P3
	for mharc-qemu-trivial@gnu.org; Wed, 18 Sep 2013 02:43:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VMBUM-0006ti-He
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 02:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VMBUH-0001aA-LD
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 02:43:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VMBU7-0001XZ-Ka; Wed, 18 Sep 2013 02:43:35 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8I6hXNp004402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Sep 2013 02:43:33 -0400
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8I6hVgk006043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Sep 2013 02:43:32 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A4860200BD; Wed, 18 Sep 2013 08:43:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1379483296-20374-1-git-send-email-sw@weilnetz.de>
Date: Wed, 18 Sep 2013 08:43:30 +0200
In-Reply-To: <1379483296-20374-1-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Wed, 18 Sep 2013 07:48:15 +0200")
Message-ID: <87mwnaeijx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] exec: Fix broken build for MinGW
	(regression)
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
X-List-Received-Date: Wed, 18 Sep 2013 06:43:55 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Commit 3435f39513a104294b5e3bbf3612047028d25cfc reduced the ifdeffery with
> this result for MinGW:
>
> exec.c: In function =E2=80=98qemu_ram_free=E2=80=99:
> exec.c:1239:17: warning:
>  implicit declaration of function =E2=80=98munmap=E2=80=99 [-Wimplicit-fu=
nction-declaration]
> exec.c:1239:17: warning:
>  nested extern declaration of =E2=80=98munmap=E2=80=99 [-Wnested-externs]
> exec.c:1239: undefined reference to `munmap'
>
> Add some ifdeffery again to fix this.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  exec.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/exec.c b/exec.c
> index 2646912..efeca14 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1229,9 +1229,11 @@ void qemu_ram_free(ram_addr_t addr)
>                  ;
>              } else if (xen_enabled()) {
>                  xen_invalidate_map_cache_entry(block->host);
> +#ifndef _WIN32
>              } else if (block->fd >=3D 0) {
>                  munmap(block->host, block->length);
>                  close(block->fd);
> +#endif
>              } else {
>                  qemu_anon_ram_free(block->host, block->length);
>              }

The initial mmap() is under #ifdef __linux__, in file_ram_alloc().
However, the code manipulating it in qemu_ram_remap() is under #ifndef
_WIN32, and your patch matches that.  Makes sense.

Thanks for cleaning up after me ;)

Reviewed-by: Markus Armbruster <armbru@redhat.com>

