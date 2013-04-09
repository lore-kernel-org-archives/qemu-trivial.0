Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPe8O-0005IX-Na
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2013 15:23:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPe8K-0005En-TI
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 15:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPe8J-0005Y6-H0
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 15:23:08 -0400
Received: from e33.co.us.ibm.com ([32.97.110.151]:44833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPe8J-0005Xs-AK
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 15:23:07 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <jlarrew@linux.vnet.ibm.com>;
	Tue, 9 Apr 2013 13:23:05 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 9 Apr 2013 13:16:21 -0600
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 4DC861FF0051;
	Tue,  9 Apr 2013 13:11:13 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r39JG2oT034238; Tue, 9 Apr 2013 13:16:03 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r39JIaf8009086; Tue, 9 Apr 2013 13:18:36 -0600
Received: from jlarrew.austin.ibm.com (jlarrew.austin.ibm.com [9.41.149.149])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP
	id r39JIZlZ009022; Tue, 9 Apr 2013 13:18:35 -0600
Message-ID: <516468E4.7020007@linux.vnet.ibm.com>
Date: Tue, 09 Apr 2013 14:15:48 -0500
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: li guang <lig.fnst@cn.fujitsu.com>
References: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51639ACE.8020505@linux.vnet.ibm.com>
	<1365483900.9553.8.camel@liguang.fnst.cn.fujitsu.com>
In-Reply-To: <1365483900.9553.8.camel@liguang.fnst.cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13040919-2398-0000-0000-0000131A96A3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.151
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/i386/pc: prompt not
 multboot or morden kernel image
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
X-List-Received-Date: Tue, 09 Apr 2013 19:23:11 -0000

On 04/09/2013 12:05 AM, li guang wrote:
> 在 2013-04-08一的 23:36 -0500，Jesse Larrew写道：
>> On 04/08/2013 09:27 PM, liguang wrote:
>>> if head magic is missing or wrong unexpectedly, we'd
>>> better to prompt memssage for this.
>>> e.g.
>>> I make a mistake to boot a vmlinuz for MIPS(which
>>> I think it's for x86) like this:
>>> qemu-system-x86_64 -kernel vmlinuz -initrd demord
>>> then qemu report:
>>> "qemu: linux kernel too old to load a ram disk"
>>> that's misleading.
>>>
>>
>> Yes, that message would definitely be misleading in this case.
>>
>>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>>> ---
>>>  hw/i386/pc.c |    2 ++
>>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index ebbf059..6b29c3f 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -686,6 +686,8 @@ static void load_linux(void *fw_cfg,
>>>          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
>>>                             kernel_cmdline, kernel_size, header)) {
>>>              return;
>>> +        } else {
>>> +            fprintf(stderr, "warn: invalid multiboot or modern kernel image\n");
>>>          }
>>>          protocol = 0;
>>>      }
>>>
>>
>> My impression from reading through the code is that this branch can be
>> legitimately triggered by an older kernel (protocol < 0x200). 
> 
> right.
> 
>> In that case,the error message above would also be misleading.
> 
> the warning message is saying: hey, we prefer modern kernel image
> or multiboot, but you specify neither, what are you doing?
> do you want to boot an old(obsolete) kernel?
> 
> or, add a line like fprintf(stderr, "do you boot an old kernel?\n") :-)
> 

Ah, I understand now. Thanks for explaining that. :)

>>
>> I think a better solution might be to simply validate that the arch
>> specified in the ELF header matches the arch that qemu is emulating.
>>  I'll look into this more tomorrow morning. :)
> 
> that's fine
> 

Looking at Documentation/x86/boot.txt in the kernel source, it looks
like there is a separate word of header magic that all x86 kernels should
have -- even the oldest images. Adding a separate check for that magic
might be a more complete solution:

---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8d75b34..e120427 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -686,6 +686,14 @@ static void load_linux(void *fw_cfg,
         if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
                            kernel_cmdline, kernel_size, header)) {
             return;
+        } else {
+            /* This is the closest thing old Linux kernels have to a
+               magic number. */
+            if (lduw_p(header+0x01FE) != 0xAA55) {
+                fprintf(stderr, "qemu: '%s' is not an x86 kernel image.\n",
+                        kernel_filename);
+                exit(1);
+            }
         }
         protocol = 0;
     }
-- 
1.7.11.7

Jesse Larrew
Software Engineer, KVM Team
IBM Linux Technology Center
Phone: (512) 973-2052 (T/L: 363-2052)
jlarrew@linux.vnet.ibm.com


