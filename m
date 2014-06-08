Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtiOj-0000n1-AA
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 15:04:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtiOd-0000me-E7
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 15:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtiOZ-0005GP-2Y
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 15:04:47 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:49889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtiOY-0005GC-Rb
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 15:04:43 -0400
Received: by mail-lb0-f177.google.com with SMTP id s7so2529320lbd.22
	for <qemu-trivial@nongnu.org>; Sun, 08 Jun 2014 12:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5Pihh510zoegg6n7kMe7EIOcPL5eEjDYYvPlds3f7ac=;
	b=UQyLgX+/EvadCn2iT9ibUdnBllM52rJN96zYNBJBREGRvTZWi0RGk6DKkVP9Ltz18A
	A9hMSLV5fevzsp/Rou1dokIMIS3PX3RIUdfvEW4O/x1U2/N8+6SKcrKLhQw/Ik1uumkY
	5aYEUtyFhCihjgTUrtJjpqllk6kKEpGWRI8gObWXsRMlKKrsuo1H1O2WUdk35VTjrzJK
	foK2vtT2OLZouzFgrMOa1dU24gNsZkEwjmroMnzghWWfZrhsBVtzlog+Jzlq6zh1/aAb
	UxrM323LouscWWJ630WayFQoOyHkuUqY3xn4EVhqe8tMznosXPsPgGNtIyFmC/ImsPQ3
	nuwg==
X-Gm-Message-State: ALoCoQngZypR4jM6F5sRTwY9V5bXEUj7E5QtB6ysyB6/UEVMVlRkUoRg2guuFYcdCIxulSLD+PEa
X-Received: by 10.112.58.202 with SMTP id t10mr13508487lbq.6.1402254281600;
	Sun, 08 Jun 2014 12:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sun, 8 Jun 2014 12:04:21 -0700 (PDT)
In-Reply-To: <539452F2.8070509@msgid.tls.msk.ru>
References: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
	<539452F2.8070509@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 Jun 2014 20:04:21 +0100
Message-ID: <CAFEAcA-ngVhdG5EemWziTcUbgKtwb+yDsFMTCKK0nk=wfKU_2w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] tcg: mark tcg_out* and tcg_patch* with
 attribute 'unused'
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
X-List-Received-Date: Sun, 08 Jun 2014 19:04:52 -0000

On 8 June 2014 13:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 07.06.2014 21:08, Peter Maydell wrote:
>> The tcg_out* and tcg_patch* functions are utility routines that may or
>> may not be used by a particular backend; mark them with the 'unused'
>> attribute to suppress spurious warnings if they aren't used.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Do we want to define a QEMU_UNUSED macro in compiler.h? We don't
>> seem to have done for the existing uses of this attribute in tree.
>>
>>  tcg/tcg.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index 2c5732d..fe55d05 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -125,19 +125,20 @@ static TCGRegSet tcg_target_available_regs[2];
>>  static TCGRegSet tcg_target_call_clobber_regs;
>>
>>  #if TCG_TARGET_INSN_UNIT_SIZE == 1
>> -static inline void tcg_out8(TCGContext *s, uint8_t v)
>
> Hm. Those are already #ifdef'ed, is it not enough?  Which architectures
> do not use functions which _are_ declared/defined?
>
> But I wonder, why to bother at all?  This "static inline foo() {..}" idiom
> is very common in header files, to define a function which may or may not
> be used, and no compiler warns about these.

The other approach we could take would be to move these
definitions from this .c file into a .h file (tcg-backend-helpers.h ?).
Then clang won't complain (it seems to only warn about unused
static-inline-functions in .c files, not in .h files).

Richard: do you have a preference?

thanks
-- PMM

