Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9vm0-0005n1-JR
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2012 05:54:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9vlx-0005ci-DM
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2012 05:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9vlv-0005Lp-FL
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2012 05:54:32 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:59684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9vlo-0005K3-2W; Tue, 20 Mar 2012 05:54:24 -0400
Received: by lbon3 with SMTP id n3so4182408lbo.4
	for <multiple recipients>; Tue, 20 Mar 2012 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QhAdKtrTcAJjn3LtKh011sOvgLAH19S4jfuLhvWnywQ=;
	b=b8XoB4XYBj2mOkS4sGpVnq2I7Vc/ru/kDbVa/pPCdjCG/iAyXuG9zXRLLr498NOw6c
	veZuJGusjjeZ6wxgMbTx49KA9TawZ+a8KQPJZsB8+llNHjkc2XehKaUAUQitD0aWEGyk
	KLzzD3HD5TaV99LQ4ooEv3I5XMtAtIwH3Fhr2eErnfK70tb/0QBImPWIuHrr62Jn+oPX
	3dpZ9qQfzoFG4XQE8hIhKeqZO4VhXdUhc0P0LpOzKZRuhMYRPHXYH81JLZky0iGtskt1
	sgcRhhOodDICK5atNG1eHE35y5IBIg9KST793l9SXQy5CtSx6X9joGC2s5cUHo7Cmcrq
	d09Q==
MIME-Version: 1.0
Received: by 10.112.46.202 with SMTP id x10mr5718973lbm.39.1332237260969; Tue,
	20 Mar 2012 02:54:20 -0700 (PDT)
Received: by 10.112.63.132 with HTTP; Tue, 20 Mar 2012 02:54:20 -0700 (PDT)
In-Reply-To: <20120320004206.GB22089@truffala.fritz.box>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
Date: Tue, 20 Mar 2012 09:54:20 +0000
Message-ID: <CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: anthony@codemonkey.ws
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Rusty Russell <rusty@rustcorp.com.au>, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
	virtio balloon device
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
X-List-Received-Date: Tue, 20 Mar 2012 09:54:35 -0000

On Tue, Mar 20, 2012 at 12:42 AM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Mon, Mar 19, 2012 at 11:33:10AM +0000, Stefan Hajnoczi wrote:
>> On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
>> > Currently the virtio balloon device, when using the virtio-pci interfa=
ce
>> > advertises itself with PCI class code MEMORY_RAM. =A0This is wrong; th=
e
>> > balloon is vaguely related to memory, but is nothing like a PCI memory
>> > device in the meaning of the class code, and this code is not required=
 or
>> > suggested by the virtio PCI specification.
>> >
>> > Worse, this patch causes problems on the pseries machine, because the
>> > firmware, seeing this class code, advertises the device as memory in t=
he
>> > device tree, and then a guest kernel bug causes it to see this "memory=
"
>> > before the real system memory, leading to a crash in early boot.
>> >
>> > This patch fixes the problem by removing the bogus PCI class code on t=
he
>> > balloon device.
>> >
>> > Cc: Michael S. Tsirkin <mst@redhat.com>
>> > Cc: Rusty Russell <rusty@rustcorp.com.au>
>> >
>> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> > ---
>> > =A0hw/virtio-pci.c | =A0 =A02 +-
>> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> Since this is a guest-visible change we might need to be careful about
>> how it's introduced.
>>
>> Do we need to keep the old class code for existing machine types? =A0The
>> new class code could be introduced only for 1.1 and later machine types
>> if we want to be extra careful about introducing guest-visible
>> changes.
>
> So as a general rule, I like to be very careful about user-visible
> changes. =A0But in this case, I don't think we want to be too hesitant.
> In particular, it's not just a question of the machine type, but also
> of how the guest OS will deal with the PCI class code.
>
> The class code we were using was Just Plain Wrong. =A0It was not
> suggetsed by the virtio spec, and it makes no sense. =A0It happens that
> so far this caused problems only for a guest on a particular machine
> type, but there's no reason it couldn't cause (different) problems for
> guests on any machine type.
>
> More to the point, it seems reasonably unlikely for existing guests to
> rely on the broken behaviour: again, there's no reason they'd think
> they need to based on the spec, and the usual way of matching drivers
> to PCI devices is with the vendor/device IDs which are correct and not
> changed by this patch.
>
> So, unless we have a known example of an existing guest that would be
> broken by this change, I think we should implement it ASAP for all
> machine types.

I agree that in practice the risk is low because working guests are
probably not using the class code.  On the other hand I don't see a
downside to making this part of the 1.1 machine type, which is what
users will run when they get this code change anyway.  That way we can
tell users that we never change the device model in a release with a
straight face :).

Anthony: I'm not sure how strict we are about a user-visible change like th=
is?

Stefan

