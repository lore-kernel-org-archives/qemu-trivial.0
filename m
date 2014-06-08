Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtcSo-0001ek-K3
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 08:44:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtcSi-0001WV-3p
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtcSc-0008At-WF
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:44:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtcSS-000893-Kv; Sun, 08 Jun 2014 08:44:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AF0F140DF5;
	Sun,  8 Jun 2014 16:44:18 +0400 (MSK)
Message-ID: <53945AA2.9040004@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 16:44:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
	<539449AE.4090909@msgid.tls.msk.ru>
	<CAFEAcA8o-1gY5xnJdCEhhfkxfYEv7AkHEXs05746EMj0zna+ow@mail.gmail.com>
In-Reply-To: <CAFEAcA8o-1gY5xnJdCEhhfkxfYEv7AkHEXs05746EMj0zna+ow@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/net/eepro100: Implement read-only
 bits in MDI registers
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
X-List-Received-Date: Sun, 08 Jun 2014 12:44:41 -0000

08.06.2014 16:27, Peter Maydell wrote:
> On 8 June 2014 12:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 07.06.2014 20:52, Peter Maydell wrote:
>>> Although we defined an eepro100_mdi_mask[] array indicating which bits
>>> in the registers are read-only, we weren't actually doing anything with
>>> it. Make the MDI register-read code use it rather than manually making
>>> registers 2 and 3 totally read-only and the rest totally read-write.
>>
>> s/register-read/register-write/ -- can be fixed when applying.
>>
>> I'm not sure this is "trivial enough", because the side effect is
>> not obvious, at least not to someone not familiar with eepro100
>> registers and their usage.
> 
> Mmm, but do you want to suggest a better queue? I did check
> that Linux could still boot and talk to the network via an eepro100.

[]

>> In this context, apparently we're losing the ability to write to
>> register 0 completely, since its mask is 0 but the original code
>> allows writing something to it.
> 
> Hmm? The mask is a mask of read-only bits, so if mask is zero
> then ANDing the register with the mask will clear it, ANDing the
> data with ~mask will do nothing, and then ORing the data into
> the register means we set every bit in the register. (This
> all happens after the register-specific case code, so the work
> that does to have some of the bits have special effects by
> changing the value of 'data' remains in place.)

That was inaccurate on my part.

Let's take a closer look.  Current code:

static const uint16_t eepro100_mdi_mask[] = {
    0x0000, 0xffff, 0xffff, 0xffff, 0xc01f, 0xffff, 0xffff, 0x0000,
    ...

static void eepro100_write_mdi() {
...
            switch (reg) {
            case 0:            /* Control Register */
                ..modify data...
                break;
            case 1:            /* Status Register */
                missing("not writable");
                data = s->mdimem[reg];
                break;
            case 2:            /* PHY Identification Register (Word 1) */
            case 3:            /* PHY Identification Register (Word 2) */
                missing("not implemented");
                break;
            case 4:            /* Auto-Negotiation Advertisement Register */
            case 5:            /* Auto-Negotiation Link Partner Ability Register */
                break;
            case 6:            /* Auto-Negotiation Expansion Register */
            default:
                missing("not implemented");
            }
            s->mdimem[reg] = data;

You're changing this last line with there (removing data= in case 1):

            s->mdimem[reg] &= eepro100_mdi_mask[reg];
            s->mdimem[reg] |= data & ~eepro100_mdi_mask[reg];

so eepro100_mdi_mask has bit set for UNwritable bits, and bit unset
for WRITABLE bits.  This is where I misunderstood it initially (because
it is sort of expected to be the opposite).  So, reg0 is fully writable
still (with the same mods which are applied initially).

But the the next 3 registers - 1, 2 and 3 - are becoming all UNwritable.
Original code has only register 1 unwritable, not registers 2 and 3 (and
all others).

Initially all registers but register 1 was fully writable, but now most
regs becomes UNwritable.  That's what I should have said in the first
email ;)

Maybe that's a non-issue anyway, maybe these regs aren't actually used
by the device emulation code, -- as I mentioned initially, this is not
exactly a trivial change, it isn't clear at all to someone who isn't
familiar with the registers and their usage -- in real hw and in there.

Thanks,

/mjt

