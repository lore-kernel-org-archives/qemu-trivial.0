Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjcPj-00013W-NR
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 20:53:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjcPh-00011d-Jv
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 20:53:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjcPg-0002ov-KV
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 20:53:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:45873)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjcPd-0002nY-Tq; Thu, 02 Mar 2017 20:53:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id A2BB37456C4;
	Fri,  3 Mar 2017 02:53:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 6DDB57456BC; Fri,  3 Mar 2017 02:53:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 6BBF27456BA;
	Fri,  3 Mar 2017 02:53:40 +0100 (CET)
Date: Fri, 3 Mar 2017 02:53:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA-aFah9sA9EkfVspw4r-4BDCSX3Tmz9-ZvcdZkYkBZa2A@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703030251220.33600@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<c554a16417ef22dbc29919a2747801be5ed7fede.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA-G8_yOjmHBb9S+ErCoxSAje4gr1S0Y=FQjwCsxK+GYGw@mail.gmail.com>
	<alpine.BSF.2.20.1703022107450.83701@zero.eik.bme.hu>
	<CAFEAcA-aFah9sA9EkfVspw4r-4BDCSX3Tmz9-ZvcdZkYkBZa2A@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 05/14] sm501: Add
 emulation of chip connected via PCI
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
X-List-Received-Date: Fri, 03 Mar 2017 01:53:46 -0000

On Thu, 2 Mar 2017, Peter Maydell wrote:
> On 2 March 2017 at 20:13, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>>
>>> On 25 February 2017 at 18:31, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>
>>>> Only the display controller part is created automatically on PCI
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>
>>>> v2: Split off removing dependency on base address to separate patch
>>>>
>>>>  hw/display/sm501.c | 52
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>>>> index 1cda127..d9219bd 100644
>>>> --- a/hw/display/sm501.c
>>>> +++ b/hw/display/sm501.c
>>>> @@ -31,6 +31,7 @@
>>>>  #include "ui/console.h"
>>>>  #include "hw/devices.h"
>>>>  #include "hw/sysbus.h"
>>>> +#include "hw/pci/pci.h"
>>>>  #include "qemu/range.h"
>>>>  #include "ui/pixel_ops.h"
>>>>  #include "exec/address-spaces.h"
>>>> @@ -1507,9 +1508,60 @@ static const TypeInfo sm501_sysbus_info = {
>>>>      .class_init    = sm501_sysbus_class_init,
>>>>  };
>>>>
>>>> +#define TYPE_PCI_SM501 "sm501"
>>>> +#define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj),
>>>> TYPE_PCI_SM501)
>>>> +
>>>> +typedef struct {
>>>> +    /*< private >*/
>>>> +    PCIDevice parent_obj;
>>>> +    /*< public >*/
>>>> +    SM501State state;
>>>> +    uint32_t vram_size;
>>>> +} SM501PCIState;
>>>> +
>>>> +static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>>>> +{
>>>> +    SM501PCIState *s = PCI_SM501(dev);
>>>> +
>>>> +    sm501_init(&s->state, DEVICE(dev), s->vram_size);
>>>> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
>>>> +                     &s->state.local_mem_region);
>>>> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>>>> +                     &s->state.mmio_region);
>>>> +}
>>>> +
>>>> +static Property sm501_pci_properties[] = {
>>>> +    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size,
>>>> +                       64 * 1024 * 1024),
>>>
>>>
>>> Something needs to sanity check this value, because it's
>>> user settable in the PCI device. (In the sysbus version you
>>> can only create it from board code, and we can assume board
>>> code doesn't pass us silly values.)
>>>
>>> Or you could just hardcode the PCI device to always be 64MB,
>>> I guess :-)
>>
>>
>> Maybe a check could be added to get_local_mem_size_index(). What should it
>> do for invalid values?
>
> The device realize function should fail:
>    if (user settable property foo is wrong) {
>        error_setg(errp, "foo must be X, Y or Z");
>        return;
>    }

Actually I think this cannot fail because get_local_mem_size_index() will 
pick a valid value that's closest to the one specified. However the mem 
region was not created using this adjusted value. I've fixed this in the 
v3 I've just sent and also added a warning when adjusment was made.

Thank you,
BALATON Zoltan

