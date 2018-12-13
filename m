Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXNBh-0003LV-UC
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 04:21:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXNBe-0003Ir-S9
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:21:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXNBZ-0002ol-0y
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:21:42 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:54680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXNBY-0002is-J9
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:21:36 -0500
Received: by mail-wm1-f43.google.com with SMTP id a62so1540338wmh.4
	for <qemu-trivial@nongnu.org>; Thu, 13 Dec 2018 01:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=urVWsU9g4PhELm5xUsyCuPCsxOIMcBd70f5inHn05rQ=;
	b=e+h3VDDbVRp+yfIHwXyizt4HzHbgBr5Z24284QF1FZhi0bkN6JIAZUU9nL0HoYIjF1
	5GtKt2kC+v/zV2BfCQmTM92b/AJFa689L0q+HWhLoqJ7f42QKjEfFa29NhBYoRjf3zjE
	C5TJIjwVyd6KAqtPNCzPRCXq2i8ejqHV6z395+BLJ/NNtUDI65nptzRiFeYMxQGlbtjk
	/VRyWbsqkEmrNauiNquq/W2vaiaqwvcXmVzBhpyY4Owg6rME4wSZ/N7gD/pklYMYQfkh
	/poRVNhVjOs06hXhJEX1YFEQNbzw4cNbkjz+zcNcEi8FbE+DvVWo8F3TDXHo7mT02tWJ
	4D7A==
X-Gm-Message-State: AA+aEWa3+B5F8wOlkYctsMKNfG8Ve+e+1fvqigg3Xo8BMHmzBsA8Ed8l
	mYX6CxT89+zOdjvBNaUctY6xQg==
X-Google-Smtp-Source: AFSGD/Xt0MgDoCeCod6JklqvsFByfK4L9k8jGYeE/epdOpUknJaSs4rU3E4uAI8MY6tNrsX5B7LgVg==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr9847073wmj.0.1544692891794;
	Thu, 13 Dec 2018 01:21:31 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	e27sm1235492wra.67.2018.12.13.01.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 01:21:31 -0800 (PST)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Liu Yuan <namei.unix@gmail.com>, Max Reitz <mreitz@redhat.com>
References: <20181212194009.2951-1-lvivier@redhat.com>
	<20181212194009.2951-5-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <270fb776-d977-77df-36c9-f77088b2ad04@redhat.com>
Date: Thu, 13 Dec 2018 10:21:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212194009.2951-5-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.43
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] block/sheepdog: Convert
 from DPRINTF() macro to trace events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 09:21:45 -0000

Hi Laurent,

On 12/12/18 8:40 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/sheepdog.c   | 47 +++++++++++++++++-----------------------------
>  block/trace-events | 14 ++++++++++++++
>  2 files changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index 0125df9d49..a5000d271b 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -28,6 +28,7 @@
>  #include "sysemu/block-backend.h"
>  #include "qemu/bitops.h"
>  #include "qemu/cutils.h"
> +#include "trace.h"
>  
>  #define SD_PROTO_VER 0x01
>  
> @@ -299,19 +300,6 @@ static inline size_t count_data_objs(const struct SheepdogInode *inode)
>                          (1UL << inode->block_size_shift));
>  }
>  
> -#undef DPRINTF
> -#ifdef DEBUG_SDOG
> -#define DEBUG_SDOG_PRINT 1
> -#else
> -#define DEBUG_SDOG_PRINT 0
> -#endif
> -#define DPRINTF(fmt, args...)                                           \
> -    do {                                                                \
> -        if (DEBUG_SDOG_PRINT) {                                         \
> -            fprintf(stderr, "%s %d: " fmt, __func__, __LINE__, ##args); \
> -        }                                                               \
> -    } while (0)
> -
>  typedef struct SheepdogAIOCB SheepdogAIOCB;
>  typedef struct BDRVSheepdogState BDRVSheepdogState;
>  
> @@ -750,7 +738,7 @@ static coroutine_fn void reconnect_to_sdog(void *opaque)
>          Error *local_err = NULL;
>          s->fd = get_sheep_fd(s, &local_err);
>          if (s->fd < 0) {
> -            DPRINTF("Wait for connection to be established\n");
> +            trace_sd_reconnect_to_sdog();
>              error_report_err(local_err);
>              qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000000ULL);
>          }
> @@ -847,7 +835,7 @@ static void coroutine_fn aio_read_response(void *opaque)
>          break;
>      case AIOCB_FLUSH_CACHE:
>          if (rsp.result == SD_RES_INVALID_PARMS) {
> -            DPRINTF("disable cache since the server doesn't support it\n");
> +            trace_sd_aio_read_response();
>              s->cache_flags = SD_FLAG_CMD_DIRECT;
>              rsp.result = SD_RES_SUCCESS;
>          }
> @@ -1639,7 +1627,7 @@ static int sd_open(BlockDriverState *bs, QDict *options, int flags,
>      s->discard_supported = true;
>  
>      if (snap_id || tag[0]) {
> -        DPRINTF("%" PRIx32 " snapshot inode was open.\n", vid);
> +        trace_sd_open(vid);
>          s->is_snapshot = true;
>      }
>  
> @@ -2252,7 +2240,7 @@ static void sd_close(BlockDriverState *bs)
>      unsigned int wlen, rlen = 0;
>      int fd, ret;
>  
> -    DPRINTF("%s\n", s->name);
> +    trace_sd_close(s->name);
>  
>      fd = connect_to_sdog(s, &local_err);
>      if (fd < 0) {
> @@ -2429,7 +2417,7 @@ static int sd_create_branch(BDRVSheepdogState *s)
>      char *buf;
>      bool deleted;
>  
> -    DPRINTF("%" PRIx32 " is snapshot.\n", s->inode.vdi_id);
> +    trace_sd_create_branch_snapshot(s->inode.vdi_id);
>  
>      buf = g_malloc(SD_INODE_SIZE);
>  
> @@ -2445,7 +2433,7 @@ static int sd_create_branch(BDRVSheepdogState *s)
>          goto out;
>      }
>  
> -    DPRINTF("%" PRIx32 " is created.\n", vid);
> +    trace_sd_create_branch_created(vid);
>  
>      fd = connect_to_sdog(s, &local_err);
>      if (fd < 0) {
> @@ -2467,7 +2455,7 @@ static int sd_create_branch(BDRVSheepdogState *s)
>  
>      s->is_snapshot = false;
>      ret = 0;
> -    DPRINTF("%" PRIx32 " was newly created.\n", s->inode.vdi_id);
> +    trace_sd_create_branch_new(s->inode.vdi_id);
>  
>  out:
>      g_free(buf);
> @@ -2561,11 +2549,11 @@ static void coroutine_fn sd_co_rw_vector(SheepdogAIOCB *acb)
>          }
>  
>          if (create) {
> -            DPRINTF("update ino (%" PRIu32 ") %" PRIu64 " %" PRIu64 " %ld\n",
> -                    inode->vdi_id, oid,
> -                    vid_to_data_oid(inode->data_vdi_id[idx], idx), idx);
> +            trace_sd_co_rw_vector_update(inode->vdi_id, oid,
> +                                  vid_to_data_oid(inode->data_vdi_id[idx], idx),
> +                                  idx);
>              oid = vid_to_data_oid(inode->vdi_id, idx);
> -            DPRINTF("new oid %" PRIx64 "\n", oid);
> +            trace_sd_co_rw_vector_new(oid);
>          }
>  
>          aio_req = alloc_aio_req(s, acb, oid, len, offset, flags, create,
> @@ -2670,9 +2658,8 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>      SheepdogInode *inode;
>      unsigned int datalen;
>  
> -    DPRINTF("sn_info: name %s id_str %s s: name %s vm_state_size %" PRId64 " "
> -            "is_snapshot %d\n", sn_info->name, sn_info->id_str,
> -            s->name, sn_info->vm_state_size, s->is_snapshot);
> +    trace_sd_snapshot_create_info(sn_info->name, sn_info->id_str, s->name,
> +                                  sn_info->vm_state_size, s->is_snapshot);
>  
>      if (s->is_snapshot) {
>          error_report("You can't create a snapshot of a snapshot VDI, "
> @@ -2681,7 +2668,7 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>          return -EINVAL;
>      }
>  
> -    DPRINTF("%s %s\n", sn_info->name, sn_info->id_str);
> +    trace_sd_snapshot_create(sn_info->name, sn_info->id_str);
>  
>      s->inode.vm_state_size = sn_info->vm_state_size;
>      s->inode.vm_clock_nsec = sn_info->vm_clock_nsec;
> @@ -2726,8 +2713,8 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>      }
>  
>      memcpy(&s->inode, inode, datalen);
> -    DPRINTF("s->inode: name %s snap_id %x oid %x\n",
> -            s->inode.name, s->inode.snap_id, s->inode.vdi_id);
> +    trace_sd_snapshot_create_inode(s->inode.name, s->inode.snap_id,
> +                                   s->inode.vdi_id);
>  
>  cleanup:
>      g_free(inode);
> diff --git a/block/trace-events b/block/trace-events
> index 49f31966e7..7a92d7b3db 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -189,3 +189,17 @@ file_xfs_discard(const char* error) "cannot punch hole (%s)"
>  file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
>  file_setup_cdrom(const char *partition) "Using %s as optical disc"
>  file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
> +
> +# block/sheepdog.c
> +sd_reconnect_to_sdog(void) "Wait for connection to be established"

Can you use the 'sheepdog' prefix to avoid clashing with the 'sd' subsystem?

> +sd_aio_read_response(void) "disable cache since the server doesn't support it"
> +sd_open(uint32_t vid) "0x%" PRIx32 " snapshot inode was open."

We can drop the trailing dots.

> +sd_close(const char *name) "%s"
> +sd_create_branch_snapshot(uint32_t vdi) "0x%" PRIx32 " is snapshot."
> +sd_create_branch_created(uint32_t vdi) "0x%" PRIx32 " is created."
> +sd_create_branch_new(uint32_t vdi) "0x%" PRIx32 " was newly created."
> +sd_co_rw_vector_update(uint32_t vdi, uint64_t oid, uint64_t data, long idx) "update ino (%" PRIu32 ") %" PRIu64 " %" PRIu64 " %ld"
> +sd_co_rw_vector_new(uint64_t oid) "new oid 0x%" PRIx64
> +sd_snapshot_create_info(const char *sn_name, const char *id, const char *name, int64_t size, int is_snapshot) "sn_info: name %s id_str %s s: name %s vm_state_size %" PRId64 " " "is_snapshot %d"
> +sd_snapshot_create(const char *sn_name, const char *id) "%s %s"
> +sd_snapshot_create_inode(const char *name, uint32_t snap, uint32_t vdi) "s->inode: name %s snap_id 0x%x vdi 0x%x"
> 

With 'sheepdog' prefix:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

