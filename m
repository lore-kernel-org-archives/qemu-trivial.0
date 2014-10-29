Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjUke-0001uJ-F7
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 11:01:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XjUkX-0001co-PB
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 11:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XjUkS-0008Ul-UF
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 11:01:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XjUkJ-0008TD-0C; Wed, 29 Oct 2014 11:01:11 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9TF0ra4010857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 29 Oct 2014 11:00:54 -0400
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9TF0p9m011770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 29 Oct 2014 11:00:52 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BF34D30403B0; Wed, 29 Oct 2014 16:00:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1414578500-10048-1-git-send-email-arei.gonglei@huawei.com>
Date: Wed, 29 Oct 2014 16:00:50 +0100
In-Reply-To: <1414578500-10048-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Wed, 29 Oct 2014 18:28:20 +0800")
Message-ID: <87vbn2apjx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, weidong.huang@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: fix use-after-free
	for s->fd
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
X-List-Received-Date: Wed, 29 Oct 2014 15:01:30 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> After commit 4c7e251a (), when dump memory completed,
> the s->fd will be closed twice. We should return
> directly when dump completed.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  dump.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/dump.c b/dump.c
> index 06a4915..9d9a409 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -626,6 +626,7 @@ static void dump_iterate(DumpState *s, Error **errp)
>          ret = get_next_block(s, block);
>          if (ret == 1) {
>              dump_completed(s);
> +            return;
>          }
>      }
>  }

What about less tortuous control structure?

    do {
        block = s->next_block;

        size = block->target_end - block->target_start;
        if (s->has_filter) {
            size -= s->start;
            if (s->begin + s->length < block->target_end) {
                size -= block->target_end - (s->begin + s->length);
            }
        }
        write_memory(s, block, s->start, size, &local_err);
        if (local_err) {
            error_propagate(errp, local_err);
            return;
        }

    } while (!get_next_block(s, block))

    dump_completed();

Makes the badly chosen return values of of get_next_block() more
visible.  Easy enough to fix if it bothers you.

