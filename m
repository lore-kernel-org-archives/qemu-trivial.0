Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtcIj-0006uJ-Iz
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 08:34:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcId-0006lg-2K
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcIU-0001jb-Ix
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:34:11 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:58241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WtcIU-0001hN-CW
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 08:34:02 -0400
Received: by mail-la0-f47.google.com with SMTP id pn19so2465817lab.6
	for <qemu-trivial@nongnu.org>; Sun, 08 Jun 2014 05:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=x6OJIzpJJP1lkSKJmN8qIdEMQs2mJOatC6FizZEDwjs=;
	b=S37eI38LZsaBOOYxTjf0vZaCl6eP1dqG/mLyQ9GXTk6hy3fJh73vo8KbseMVlxZdIZ
	JDauCEyfNE/tismATHNX2T+KSkVPQ9yN76Tp7Y7oJ3OxJ79Ev1ounheptegE3aXY2agg
	5RM9fptCVBewzWR6uoWy/VxVR8E9AZsqCYvQqTfSheLcHONv87sEXGMWSsXTsxgt2mF4
	ISCIWulq90ssRJVMrfWs3ZQomJwvjopKq7jCdp/UQcFDlgR1tig4oDab7A8WTZMwV3FH
	2S6L+P0d95BR3Az/aFJ9m2sajwI+8UWuWgxuk1M5y/bWufVXorCb8Wu4OlzxnBizSzOS
	wKRg==
X-Gm-Message-State: ALoCoQl/XCdoz5W+q8U75ZuudJP0YQSlIX+4K12F+6wyLXHdtinW8EbvswUlkysEU/iCVSLnwUTj
X-Received: by 10.112.149.71 with SMTP id ty7mr12544002lbb.34.1402230841010;
	Sun, 08 Jun 2014 05:34:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sun, 8 Jun 2014 05:33:40 -0700 (PDT)
In-Reply-To: <539452F2.8070509@msgid.tls.msk.ru>
References: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
	<539452F2.8070509@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 Jun 2014 13:33:40 +0100
Message-ID: <CAFEAcA-pYo8bBWcLFnfuOqjm=qJgBdoXYqUVu8JeWr=73Sy6AA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
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
X-List-Received-Date: Sun, 08 Jun 2014 12:34:15 -0000

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

The tcg x86 backend doesn't use all the tcg_patch* functions.
These ifdefs merely restrict the functions to only be provided
for the backends which conceivably could use them; there is
no requirement that the backend actually does use them.

> But I wonder, why to bother at all?  This "static inline foo() {..}" idiom
> is very common in header files, to define a function which may or may not
> be used, and no compiler warns about these.

clang 3.4 complains, which is why I'm fixing these. (It also found about
half a dozen genuine bugs and quite a bit of legitimately dead code,
which is why I think it's worth dealing with the handful of false positives
like this rather than removing the warning flag.)

thanks
-- PMM

