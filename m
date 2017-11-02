Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAJvw-0007yM-Q9
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 14:09:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJvu-0007wn-6r
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 14:09:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJvt-0003w3-4B
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 14:09:38 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:37780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1eAJvn-0003pS-FK; Thu, 02 Nov 2017 14:09:31 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 19:09:29 +0100
Received: from [192.168.2.155] (nwb-a10-snat.microfocus.com [10.120.13.201])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 18:09:17 +0000
To: "Daniel P. Berrange" <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20171102171846.21445-1-lyan@suse.com>
	<CAFEAcA8JDVKBE1pFssTwFTybT=Kamc+_ra8qRF-DGSpb7=7QZA@mail.gmail.com>
	<20171102174022.GA32533@redhat.com>
From: Liang Yan <lyan@suse.com>
Message-ID: <5d923413-23ce-4bce-f9e6-9cb1d5486b8e@suse.com>
Date: Thu, 2 Nov 2017 14:09:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:56.0) Gecko/20100101
	Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <20171102174022.GA32533@redhat.com>
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
X-List-Received-Date: Thu, 02 Nov 2017 18:09:39 -0000



On 11/2/17 1:40 PM, Daniel P. Berrange wrote:
> On Thu, Nov 02, 2017 at 05:26:50PM +0000, Peter Maydell wrote:
>> On 2 November 2017 at 17:18, Liang Yan <lyan@suse.com> wrote:
>>> New tigervnc changes the way to send long pressed key,
>>> from "down up down up ..." to "down down ... up", it only
>>> affects xen pv console mode. I send a patch to latest
>>> kernel side, but it may have a fix in qemu backend for
>>> back compatible becase guest VMs may use very old kernel.
>>> This patch inserts an up event after each regular key down
>>> event to simulate an auto-repeat key event for xen keyboard
>>> frontend driver.
>>>
>>> Signed-off-by: Liang Yan <lyan@suse.com>
>>> ---
>>> v2:
>>> - exclude extended key
>>> - change log comment
>>>
>>>  hw/display/xenfb.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>>> index 8e2547ac05..1bc5b41ab7 100644
>>> --- a/hw/display/xenfb.c
>>> +++ b/hw/display/xenfb.c
>>> @@ -292,6 +292,11 @@ static void xenfb_key_event(void *opaque, int scancode)
>>>      }
>>>      trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
>>>      xenfb_send_key(xenfb, down, scancode2linux[scancode]);
>>> +
>>> +    /* insert an up event for regular down key event */
>>> +    if (down && !xenfb->extended) {
>>> +        xenfb_send_key(xenfb, 0, scancode2linux[scancode]);
>>> +    }
>>>  }
>> This doesn't look to me like the right place to fix this bug.
>> The xenfb key event handler is just one QEMU keyboard backend
>> (in a setup where there are many possible sources of keyboard
>> events: vnc, gtk, SDL, cocoa UI frontends; and many possible
>> sinks: xenfb's key handling, ps2 keyboard emulator, etc etc).
>>
>> We need to be clear in our definition of generic QEMU key
>> events how key repeat is supposed to be handled, and then
>> every consumer and every producer needs to follow that.
>> In the specific case of the vnc UI frontend, we need to
>> also look at what the VNC protocol specifies for key repeat.
>> That then tells us whether the bug to be fixed is in QEMU,
>> or in a particular VNC client.
> I'm somewhat inclined to say this is a Tigervnc bug. We fixed this
> same issue in GTK-VNC ~10 years ago. While X11 would send a sequence
> of press,release,press,release,  GTK would turn this into
> press,press,press,press,release which broke some VNC servers.
> So GTK-VNC undoes this optimization from GTK to ensure a full set
> of press,release,press,release pairs is always sent.
Tigervnc uses "press press press ... release" now,  this one is actually
because xenkb couldn't handler these repeat events. I sent a fix to
front-end side, and this patch here is for old compatibly only,
otherwise we need to patch all those guest VMs even we run a newer host.

Thanks,
Liang
> The official RFC for VNC does not specify any auto-repeat behaviour
>
>   https://tools.ietf.org/html/rfc6143#section-7.5.4
>
> The unofficial community authored extension to the RFC suggests
> taking the press,press,press,release approach to allow servers to
> distinguish auto-repeat from manual repeat, but I'm not really
> convinced by that justification really
>
>   http://vncdotool.readthedocs.io/en/latest/rfbproto.html#keyevent
>
> Regards,
> Daniel


