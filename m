Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDkOy-00014S-0s
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 21:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkOs-00014L-Uz
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkOm-0008RC-Kf
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:15:50 -0400
Received: from mail-vc0-f169.google.com ([209.85.220.169]:33529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkOm-0008R4-Fx
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:15:44 -0400
Received: by mail-vc0-f169.google.com with SMTP id le20so9043538vcb.28
	for <qemu-trivial@nongnu.org>; Sat, 02 Aug 2014 18:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=pzt/wBVyLn6nNRrNYXOg7yj/Uwzaqf2q8sEebHkXFc0=;
	b=BTw5sBw3wU6QnJ8SmCLkoUfFTlGXLfEvo1Bp2yMLg9TnHPIe6XUJHnAlvXVx+LAakb
	tuko88KR1fYS3emR9qHjKDI4rgs1LeA619yipCzaL3EvLK0GX046dzxQw5jq/kp4bbP9
	SOUYOS2Iy2OxmM9lkHAWf0PVolJ/LWvUf3hbRFKicag8OMwUEsHW1WX6Hh3ZUX8GJ9lQ
	a6iG9o7SDEFdwFpcTVrkWg+SLJa23IbvNPNP32+xDOVd+XXGHGhxzCqg1rtdMLfXjubK
	NIUo6UfaJmsfF1tdMXxbB9ryHXfUDb1RsvvD2j89WbN5qEA+EhLxH0fIuY24digxrfNk
	Co+g==
X-Gm-Message-State: ALoCoQn1K2HQP0WCeWdffZBDUrf8V5XlxPQkfDa47e3EWz0/OUIALfjDKlXMHD+AUPqc6Vbe2772
MIME-Version: 1.0
X-Received: by 10.220.190.197 with SMTP id dj5mr15563293vcb.19.1407028544231; 
	Sat, 02 Aug 2014 18:15:44 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Sat, 2 Aug 2014 18:15:44 -0700 (PDT)
In-Reply-To: <CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
References: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
	<53DCE6F5.7010809@msgid.tls.msk.ru>
	<CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
Date: Sun, 3 Aug 2014 11:15:44 +1000
X-Google-Sender-Auth: hTCIdd0xceqSn-cqBm0T39P42-w
Message-ID: <CAEgOgz4WEzD0_Fkdfez9tm9xk3xE_fF5GM3vAbHpAxVGZWyH2Q@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.169
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] hexdump: Add null
 guard on output file.
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
X-List-Received-Date: Sun, 03 Aug 2014 01:15:55 -0000

Sorry premature send (I guess I just discovered a new keyboard shortcut!)

On Sun, Aug 3, 2014 at 11:14 AM, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> On Sat, Aug 2, 2014 at 11:26 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 31.07.2014 04:31, Peter Crosthwaite wrote:
>>> To avoid callsites with optional output having to NULL guard.
>>
>> Isn't it a bit backwards?  If we don't need output, maybe we should
>> not call hexdump in the first place?
>>
>
> Well my thinking is a NULL File * is a good way to "don't need output"
> and then it means then the multiple callsites can avoid:
>
>
> if (fp) {
>
>
> Note that many of the exitinst
>
>
>
>> Thanks,
>>
>> /mjt
>>
>>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>> ---
>>> Noting in-tree is affected by this yet, but I though I'd get this
>>> out of the way straight-up rather than elongate other series.
>>>
>>>  util/hexdump.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/util/hexdump.c b/util/hexdump.c
>>> index 969b340..b607236 100644
>>> --- a/util/hexdump.c
>>> +++ b/util/hexdump.c
>>> @@ -19,6 +19,9 @@ void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
>>>  {
>>>      unsigned int b;
>>>
>>> +    if (!fp) {
>>> +        return;
>>> +    }
>>>      for (b = 0; b < size; b++) {
>>>          if ((b % 16) == 0) {
>>>              fprintf(fp, "%s: %04x:", prefix, b);
>>>
>>
>>

