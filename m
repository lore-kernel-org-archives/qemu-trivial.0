Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frh2h-0005rX-Cc
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 06:04:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1frh2g-0005ng-0q
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 06:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1frgvz-0002jz-3o
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 05:57:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45956 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1frgvt-0002b3-3v; Mon, 20 Aug 2018 05:57:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF247400E968;
	Mon, 20 Aug 2018 09:57:06 +0000 (UTC)
Received: from localhost (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A1B82026D66;
	Mon, 20 Aug 2018 09:57:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
In-Reply-To: <20180818025653.21192-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri,
	17 Aug 2018 23:56:53 -0300")
References: <20180818025653.21192-1-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 20 Aug 2018 11:57:01 +0200
Message-ID: <87lg91e4ya.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 20 Aug 2018 09:57:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 20 Aug 2018 09:57:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] migration: Replace strncpy() by
 g_strlcpy()
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
X-List-Received-Date: Mon, 20 Aug 2018 10:04:10 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Fedora 29 comes with GCC 8.1 which added the 'stringop-truncation' checks.
>
> Replace the strncpy() calls by g_strlcpy() to avoid the following warning:
>
>   migration/global_state.c: In function 'global_state_store_running':
>   migration/global_state.c:45:5: error: 'strncpy' specified bound 100 equ=
als destination size [-Werror=3Dstringop-truncation]
>        strncpy((char *)global_state.runstate,
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>               state, sizeof(global_state.runstate));
>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

will be in next pull, thanks.

> ---
> See http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03723.html
>
>  migration/global_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/global_state.c b/migration/global_state.c
> index 8e8ab5c51e..d5df502cd5 100644
> --- a/migration/global_state.c
> +++ b/migration/global_state.c
> @@ -42,7 +42,7 @@ int global_state_store(void)
>  void global_state_store_running(void)
>  {
>      const char *state =3D RunState_str(RUN_STATE_RUNNING);
> -    strncpy((char *)global_state.runstate,
> +    g_strlcpy((char *)global_state.runstate,
>             state, sizeof(global_state.runstate));
>  }

