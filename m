Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UEz27-0003uP-NK
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2013 05:28:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UEz25-0003qb-49
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2013 05:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UEz23-0005EZ-CT
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2013 05:28:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1UEz20-0005Dv-5z; Mon, 11 Mar 2013 05:28:32 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2B9SUul003377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 11 Mar 2013 05:28:30 -0400
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2B9STBh026238; Mon, 11 Mar 2013 05:28:30 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 30C1A200B1; Mon, 11 Mar 2013 10:28:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <1362923885-2656-1-git-send-email-i.mitsyanko@gmail.com>
Date: Mon, 11 Mar 2013 10:28:29 +0100
In-Reply-To: <1362923885-2656-1-git-send-email-i.mitsyanko@gmail.com> (Igor
	Mitsyanko's message of "Sun, 10 Mar 2013 17:58:05 +0400")
Message-ID: <8738w2thdu.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char.c: fix waiting
	for telnet connection message
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
X-List-Received-Date: Mon, 11 Mar 2013 09:28:38 -0000

Igor Mitsyanko <i.mitsyanko@gmail.com> writes:

> Current colon position in "waiting for telnet connection" message template
> produces messages like:
> QEMU waiting for connection on: telnet::127.0.0.16666,server
>
> After moving a colon to the right, we will get a correct messages like:
> QEMU waiting for connection on: telnet:127.0.0.1:6666,server
>
> Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
> ---
>  qemu-char.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index 36295b1..789ee35 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2476,7 +2476,7 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
>          s->do_nodelay = do_nodelay;
>          getnameinfo((struct sockaddr *) &ss, ss_len, host, sizeof(host),
>                      serv, sizeof(serv), NI_NUMERICHOST | NI_NUMERICSERV);
> -        snprintf(chr->filename, 256, "%s:%s:%s%s%s%s",
> +        snprintf(chr->filename, 256, "%s:%s%s%s:%s%s",
>                   is_telnet ? "telnet" : "tcp",
>                   left, host, right, serv,
>                   is_listen ? ",server" : "");

Broken in commit f6bd5d6e.  Nice to have that information in the commit
message, but not worth a respin.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

