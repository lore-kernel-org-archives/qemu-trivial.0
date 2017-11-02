Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAJjL-0003Hr-LR
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 13:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJjJ-0003F8-7L
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJjI-0006Lz-Dj
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:56:37 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:60030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1eAJjD-0006Jw-NA; Thu, 02 Nov 2017 13:56:31 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 18:56:29 +0100
Received: from [192.168.2.155] (nwb-a10-snat.microfocus.com [10.120.13.201])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 17:56:17 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20171102171846.21445-1-lyan@suse.com>
	<CAFEAcA8JDVKBE1pFssTwFTybT=Kamc+_ra8qRF-DGSpb7=7QZA@mail.gmail.com>
From: Liang Yan <lyan@suse.com>
Message-ID: <ae49a923-5f9f-e0ac-3633-896f6f26c087@suse.com>
Date: Thu, 2 Nov 2017 13:56:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:56.0) Gecko/20100101
	Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8JDVKBE1pFssTwFTybT=Kamc+_ra8qRF-DGSpb7=7QZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.135.221.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/display/xenfb:
 Simulate auto-repeat key events
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
X-List-Received-Date: Thu, 02 Nov 2017 17:56:38 -0000

Thanks for the reply.

On 11/2/17 1:26 PM, Peter Maydell wrote:
> On 2 November 2017 at 17:18, Liang Yan <lyan@suse.com> wrote:
>> New tigervnc changes the way to send long pressed key,
>> from "down up down up ..." to "down down ... up", it only
>> affects xen pv console mode. I send a patch to latest
>> kernel side, but it may have a fix in qemu backend for
>> back compatible becase guest VMs may use very old kernel.
>> This patch inserts an up event after each regular key down
>> event to simulate an auto-repeat key event for xen keyboard
>> frontend driver.
>>
>> Signed-off-by: Liang Yan <lyan@suse.com>
>> ---
>> v2:
>> - exclude extended key
>> - change log comment
>>
>>  hw/display/xenfb.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>> index 8e2547ac05..1bc5b41ab7 100644
>> --- a/hw/display/xenfb.c
>> +++ b/hw/display/xenfb.c
>> @@ -292,6 +292,11 @@ static void xenfb_key_event(void *opaque, int scancode)
>>      }
>>      trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
>>      xenfb_send_key(xenfb, down, scancode2linux[scancode]);
>> +
>> +    /* insert an up event for regular down key event */
>> +    if (down && !xenfb->extended) {
>> +        xenfb_send_key(xenfb, 0, scancode2linux[scancode]);
>> +    }
>>  }
> This doesn't look to me like the right place to fix this bug.
> The xenfb key event handler is just one QEMU keyboard backend
> (in a setup where there are many possible sources of keyboard
> events: vnc, gtk, SDL, cocoa UI frontends; and many possible
> sinks: xenfb's key handling, ps2 keyboard emulator, etc etc).
QEMU actually just forwards what it receives(vnc,sdl) to different
backend handler, usually those front and back(device) end will work
together to handle those events. For this one, it could and should be
fixed in front-end driver, but there are so many different guest kernel,
especially for those old versions, it would be totally a pain. That is
why I came back to backend side. BTW, I saw same logic in other places
of qemu too.    

Best,
Liang
> We need to be clear in our definition of generic QEMU key
> events how key repeat is supposed to be handled, and then
> every consumer and every producer needs to follow that.
> In the specific case of the vnc UI frontend, we need to
> also look at what the VNC protocol specifies for key repeat.
> That then tells us whether the bug to be fixed is in QEMU,
> or in a particular VNC client.
>
> thanks
> -- PMM
>
>


