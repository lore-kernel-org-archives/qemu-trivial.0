Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN7rG-00081S-2q
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 17:03:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN7r9-0007zI-1F
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 17:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN7r2-0004LP-Tz
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 17:03:14 -0400
Received: from mail-wi0-f180.google.com ([209.85.212.180]:43083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN7r2-0004Kn-K0
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 17:03:08 -0400
Received: by mail-wi0-f180.google.com with SMTP id hj3so101358wib.13
	for <qemu-trivial@nongnu.org>; Fri, 20 Sep 2013 14:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type;
	bh=kgNv2guiYP/UkhRAatHB1s6DhH/G5XWMqkdZgeydrDc=;
	b=PvMNj96ota4l9Q+HMtFpzzJIEHu7EBnuQGdaEHTnBV9atYwRkvAh2GcJI1NKGIAi0m
	gQfGJeOjj2JEmOMsS4mOTmGh5xXyP6y5evJOavZI2OnbbXFLekO+twhuy1ov4dDXYLU7
	myQqzh8fvFTVJkREPyh1rE+6m/enjnzdq3qEfSu2Xi1EvBCMqNS58sOcppdGNvPvadrM
	k9NXB/KAhzdACLhC5Opk8Ktx7qAva2aN67IOrtFGcj9zcD2GHsadmQu+G0ys4HxNvZAr
	GzPjp+nAIA094FeZ5ceiuiEBe510XtdYQ4d5jw1WJaNPDVu7vs9iDAWRbpk3ghH+fuAy
	mmXQ==
X-Gm-Message-State: ALoCoQlaj6zs70qUJgUebFXsGyyE6/y6zJ3gLafJvnT8H6MEqmkYdhsMXvsIVW/hNYeNrLfR82aW
X-Received: by 10.195.13.45 with SMTP id ev13mr7517220wjd.20.1379710987489;
	Fri, 20 Sep 2013 14:03:07 -0700 (PDT)
Received: from [192.168.0.11] ([81.56.67.82]) by mx.google.com with ESMTPSA id
	ed12sm7232874wic.11.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 14:03:06 -0700 (PDT)
Message-ID: <523CB79F.9070706@6wind.com>
Date: Fri, 20 Sep 2013 23:01:19 +0200
From: Damien Millescamps <damien.millescamps@6wind.com>
Organization: 6WIND S.A.
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Beno=EEt_Canet?= <benoit.canet@irqsave.net>
References: <1379702087-8653-1-git-send-email-damien.millescamps@6wind.com>
	<20130920204517.GC3276@irqsave.net>
In-Reply-To: <20130920204517.GC3276@irqsave.net>
Content-Type: multipart/alternative;
	boundary="------------000607090602050608020500"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] ivshmem: allow the
 sharing of mmap'd files
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
X-List-Received-Date: Fri, 20 Sep 2013 21:03:20 -0000

This is a multi-part message in MIME format.
--------------000607090602050608020500
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 09/20/2013 10:45 PM, Benoît Canet wrote:
> Le Friday 20 Sep 2013 à 20:34:47 (+0200), Damien Millescamps a écrit :
>> This patch permits to share memory areas that do not specifically belong to
>> /dev/shm. In such case, the file must be already present when launching qemu.
>> A new parameter 'file' has been added to specify the file to use.
>>
>> A use case for this patch is sharing huge pages available through a
>> hugetlbfs mountpoint.
>>
>> Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
>> ---
>>  docs/specs/ivshmem_device_spec.txt |    7 +++-
>>  hw/misc/ivshmem.c                  |   56 +++++++++++++++++++++++------------
>>  2 files changed, 42 insertions(+), 21 deletions(-)
>>
>> diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
>> index 667a862..cb7d310 100644
>> --- a/docs/specs/ivshmem_device_spec.txt
>> +++ b/docs/specs/ivshmem_device_spec.txt
>> @@ -4,8 +4,11 @@ Device Specification for Inter-VM shared memory device
>>  
>>  The Inter-VM shared memory device is designed to share a region of memory to
>>  userspace in multiple virtual guests.  The memory region does not belong to any
>> -guest, but is a POSIX memory object on the host.  Optionally, the device may
>> -support sending interrupts to other guests sharing the same memory region.
>> +guest, but is a either a POSIX memory object or a mmap'd file (including
>> +hugepage-backed file) on the host.
>> +
>> +Optionally, the device may support sending interrupts to other guests sharing
>> +the same memory region.
>>  
>>  
>>  The Inter-VM PCI device
>> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
>> index 2838866..5d991cf 100644
>> --- a/hw/misc/ivshmem.c
>> +++ b/hw/misc/ivshmem.c
>> @@ -98,6 +98,7 @@ typedef struct IVShmemState {
>>      Error *migration_blocker;
>>  
>>      char * shmobj;
>> +    char * fileobj;
>>      char * sizearg;
>>      char * role;
>>      int role_val;   /* scalar to avoid multiple string comparisons */
>> @@ -715,9 +716,10 @@ static int pci_ivshmem_init(PCIDevice *dev)
>>          /* if we get a UNIX socket as the parameter we will talk
>>           * to the ivshmem server to receive the memory region */
>>  
>> -        if (s->shmobj != NULL) {
>> -            fprintf(stderr, "WARNING: do not specify both 'chardev' "
>> -                                                "and 'shm' with ivshmem\n");
>> +        if (s->shmobj != NULL || s->fileobj != NULL) {
>> +            fprintf(stderr, "WARNING: both 'chardev' and '%s' specified.\n"
>> +                            "Falling back to 'chardev' only.\n",
>> +                            s->shmobj ? "shm" : "file");
>>          }
>>  
>>          IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
>> @@ -743,28 +745,43 @@ static int pci_ivshmem_init(PCIDevice *dev)
>>      } else {
>>          /* just map the file immediately, we're not using a server */
>>          int fd;
>> +        int is_shm = !!(s->shmobj != NULL);
>> +        int is_file = !!(s->fileobj != NULL);
> Out of curiosity why doing !! on a boolean which would be converted either to
> zero or one by implicit casting ?
>
>>  
>> -        if (s->shmobj == NULL) {
>> -            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
>> +        if (!(is_shm ^ is_file)) {
>> +            fprintf(stderr, "ERROR: both 'file' and 'shm' specified for the "
>> +                            "same ivshmem device.\n");
>>              exit(1);
>>          }
>>  
>> -        IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
>> -
>> -        /* try opening with O_EXCL and if it succeeds zero the memory
>> -         * by truncating to 0 */
>> -        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
>> -                        S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
>> -           /* truncate file to length PCI device's memory */
>> -            if (ftruncate(fd, s->ivshmem_size) != 0) {
>> -                fprintf(stderr, "ivshmem: could not truncate shared file\n");
>> +        if (is_shm) {
>> +            IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
>> +
>> +            /* try opening with O_EXCL and if it succeeds zero the memory
>> +             * by truncating to 0 */
>> +            if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
>> +                            S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
>> +               /* truncate file to length PCI device's memory */
>> +                if (ftruncate(fd, s->ivshmem_size) != 0) {
>> +                    fprintf(stderr, "ivshmem: could not truncate"
>> +                                    " shared file: %m\n");
>> +                    exit(-1);
>> +                }
>> +
>> +            } else if ((fd = shm_open(s->shmobj, O_RDWR,
>> +                            S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
>> +                fprintf(stderr, "ivshmem: could not open shared file: %m\n");
>> +                exit(-1);
>>              }
>> +        } else {
>> +            IVSHMEM_DPRINTF("using open (file object = %s)\n", s->fileobj);
>>  
>> -        } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
>> -                        S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
>> -            fprintf(stderr, "ivshmem: could not open shared file\n");
>> -            exit(-1);
>> -
>> +            /* try opening a mmap's file. This file must have been previously
>> +             * created on the host */
>> +            if ((fd = open(s->fileobj, O_RDWR)) < 0) {
>> +                fprintf(stderr, "ivshmem: could not open mmap'd file: %m\n");
>> +                exit(-1);
>> +            }
>>          }
>>  
>>          if (check_shm_size(s, fd) == -1) {
>> @@ -804,6 +821,7 @@ static Property ivshmem_properties[] = {
>>      DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD, false),
>>      DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
>>      DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
>> +    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
>>      DEFINE_PROP_STRING("role", IVShmemState, role),
>>      DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
>>      DEFINE_PROP_END_OF_LIST(),
>> -- 
>> 1.7.2.5
>>
>>
> Hi,
>
> I won't be able to help you much on the semantic of the patch.
> However you should ./script/checkpatch.pl before posting:
>
> benoit@Laure:~/qemu (quorum_reboot2)$ ./scripts/checkpatch.pl /tmp/onx 
> ERROR: "foo * bar" should be "foo *bar"
> #115: FILE: hw/misc/ivshmem.c:101:
> +    char * fileobj;
>
> WARNING: suspect code indent for conditional statements (12, 15)
> #162: FILE: hw/misc/ivshmem.c:762:
> +            if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> [...]
> +               /* truncate file to length PCI device's memory */
>
> ERROR: do not use assignment in if condition
> #162: FILE: hw/misc/ivshmem.c:762:
> +            if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
>
> ERROR: do not use assignment in if condition
> #171: FILE: hw/misc/ivshmem.c:771:
> +            } else if ((fd = shm_open(s->shmobj, O_RDWR,
>
> ERROR: do not use assignment in if condition
> #186: FILE: hw/misc/ivshmem.c:781:
> +            if ((fd = open(s->fileobj, O_RDWR)) < 0) {
>
> total: 4 errors, 1 warnings, 99 lines checked
>
> /tmp/patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> Best regards
>
> Benoît
Well, I am actually a bit confused by the rule:
*Follow the coding style* and run /scripts/checkpatch.pl <patchfile>/
before submitting.
from the submit patch guidelines, since I assume that the coding style
is referring to the file coding style ?

The whole file might need a complete clean up, but I understand that it
should be in a separate patch from this rule, since the whole file is
written like that:
*Don't include irrelevant changes*. In particular, don't include
formatting, coding style or whitespace changes to bits of code that
would otherwise not be touched by the patch.

This is a just an indentation modification to put it inside a if/else...

Cheers,
-- 
Damien


--------------000607090602050608020500
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/20/2013 10:45 PM, Beno&icirc;t Canet
      wrote:<br>
    </div>
    <blockquote cite="mid:20130920204517.GC3276@irqsave.net" type="cite">
      <pre wrap="">Le Friday 20 Sep 2013 &agrave; 20:34:47 (+0200), Damien Millescamps a &eacute;crit :
</pre>
      <blockquote type="cite">
        <pre wrap="">This patch permits to share memory areas that do not specifically belong to
/dev/shm. In such case, the file must be already present when launching qemu.
A new parameter 'file' has been added to specify the file to use.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <a class="moz-txt-link-rfc2396E" href="mailto:damien.millescamps@6wind.com">&lt;damien.millescamps@6wind.com&gt;</a>
---
 docs/specs/ivshmem_device_spec.txt |    7 +++-
 hw/misc/ivshmem.c                  |   56 +++++++++++++++++++++++------------
 2 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
index 667a862..cb7d310 100644
--- a/docs/specs/ivshmem_device_spec.txt
+++ b/docs/specs/ivshmem_device_spec.txt
@@ -4,8 +4,11 @@ Device Specification for Inter-VM shared memory device
 
 The Inter-VM shared memory device is designed to share a region of memory to
 userspace in multiple virtual guests.  The memory region does not belong to any
-guest, but is a POSIX memory object on the host.  Optionally, the device may
-support sending interrupts to other guests sharing the same memory region.
+guest, but is a either a POSIX memory object or a mmap'd file (including
+hugepage-backed file) on the host.
+
+Optionally, the device may support sending interrupts to other guests sharing
+the same memory region.
 
 
 The Inter-VM PCI device
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2838866..5d991cf 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -98,6 +98,7 @@ typedef struct IVShmemState {
     Error *migration_blocker;
 
     char * shmobj;
+    char * fileobj;
     char * sizearg;
     char * role;
     int role_val;   /* scalar to avoid multiple string comparisons */
@@ -715,9 +716,10 @@ static int pci_ivshmem_init(PCIDevice *dev)
         /* if we get a UNIX socket as the parameter we will talk
          * to the ivshmem server to receive the memory region */
 
-        if (s-&gt;shmobj != NULL) {
-            fprintf(stderr, "WARNING: do not specify both 'chardev' "
-                                                "and 'shm' with ivshmem\n");
+        if (s-&gt;shmobj != NULL || s-&gt;fileobj != NULL) {
+            fprintf(stderr, "WARNING: both 'chardev' and '%s' specified.\n"
+                            "Falling back to 'chardev' only.\n",
+                            s-&gt;shmobj ? "shm" : "file");
         }
 
         IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
@@ -743,28 +745,43 @@ static int pci_ivshmem_init(PCIDevice *dev)
     } else {
         /* just map the file immediately, we're not using a server */
         int fd;
+        int is_shm = !!(s-&gt;shmobj != NULL);
+        int is_file = !!(s-&gt;fileobj != NULL);
</pre>
      </blockquote>
      <pre wrap="">
Out of curiosity why doing !! on a boolean which would be converted either to
zero or one by implicit casting ?

</pre>
      <blockquote type="cite">
        <pre wrap=""> 
-        if (s-&gt;shmobj == NULL) {
-            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
+        if (!(is_shm ^ is_file)) {
+            fprintf(stderr, "ERROR: both 'file' and 'shm' specified for the "
+                            "same ivshmem device.\n");
             exit(1);
         }
 
-        IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s-&gt;shmobj);
-
-        /* try opening with O_EXCL and if it succeeds zero the memory
-         * by truncating to 0 */
-        if ((fd = shm_open(s-&gt;shmobj, O_CREAT|O_RDWR|O_EXCL,
-                        S_IRWXU|S_IRWXG|S_IRWXO)) &gt; 0) {
-           /* truncate file to length PCI device's memory */
-            if (ftruncate(fd, s-&gt;ivshmem_size) != 0) {
-                fprintf(stderr, "ivshmem: could not truncate shared file\n");
+        if (is_shm) {
+            IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s-&gt;shmobj);
+
+            /* try opening with O_EXCL and if it succeeds zero the memory
+             * by truncating to 0 */
+            if ((fd = shm_open(s-&gt;shmobj, O_CREAT|O_RDWR|O_EXCL,
+                            S_IRWXU|S_IRWXG|S_IRWXO)) &gt; 0) {
+               /* truncate file to length PCI device's memory */
+                if (ftruncate(fd, s-&gt;ivshmem_size) != 0) {
+                    fprintf(stderr, "ivshmem: could not truncate"
+                                    " shared file: %m\n");
+                    exit(-1);
+                }
+
+            } else if ((fd = shm_open(s-&gt;shmobj, O_RDWR,
+                            S_IRWXU|S_IRWXG|S_IRWXO)) &lt; 0) {
+                fprintf(stderr, "ivshmem: could not open shared file: %m\n");
+                exit(-1);
             }
+        } else {
+            IVSHMEM_DPRINTF("using open (file object = %s)\n", s-&gt;fileobj);
 
-        } else if ((fd = shm_open(s-&gt;shmobj, O_CREAT|O_RDWR,
-                        S_IRWXU|S_IRWXG|S_IRWXO)) &lt; 0) {
-            fprintf(stderr, "ivshmem: could not open shared file\n");
-            exit(-1);
-
+            /* try opening a mmap's file. This file must have been previously
+             * created on the host */
+            if ((fd = open(s-&gt;fileobj, O_RDWR)) &lt; 0) {
+                fprintf(stderr, "ivshmem: could not open mmap'd file: %m\n");
+                exit(-1);
+            }
         }
 
         if (check_shm_size(s, fd) == -1) {
@@ -804,6 +821,7 @@ static Property ivshmem_properties[] = {
     DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD, false),
     DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
     DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
+    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
     DEFINE_PROP_STRING("role", IVShmemState, role),
     DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
     DEFINE_PROP_END_OF_LIST(),
-- 
1.7.2.5


</pre>
      </blockquote>
      <pre wrap="">
Hi,

I won't be able to help you much on the semantic of the patch.
However you should ./script/checkpatch.pl before posting:

benoit@Laure:~/qemu (quorum_reboot2)$ ./scripts/checkpatch.pl /tmp/onx 
ERROR: "foo * bar" should be "foo *bar"
#115: FILE: hw/misc/ivshmem.c:101:
+    char * fileobj;

WARNING: suspect code indent for conditional statements (12, 15)
#162: FILE: hw/misc/ivshmem.c:762:
+            if ((fd = shm_open(s-&gt;shmobj, O_CREAT|O_RDWR|O_EXCL,
[...]
+               /* truncate file to length PCI device's memory */

ERROR: do not use assignment in if condition
#162: FILE: hw/misc/ivshmem.c:762:
+            if ((fd = shm_open(s-&gt;shmobj, O_CREAT|O_RDWR|O_EXCL,

ERROR: do not use assignment in if condition
#171: FILE: hw/misc/ivshmem.c:771:
+            } else if ((fd = shm_open(s-&gt;shmobj, O_RDWR,

ERROR: do not use assignment in if condition
#186: FILE: hw/misc/ivshmem.c:781:
+            if ((fd = open(s-&gt;fileobj, O_RDWR)) &lt; 0) {

total: 4 errors, 1 warnings, 99 lines checked

/tmp/patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

Best regards

Beno&icirc;t
</pre>
    </blockquote>
    Well, I am actually a bit confused by the rule:<br>
    <b>Follow the coding style</b> and run <i>scripts/checkpatch.pl
      &lt;patchfile&gt;</i> before submitting.<br>
    from the submit patch guidelines, since I assume that the coding
    style is referring to the file coding style ?<br>
    <br>
    The whole file might need a complete clean up, but I understand that
    it should be in a separate patch from this rule, since the whole
    file is written like that:<br>
    <b>Don't include irrelevant changes</b>. In particular, don't
    include formatting, coding style or whitespace changes to bits of
    code that would otherwise not be touched by the patch.<br>
    <br>
    This is a just an indentation modification to put it inside a
    if/else...<br>
    <br>
    Cheers,<br>
    -- <br>
    Damien<br>
    <br>
  </body>
</html>

--------------000607090602050608020500--

