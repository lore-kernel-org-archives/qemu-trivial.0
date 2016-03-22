Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiO2V-0001JJ-K0
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 11:16:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiO2S-0001G4-TT
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiO2N-00070t-3b
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:16:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiO2E-0006zf-6J; Tue, 22 Mar 2016 11:15:54 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id C206FC00F215;
	Tue, 22 Mar 2016 15:15:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MFFqCw029640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 11:15:53 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AC61F303F90D; Tue, 22 Mar 2016 16:15:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Md Haris Iqbal <haris.phnx@gmail.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
Date: Tue, 22 Mar 2016 16:15:51 +0100
In-Reply-To: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com> (Md
	Haris Iqbal's message of "Tue, 22 Mar 2016 20:03:39 +0530")
Message-ID: <877fgumtlk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Changed malloc() to
	g_malloc() at places where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 15:16:10 -0000

Md Haris Iqbal <haris.phnx@gmail.com> writes:

> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  bsd-user/elfload.c | 2 +-
>  bsd-user/qemu.h    | 2 +-
>  linux-user/qemu.h  | 2 +-
>  thunk.c            | 2 +-
>  ui/shader.c        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 0a6092b..40bd1f2 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>  
>   found:
>      /* Now know where the strtab and symtab are.  Snarf them. */
> -    s = malloc(sizeof(*s));
> +    s = g_malloc(sizeof(*s));
>      syms = malloc(symtab.sh_size);
>      if (!syms) {
>          free(s);

You need to track down where s is freed and change from free() to
g_free() there.  One such spot is visible in context.  Same for the
rest of the patch.

[...]

