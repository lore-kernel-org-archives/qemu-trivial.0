Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDkR3-00023U-OY
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 21:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkQy-00023K-AX
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkQt-0000jp-HE
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:18:00 -0400
Received: from mail-vc0-f170.google.com ([209.85.220.170]:53116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkQt-0000jh-CW
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:17:55 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so9095162vcb.1
	for <qemu-trivial@nongnu.org>; Sat, 02 Aug 2014 18:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nmS2ANnEnV9LkoIhd6uV4jI/miI2RAG4hTyXLgKyH2w=;
	b=KZrPp4zksF5Ug/pCELKjyoq6LPiOIiwd/cn63WdbJDKTSreUFBjGVBXomYag8c+RMm
	NbyEiEmmx1pZgXQJSO4ln+/r2uNfy28vcIDV3dSgsdKgXY4EFtrwn3rnOJV5TKkv9EIF
	ciyHsMaUlIBQGNA2Q0uf9vlOz87032bv6/eXWtZxeDtIAIMLfGbQj2uYWWdR8dzOeaaW
	1ftKw1Yzsz8a0t11jQJOWxIYjX7AMiJdXsPes1SmaCkf3/WoHrM5PKSy9Utt6RBsn1eZ
	X7G5m6FtwlEyC1QCrVyTetIpYIRfx5E6A1aI+vmZqVasz05X3yZQYOVw3ZGcwJoTSVxj
	hMzw==
X-Gm-Message-State: ALoCoQl57nVwXvmQrepiI0m+UgBNEASIsng7Xes7T9+5X/+WLmwcU4L55qw0OhimioxYQ/G4GiWG
MIME-Version: 1.0
X-Received: by 10.52.27.16 with SMTP id p16mr1476927vdg.14.1407028675048; Sat,
	02 Aug 2014 18:17:55 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Sat, 2 Aug 2014 18:17:54 -0700 (PDT)
In-Reply-To: <CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
References: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
	<53DCE6F5.7010809@msgid.tls.msk.ru>
	<CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
Date: Sun, 3 Aug 2014 11:17:54 +1000
X-Google-Sender-Auth: 3hxa9BRbxpXOFMxxwECq_i6qqzI
Message-ID: <CAEgOgz4muAfJmGajA2D7EPiW12HGh-2JKfb1G7-tc5SW8ABhCQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.170
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
X-List-Received-Date: Sun, 03 Aug 2014 01:18:04 -0000

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
Well my thinking is a NULL File * is a good way to "don't need output"
and then it means then the multiple callsites can avoid:

if (fp) {
    qemu_hexdump(foo, fp, ..)
}

Note that many of the existing call this with stderr as FP argument
which in theory should be change to something that backs onto
qemu_log. I suspect the file handle in this case will be NULL when
logging is disabled and this patch avoid having to add all these
conditionals.

Regards,
Peter

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

