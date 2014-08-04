Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEIg3-0001ok-Eq
	for mharc-qemu-trivial@gnu.org; Mon, 04 Aug 2014 09:51:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEIfr-0001YJ-TR
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 09:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XEIfi-00069e-Pa
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 09:51:39 -0400
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:48740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XEIfQ-0005lU-7c; Mon, 04 Aug 2014 09:51:12 -0400
Received: by mail-pa0-f52.google.com with SMTP id bj1so9972751pad.25
	for <multiple recipients>; Mon, 04 Aug 2014 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=2nt8k7EhJSihO7WyQ8g2QVV4tRhp2PbU2T7+Imh3drQ=;
	b=c3r/J51QxkH77uF209F6/Z94Ggzwm7xaDFKFloBHHXiFfTJNcY4RpSRShdLOWu5Lvc
	IEVFgapft2Gzc4pPp3MNJjCZrXWMGgPwocwqWocTu1RWwuMgGKpdG19BfNhR6ijOAv6E
	OnaK/QxXGmSDzOFCFssXx5FmCcLQREFXz3FlGuh/3bZD6zZZzHYZz1VRZ4rgW99E2otV
	ex5Rf4MBkxGC627EAihupEs+ItjOA23OXbs9BwImAJhpX/iRcS0RRakg4uOhaa8YQilx
	1mXacThQgTu3F7PuSOqx6RHV5M82mz2i5Ihwp0bKHcuw4Ba0d+ocvcaG+XHI1SLNRrGv
	u+CA==
X-Received: by 10.70.135.130 with SMTP id ps2mr24259090pdb.0.1407160270513;
	Mon, 04 Aug 2014 06:51:10 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.31])
	by mx.google.com with ESMTPSA id ja8sm17580040pbd.3.2014.08.04.06.51.07
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 06:51:10 -0700 (PDT)
Message-ID: <53DF8FCA.1090602@gmail.com>
Date: Mon, 04 Aug 2014 21:51:06 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>
References: <53DE5538.1020701@gmail.com> <53DE5BB7.10709@redhat.com>
In-Reply-To: <53DE5BB7.10709@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, agraf@suse.de, qiaonuohan@cn.fujitsu.com,
	pbonzini@redhat.com, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] dump.c: Fix memory leak issue in cleanup
 processing for dump_init()
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
X-List-Received-Date: Mon, 04 Aug 2014 13:51:49 -0000

On 08/03/2014 11:56 PM, Laszlo Ersek wrote:
> comments below
> 

Excuse me for replying late, firstly.

> On 08/03/14 17:28, Chen Gang wrote:
>> In dump_init(), when failure occurs, need notice about 'fd' and memory
>> mapping. So call dump_cleanup() for it (need let all initializations at
>> front).
>>
>> Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
>> checking.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  dump.c | 18 +++++-------------
>>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> Please explain what is leaked and how.
> 

Oh, sorry for the title misleading, need change to "Fix resource leak"
instead of "Fix memory leak".

> The only possibility I can see (without digging very hard) is that
> qemu_get_guest_memory_mapping() succeeds and lzo_init() fails (which
> should never happen in practice).
>

Yeah, what you said sounds reasonable to me.
 
> Regarding s->fd itself, I'm beyond trying to understand its lifecycle.
> Qemu uses a bad ownership model wherein functions, in case of an
> internal error, release resources they got from their callers. I'm
> unable to reason in such a model.

Yeah, what you said sounds reasonable to me.

>                                   The only function to close fd *ever*
> should be qmp_dump_guest_memory() (and that one should close fd with a
> direct close() call). Currently fd is basically a global variable,
> because the entire dump function tree has access to it (and closes it if
> there's an error).
> 

Although 's->fd' seems a global variable, but it is only have effect
within this file. It starts from qemu_open() or monitor_get_fd() in
qmp_dump_guest_memory(), and also end in qmp_dump_guest_memory().

dump_cleanup() is a static function, and qmp_dump_guest_memory() is
the only extern function which related with dump_cleanup() (I assume
'dump.c' will not be included directly by other C files).


> Anyway I guess it's OK to call dump_cleanup() to close s->fd just in case.
> 
> If you have a Coverity report, please share it.
> 

Excuse me, I only found it by reading source code (vi, grep, find ...), no
other additional tools.

> Then,
> 
>> diff --git a/dump.c b/dump.c
>> index ce646bc..71d3e94 100644
>> --- a/dump.c
>> +++ b/dump.c
>> @@ -71,18 +71,14 @@ uint64_t cpu_to_dump64(DumpState *s, uint64_t val)
>>  
>>  static int dump_cleanup(DumpState *s)
>>  {
>> -    int ret = 0;
>> -
> 
> I agree with this change.
> 

Thanks.

>>      guest_phys_blocks_free(&s->guest_phys_blocks);
>>      memory_mapping_list_free(&s->list);
>> -    if (s->fd != -1) {
>> -        close(s->fd);
>> -    }
>> +    close(s->fd);
> 
> I disagree. It clobbers errno if s->fd is -1. Even though we don't
> particularly care about errno, it sort of disturbs be. Or can you prove
> s->fd is never -1 here?
> 

In our case, s->fd must be valid, or will return with failure in
qmp_dump_guest_memory().

For dump_cleanup(), at present, it is only a static function for share
code which need assume many things (e.g. only can be called once), not
generic enough.

But for simplify thinking, for me, it will be OK to let it be a generic
function, e.g: ('guest_phys_blocks_free' and 'memory_mapping_list_free'
know about NULL)

diff --git a/dump.c b/dump.c
index ce646bc..3f1ec5b 100644
--- a/dump.c
+++ b/dump.c
@@ -71,18 +71,18 @@ uint64_t cpu_to_dump64(DumpState *s, uint64_t val)
 
 static int dump_cleanup(DumpState *s)
 {
-    int ret = 0;
-
     guest_phys_blocks_free(&s->guest_phys_blocks);
     memory_mapping_list_free(&s->list);
     if (s->fd != -1) {
         close(s->fd);
+        s->fd = -1;
     }
     if (s->resume) {
         vm_start();
+        s->resume = false;
     }
 
-    return ret;
+    return 0;
 }
 
 static void dump_error(DumpState *s, const char *reason)


>>      if (s->resume) {
>>          vm_start();
>>      }
>>  
>> -    return ret;
>> +    return 0;
>>  }
>>  
>>  static void dump_error(DumpState *s, const char *reason)
>> @@ -1499,6 +1495,8 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>>      s->begin = begin;
>>      s->length = length;
>>  
>> +    memory_mapping_list_init(&s->list);
>> +
>>      guest_phys_blocks_init(&s->guest_phys_blocks);
>>      guest_phys_blocks_append(&s->guest_phys_blocks);
>>  
>> @@ -1526,7 +1524,6 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>>      }
>>  
>>      /* get memory mapping */
>> -    memory_mapping_list_init(&s->list);
>>      if (paging) {
>>          qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks, &err);
>>          if (err != NULL) {
>> @@ -1622,12 +1619,7 @@ static int dump_init(DumpState *s, int fd, bool has_format,
>>      return 0;
>>  
>>  cleanup:
>> -    guest_phys_blocks_free(&s->guest_phys_blocks);
>> -
>> -    if (s->resume) {
>> -        vm_start();
>> -    }
>> -
>> +    dump_cleanup(s);
>>      return -1;
>>  }
>>  
>>
> 
> This code is ripe for a generic lifecycle tracking overhaul, but since
> my view of ownership tracking is marginal in the qemu developer
> community, I'm not motivated.
>
> NB: I'm not nacking your patch, just please explain it better.
> 

OK, I can understand, and still thank you for your checking.

 
> Thanks
> Laszlo
> 

Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

