Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1Rzl-0005YD-Gh
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 02:56:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1Rzk-0005XL-2Q
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 02:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1Rzj-0007wS-80
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 02:56:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1e1Rze-0007uu-5f; Mon, 09 Oct 2017 02:56:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE96E81DF1;
	Mon,  9 Oct 2017 06:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AE96E81DF1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-91.ams2.redhat.com
	[10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8ED672D0;
	Mon,  9 Oct 2017 06:56:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 734B9113298A; Mon,  9 Oct 2017 08:46:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Eric
	Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>, =?utf-8?Q?Mar?=
	=?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, qemu trival
	<qemu-trivial@nongnu.org>,  qemu-devel@nongnu.org
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-89-f4bug@amsat.org>
Date: Mon, 09 Oct 2017 08:46:57 +0200
In-Reply-To: <20171006235023.11952-89-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 6 Oct 2017 20:50:23
	-0300")
Message-ID: <87po9wstr2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 09 Oct 2017 06:56:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 88/88]
 scripts/coverity-model: use g_new() family of functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 06:56:57 -0000

Please cc me on changes to stuff I maintain, as scripts/get_maintainer
tells you :)

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coverity-model.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
> index c702804f41..de07bffb57 100644
> --- a/scripts/coverity-model.c
> +++ b/scripts/coverity-model.c
> @@ -363,7 +363,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
>  typedef struct _GIOChannel GIOChannel;
>  GIOChannel *g_io_channel_unix_new(int fd)
>  {
> -    GIOChannel *c =3D g_malloc0(sizeof(GIOChannel));
> +    GIOChannel *c =3D g_new0(GIOChannel, 1);
>      __coverity_escape__(fd);
>      return c;
>  }

Hmm.

The Coverity model carefully explains g_malloc0().  It doesn't explain
g_new0().  With any luck, Coverity can see through g_new0() --- it's a
macro in my <gmem.h>.  But why complicate matters?  The normal reason
for changing g_malloc0() to g_new0() doesn't apply here.  Let's leave
the model alone.

