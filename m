Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrMaS-0005nU-GP
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jun 2013 02:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UrMaP-0005mh-7q
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 02:18:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UrMaN-0002vG-Tc
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 02:18:41 -0400
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b]:39095)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UrMaN-0002v2-Mb; Tue, 25 Jun 2013 02:18:39 -0400
Received: by mail-ee0-f43.google.com with SMTP id l10so6484632eei.30
	for <multiple recipients>; Mon, 24 Jun 2013 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Rx9R2q/Ei3eMvwPwmdmk6/40BAQL1Bba2rszgDPwVbs=;
	b=QrcStJv32Rd80TqChK3hTYMyJ2QcSQ5AxSYizvuS0WLx+KQHudHv0U1sPMh7b2xEAT
	h7flJaxKX0BcIGcfUD7PXdakKf6wmhWxssThWaIM1bhRZa/kojgp+Lus/+UBC7eoi8oh
	WoRz0DJ3HN2YDpzSRyFEaBa/C/5YILQ8B6F3J8VHoIun8gTZ87sSG2o/6uobs09lKjzk
	f74JPu2jGZVOcQ0Yn6OUXHgynqVcAA69fY9OEdNhpxFQaE2NEVZ+HWcqWAOw9KJs66He
	mlXJ2ZGb8sfBu5JV/+fofPgVylUgBqOSWCKI+bCRKuK8xwZLWRNdvHuwI6DKEOlsxXpQ
	8ZmQ==
X-Received: by 10.15.111.135 with SMTP id cj7mr18646391eeb.144.1372141118809; 
	Mon, 24 Jun 2013 23:18:38 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id
	e44sm33386898eeh.11.2013.06.24.23.18.36 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 23:18:37 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51C93639.6000907@redhat.com>
Date: Tue, 25 Jun 2013 08:18:33 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51C8B6EF.5070108@redhat.com>
	<CAFEAcA9e212aEL2O-oqKmEMO-cj9o+x_RHTXryyDVg73UhmV3w@mail.gmail.com>
In-Reply-To: <CAFEAcA9e212aEL2O-oqKmEMO-cj9o+x_RHTXryyDVg73UhmV3w@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Tue, 25 Jun 2013 06:18:43 -0000

Il 24/06/2013 23:30, Peter Maydell ha scritto:
> On 24 June 2013 22:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Il 24/06/2013 21:21, Ed Maste ha scritto:
>>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>>> ---
>>> I have had this in a local tree for some time, and it is needed by the
>>> BSD-user work that is now being proposed.
>>
>> At this time, qemu/tls.h is really just for cpu_single_env, so I think
>> this patch should be applied together with the bsd-user patches that
>> need it.
> 
> This patch has arrived because I suggested splitting it out from
> those ;-) System mode qemu is multi-threaded, so moving more host
> OSes into the fold of "these variables behave like the linux host
> which is where the bulk of testing happens" sounds like a good idea
> to me.

Ah. :)

>>> As an aside, an abstraction was recently proposed for Open vSwtich that
>>> can use any of _Thread_local, __thread, or pthread_getspecific() which
>>> may make a convenient reference for someone wishing to implement one of
>>> the TODOs: http://openvswitch.org/pipermail/dev/2013-June/028665.html
>>
>> I and Stefan Hajnoczi have almost the same idea implemented in QEMU
>> (except that get_foo() returns a pointer to the variable).  But
>> pthread_get/setspecific would be too slow for cpu_single_env, so we're
>> just switching to __thread for cpu_single_env (for Linux in our patches,
>> but you can add FreeBSD too once it's needed).
> 
> I would really like cpu_single_env (and the other thread variables)
> to have consistent semantics everywhere (which means "always thread
> local"), even if that means "sometimes suboptimal performance".
> Reasoning about a variable that might or might not be per-thread
> is just painful. Alternatively, we could just drop support for any
> host OS that doesn't provide reasonably efficient per-thread data.

That is basically only OpenBSD.  If we get reasonable support for
FreeBSD, I'm perfectly fine with dropping OpenBSD.  But so far OpenBSD
was the only officially supported variant.

Paolo

