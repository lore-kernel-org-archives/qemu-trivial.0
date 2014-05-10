Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wj7Ap-0005EE-7X
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 09:18:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wj7Ah-0005D6-GG
	for qemu-trivial@nongnu.org; Sat, 10 May 2014 09:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wj7Ab-0007FA-6m
	for qemu-trivial@nongnu.org; Sat, 10 May 2014 09:18:35 -0400
Received: from mail-vc0-f179.google.com ([209.85.220.179]:50209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wj7Ab-0007F4-2C
	for qemu-trivial@nongnu.org; Sat, 10 May 2014 09:18:29 -0400
Received: by mail-vc0-f179.google.com with SMTP id im17so6729388vcb.10
	for <qemu-trivial@nongnu.org>; Sat, 10 May 2014 06:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=n56SNzYNSf/IoywETflrDTxVTQadcqP48D2n4hHgNLY=;
	b=eNkb++dnVUOt7eLABVhQ95Ka7EeorQG819pySnm4lQYPv/CNZrp+y+2NbMGhtL5iU0
	cO7vakaPT0pLNMlDIr67A6pfQ2qpKaIlhbLzdaDboFjIz/W6UPBuuqaKT1uCVC5o0vhO
	EfKegRUH62h/EVK436Puvz49dabWtuLJpJIQR7N8DbZEoXPUBaRALAJ9s6pMdlrnWyaq
	t82rWuCAXSFcqaV8gu7p4PgPxLoL/S4q5YlACJAuWKYoxBNpxPmWcGd//7YkwHBolQ24
	ICmXP0IeOKUpZKQUbsIs/x7MjAe/jPpwfJ00+jUKw8tFwUi+hQmHJWdDUQz6mRJdGcvF
	KhSQ==
X-Gm-Message-State: ALoCoQnGMyASGRw4hze9+t7MwjeDlXAa8Veuk6MmdWqGAN5Ji87McnM7ZrorWAY8pKgo0FDUXoSo
MIME-Version: 1.0
X-Received: by 10.52.164.175 with SMTP id yr15mr100103vdb.59.1399727908437;
	Sat, 10 May 2014 06:18:28 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Sat, 10 May 2014 06:18:28 -0700 (PDT)
In-Reply-To: <fc7e1b7c4b8d366461aeadf11769d3c0b039b93e.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
	<fc7e1b7c4b8d366461aeadf11769d3c0b039b93e.1399641611.git.tamlokveer@gmail.com>
Date: Sat, 10 May 2014 23:18:28 +1000
X-Google-Sender-Auth: TBDU021G8Qi7iMaaKCtex2Uxhjg
Message-ID: <CAEgOgz7YXhfdBo4bASgKK7HyTJnhE0Sj6-pOS74ve+VjA-Ac+g@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Le Tan <tamlokveer@gmail.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.179
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] block: replace
 fprintf(stderr, ...) with error_report() in block/
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
X-List-Received-Date: Sat, 10 May 2014 13:18:41 -0000

On Sat, May 10, 2014 at 9:55 AM, Le Tan <tamlokveer@gmail.com> wrote:
> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
> have been removed because @fmt of error_report() should not contain newline.
>
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> ---
>  block-migration.c      |    4 +-
>  block.c                |    4 +-
>  block/linux-aio.c      |    4 +-
>  block/nbd-client.h     |    2 +-
>  block/qcow2-cluster.c  |    4 +-
>  block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
>  block/qcow2.c          |   16 +++----
>  block/quorum.c         |    4 +-
>  block/raw-posix.c      |    8 ++--
>  block/raw-win32.c      |    6 +--
>  block/ssh.c            |    4 +-
>  block/vdi.c            |   14 +++---
>  block/vmdk.c           |   21 ++++-----
>  block/vpc.c            |    4 +-
>  block/vvfat.c          |  108 ++++++++++++++++++++++-----------------------
>  blockdev.c             |    6 +--
>  16 files changed, 160 insertions(+), 163 deletions(-)
>
> diff --git a/block-migration.c b/block-migration.c
> index 56951e0..5bcf7c8 100644
> --- a/block-migration.c
> +++ b/block-migration.c
> @@ -790,7 +790,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>
>              bs = bdrv_find(device_name);
>              if (!bs) {
> -                fprintf(stderr, "Error unknown block device %s\n",
> +                error_report("Error unknown block device %s",
>                          device_name);
>                  return -EINVAL;
>              }
> @@ -833,7 +833,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>                     (addr == 100) ? '\n' : '\r');
>              fflush(stdout);
>          } else if (!(flags & BLK_MIG_FLAG_EOS)) {
> -            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
> +            error_report("Unknown block migration flags: %#x", flags);
>              return -EINVAL;
>          }
>          ret = qemu_file_get_error(f);
> diff --git a/block.c b/block.c
> index b749d31..7dc4acb 100644
> --- a/block.c
> +++ b/block.c
> @@ -2694,8 +2694,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
>       * if it has been enabled.
>       */
>      if (bs->io_limits_enabled) {
> -        fprintf(stderr, "Disabling I/O throttling on '%s' due "
> -                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
> +        error_report("Disabling I/O throttling on '%s' due "
> +                     "to synchronous I/O.", bdrv_get_device_name(bs));
>          bdrv_io_limits_disable(bs);
>      }
>
> diff --git a/block/linux-aio.c b/block/linux-aio.c
> index 53434e2..b706a59 100644
> --- a/block/linux-aio.c
> +++ b/block/linux-aio.c
> @@ -162,8 +162,8 @@ BlockDriverAIOCB *laio_submit(BlockDriverState *bs, void *aio_ctx, int fd,
>         break;
>      /* Currently Linux kernel does not support other operations */
>      default:
> -        fprintf(stderr, "%s: invalid AIO request type 0x%x.\n",
> -                        __func__, type);
> +        error_report("%s: invalid AIO request type 0x%x.",
> +                     __func__, type);
>          goto out_free_aiocb;
>      }
>      io_set_eventfd(&laiocb->iocb, event_notifier_get_fd(&s->e));
> diff --git a/block/nbd-client.h b/block/nbd-client.h
> index f2a6337..74178f4 100644
> --- a/block/nbd-client.h
> +++ b/block/nbd-client.h
> @@ -9,7 +9,7 @@
>
>  #if defined(DEBUG_NBD)
>  #define logout(fmt, ...) \
> -    fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
> +    error_report("nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)

So i'm not sure we want to convert debug printfery to error_report.
There's very good value in converting the printfs with user
visibility, but ones like this seem intended for developers only as
throwaway-output. My thinking is that this is a lower level output
than error_report. For instance, as a developer you may do something
to break your error API yet you still want your debug printfery.
Wouldn't matter in this location, but there may be other parts of the
tree where we don't want error_report relinace for debug
instrumentation and it just seems better to keep it consistent.

Thinking further afield, qemu_log may ultimately be the correct
mechanism for this instead (I think thats what I have been using for
new code recently anyway).

Thoughts from others?

Regards,
Peter

