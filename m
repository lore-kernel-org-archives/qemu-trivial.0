Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXljT-0006Md-S2
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 03:16:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXljR-0006J7-MR
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 03:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXljQ-0003HH-IM
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 03:16:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXljK-0003G3-6l; Tue, 17 Mar 2015 03:15:58 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2H7Fv8c016326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 03:15:57 -0400
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2H7FsPg006706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Mar 2015 03:15:56 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C17C03042B6D; Tue, 17 Mar 2015 08:15:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1426527232-15044-1-git-send-email-armbru@redhat.com>
	<20150316181357.GK3513@thinpad.lan.raisama.net>
Date: Tue, 17 Mar 2015 08:15:53 +0100
In-Reply-To: <20150316181357.GK3513@thinpad.lan.raisama.net> (Eduardo
	Habkost's message of "Mon, 16 Mar 2015 15:13:57 -0300")
Message-ID: <87k2ygm6vq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Make -device FOO,
	help help again when FOO is not pluggable
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
X-List-Received-Date: Tue, 17 Mar 2015 07:16:07 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, Mar 16, 2015 at 06:33:52PM +0100, Markus Armbruster wrote:
>> Doesn't work since commit 31bed55 changed qdev_device_help() to reject
>> abstract devices and devices that have
>> cannot_instantiate_with_device_add_yet set.
>> 
>> The former makes sense: abstract devices are purely internal, and the
>> implementation of the help feature can't cope with them.
>> 
>> The latter makes less sense: the implementation works fine, and even
>> though you can't -device such a device, the help may still be useful
>> elsewhere, for instance with -global.
>> 
>> Revert the latter by moving the cannot_instantiate_with_device_add_yet
>> check back to the other caller of qdev_get_device_class(),
>> qdev_device_add().
>
> This reintroduces the following crash:
>
>   $ ./x86_64-softmmu/qemu-system-x86_64    -device host-x86_64-cpu,help
>   qemu-system-x86_64: /home/ehabkost/rh/proj/virt/qemu/target-i386/cpu.c:1391: host_x86_cpu_initfn: Assertion `(kvm_allowed)' failed.
>   Aborted (core dumped)
>
> And this (which is not x86-specific because other arches also call
> cpu_exec_init() inside instance_init):
>
>   $ ./x86_64-softmmu/qemu-system-x86_64    -monitor stdio
>   QEMU 2.2.50 monitor - type 'help' for more information
>   (qemu) device_add Nehalem-x86_64-cpu,help
>   Nehalem-x86_64-cpu.filtered-features=X86CPUFeatureWordInfo
>   Nehalem-x86_64-cpu.feature-words=X86CPUFeatureWordInfo
>   Nehalem-x86_64-cpu.apic-id=int
>   Nehalem-x86_64-cpu.tsc-frequency=int
>   Nehalem-x86_64-cpu.model-id=string
>   Nehalem-x86_64-cpu.vendor=string
>   Nehalem-x86_64-cpu.xlevel=int
>   Nehalem-x86_64-cpu.level=int
>   Nehalem-x86_64-cpu.stepping=int
>   Nehalem-x86_64-cpu.model=int
>   Nehalem-x86_64-cpu.family=int
>   Nehalem-x86_64-cpu.kvm=bool
>   Nehalem-x86_64-cpu.enforce=bool
>   Nehalem-x86_64-cpu.check=bool
>   Nehalem-x86_64-cpu.hv-time=bool
>   Nehalem-x86_64-cpu.hv-vapic=bool
>   Nehalem-x86_64-cpu.hv-relaxed=bool
>   Nehalem-x86_64-cpu.hv-spinlocks=int
>   Nehalem-x86_64-cpu.pmu=bool
>   (qemu) Segmentation fault (core dumped)

I foolishly assumed that I can object_new() any device, so testing one
with cannot_instantiate_with_device_add_yet was enough.  Thanks for
paying attention.

We clearly need a test that object_new()s every known type.  Could this
be done with -object?  Probably not if we want to catch known bad side
effects.  Ideas?

> Should we:
>
> 1) Live with the crashes until we move all code with side-effects outside
>    instance_init (including bot not limited to cpu_exec_init() calls on most
>    CPU classes);
>
> 2) add a "instance_init_is_unsafe" flag to those classes classes; or

To honor Anthony's long and distinguished service, we should name it
cannot_even_create_with_object_new_yet ;-P

If my working idea "you can object_new() any type, and in fact you have
to for introspection" is correct, then this as a stop gap, not a
solution.  If it's not correct, please educate me.

> 3) Keep the current code until we fix the classes that have unsafe
>    instance_init functions?

The help regression is already in 2.2, which reduces the urgency of
fixing it a bit.

Once we know which types's instance_init misbehave, (2) is easy.  (1)
might be, can't say.

"Until we fix" is potentially unbounded time, which makes me wary of
both (1) and (3).  If we pick either of them now, and a fix doesn't
appear during the next development cycle, I'd like us to switch to (2)
as a stop gap for 2.4.

