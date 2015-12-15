Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a8w58-0003Zz-Et
	for mharc-qemu-trivial@gnu.org; Tue, 15 Dec 2015 15:20:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a8w54-0003V1-IN
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 15:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a8w53-0001pw-Oo
	for qemu-trivial@nongnu.org; Tue, 15 Dec 2015 15:20:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1a8w4x-0001oi-Rk; Tue, 15 Dec 2015 15:20:11 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E7448A1707;
	Tue, 15 Dec 2015 20:20:10 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFKK9MB025370; Tue, 15 Dec 2015 15:20:09 -0500
To: Zhu Lingshan <lszhu@suse.com>, qemu-block@nongnu.org
References: <1450150404-20668-1-git-send-email-lszhu@suse.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <567075F8.5090201@redhat.com>
Date: Tue, 15 Dec 2015 15:20:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1450150404-20668-1-git-send-email-lszhu@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com, pl@kamp.de,
	qemu-devel@nongnu.org, ronniesahlberg@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] iscsi: fix readcapacity
	error message
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
X-List-Received-Date: Tue, 15 Dec 2015 20:20:19 -0000

CC qemu-trivial, I think this can go in through that tree.

On 12/14/2015 10:33 PM, Zhu Lingshan wrote:
> fix:The error message for readcapacity 16 incorrectly mentioned
> a readcapacity 10 failure, fixed the error message.
> 
> Signed-off-by: Zhu Lingshan <lszhu@suse.com>
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index bd1f1bf..eb28ddc 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -1270,7 +1270,7 @@ static void iscsi_readcapacity_sync(IscsiLun *iscsilun, Error **errp)
>               && retries-- > 0);
>  
>      if (task == NULL || task->status != SCSI_STATUS_GOOD) {
> -        error_setg(errp, "iSCSI: failed to send readcapacity10 command.");
> +        error_setg(errp, "iSCSI: failed to send readcapacity10/16 command");
>      } else if (!iscsilun->block_size ||
>                 iscsilun->block_size % BDRV_SECTOR_SIZE) {
>          error_setg(errp, "iSCSI: the target returned an invalid "
> 

Reviewed-by: John Snow <jsnow@redhat.com>

