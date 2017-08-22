Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkBKm-0004JO-1z
	for mharc-qemu-trivial@gnu.org; Tue, 22 Aug 2017 11:43:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBKi-0004GK-Rw
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBKh-0003OK-Tk
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:43:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkBKb-0003Iu-0e; Tue, 22 Aug 2017 11:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD3D368C2;
	Tue, 22 Aug 2017 15:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AD3D368C2
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2B85C6DC;
	Tue, 22 Aug 2017 15:43:01 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster
	<armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
	<443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
	<CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06c16109-cdd2-0732-176d-6ec80b1f7f4e@redhat.com>
Date: Tue, 22 Aug 2017 17:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 22 Aug 2017 15:43:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
X-List-Received-Date: Tue, 22 Aug 2017 15:43:13 -0000

On 22.08.2017 17:30, Peter Maydell wrote:
> On 22 August 2017 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>> On 22.08.2017 17:12, Peter Maydell wrote:
>>> Why is our default "hotpluggable" rather than "not hotpluggable" ?
>>> We must have way more non-hotpluggable devices than hotpluggable
>>> ones, and it takes active effort to make a hotpluggable device
>>> model, so it seems like it would be much less bug-prone to
>>> require hotpluggable devices to set dc->hotpluggable true
>>> rather than all the non-hotpluggable ones to set it false...
>>
>> I think most devices are already non-hotpluggable automatically because
>> they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
>> problematic ones are the devices with .parent = TYPE_DEVICE. And for
>> these, I think it is quite hard to say whether they should be
>> hot-pluggable by default or not?
> 
> To implement hotplug you need to write extra code (notably some
> kind of unrealize method to undo whatever you did in realize),
> at which point also setting the hotpluggable flag is trivial.
> 
>> Anyway, according to my tests (I'm currently working on a test that
>> automatically does device_add + device_del for all devices, as you might
>> have guessed already), there are not that many devices that cause
>> problems here, so I guess marking some few with hotpluggable = false
>> should be OK?
> 
> The problem is not the devices we have today but the ones we're
> going to write tomorrow. Having hotpluggable default to false
> "fails safe" -- the worst that happens is that somebody writing
> a hotpluggable device finds in their testing that they need to
> set the flag to make it work. Having it default to true fails
> non-safely -- as you've found, people writing devices that
> were never expected to be hotplugged don't try to test the
> error case of attempting hotplug anyway, and in code review
> the absence of a line of code is very hard to reliably spot,
> so we get devices in tree that crash QEMU if you try to
> hotplug them. If we make the default be not-hotpluggable
> we fix this not just today but forever.

OK, you've got a point. I'll ponder about this a little bit and will try
to come up with a patch / some patches ...

 Thomas

