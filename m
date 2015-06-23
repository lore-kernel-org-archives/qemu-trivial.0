Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7IlN-0006S7-Vp
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:36:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7IlL-0006PQ-Jr
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:36:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7IlK-0003y3-Im
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:36:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z7IlG-0003wk-9I; Tue, 23 Jun 2015 03:36:50 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id DE9D08F287;
	Tue, 23 Jun 2015 07:36:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N7ampB024531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 23 Jun 2015 03:36:49 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BBBA2303E586; Tue, 23 Jun 2015 09:36:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
Date: Tue, 23 Jun 2015 09:36:47 +0200
In-Reply-To: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 23 Jun 2015 09:02:28 +0800")
Message-ID: <87oak6zxio.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com,
	qemu-devel@nongnu.org, mrhines@us.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 07:36:56 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Variable "r" going out of scope leaks the storage
> it points to in line 3268.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  migration/rdma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index cf5de7e..de80860 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
>  
>  static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>  {
> -    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
> +    QEMUFileRDMA *r = NULL;

Dead initialization, please drop.

>  
>      if (qemu_file_mode_is_not_valid(mode)) {
>          return NULL;
>      }
>  
> +    r = g_malloc0(sizeof(QEMUFileRDMA));
>      r->rdma = rdma;
>  
>      if (mode[0] == 'w') {

Looks good otherwise.

