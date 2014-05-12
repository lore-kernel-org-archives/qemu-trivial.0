Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wjenv-00057s-Rt
	for mharc-qemu-trivial@gnu.org; Sun, 11 May 2014 21:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wjenp-00055L-2J
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 21:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wjenj-0003mK-FK
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 21:13:13 -0400
Received: from mail-ve0-f175.google.com ([209.85.128.175]:45911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Wjenj-0003m9-AE
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 21:13:07 -0400
Received: by mail-ve0-f175.google.com with SMTP id jw12so7845974veb.20
	for <qemu-trivial@nongnu.org>; Sun, 11 May 2014 18:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=zs3TdP0VvJU7dRVDfDy59HWYargheOmh1ky/xxw/NY4=;
	b=m1YJ29IWYMtv6GdajO9L5AzNCaYcQnq7xUQa4jSGliw6Jnp7jQ0QC6SKRkvkx5W21I
	BFQfH//CTzfDR9ReyPRmA5kI3mY+LlQO2JVzUcGUjFVsKtCykxVqh5RMUD3/dK8tZRFQ
	Og0ramCj22PEXS/mvlTbl8oN0am7qPAv/NZPiu/cEZh2Cxt+h7vyYichMJBZYrANZfGq
	EBP4mEgJNuPuH5nn3k36GEwTZ8MkkjhwVBAJRb7Ye8v+z1w1FKHSHU/0iDVIQ17CjrO1
	9e1aN5e4IQbpXtOtnUhXtZZ9Mc4XMW2lTeiF3bVECMBpW+K/ktkE4xKw874EhSK69KMW
	vQAA==
X-Gm-Message-State: ALoCoQnoElrjP3F6m7rSeY1ZM4olpHxf3zhvGNJZ/zYIz02OzpuLdVdsDjv3OX+bVWz/JJvZyPim
MIME-Version: 1.0
X-Received: by 10.52.137.174 with SMTP id qj14mr147674vdb.32.1399857186812;
	Sun, 11 May 2014 18:13:06 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Sun, 11 May 2014 18:13:06 -0700 (PDT)
In-Reply-To: <CACrq+iLxrRxup5FKD8wSUDtyYG8o=zVkQOcAaX2CRrw1jYS3-g@mail.gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
	<fc7e1b7c4b8d366461aeadf11769d3c0b039b93e.1399641611.git.tamlokveer@gmail.com>
	<CAEgOgz7YXhfdBo4bASgKK7HyTJnhE0Sj6-pOS74ve+VjA-Ac+g@mail.gmail.com>
	<CACrq+iLxrRxup5FKD8wSUDtyYG8o=zVkQOcAaX2CRrw1jYS3-g@mail.gmail.com>
Date: Mon, 12 May 2014 11:13:06 +1000
X-Google-Sender-Auth: sj2twOlzw09ucqsockVC5NstZi8
Message-ID: <CAEgOgz6yy7_w2q=anfCxJiF3RKB6=wCEPuJUr2GvNWqQjzGmww@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Le Tan <tamlokveer@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Markus Armbruster <armbru@redhat.com>,
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
X-List-Received-Date: Mon, 12 May 2014 01:13:18 -0000

On Sun, May 11, 2014 at 11:27 PM, Le Tan <tamlokveer@gmail.com> wrote:
> 2014-05-10 21:18 GMT+08:00 Peter Crosthwaite <peter.crosthwaite@xilinx.com>:
>> On Sat, May 10, 2014 at 9:55 AM, Le Tan <tamlokveer@gmail.com> wrote:
>>> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
>>> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
>>> have been removed because @fmt of error_report() should not contain newline.
>>>
>>> Signed-off-by: Le Tan <tamlokveer@gmail.com>
>>> ---
>>>  block-migration.c      |    4 +-
>>>  block.c                |    4 +-
>>>  block/linux-aio.c      |    4 +-
>>>  block/nbd-client.h     |    2 +-
>>>  block/qcow2-cluster.c  |    4 +-
>>>  block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
>>>  block/qcow2.c          |   16 +++----
>>>  block/quorum.c         |    4 +-
>>>  block/raw-posix.c      |    8 ++--
>>>  block/raw-win32.c      |    6 +--
>>>  block/ssh.c            |    4 +-
>>>  block/vdi.c            |   14 +++---
>>>  block/vmdk.c           |   21 ++++-----
>>>  block/vpc.c            |    4 +-
>>>  block/vvfat.c          |  108 ++++++++++++++++++++++-----------------------
>>>  blockdev.c             |    6 +--
>>>  16 files changed, 160 insertions(+), 163 deletions(-)
>>>
>>> diff --git a/block-migration.c b/block-migration.c
>>> index 56951e0..5bcf7c8 100644
>>> --- a/block-migration.c
>>> +++ b/block-migration.c
>>> @@ -790,7 +790,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>>>
>>>              bs = bdrv_find(device_name);
>>>              if (!bs) {
>>> -                fprintf(stderr, "Error unknown block device %s\n",
>>> +                error_report("Error unknown block device %s",
>>>                          device_name);
>>>                  return -EINVAL;
>>>              }
>>> @@ -833,7 +833,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>>>                     (addr == 100) ? '\n' : '\r');
>>>              fflush(stdout);
>>>          } else if (!(flags & BLK_MIG_FLAG_EOS)) {
>>> -            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
>>> +            error_report("Unknown block migration flags: %#x", flags);
>>>              return -EINVAL;
>>>          }
>>>          ret = qemu_file_get_error(f);
>>> diff --git a/block.c b/block.c
>>> index b749d31..7dc4acb 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -2694,8 +2694,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
>>>       * if it has been enabled.
>>>       */
>>>      if (bs->io_limits_enabled) {
>>> -        fprintf(stderr, "Disabling I/O throttling on '%s' due "
>>> -                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
>>> +        error_report("Disabling I/O throttling on '%s' due "
>>> +                     "to synchronous I/O.", bdrv_get_device_name(bs));
>>>          bdrv_io_limits_disable(bs);
>>>      }
>>>
>>> diff --git a/block/linux-aio.c b/block/linux-aio.c
>>> index 53434e2..b706a59 100644
>>> --- a/block/linux-aio.c
>>> +++ b/block/linux-aio.c
>>> @@ -162,8 +162,8 @@ BlockDriverAIOCB *laio_submit(BlockDriverState *bs, void *aio_ctx, int fd,
>>>         break;
>>>      /* Currently Linux kernel does not support other operations */
>>>      default:
>>> -        fprintf(stderr, "%s: invalid AIO request type 0x%x.\n",
>>> -                        __func__, type);
>>> +        error_report("%s: invalid AIO request type 0x%x.",
>>> +                     __func__, type);
>>>          goto out_free_aiocb;
>>>      }
>>>      io_set_eventfd(&laiocb->iocb, event_notifier_get_fd(&s->e));
>>> diff --git a/block/nbd-client.h b/block/nbd-client.h
>>> index f2a6337..74178f4 100644
>>> --- a/block/nbd-client.h
>>> +++ b/block/nbd-client.h
>>> @@ -9,7 +9,7 @@
>>>
>>>  #if defined(DEBUG_NBD)
>>>  #define logout(fmt, ...) \
>>> -    fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
>>> +    error_report("nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
>>
>> So i'm not sure we want to convert debug printfery to error_report.
>> There's very good value in converting the printfs with user
>> visibility, but ones like this seem intended for developers only as
>> throwaway-output. My thinking is that this is a lower level output
>> than error_report. For instance, as a developer you may do something
>> to break your error API yet you still want your debug printfery.
>> Wouldn't matter in this location, but there may be other parts of the
>> tree where we don't want error_report relinace for debug
>> instrumentation and it just seems better to keep it consistent.
>>
>> Thinking further afield, qemu_log may ultimately be the correct
>> mechanism for this instead (I think thats what I have been using for
>> new code recently anyway).
>>
>> Thoughts from others?
>>
>> Regards,
>> Peter
> Hi! I am a novice and this is my warm-up task for GSoC. So you mean
> that it's good to convert printfs to error_report where the message is
> deemed to notice the user, such as some warning about wrong cmd
> arguments and so on, while it is better to let them be where the
> printfs are used for the developer to debug, such as:
> #if defined(DEBUG_NBD)
> #define logout(fmt, ...) \
>     fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
>
> Am I right?
> I think I should fix the patch and convert the printfs to error_report
> selectively. Do I get the idea?

Yes sounds clear. Just leave those that aren't errors alone.

Give others a chance (a day or two) to weigh in on discussion as well.

Regards,
Peter

> Thanks very much!
>
> Regards,
> Le
>

