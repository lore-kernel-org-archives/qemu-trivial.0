Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC5GU-00047G-5F
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 12:30:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hC5GR-00046m-Of
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hC5GQ-0006df-N0
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:30:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hC5GO-0006To-3C; Thu, 04 Apr 2019 12:30:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0795F307E054;
	Thu,  4 Apr 2019 16:30:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76CBE5D9C4;
	Thu,  4 Apr 2019 16:30:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C5E751138648; Thu,  4 Apr 2019 18:30:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Paolo
	Bonzini <pbonzini@redhat.com>,  qemu-devel@nongnu.org,  "Michael S.
	Tsirkin" <mst@redhat.com>,  qemu-trivial@nongnu.org
References: <20190404071421.4891-1-thuth@redhat.com>
	<298ccbd7-9af5-8303-e42b-33dd1cb94b9e@redhat.com>
	<158fe22a-5781-73e5-5955-2fe9db019236@redhat.com>
	<3ba3c765-589f-4c0a-38dc-d9126f515e7b@redhat.com>
Date: Thu, 04 Apr 2019 18:30:43 +0200
In-Reply-To: <3ba3c765-589f-4c0a-38dc-d9126f515e7b@redhat.com> (Thomas Huth's
	message of "Thu, 4 Apr 2019 16:19:27 +0200")
Message-ID: <87lg0p4tsc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 04 Apr 2019 16:30:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/pckbd: The i8042
 device should not be user_creatable
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 16:30:57 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 04/04/2019 15.29, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 4/4/19 12:07 PM, Paolo Bonzini wrote:
>>> On 04/04/19 09:14, Thomas Huth wrote:
>>>> The i8042 PS/2 controller is part of the chipset on the motherboard.
>>>> It is instantiated by the machine init code, and it does not make sense
>>>> to allow the user to plug an additional i8042 in any of the free ISA s=
lots.
>>>> Thus let's mark the device with user_creatable =3D false.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  hw/input/pckbd.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> user_creatable is not for devices that are not pluggable in real life;
>>> it is for devices that crash QEMU (!) or always fail if plugged by the =
user.
>
> ... hmm, but presenting devices to the user that are clearly not
> intended for direct use is also not very nice, is it?

Maybe, but hiding them should be separate from marking devices that
still defeat device_add.

In the ideal world, we'd be able to start with an empty board, then
build a machine with by wiring together devices.  Say like use
device_add to create and plug into parent bus, qom-set link properties
to create additional wires.

Plenty of devices fail at the device_add stage, or require additional
wiring by code.  These are marked not user_creatable.

See also commit e90f2a8c3e0e677eeea46a9b401c3f98425ffa37.

>>> So the question to ask is: would it make sense, and especially work, to
>>> add an i8042 to machines that do have an ISA bridge (for example the Al=
pha?)

Scratch the "would it make sense" part, keep the "would it work" part.

> I don't think so. It is a device that is supposed to be part of the
> chipset on the motherboard, so operating systems certainly don't know
> how to use this device on other machines.
>
> And at least some part of the device have to be set up in source code
> (see e.g. i8042_setup_a20_line() ...).

If (and only if) the parts that need code are essential to the
functioning the device, it should be marked not user_creatable.

>> Correct me if I'm wrong but it seems no machine directly use a 8042 on a
>> ISA bus, it is always part of a SuperIO chipset. It is not reflected in
>> the code (in particular the X86 machines, but I'm working on cleaning th=
is).

Known issue: we model a bunch of x86 devices as ISA devices, even though
they're actually part of a super i/o device connected via LPC bus.

[...]

