Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXswa-00014b-1q
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 10:58:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1YXswX-00011Y-Pa
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 10:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1YXswU-00084b-J1
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 10:58:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1YXswJ-00082k-Vh; Tue, 17 Mar 2015 10:57:52 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 65468C1F97;
	Tue, 17 Mar 2015 14:57:51 +0000 (UTC)
Received: from localhost (ovpn-113-187.phx2.redhat.com [10.3.113.187])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HEvo30027256; Tue, 17 Mar 2015 10:57:50 -0400
Date: Tue, 17 Mar 2015 11:57:49 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150317145749.GL3513@thinpad.lan.raisama.net>
References: <1426527232-15044-1-git-send-email-armbru@redhat.com>
	<20150316181357.GK3513@thinpad.lan.raisama.net>
	<87k2ygm6vq.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k2ygm6vq.fsf@blackfin.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 17 Mar 2015 14:58:07 -0000

On Tue, Mar 17, 2015 at 08:15:53AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Mon, Mar 16, 2015 at 06:33:52PM +0100, Markus Armbruster wrote:
> >> Doesn't work since commit 31bed55 changed qdev_device_help() to reject
> >> abstract devices and devices that have
> >> cannot_instantiate_with_device_add_yet set.
> >> 
> >> The former makes sense: abstract devices are purely internal, and the
> >> implementation of the help feature can't cope with them.
> >> 
> >> The latter makes less sense: the implementation works fine, and even
> >> though you can't -device such a device, the help may still be useful
> >> elsewhere, for instance with -global.
> >> 
> >> Revert the latter by moving the cannot_instantiate_with_device_add_yet
> >> check back to the other caller of qdev_get_device_class(),
> >> qdev_device_add().
> >
> > This reintroduces the following crash:
> >
> >   $ ./x86_64-softmmu/qemu-system-x86_64    -device host-x86_64-cpu,help
> >   qemu-system-x86_64: /home/ehabkost/rh/proj/virt/qemu/target-i386/cpu.c:1391: host_x86_cpu_initfn: Assertion `(kvm_allowed)' failed.
> >   Aborted (core dumped)
> >
> > And this (which is not x86-specific because other arches also call
> > cpu_exec_init() inside instance_init):
> >
> >   $ ./x86_64-softmmu/qemu-system-x86_64    -monitor stdio
> >   QEMU 2.2.50 monitor - type 'help' for more information
> >   (qemu) device_add Nehalem-x86_64-cpu,help
> >   Nehalem-x86_64-cpu.filtered-features=X86CPUFeatureWordInfo
> >   Nehalem-x86_64-cpu.feature-words=X86CPUFeatureWordInfo
> >   Nehalem-x86_64-cpu.apic-id=int
> >   Nehalem-x86_64-cpu.tsc-frequency=int
> >   Nehalem-x86_64-cpu.model-id=string
> >   Nehalem-x86_64-cpu.vendor=string
> >   Nehalem-x86_64-cpu.xlevel=int
> >   Nehalem-x86_64-cpu.level=int
> >   Nehalem-x86_64-cpu.stepping=int
> >   Nehalem-x86_64-cpu.model=int
> >   Nehalem-x86_64-cpu.family=int
> >   Nehalem-x86_64-cpu.kvm=bool
> >   Nehalem-x86_64-cpu.enforce=bool
> >   Nehalem-x86_64-cpu.check=bool
> >   Nehalem-x86_64-cpu.hv-time=bool
> >   Nehalem-x86_64-cpu.hv-vapic=bool
> >   Nehalem-x86_64-cpu.hv-relaxed=bool
> >   Nehalem-x86_64-cpu.hv-spinlocks=int
> >   Nehalem-x86_64-cpu.pmu=bool
> >   (qemu) Segmentation fault (core dumped)
> 
> I foolishly assumed that I can object_new() any device, so testing one
> with cannot_instantiate_with_device_add_yet was enough.  Thanks for
> paying attention.
> 
> We clearly need a test that object_new()s every known type.  Could this
> be done with -object?  Probably not if we want to catch known bad side
> effects.  Ideas?

The ones above are easy ones: one crashes QEMU immediately after
device_add, another one crashes QEMU immediately. But I would like to
find a way to catch the side effects we aren't even aware of. Does
anybody know some trick that would allow us to easily detect any memory
writes outside the object struct while running the instance_init
functions?

> 
> > Should we:
> >
> > 1) Live with the crashes until we move all code with side-effects outside
> >    instance_init (including bot not limited to cpu_exec_init() calls on most
> >    CPU classes);
> >
> > 2) add a "instance_init_is_unsafe" flag to those classes classes; or
> 
> To honor Anthony's long and distinguished service, we should name it
> cannot_even_create_with_object_new_yet ;-P
> 
> If my working idea "you can object_new() any type, and in fact you have
> to for introspection" is correct, then this as a stop gap, not a
> solution.  If it's not correct, please educate me.

Yes, this would be a stop gap. The problem is that the issue seems to
affect most CPU classes on most architectures, so we may take a while to
fix all of them.

I have just ran a script which tried "device_add $DEV,help" on all
no-user classes on qemu-system-x86_64, and the only crashes I've seen
were on the CPU classes. I think it's likely that we will need to set
the flag only on TYPE_CPU.

> 
> > 3) Keep the current code until we fix the classes that have unsafe
> >    instance_init functions?
> 
> The help regression is already in 2.2, which reduces the urgency of
> fixing it a bit.
> 
> Once we know which types's instance_init misbehave, (2) is easy.  (1)
> might be, can't say.

Well, (1) is the easiest solution, because it means doing nothing and
live with the crashes until we fix them. But the "fixing the crashes"
part may take a while.

> 
> "Until we fix" is potentially unbounded time, which makes me wary of
> both (1) and (3).  If we pick either of them now, and a fix doesn't
> appear during the next development cycle, I'd like us to switch to (2)
> as a stop gap for 2.4.

Makes sense to me.

-- 
Eduardo

