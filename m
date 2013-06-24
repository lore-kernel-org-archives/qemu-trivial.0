Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur1pN-0007SF-Kx
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 04:08:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur1pK-0007Nt-FU
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur1pJ-0002iW-D0
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:08:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ur1pG-0002d3-74; Mon, 24 Jun 2013 04:08:38 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O88bNe012586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 04:08:37 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O88a9p006334; Mon, 24 Jun 2013 04:08:36 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ED09C200B4; Mon, 24 Jun 2013 10:08:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
	<1372055996-4072-8-git-send-email-kraxel@redhat.com>
Date: Mon, 24 Jun 2013 10:08:35 +0200
In-Reply-To: <1372055996-4072-8-git-send-email-kraxel@redhat.com> (Gerd
	Hoffmann's message of "Mon, 24 Jun 2013 08:39:50 +0200")
Message-ID: <87ppvcylq4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 07/13] qemu-char: fix
	documentation for telnet+wait socket flags
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
X-List-Received-Date: Mon, 24 Jun 2013 08:08:43 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qapi-schema.json |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index a80ee40..a29ce57 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -3185,10 +3185,11 @@
>  # @addr: socket address to listen on (server=true)
>  #        or connect to (server=false)
>  # @server: #optional create server socket (default: true)
> -# @wait: #optional wait for connect (not used for server
> -#        sockets, default: false)
> +# @wait: #optional wait for incoming connection on server
> +#        sockets (default: false).
>  # @nodelay: #optional set TCP_NODELAY socket option (default: false)
> -# @telnet: #optional enable telnet protocol (default: false)
> +# @telnet: #optional enable telnet protocol on server
> +#          sockets (default: false)
>  #
>  # Since: 1.4
>  ##

Yes, both options apply only with server=true (I double-checked).

Curiously, qemu_chr_open_socket_fd() puts "telnet" into chr->filename
regardless of server.

qemu_chr_open_socket() has

    if (!is_listen)
        is_waitconnect = 0;

Should this perhaps be

    if (!is_listen) {
        is_waitconnect = 0;
        is_telnet = 0;
    }

?

