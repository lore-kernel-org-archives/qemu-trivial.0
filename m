Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzilT-0001lg-Tr
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 05:45:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YzilR-0001j2-E0
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 05:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YzilQ-0003di-Cs
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 05:45:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YzilJ-0003bl-U9; Tue, 02 Jun 2015 05:45:34 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 6ED442E6CEB;
	Tue,  2 Jun 2015 09:45:33 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t529jVDd017295; Tue, 2 Jun 2015 05:45:31 -0400
Date: Tue, 2 Jun 2015 11:45:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20150602094531.GH3765@noname.str.redhat.com>
References: <1433237561-10846-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433237561-10846-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org,
	mitake.hitoshi@lab.ntt.co.jp, namei.unix@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] sheepdog: Fix error message if failed to
	load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 09:45:42 -0000

[ CC to Sheepdog maintainers ]

Am 02.06.2015 um 11:32 hat Fam Zheng geschrieben:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  block/sheepdog.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index bd7cbed..a22f838 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -2556,7 +2556,11 @@ static int do_load_save_vmstate(BDRVSheepdogState *s, uint8_t *data,
>          }
>  
>          if (ret < 0) {
> -            error_report("failed to save vmstate %s", strerror(errno));
> +            if (load) {
> +                error_report("failed to load vmstate %s", strerror(errno));
> +            } else {
> +                error_report("failed to save vmstate %s", strerror(errno));
> +            }
>              goto cleanup;
>          }

Why do we even print this message? We usually don't do this for a failed
request, and much less so if we don't actually add any information that
isn't covered by the return code. qemu_savevm_state() will already set
an error that is even visible in QMP.

In fact, errno doesn't even contain anything relevant here, or in most
(all?) other places that it's used in the sheepdog block driver.

I think we might be better off just removing the message.

Kevin

