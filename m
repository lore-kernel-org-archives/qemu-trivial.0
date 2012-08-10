Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzyMf-0007ON-1Z
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 19:11:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzyMc-0007Ky-Ew
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 19:11:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzyMa-0008V6-E1
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 19:11:30 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:58690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzyMa-0008Um-8R
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 19:11:28 -0400
Received: by obbta14 with SMTP id ta14so2722850obb.4
	for <qemu-trivial@nongnu.org>; Fri, 10 Aug 2012 16:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=+ZzsrvGZ+v/XqNQTBYAhC9z/yOd6bgKYqr3ymrp1Hn4=;
	b=Cth6AT/lCAym6WcNCaSbBZz92CQ4k71tJFdi8rihJvev9AuSJ+aiebPhy4sdvF/BpC
	JIeP9eHNc8xPocxkXSK1nT4kbzUFQVu9y0qTCtmaG2UgemVcgV/EiUjgwfMe2flSCaTb
	lpykD/L5JwjAJFs0xDpjorHbTkJKHcDTmatAmDGCaoPTqSkTv4u7YiayGTVHxWXyNQZy
	Yh4ypUFtirjj03LrQxwcLghf5GS3O8rIltoJaStzGlhdvXhEmeFu7c38rqmEY7ZEsa8u
	1pKA+714xfxHX/vcbEwBN7hWlcftbvF50DqUQUVwN5LgBhDn9iLokLGV710dQgn5RixZ
	XoeA==
MIME-Version: 1.0
Received: by 10.60.13.10 with SMTP id d10mr6276412oec.63.1344640287486; Fri,
	10 Aug 2012 16:11:27 -0700 (PDT)
Received: by 10.76.12.38 with HTTP; Fri, 10 Aug 2012 16:11:27 -0700 (PDT)
In-Reply-To: <20120810134245.GC14122@stefanha-thinkpad.localdomain>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
	<20120810134245.GC14122@stefanha-thinkpad.localdomain>
Date: Sat, 11 Aug 2012 09:11:27 +1000
Message-ID: <CAEgOgz7OwHJgKhgm=5VH9UomOr09XOQbDy5OgZx4DqnNj559gQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQn3cE/Wy5b4VYcwjTo/7BhUyXayWy55GpatYjq5zKirAaXp/+g83EzpqDjKgBJg5DpIGK2l
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
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
X-List-Received-Date: Fri, 10 Aug 2012 23:11:31 -0000

On Fri, Aug 10, 2012 at 11:42 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
>> The sizep arg is populated with the size of the loaded device tree. Since this
>> is one of those informational "please populate" type arguments it should be
>> optional. Guarded writes to *sizep against NULL accordingly.
>>
>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>> Acked-by: Alexander Graf <agraf@suse.de>
>> ---
>>  device_tree.c |    8 ++++++--
>>  1 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index d7a9b6b..641a48a 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>      int ret;
>>      void *fdt = NULL;
>>
>> -    *sizep = 0;
>> +    if (sizep) {
>> +        *sizep = 0;
>> +    }
>>      dt_size = get_image_size(filename_path);
>>      if (dt_size < 0) {
>>          printf("Unable to get size of device tree file '%s'\n",
>> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>              filename_path);
>>          goto fail;
>>      }
>> -    *sizep = dt_size;
>> +    if (sizep) {
>> +        *sizep = dt_size;
>> +    }
>
> What can the caller do with this void* buffer without knowing its size?
>

Sanity check the machine:

dtb = load_device_tree( ... ); //dont care how big it is
foo = fdt_gep_prop( dtb, ... );
if (foo != object_get_prop(foo_device, foo_prop, ... )) {
    hw_error("your dtb is bad because ... !\n", ... );
}
...
boot();

This happens at machine init, which is quite separate from boot.

> They cannot hand the buffer to the guest unless they duplicate the
> get_image_size() call, which is pointless, or we're assuming a fixed
> size, which is unsafe.  I'm asking what the legitimate use case for
> sizep == NULL is?

Sanity check the dtb without passing it to the guest. My CAD tools
emit a DTB for the hardware, but it wont always go through a linux
bootloader (E.G. I may want to boot random elfs). I still will pass
the CAD generated DTB to QEMU for sanity check however so qemu can
give me a nice report of what is and isn't modelled.

Regards,
Peter

>
> Stefan

