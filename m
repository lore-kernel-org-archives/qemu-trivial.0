Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfA3G-0007LT-Ig
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2013 10:30:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UfA39-0007KX-Ec
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 10:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UfA34-0008L8-E9
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 10:29:55 -0400
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:59240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UfA33-0008Kp-PB
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 10:29:50 -0400
Received: from /spool/local
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Thu, 23 May 2013 11:27:09 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 23 May 2013 11:27:07 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 4EAF9357804E;
	Thu, 23 May 2013 00:29:45 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4MEFaf423658572; Thu, 23 May 2013 00:15:36 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4METicV020429; Thu, 23 May 2013 00:29:44 +1000
Received: from titi.na.relay.ibm.com (sig-9-65-241-117.mts.ibm.com
	[9.65.241.117])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4METaFv020285; Thu, 23 May 2013 00:29:38 +1000
From: Anthony Liguori <aliguori@us.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
	<CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 22 May 2013 09:29:35 -0500
Message-ID: <87y5b7hyuo.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052301-3568-0000-0000-000003A7FA12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.142
Cc: John Rigby <john.rigby@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema.json: Reformat
	TargetType enum to one-per-line
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
X-List-Received-Date: Wed, 22 May 2013 14:30:01 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 22 May 2013 14:15, Anthony Liguori <aliguori@us.ibm.com> wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>> You
>>> don't need to know what targets were supported in the version that you
>>> compiled from.  Only one target is supported in this executable
>>> anyway.
>>
>> It seems useful to me.  One day we may support multiple targets per
>> executable.
>
> Why would you care about which architectures the executable supports?
> What you actually want to know is which machine models are supported;
> whether board foo happens to be ARM or PPC isn't really very interesting
> IMHO.

That's a very good point.  It was the libvirt folks that requested
this.  Perhaps they can shed some light on the logic?

Regards,

Anthony Liguori

>
> -- PMM


