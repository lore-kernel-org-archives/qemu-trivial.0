Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3t7e-0004Py-CX
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 13:56:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3t7a-0004Fi-Vb
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3t7Z-00073e-40
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:56:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3t7W-00072s-9g; Fri, 08 Feb 2013 13:56:22 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18IuJmS006848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 13:56:19 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18IuI37020778; Fri, 8 Feb 2013 13:56:18 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 95886200AA; Fri,  8 Feb 2013 19:56:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-2-git-send-email-armbru@redhat.com>
	<20130208154154.7bf7ab79@redhat.com>
Date: Fri, 08 Feb 2013 19:56:17 +0100
In-Reply-To: <20130208154154.7bf7ab79@redhat.com> (Luiz Capitulino's message
	of "Fri, 8 Feb 2013 15:41:54 -0200")
Message-ID: <87wquid48e.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 1/6] error: Clean up error
	strings with embedded newlines
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
X-List-Received-Date: Fri, 08 Feb 2013 18:56:29 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Fri,  8 Feb 2013 17:17:07 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> The arguments of error_report() should yield a short error string
>> without newlines.
>> 
>> A few places try to print additional help after the error message by
>> embedding newlines in the error string.  That's nice, but let's do it
>> the right way.
>> 
>> Since I'm touching these lines anyway, drop a stray preposition and
>> some tabs.  We don't use tabs for similar messages elsewhere.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/kvm/pci-assign.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
>> index 896cfe8..da64b5b 100644
>> --- a/hw/kvm/pci-assign.c
>> +++ b/hw/kvm/pci-assign.c
>> @@ -936,8 +936,8 @@ retry:
>>              /* Retry with host-side MSI. There might be an IRQ conflict and
>>               * either the kernel or the device doesn't support sharing. */
>>              error_report("Host-side INTx sharing not supported, "
>> -                         "using MSI instead.\n"
>> -                         "Some devices do not to work properly in this mode.");
>> +                         "using MSI instead");
>> +            error_printf("Some devices do not work properly in this mode.\n");
>
> This is fixing command-line, right?

Whatever made assign_intx() run.  I'm not familiar with this code, and I
don't know how to trigger the error.

Hmm, one call chain is via PCIDeviceClass init method assigned_initfn().
So it could also be device_add.

> I honestly don't know which is less worse, the current code or having
> to call two different functions in the correct order to report an
> error :(

You call one function to report the error.  In the rare case that you
want to add some explanation or hint to the error message, you use
another function to print to the error destination.  Big deal :)

Explanations and hints are *not* error messages.  Sticking them into the
error string like the code does before my patch happens to work due to
the way error_report() formats the error message.  Relying on that is
unclean.  Besides, error_report()'s function comment clearly stipulates
"no newlines".

> I'd say the best solution for this would be to propagate errors, but this
> will loose LOC support.

I'm unwilling to degrade error message quality even further.

