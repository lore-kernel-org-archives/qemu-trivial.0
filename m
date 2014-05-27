Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpFp0-0001qs-Gw
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 07:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WpFop-0001MO-9f
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 07:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WpFog-0000vn-92
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 07:45:23 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:48710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WpFoN-0000aH-Ia; Tue, 27 May 2014 07:44:55 -0400
Received: from blackfin.pond.sub.org (p5B32A348.dip0.t-ipconnect.de
	[91.50.163.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id A39EE24ED1;
	Tue, 27 May 2014 13:44:50 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B116C30403AF; Tue, 27 May 2014 13:44:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: serge.fdrv@gmail.com
References: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
Date: Tue, 27 May 2014 13:44:49 +0200
In-Reply-To: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com> (serge
	fdrv's message of "Tue, 27 May 2014 12:16:00 +0400")
Message-ID: <87k397e98u.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: fix hex2nib for
	capital characters
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
X-List-Received-Date: Tue, 27 May 2014 11:45:32 -0000

serge.fdrv@gmail.com writes:

> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>
> ---
>  qtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qtest.c b/qtest.c
> index 2aba20d..87ccd62 100644
> --- a/qtest.c
> +++ b/qtest.c
> @@ -148,7 +148,7 @@ static int hex2nib(char ch)
>      } else if (ch >= 'a' && ch <= 'f') {
>          return 10 + (ch - 'a');
>      } else if (ch >= 'A' && ch <= 'F') {
> -        return 10 + (ch - 'a');
> +        return 10 + (ch - 'A');
>      } else {
>          return -1;
>      }

Awesome testing on the original author's part %-}

Reviewed-by: Markus Armbruster <armbru@redhat.com>

