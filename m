Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgDdS-000541-0F
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 08:31:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgDdO-0004zE-NG
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 08:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgDdN-0003im-M3
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 08:31:42 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56290 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UgDdJ-0003ho-9q; Sat, 25 May 2013 08:31:37 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D6ABFA51B7;
	Sat, 25 May 2013 14:31:35 +0200 (CEST)
Message-ID: <51A0AF24.3020704@suse.de>
Date: Sat, 25 May 2013 14:31:32 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
	<CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
	<87y5b7hyuo.fsf@codemonkey.ws> <519FDDBD.7030201@redhat.com>
	<CAFEAcA-pQXbnwUy_=HOA3JLriT4uz7vP-srNUKeXB6bYBxCj0w@mail.gmail.com>
In-Reply-To: <CAFEAcA-pQXbnwUy_=HOA3JLriT4uz7vP-srNUKeXB6bYBxCj0w@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, Libvirt <libvir-list@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [libvirt] [PATCH] qapi-schema.json:
 Reformat TargetType enum to one-per-line
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
X-List-Received-Date: Sat, 25 May 2013 12:31:44 -0000

Am 25.05.2013 11:18, schrieb Peter Maydell:
> On 24 May 2013 22:38, Eric Blake <eblake@redhat.com> wrote:
>> I think knowing the architecture (such as x86 vs. pseries ppc) is used
>> by libvirt to know what default devices the board supports (for exampl=
e,
>> whether usb is present by default).
>=20
> ...but this is a per-board question, since (for instance) some
> ARM boards have USB and some do not, some have PCI and some
> do not, and so on.

If we look beyond what we have at the moment, then Anthony has been
promoting the idea of having boards potentially be just a config file
wiring up QOM devices. I.e., the distro or user would be able to have
random boards with a number of devices on them.

In that very general case, much like our boards today, the question of
can-I-attach-a-certain-device-on-a-bus becomes: Can a solver come up
with a path from any device on the board to a device exposing the
required bus.
E.g., if there is either some USB host interface on SysBus or a PCI host
bridge and either a PCI-USB bridge plugged or available to plug, USB
devices can be offered - which would then dynamically rule out
s390-virtio and s390-ccw-virtio without hardcoding anything in libvirt.

Problem is, our devices often have no static way of telling what busses
they will/may provide*, so instantiating would often be the only way to
find out.

* Well, pci-host-bridge as base type might indicate PCIBus to a human,
but ISABus, USBBus and other bridges have non-telling base types.

>> There's probably still room for
>> improvement for communication between libvirt and qemu on what exactly
>> is being supported, and knowing an architecture type may be too broad =
of
>> a knob compared to what is really wanted, except that I don't have a
>> good handle on what is really wanted.

Knowing the provided architecture would today give us hints what -cpu
options may be supported. That becomes moot in a future
multi-architecture case though, where devices might be constructed from
config or some generic object-create QMP command with qom-set for device
options.

> It does sound like we could use a more specific enquiry mechanism.

Ack, but sadly qemu-system-foo -M bar -S + qom-list + qom-list-types is
the most accurate interface I can think of today.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

