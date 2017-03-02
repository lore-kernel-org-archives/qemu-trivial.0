Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXEI-0001sj-PF
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:21:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjXEG-0001rI-Ll
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:21:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjXEF-00076f-Q5
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:21:36 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjXEA-00070N-UO; Thu, 02 Mar 2017 15:21:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 0A63B74577A;
	Thu,  2 Mar 2017 21:21:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 6C4ED7456D4; Thu,  2 Mar 2017 21:21:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 6BCAD7456BC;
	Thu,  2 Mar 2017 21:21:28 +0100 (CET)
Date: Thu, 2 Mar 2017 21:21:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <CAFEAcA8pzuQ=TbOpDQaDLjyFSUygRQ0HC+ag3z_9=mBte5pb4Q@mail.gmail.com>
Message-ID: <alpine.BSF.2.20.1703022119570.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<379a9021607724194b457bf562df9900993788c0.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA8pzuQ=TbOpDQaDLjyFSUygRQ0HC+ag3z_9=mBte5pb4Q@mail.gmail.com>
User-Agent: Alpine 2.20 (BSF 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 11/14] sm501: Add some
 more missing registers
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
X-List-Received-Date: Thu, 02 Mar 2017 20:21:37 -0000

On Thu, 2 Mar 2017, Peter Maydell wrote:
> On 10 December 2016 at 02:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> Values are not used yet, only stored to allow clients to initialise
>> these without failing as long as no 2D engine function is called that
>> would use the written value.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>
>> v2: Fixed mask of video_control register for a read only bit
>>     Changed IRQ status register to write ignored as IRQ is not implemented
>>
>>  hw/display/sm501.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index caa7e5c..af5e4db 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -511,6 +511,8 @@ typedef struct SM501State {
>>      uint32_t dc_panel_hwc_color_1_2;
>>      uint32_t dc_panel_hwc_color_3;
>>
>> +    uint32_t dc_video_control;
>> +
>>      uint32_t dc_crt_control;
>>      uint32_t dc_crt_fb_addr;
>>      uint32_t dc_crt_fb_offset;
>> @@ -530,13 +532,20 @@ typedef struct SM501State {
>>      uint32_t twoD_control;
>>      uint32_t twoD_pitch;
>>      uint32_t twoD_foreground;
>> +    uint32_t twoD_background;
>>      uint32_t twoD_stretch;
>> +    uint32_t twoD_color_compare;
>>      uint32_t twoD_color_compare_mask;
>>      uint32_t twoD_mask;
>> +    uint32_t twoD_clip_tl;
>> +    uint32_t twoD_clip_br;
>> +    uint32_t twoD_mono_pattern_low;
>> +    uint32_t twoD_mono_pattern_high;
>>      uint32_t twoD_window_width;
>>      uint32_t twoD_source_base;
>>      uint32_t twoD_destination_base;
>> -
>> +    uint32_t twoD_alpha;
>> +    uint32_t twoD_wrap;
>>  } SM501State;
>
> You're still implementing almost all of these as writes to structure
> fields which can never be read. Either of these:
>
> (1) a write function case which writes to the struct field, plus
>     a read function case which returns the value in the struct field
> (2) a write function which does nothing (and no read function case,
>     or a read function case which returns 0)
>     [you can usually bunch these up into a lot of case FOO: which
>     share a /* unimplemented, ignore writes */ body]
>
> are OK, but a write function which writes to the struct field but
> nothing ever reading that field doesn't make sense.
>
> (You can also LOG_UNIMP for dummy stuff like this if you like, but
> that's not something we insist on.)

I've stored these in the state because these will be needed if we ever 
implement more of the 2D engine even if they are not used yet. (Also as 
you've noticed read is also imlemented.)

>
> thanks
> -- PMM
>
>

