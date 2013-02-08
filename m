Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3tw0-0002bg-1S
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 14:48:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3tvx-0002Tw-Ea
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3tvv-0002XR-D7
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:48:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3tvs-0002WI-0h; Fri, 08 Feb 2013 14:48:24 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18JmKpj022466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 14:48:21 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18JmJie029539; Fri, 8 Feb 2013 14:48:19 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BE4DC200AA; Fri,  8 Feb 2013 20:48:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-2-git-send-email-armbru@redhat.com>
	<20130208154154.7bf7ab79@redhat.com>
	<87wquid48e.fsf@blackfin.pond.sub.org>
	<20130208171315.2fc46fb4@redhat.com>
Date: Fri, 08 Feb 2013 20:48:18 +0100
In-Reply-To: <20130208171315.2fc46fb4@redhat.com> (Luiz Capitulino's message
	of "Fri, 8 Feb 2013 17:13:15 -0200")
Message-ID: <87vca260zh.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Fri, 08 Feb 2013 19:48:30 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Fri, 08 Feb 2013 19:56:17 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Luiz Capitulino <lcapitulino@redhat.com> writes:
>> 
>> > On Fri,  8 Feb 2013 17:17:07 +0100
>> > Markus Armbruster <armbru@redhat.com> wrote:
>> >
>> >> The arguments of error_report() should yield a short error string
>> >> without newlines.
>> >> 
>> >> A few places try to print additional help after the error message by
>> >> embedding newlines in the error string.  That's nice, but let's do it
>> >> the right way.
>> >> 
>> >> Since I'm touching these lines anyway, drop a stray preposition and
>> >> some tabs.  We don't use tabs for similar messages elsewhere.
>> >> 
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> ---
>> >>  hw/kvm/pci-assign.c | 12 ++++++------
>> >>  1 file changed, 6 insertions(+), 6 deletions(-)
>> >> 
>> >> diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
>> >> index 896cfe8..da64b5b 100644
>> >> --- a/hw/kvm/pci-assign.c
>> >> +++ b/hw/kvm/pci-assign.c
>> >> @@ -936,8 +936,8 @@ retry:
>> >>              /* Retry with host-side MSI. There might be an IRQ conflict and
>> >>               * either the kernel or the device doesn't support sharing. */
>> >>              error_report("Host-side INTx sharing not supported, "
>> >> -                         "using MSI instead.\n"
>> >> -                         "Some devices do not to work properly in this mode.");
>> >> +                         "using MSI instead");
>> >> +            error_printf("Some devices do not work properly in this mode.\n");
>> >
>> > This is fixing command-line, right?
>> 
>> Whatever made assign_intx() run.  I'm not familiar with this code, and I
>> don't know how to trigger the error.
>> 
>> Hmm, one call chain is via PCIDeviceClass init method assigned_initfn().
>> So it could also be device_add.
>> 
>> > I honestly don't know which is less worse, the current code or having
>> > to call two different functions in the correct order to report an
>> > error :(
>> 
>> You call one function to report the error.  In the rare case that you
>> want to add some explanation or hint to the error message, you use
>> another function to print to the error destination.  Big deal :)
>
> I think the important point is not whether or not this is a big deal,
> but that this is a bad API which will break from time to time (as it's
> more or less the case now).

See the discussion we're having under PATCH 4/6.

>> Explanations and hints are *not* error messages.  Sticking them into the
>> error string like the code does before my patch happens to work due to
>> the way error_report() formats the error message.  Relying on that is
>> unclean.  Besides, error_report()'s function comment clearly stipulates
>> "no newlines".
>
> I agree.
>
> But regarding this patch, we first have to decide whether or not this is
> good for 1.4 and then we have to come with a better solution for this
> (post 1.4).
>
> Regarding the first point, I have to questions:
>
>  1. Were the additional newlines added in 1.4?

Both offending calls were added in commit c3ebd3ba during 1.3
development.

>  2. What's the worse case here?

"worse"?

It's a cleanup.  It's only user-visible effect is getting rid of an
extra newline on stderr.  I'm fixing those globally.  Tiny improvement
in user experience, but next to no risk, thus proposed for 1.4.  Since I
need to touch this call anyway for that, I can just as well clean up the
API abuse.  The alternative is to leave the abuse alone and just strip
the final newline.  That would make me sad.

If you hate the API, fix it.  Don't make me not fix abuses of it :)

