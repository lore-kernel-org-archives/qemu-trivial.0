Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3oMK-0000J1-GN
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 08:51:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3oMB-0008Ls-KF
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 08:51:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3oM7-0003O9-0I
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 08:51:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3oLz-0003MM-Is; Fri, 08 Feb 2013 08:50:59 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18Dovxu029411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 08:50:57 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18Dou6c009129; Fri, 8 Feb 2013 08:50:56 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 866C8200AA; Fri,  8 Feb 2013 14:50:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
	<1360325749-1989-2-git-send-email-armbru@redhat.com>
	<CAFEAcA8XZ7AP0BL79vCfT7i3CwTQRTMFnAeVx4-7y-EPeji-hA@mail.gmail.com>
Date: Fri, 08 Feb 2013 14:50:55 +0100
In-Reply-To: <CAFEAcA8XZ7AP0BL79vCfT7i3CwTQRTMFnAeVx4-7y-EPeji-hA@mail.gmail.com>
	(Peter Maydell's message of "Fri, 8 Feb 2013 12:46:03 +0000")
Message-ID: <87wquirk1s.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.4 1/6] error: Clean up
	error strings with embedded newlines
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
X-List-Received-Date: Fri, 08 Feb 2013 13:51:19 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 8 February 2013 12:15, Markus Armbruster <armbru@redhat.com> wrote:
>> The arguments of error_report() should yield a short error string
>> without newlines.
>>
>> A few places try to print additional help after the error message by
>> embedding newlines in the error string.  That's nice, but let's do it
>> the right way.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/kvm/pci-assign.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
>> index 896cfe8..c31a7f2 100644
>> --- a/hw/kvm/pci-assign.c
>> +++ b/hw/kvm/pci-assign.c
>> @@ -936,8 +936,8 @@ retry:
>>              /* Retry with host-side MSI. There might be an IRQ conflict and
>>               * either the kernel or the device doesn't support sharing. */
>>              error_report("Host-side INTx sharing not supported, "
>> -                         "using MSI instead.\n"
>> -                         "Some devices do not to work properly in this mode.");
>> +                         "using MSI instead");
>> +            error_printf("Some devices do not to work properly in this mode.");
>
> "do not work properly"

Since I'm touching the line anyway...

>>              dev->features |= ASSIGNED_DEVICE_PREFER_MSI_MASK;
>>              goto retry;
>>          }
>> @@ -1903,10 +1903,10 @@ static void assigned_dev_load_option_rom(AssignedDevice *dev)
>>      memset(ptr, 0xff, st.st_size);
>>
>>      if (!fread(ptr, 1, st.st_size, fp)) {
>> -        error_report("pci-assign: Cannot read from host %s\n"
>> -                     "\tDevice option ROM contents are probably invalid "
>> +        error_report("pci-assign: Cannot read from host %s", rom_file);
>> +        error_printf("\tDevice option ROM contents are probably invalid "
>>                       "(check dmesg).\n\tSkip option ROM probe with rombar=0, "
>> -                     "or load from file with romfile=", rom_file);
>> +                     "or load from file with romfile=\n");
>
> So should error_printf() strings end with \n or not? This one does,
> the one in the hunk above doesn't...

The hunk above is a bug.  Will fix.

> (also we should probably either drop those \t indents or have
> error_printf() add them automatically or otherwise indicate that
> this is followon additional info about a previous error.)

error_printf() is just like printf(), except it prints to wherever error
messages go.  In fact, error_report() uses error_printf() to print.

We could have an API to for emitting helpful text after an error
message.  Its implementation could print the text indented, if we so
desire.  I doubt it's really worthwhile.

Since this is the only place that indents text following an error
message, let's just drop the tabs.

Thanks!

