Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WteYS-0005p6-1y
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 10:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WteYL-0005hW-5m
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WteYF-0002w0-1g
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:58:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WteY2-0002tq-6n; Sun, 08 Jun 2014 10:58:14 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s58Ew0c6025594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 8 Jun 2014 10:58:00 -0400
Received: from redhat.com (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s58Evul9002632; Sun, 8 Jun 2014 10:57:57 -0400
Date: Sun, 8 Jun 2014 17:58:26 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: serge.fdrv@gmail.com
Message-ID: <20140608145826.GB5704@redhat.com>
References: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] qtest: fix hex2nib for capital characters
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
X-List-Received-Date: Sun, 08 Jun 2014 14:58:39 -0000

On Tue, May 27, 2014 at 12:16:00PM +0400, serge.fdrv@gmail.com wrote:
> From: Sergey Fedorov <serge.fdrv@gmail.com>
> 
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>


Applied, thanks!

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
> -- 
> 1.9.1

