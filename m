Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7JPJ-0001R7-Jc
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 04:18:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1Z7JPD-0001Ke-Qs
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1Z7JPC-0003zW-UW
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:18:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1Z7JP5-0003xz-IU; Tue, 23 Jun 2015 04:17:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E09D32C406;
	Tue, 23 Jun 2015 08:17:58 +0000 (UTC)
Received: from localhost (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N8Hv4l018095; Tue, 23 Jun 2015 04:17:57 -0400
From: Juan Quintela <quintela@redhat.com>
To: <arei.gonglei@huawei.com>
In-Reply-To: <1435046198-10200-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 23 Jun 2015 15:56:38 +0800")
References: <1435046198-10200-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
Date: Tue, 23 Jun 2015 10:17:56 +0200
Message-ID: <87ioaerg7f.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
	mrhines@us.ibm.com, amit.shah@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] rdma: fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jun 2015 08:18:11 -0000

<arei.gonglei@huawei.com> wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> Variable "r" going out of scope leaks the storage
> it points to in line 3268.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> Reviewed-by: Amit Shah <amit.shah@redhat.com>
> ---
>  v2:
>   - Drop needless initialization. (Markus & Paolo)
>   - add Amit's R-by.
> ---
>  migration/rdma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>

Applied, thanks.


>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index cf5de7e..b5f9f82 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
>  
>  static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>  {
> -    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
> +    QEMUFileRDMA *r;
>  
>      if (qemu_file_mode_is_not_valid(mode)) {
>          return NULL;
>      }
>  
> +    r = g_malloc0(sizeof(QEMUFileRDMA));
>      r->rdma = rdma;
>  
>      if (mode[0] == 'w') {

