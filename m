Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpXIc-0006j5-41
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2015 03:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YpXIa-0006hJ-5I
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 03:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YpXIZ-0006Pz-CM
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 03:29:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YpXIT-0006Oo-EL; Tue, 05 May 2015 03:29:41 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 417038EA21;
	Tue,  5 May 2015 07:29:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t457TcCP022342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 5 May 2015 03:29:39 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8ECB03009B31; Tue,  5 May 2015 09:29:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1430790483-10320-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Tue, 05 May 2015 09:29:37 +0200
In-Reply-To: <1430790483-10320-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Tue, 5 May 2015 09:48:03 +0800")
Message-ID: <87383bzdlq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mitake.hitoshi@lab.ntt.co.jp,
	qemu-devel@nongnu.org, kwolf@redhat.com, namei.unix@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sheepdog: fix resource leak
	with sd_snapshot_create
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
X-List-Received-Date: Tue, 05 May 2015 07:29:49 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  block/sheepdog.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index 2d5f06a..bd7cbed 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -2341,6 +2341,7 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>      if (ret < 0) {
>          error_report("failed to create inode for snapshot: %s",
>                       error_get_pretty(local_err));
> +        error_free(local_err);
>          goto cleanup;
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

