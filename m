Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSkZI-0001Db-5X
	for mharc-qemu-trivial@gnu.org; Wed, 26 Mar 2014 05:56:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WSkZ8-0000zu-49
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 05:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WSkYz-0005hv-Ls
	for qemu-trivial@nongnu.org; Wed, 26 Mar 2014 05:56:10 -0400
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236]:47884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WSkYi-0005fP-4u; Wed, 26 Mar 2014 05:55:44 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so1417223eek.41
	for <multiple recipients>; Wed, 26 Mar 2014 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=EgQnPbGVD0FMuUOIRVtaNIcKUl378fEbovl5wII6eI4=;
	b=suEeIS6Vm6++WrdfyJCEsPMIInj+vDXk623VvSmFQRPRlMa2KVJ9HpiSQjbqaDyM8A
	hvYBqxInT20KH/3MMlCZukJms9mjlhmHAwKWyp66aOvhvjllCKT+c7gF6kF6vrA3TGmi
	6skyAldUg/UxSaaXM+XlK78LbhXxmY7lHr2bJ5IZCB86p98fM8DeVt2osxFM9KM6E6ug
	W+nW2qn1yz3pHhAzbXLzG80VG4OpPnl5blg8xxC3HSz7tILwhwmpCRp4xqKxAUCV/wDf
	Aufls1a3lZf8Or1T3IARvVtgvS6GE9GsFf2TAlhyK1d2rOqtmBouZKVcV+EXat6H+WQZ
	tggA==
X-Received: by 10.14.94.5 with SMTP id m5mr41269105eef.23.1395827742691;
	Wed, 26 Mar 2014 02:55:42 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-156-129.cust.vodafonedsl.it. [37.117.156.129])
	by mx.google.com with ESMTPSA id 48sm46134559eee.2.2014.03.26.02.55.40
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 02:55:41 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5332A419.1090700@redhat.com>
Date: Wed, 26 Mar 2014 10:55:37 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Li, Zhen-Hua" <zhen-hual@hp.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <1395799358-16499-1-git-send-email-zhen-hual@hp.com>
In-Reply-To: <1395799358-16499-1-git-send-email-zhen-hual@hp.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::236
Subject: Re: [Qemu-trivial] [PATCH 1/1] virtio-blk: Use a req pool instead
	of malloc/free
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
X-List-Received-Date: Wed, 26 Mar 2014 09:56:19 -0000

Il 26/03/2014 03:02, Li, Zhen-Hua ha scritto:
> From: "Li, ZhenHua" <zhen-hual@hp.com>
>
> In virtio-blk module, when there is new request, new req structure
> will be created by malloc.  Use a req pool instead of this, will increase
> performance;
>
> Increacement: about 5% to 10%.

Can you try g_slice_new/g_slice_free instead?

Paolo

> Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
> ---
>  hw/block/virtio-blk.c |   87 ++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 12 deletions(-)
>
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 8a568e5..da5b570 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -39,6 +39,70 @@ typedef struct VirtIOBlockReq
>      BlockAcctCookie acct;
>  } VirtIOBlockReq;
>
> +#define POOL_PAGE 512
> +static VirtIOBlockReq * * req_pool;
> +static char * req_pool_used;
> +static unsigned long req_pool_size = 0;
> +
> +static void remalloc_reqs(void){
> +    unsigned long old_size = req_pool_size;
> +    unsigned long int i;
> +    char * old_used = req_pool_used;
> +    VirtIOBlockReq * * old_pool = req_pool;
> +
> +    req_pool_size += POOL_PAGE;
> +    req_pool_used = (char * )malloc(req_pool_size * sizeof(char));
> +    req_pool =  (VirtIOBlockReq * * )malloc(req_pool_size * sizeof(VirtIOBlockReq *));
> +
> +    if(old_size != 0){
> +        memcpy(req_pool_used, old_used, old_size*(sizeof(char)));
> +        memcpy(req_pool, old_pool, old_size*(sizeof(VirtIOBlockReq *)));
> +    }
> +    for(i=old_size; i<req_pool_size; i++){
> +    	req_pool[i] = (VirtIOBlockReq *)malloc(sizeof(VirtIOBlockReq));
> +    	req_pool_used[i] = 0;
> +    }
> +
> +    if(old_size != 0){
> +    	free(old_used);
> +    	free(old_pool);
> +    }
> +}
> +static VirtIOBlockReq * req_pool_get_new(void){
> +    unsigned long int i;
> +    char * used;
> +    VirtIOBlockReq * * req;
> +
> +    if(req_pool_size == 0){
> +        remalloc_reqs();
> +    }
> +    for(i=0, used=req_pool_used, req=req_pool;
> +            i<req_pool_size; i++, used ++, req++){
> +    	if(*used == 0){
> +            *used = 1;
> +            return *req;
> +        }
> +    }
> +    remalloc_reqs();
> +    req_pool_used[req_pool_size-POOL_PAGE] = 1;
> +    *req = req_pool[req_pool_size-POOL_PAGE];
> +    return *req;
> +}
> +
> +static void virtio_blk_free_request(VirtIOBlockReq *req0){
> +    unsigned long int i;
> +    char * used;
> +    VirtIOBlockReq * * req;
> +
> +    for(i=0, used=req_pool_used, req=req_pool;
> +            i<req_pool_size; i++, used ++, req++){
> +    	if(*req == req0){
> +            *used = 0;
> +        }
> +    }
> +}
> +
> +
>  static void virtio_blk_req_complete(VirtIOBlockReq *req, int status)
>  {
>      VirtIOBlock *s = req->dev;
> @@ -63,7 +127,7 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
>      } else if (action == BDRV_ACTION_REPORT) {
>          virtio_blk_req_complete(req, VIRTIO_BLK_S_IOERR);
>          bdrv_acct_done(s->bs, &req->acct);
> -        g_free(req);
> +        virtio_blk_free_request(req);
>      }
>
>      bdrv_error_action(s->bs, action, is_read, error);
> @@ -84,7 +148,7 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
>
>      virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
>      bdrv_acct_done(req->dev->bs, &req->acct);
> -    g_free(req);
> +    virtio_blk_free_request(req);
>  }
>
>  static void virtio_blk_flush_complete(void *opaque, int ret)
> @@ -99,25 +163,24 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
>
>      virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
>      bdrv_acct_done(req->dev->bs, &req->acct);
> -    g_free(req);
> +    virtio_blk_free_request(req);
>  }
> -
>  static VirtIOBlockReq *virtio_blk_alloc_request(VirtIOBlock *s)
>  {
> -    VirtIOBlockReq *req = g_malloc(sizeof(*req));
> +    VirtIOBlockReq *req ;
> +    req = req_pool_get_new();
>      req->dev = s;
>      req->qiov.size = 0;
>      req->next = NULL;
>      return req;
>  }
> -
>  static VirtIOBlockReq *virtio_blk_get_request(VirtIOBlock *s)
>  {
>      VirtIOBlockReq *req = virtio_blk_alloc_request(s);
>
>      if (req != NULL) {
>          if (!virtqueue_pop(s->vq, &req->elem)) {
> -            g_free(req);
> +            virtio_blk_free_request(req);
>              return NULL;
>          }
>      }
> @@ -142,7 +205,7 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
>       */
>      if (req->elem.out_num < 2 || req->elem.in_num < 3) {
>          virtio_blk_req_complete(req, VIRTIO_BLK_S_IOERR);
> -        g_free(req);
> +        virtio_blk_free_request(req);
>          return;
>      }
>
> @@ -232,7 +295,7 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
>      stl_p(&req->scsi->data_len, hdr.dxfer_len);
>
>      virtio_blk_req_complete(req, status);
> -    g_free(req);
> +    virtio_blk_free_request(req);
>      return;
>  #else
>      abort();
> @@ -242,7 +305,7 @@ fail:
>      /* Just put anything nonzero so that the ioctl fails in the guest.  */
>      stl_p(&req->scsi->errors, 255);
>      virtio_blk_req_complete(req, status);
> -    g_free(req);
> +    virtio_blk_free_request(req);
>  }
>
>  typedef struct MultiReqBuffer {
> @@ -375,7 +438,7 @@ static void virtio_blk_handle_request(VirtIOBlockReq *req,
>                  s->blk.serial ? s->blk.serial : "",
>                  MIN(req->elem.in_sg[0].iov_len, VIRTIO_BLK_ID_BYTES));
>          virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
> -        g_free(req);
> +        virtio_blk_free_request(req);
>      } else if (type & VIRTIO_BLK_T_OUT) {
>          qemu_iovec_init_external(&req->qiov, &req->elem.out_sg[1],
>                                   req->elem.out_num - 1);
> @@ -387,7 +450,7 @@ static void virtio_blk_handle_request(VirtIOBlockReq *req,
>          virtio_blk_handle_read(req);
>      } else {
>          virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
> -        g_free(req);
> +        virtio_blk_free_request(req);
>      }
>  }
>
>


