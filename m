Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0At7-00057r-OC
	for mharc-qemu-trivial@gnu.org; Sat, 11 Aug 2012 08:33:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T0At5-00051d-Ob
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 08:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T0At3-0004fB-92
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2012 08:33:51 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T0Asy-0004ds-DB; Sat, 11 Aug 2012 08:33:44 -0400
Received: by lbbgm13 with SMTP id gm13so1202944lbb.4
	for <multiple recipients>; Sat, 11 Aug 2012 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hgIJXzdmMZbMJmw8Pt4/oFtY6maKsvlezS8JtNYQV9o=;
	b=InBPDzryoCOauEeaS5Dtr2al58nG4sItdcCIyo/+cwtSRpQELtdCI0hU+6n3eSGFKD
	uOhbNyHxQP2OuY6k72fo3vtwdlqnJTdkn8P0kXQgy9ydoYbFQJAQoPiOIVBsb89U5g0p
	1CaYCUBYoOBRt2snEadmWXe/mvBDDTEGc8xZRtvMOipM0F/5aWYL93jn93oN8Zin2sQ1
	nbDGWdjUDjqSIlSosrbXaWsXVtbS2X+pezGXNHwVjqSxdub0nIMaQT/xqGP0lfooEdKa
	p+TL0pwbH+zeILWVi6atAVIW10sfKFaQ2iR+4t2WnBsAiNO4SPDsz+E+4r19qRem+HNX
	MZqg==
MIME-Version: 1.0
Received: by 10.152.105.132 with SMTP id gm4mr5996528lab.8.1344688423041; Sat,
	11 Aug 2012 05:33:43 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Sat, 11 Aug 2012 05:33:42 -0700 (PDT)
In-Reply-To: <CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
	<20120810134245.GC14122@stefanha-thinkpad.localdomain>
	<CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
Date: Sat, 11 Aug 2012 13:33:42 +0100
Message-ID: <CAJSP0QXonD5WYkgAaqO-BeLaJEVoFOPDOajLWerxkrbKdECUkQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, agraf@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] device_tree:
	load_device_tree(): Allow NULL sizep
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
X-List-Received-Date: Sat, 11 Aug 2012 12:33:53 -0000

On Sat, Aug 11, 2012 at 12:11 AM, Peter Crosthwaite
<peter.crosthwaite@petalogix.com> wrote:
> On Fri, Aug 10, 2012 at 11:42 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
>>> The sizep arg is populated with the size of the loaded device tree. Since this
>>> is one of those informational "please populate" type arguments it should be
>>> optional. Guarded writes to *sizep against NULL accordingly.
>>>
>>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>>> Acked-by: Alexander Graf <agraf@suse.de>
>>> ---
>>>  device_tree.c |    8 ++++++--
>>>  1 files changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/device_tree.c b/device_tree.c
>>> index d7a9b6b..641a48a 100644
>>> --- a/device_tree.c
>>> +++ b/device_tree.c
>>> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>>      int ret;
>>>      void *fdt = NULL;
>>>
>>> -    *sizep = 0;
>>> +    if (sizep) {
>>> +        *sizep = 0;
>>> +    }
>>>      dt_size = get_image_size(filename_path);
>>>      if (dt_size < 0) {
>>>          printf("Unable to get size of device tree file '%s'\n",
>>> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>>              filename_path);
>>>          goto fail;
>>>      }
>>> -    *sizep = dt_size;
>>> +    if (sizep) {
>>> +        *sizep = dt_size;
>>> +    }
>>
>> What can the caller do with this void* buffer without knowing its size?
>>
>
> Sanity check the machine:
>
> dtb = load_device_tree( ... ); //dont care how big it is
> foo = fdt_gep_prop( dtb, ... );
> if (foo != object_get_prop(foo_device, foo_prop, ... )) {
>     hw_error("your dtb is bad because ... !\n", ... );
> }

What happens if the fdt is corrupt or malicious?  I guess we'll access
memory beyond the end of blob.

This seems to be libfdt's fault.  I didn't see an API to validate the
blob's size.

I'm "happy" with this patch but if fdt's can ever come from untrusted
sources then we're in trouble.

Stefan

