Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6i8v-0007hJ-5R
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jul 2014 11:26:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1X6i8n-0007Xp-Hi
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 11:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1X6i8h-0002vQ-Jf
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 11:26:09 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:201:233:1::3]:40060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1X6i8U-0002hN-Kl; Mon, 14 Jul 2014 11:25:50 -0400
Received: from blackfin.pond.sub.org (p5B3298D8.dip0.t-ipconnect.de
	[91.50.152.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id A76E52002B;
	Mon, 14 Jul 2014 17:25:48 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CA05B3043013; Mon, 14 Jul 2014 17:25:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
	<877g442kie.fsf@blackfin.pond.sub.org>
	<CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
Date: Mon, 14 Jul 2014 17:25:47 +0200
In-Reply-To: <CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
	(Peter Crosthwaite's message of "Mon, 14 Jul 2014 22:36:32 +1000")
Message-ID: <87fvi46jyc.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:201:233:1::3
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: remove memory
	regions from BAR before destroying them
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
X-List-Received-Date: Mon, 14 Jul 2014 15:26:15 -0000

Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:

> On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com> wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
>>> in memory_region_destroy:
>>>
>>>     (qemu) device_del gg
>>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021:
>>> memory_region_destroy: Assertion `((&mr->subregions)->tqh_first ==
>>> ((void *)0))' failed.
>>>     Aborted (core dumped)
>>>
>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Nominating for 2.1, just to be explicit.

[...]

