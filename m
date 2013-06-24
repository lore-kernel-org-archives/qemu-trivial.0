Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur2Vb-0003f2-PQ
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 04:52:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2VZ-0003es-Fm
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2VY-0000eN-FV
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:52:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ur2VY-0000eH-7p; Mon, 24 Jun 2013 04:52:20 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O8qJIm009259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 04:52:19 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O87Y4j009514; Mon, 24 Jun 2013 04:07:34 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0D4D9200B4; Mon, 24 Jun 2013 10:07:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
	<1372055996-4072-3-git-send-email-kraxel@redhat.com>
Date: Mon, 24 Jun 2013 10:07:33 +0200
In-Reply-To: <1372055996-4072-3-git-send-email-kraxel@redhat.com> (Gerd
	Hoffmann's message of "Mon, 24 Jun 2013 08:39:45 +0200")
Message-ID: <87r4fsylru.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/13] qemu-socket: drop
	pointless allocation
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
X-List-Received-Date: Mon, 24 Jun 2013 08:52:23 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  util/qemu-sockets.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 86fb09c..35023a8 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -871,7 +871,6 @@ SocketAddress *socket_parse(const char *str, Error **errp)
>          }
>      } else {
>          addr->kind = SOCKET_ADDRESS_KIND_INET;
> -        addr->inet = g_new(InetSocketAddress, 1);
>          addr->inet = inet_parse(str, errp);
>          if (addr->inet == NULL) {
>              goto fail;

Plugs a memory leak, which is a bit more than "drop pointless
allocation".

