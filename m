Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur2iS-0006lm-06
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 05:05:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2iN-0006b4-HA
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 05:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2iJ-0005T7-0B
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 05:05:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ur2iI-0005St-Oj; Mon, 24 Jun 2013 05:05:30 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O95RCq012720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 05:05:29 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O86HuZ005905; Mon, 24 Jun 2013 04:06:18 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2F236200B4; Mon, 24 Jun 2013 10:06:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
	<1372055996-4072-13-git-send-email-kraxel@redhat.com>
Date: Mon, 24 Jun 2013 10:06:17 +0200
In-Reply-To: <1372055996-4072-13-git-send-email-kraxel@redhat.com> (Gerd
	Hoffmann's message of "Mon, 24 Jun 2013 08:39:55 +0200")
Message-ID: <87vc54ylty.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/13] qemu-char: report
	udb backend errors
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
X-List-Received-Date: Mon, 24 Jun 2013 09:05:37 -0000

Typo in subject: s/udb/UDP/

Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qemu-char.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index 7d072a8..dcc91bb 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2255,6 +2255,8 @@ static CharDriverState *qemu_chr_open_udp(QemuOpts *opts)
>  
>      fd = inet_dgram_opts(opts, &local_err);
>      if (fd < 0) {
> +        qerror_report_err(local_err);
> +        error_free(local_err);
>          return NULL;
>      }
>      return qemu_chr_open_udp_fd(fd);

Also plugs memory leak on error path.  Worth mentioning in commit
message.

