Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duerS-0002pa-LS
	for mharc-qemu-trivial@gnu.org; Wed, 20 Sep 2017 09:16:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1duerP-0002ml-RS
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 09:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1duerL-0000xK-Dq
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 09:16:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32497)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1duer8-0000qT-RN; Wed, 20 Sep 2017 09:15:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 587E37EA8F;
	Wed, 20 Sep 2017 11:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 587E37EA8F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.62] (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A979060BE2;
	Wed, 20 Sep 2017 11:57:22 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1495613046-6430-1-git-send-email-thuth@redhat.com>
	<5e647277-d688-071d-7def-bd8d57dd7e66@redhat.com>
	<deb2e9b4-686d-1a5a-0aba-0c404183ae9a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6518e022-d9ef-5cf6-625b-9cbd7c106d2e@redhat.com>
Date: Wed, 20 Sep 2017 13:57:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <deb2e9b4-686d-1a5a-0aba-0c404183ae9a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 20 Sep 2017 11:57:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Mark the 'hubport'
 netdev as deprecated
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
X-List-Received-Date: Wed, 20 Sep 2017 13:16:17 -0000

On 20.09.2017 13:07, Paolo Bonzini wrote:
> On 20/09/2017 09:45, Thomas Huth wrote:
>> On 24.05.2017 10:04, Thomas Huth wrote:
>>> The 'hubport' netdev is closely tied to the 'vlan' concept which
>>> has been marked as deprecated in commit a2dbe1356faff3cb6 already.
>>> Thus we should also mark the hubport netdevs as deprecated to make
>>> the remaining users aware that they should not use this anymore.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> What is the replacement for VLANs?
>=20
> The point of hub/hubport was to implement this without needing
> special-casing of VLANs everywhere in the net/ directory.  VLANs remain
> messy in terms of command-line expression for -net, but that's where th=
e
> problems end.

The QEMU "VLAN"s are a complete PITA for the users, they are causing
confusion (e.g. https://bugs.launchpad.net/qemu/+bug/658904) and
mis-configurations (see e.g.
http://lists.gnu.org/archive/html/qemu-discuss/2017-08/msg00031.html).
So I hope you agree that we should get rid of this "vlan" stuff in QEMU
(no matter whether we continue to provide some kind of "hub" or "switch"
instead or completely remove it).

> In fact, while there are some uses of VLANs that have been replaced by
> filters, VLANs are still needed to place 2 NICs to be on the same guest
> network without using a host bridge.  This should be a supported use
> case for e.g. L2TP backends, and it can be important for users that
> don't have the ability to configure a host bridge.

I don't think that anybody really wants to connect two NICs of one
machine to a *hub* - all the network traffic of one NIC will go to the
other, too! That might only make sense if you want to do some basic
network driver tests in your guest, but for every normal OS, this is
nonsense. You normally are also not doing this with real hardware (note
that we're talking about hubs, not switches!).

> Rather than deprecating hubport, we need a mechanism to define a hubpor=
t
> for the back-end side.  For example:
>=20
>    -netdev l2tp,...,id=3Dl2tp-backend
>    -netdev hubport,hubid=3D0,netdev=3Dl2tp-backend,id=3Dl2tp-hub
>    -netdev hubport,hubid=3D0,id=3Dnic0 -device virtio-net-pci,netdev=3D=
nic0
>    -netdev hubport,hubid=3D0,id=3Dnic1 -device virtio-net-pci,netdev=3D=
nic1
>=20
> This would normalize the topology
>=20
>    NIC      NIC      L2TP
>     |        |        |
>    hubport  hubport   |
>     |        |        |
>     '--------'--------'-------- hub
>=20
> to
>=20
>    NIC      NIC      L2TP
>     |        |        |
>    hubport  hubport  hubport
>     |        |        |
>     '--------'--------'-------- hub
>=20
> and would let us drop vlan from the command-line options.  Even
> immediately in 2.11.

While that looks at least way more logical than the "vlan" parameter, I
really doubt that we need a *hub* within QEMU. Emulating a switch might
make at least a little bit more sense ... but still, do we really need
this? Do you have any real world example where somebody is using QEMU
for a configuration like this?

 Thomas


PS: Or are you just afraid that we might finally get rid of the short
"-net nic -net tap" syntax, which is way easier to type than its -netdev
equivalent? Well, I'd say that's a different topic, and we should come
up with a new convenience option instead before we remove the old one.

