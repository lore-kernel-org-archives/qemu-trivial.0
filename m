Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjTnF-0005tq-Cv
	for mharc-qemu-trivial@gnu.org; Sun, 11 May 2014 09:27:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WjTnC-0005qv-FY
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 09:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WjTnB-0002Sy-A0
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 09:27:50 -0400
Received: from mail-qa0-x22c.google.com ([2607:f8b0:400d:c00::22c]:39352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WjTn8-0002SR-Kz; Sun, 11 May 2014 09:27:46 -0400
Received: by mail-qa0-f44.google.com with SMTP id j7so6090275qaq.3
	for <multiple recipients>; Sun, 11 May 2014 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OEvXREkfxDuN+6424bLwYBOZD1r2pYc/T9OXXiS9GeE=;
	b=wTClA1dzur6I2QpuTDI8xxxcrPJz3hasBn6hCnJoiUQkDvfgkP3Af0IEhouGWeqyT8
	TNK3wkXY6Cxhu0+bUr/SxvnA+M9XndZlWmAeOTvHiEQ9j3ENw7MSxRTMO400IC6mWaJJ
	M1qCeufI21BqXdQAQU+d5EAmu0kZUlaopykd3wcYVZYA+vsB01HvwNQfeQvz1qJY31pv
	UuNKb4LEk4LFdfRZr+ZlvN/v/L2rSgg0Mh/Yo3UiLtUgq1jHFRVO3Pv1S/o1Afr29D2i
	XmtgzUlmJ47008BETD/NwiYM7Qk5IABFEteKIFGlnJySgetM/zaVrBAfz8wzXhSVixPj
	81Tg==
MIME-Version: 1.0
X-Received: by 10.224.30.70 with SMTP id t6mr30080115qac.30.1399814865784;
	Sun, 11 May 2014 06:27:45 -0700 (PDT)
Received: by 10.140.24.51 with HTTP; Sun, 11 May 2014 06:27:45 -0700 (PDT)
In-Reply-To: <CAEgOgz7YXhfdBo4bASgKK7HyTJnhE0Sj6-pOS74ve+VjA-Ac+g@mail.gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
	<fc7e1b7c4b8d366461aeadf11769d3c0b039b93e.1399641611.git.tamlokveer@gmail.com>
	<CAEgOgz7YXhfdBo4bASgKK7HyTJnhE0Sj6-pOS74ve+VjA-Ac+g@mail.gmail.com>
Date: Sun, 11 May 2014 21:27:45 +0800
Message-ID: <CACrq+iLxrRxup5FKD8wSUDtyYG8o=zVkQOcAaX2CRrw1jYS3-g@mail.gmail.com>
From: Le Tan <tamlokveer@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::22c
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sun, 11 May 2014 13:27:51 -0000

2014-05-10 21:18 GMT+08:00 Peter Crosthwaite <peter.crosthwaite@xilinx.com>:
> On Sat, May 10, 2014 at 9:55 AM, Le Tan <tamlokveer@gmail.com> wrote:
>> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
>> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
>> have been removed because @fmt of error_report() should not contain newline.
>>
>> Signed-off-by: Le Tan <tamlokveer@gmail.com>
>> ---
>>  block-migration.c      |    4 +-
>>  block.c                |    4 +-
>>  block/linux-aio.c      |    4 +-
>>  block/nbd-client.h     |    2 +-
>>  block/qcow2-cluster.c  |    4 +-
>>  block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
>>  block/qcow2.c          |   16 +++----
>>  block/quorum.c         |    4 +-
>>  block/raw-posix.c      |    8 ++--
>>  block/raw-win32.c      |    6 +--
>>  block/ssh.c            |    4 +-
>>  block/vdi.c            |   14 +++---
>>  block/vmdk.c           |   21 ++++-----
>>  block/vpc.c            |    4 +-
>>  block/vvfat.c          |  108 ++++++++++++++++++++++-----------------------
>>  blockdev.c             |    6 +--
>>  16 files changed, 160 insertions(+), 163 deletions(-)
>>
>> diff --git a/block-migration.c b/block-migration.c
>> index 56951e0..5bcf7c8 100644
>> --- a/block-migration.c
>> +++ b/block-migration.c
>> @@ -790,7 +790,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>>
>>              bs = bdrv_find(device_name);
>>              if (!bs) {
>> -                fprintf(stderr, "Error unknown block device %s\n",
>> +                error_report("Error unknown block device %s",
>>                          device_name);
>>                  return -EINVAL;
>>              }
>> @@ -833,7 +833,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>>                     (addr == 100) ? '\n' : '\r');
>>              fflush(stdout);
>>          } else if (!(flags & BLK_MIG_FLAG_EOS)) {
>> -            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
>> +            error_report("Unknown block migration flags: %#x", flags);
>>              return -EINVAL;
>>          }
>>          ret = qemu_file_get_error(f);
>> diff --git a/block.c b/block.c
>> index b749d31..7dc4acb 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2694,8 +2694,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
>>       * if it has been enabled.
>>       */
>>      if (bs->io_limits_enabled) {
>> -        fprintf(stderr, "Disabling I/O throttling on '%s' due "
>> -                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
>> +        error_report("Disabling I/O throttling on '%s' due "
>> +                     "to synchronous I/O.", bdrv_get_device_name(bs));
>>          bdrv_io_limits_disable(bs);
>>      }
>>
>> diff --git a/block/linux-aio.c b/block/linux-aio.c
>> index 53434e2..b706a59 100644
>> --- a/block/linux-aio.c
>> +++ b/block/linux-aio.c
>> @@ -162,8 +162,8 @@ BlockDriverAIOCB *laio_submit(BlockDriverState *bs, void *aio_ctx, int fd,
>>         break;
>>      /* Currently Linux kernel does not support other operations */
>>      default:
>> -        fprintf(stderr, "%s: invalid AIO request type 0x%x.\n",
>> -                        __func__, type);
>> +        error_report("%s: invalid AIO request type 0x%x.",
>> +                     __func__, type);
>>          goto out_free_aiocb;
>>      }
>>      io_set_eventfd(&laiocb->iocb, event_notifier_get_fd(&s->e));
>> diff --git a/block/nbd-client.h b/block/nbd-client.h
>> index f2a6337..74178f4 100644
>> --- a/block/nbd-client.h
>> +++ b/block/nbd-client.h
>> @@ -9,7 +9,7 @@
>>
>>  #if defined(DEBUG_NBD)
>>  #define logout(fmt, ...) \
>> -    fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
>> +    error_report("nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
>
> So i'm not sure we want to convert debug printfery to error_report.
> There's very good value in converting the printfs with user
> visibility, but ones like this seem intended for developers only as
> throwaway-output. My thinking is that this is a lower level output
> than error_report. For instance, as a developer you may do something
> to break your error API yet you still want your debug printfery.
> Wouldn't matter in this location, but there may be other parts of the
> tree where we don't want error_report relinace for debug
> instrumentation and it just seems better to keep it consistent.
>
> Thinking further afield, qemu_log may ultimately be the correct
> mechanism for this instead (I think thats what I have been using for
> new code recently anyway).
>
> Thoughts from others?
>
> Regards,
> Peter
Hi! I am a novice and this is my warm-up task for GSoC. So you mean
that it's good to convert printfs to error_report where the message is
deemed to notice the user, such as some warning about wrong cmd
arguments and so on, while it is better to let them be where the
printfs are used for the developer to debug, such as:
#if defined(DEBUG_NBD)
#define logout(fmt, ...) \
    fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)

Am I right?
I think I should fix the patch and convert the printfs to error_report
selectively. Do I get the idea?
Thanks very much!

Regards,
Le

