Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRGV-0002cI-FP
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:17:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRGT-0002aS-Og
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRGS-0005Yf-R0
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:17:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRGM-0005Xf-QL; Thu, 03 Mar 2016 06:17:46 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5A389C00B8F6;
	Thu,  3 Mar 2016 11:17:46 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BHhbo025185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:17:45 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81D57.4040605@redhat.com>
Date: Thu, 3 Mar 2016 12:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/6] sheepdog: fix possible resouce leak
 and out-of-bounds access
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
X-List-Received-Date: Thu, 03 Mar 2016 11:17:54 -0000



On 03/03/2016 10:43, Gonglei wrote:
> CID 1352418 (#1 of 1): Out-of-bounds access (INCOMPATIBLE_CAST)
> incompatible_cast: Pointer &snap_id points to an object whose effective
> type is unsigned int (32 bits, unsigned) but is dereferenced as a wider
> unsigned long (64 bits, unsigned). This may lead to memory corruption.
> 
> We also need to free local_err when ret is not equals to 0.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  block/sheepdog.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index 8739acc..3d81bba 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -2543,7 +2543,7 @@ static int sd_snapshot_delete(BlockDriverState *bs,
>                                const char *name,
>                                Error **errp)
>  {
> -    uint32_t snap_id = 0;
> +    unsigned long snap_id = 0;
>      char snap_tag[SD_MAX_VDI_TAG_LEN];
>      Error *local_err = NULL;
>      int fd, ret;
> @@ -2565,20 +2565,23 @@ static int sd_snapshot_delete(BlockDriverState *bs,
>      memset(buf, 0, sizeof(buf));
>      memset(snap_tag, 0, sizeof(snap_tag));
>      pstrcpy(buf, SD_MAX_VDI_LEN, s->name);
> -    if (qemu_strtoul(snapshot_id, NULL, 10, (unsigned long *)&snap_id)) {
> +    if (qemu_strtoul(snapshot_id, NULL, 10, &snap_id)) {
>          return -1;
>      }
>  
>      if (snap_id) {
> +        assert(snap_id <= UINT_MAX);
> +
>          hdr.snapid = snap_id;
>      } else {
>          pstrcpy(snap_tag, sizeof(snap_tag), snapshot_id);
>          pstrcpy(buf + SD_MAX_VDI_LEN, SD_MAX_VDI_TAG_LEN, snap_tag);
>      }
>  
> -    ret = find_vdi_name(s, s->name, snap_id, snap_tag, &vid, true,
> +    ret = find_vdi_name(s, s->name, hdr.snapid, snap_tag, &vid, true,
>                          &local_err);
>      if (ret) {
> +        error_report_err(local_err);
>          return ret;
>      }
>  
> 

A patch for this has been posted yesterday by Jeff Cody.

Paolo

