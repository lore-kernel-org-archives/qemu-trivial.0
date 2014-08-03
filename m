Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDkNo-0008O1-CZ
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 21:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkNi-0008Mp-Hw
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkNe-00083c-1c
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:14:38 -0400
Received: from mail-vc0-f182.google.com ([209.85.220.182]:64566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XDkNd-00083J-UG
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:14:33 -0400
Received: by mail-vc0-f182.google.com with SMTP id hy4so9181071vcb.27
	for <qemu-trivial@nongnu.org>; Sat, 02 Aug 2014 18:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=c2e8ZFSLsqqIPtC+GrTFD/oChg6GAZ2HKElK5mezeD0=;
	b=me7vhBXCuhlezE1mQJ3JPRQwJC7PROXuX2r0AmnmoEtDbeqpbQ0O/Qi9Z+2+gd0lOO
	zX2LRjnQCAxgFnaQGk0YMJcZtO+mWntqHh07TOIYKLs3EdLdDUH3Ow6D6FWFwVPLE9g5
	SBIXBc6nWfPvS0ag7yoTv8LDpR3h02gKSF0WHu5bcnbNg9B+aiB+kVSUPujZ9tTor4uB
	CfDZtTprVeCpduO//IeflZZIZeJcKXVVU4w7n3dp7rDdL4F1vgFxcG1BmdnFza6Th7IS
	/AKc0GOY5NjRb/BjnpZgMYIRpVdQTHTM8799QCSM+kSFHAvza/sKAZpy7/yQkOhY5hmy
	h9/w==
X-Gm-Message-State: ALoCoQlP9SqsDcq376pBMEpDXDa8IIGU6lqz1s+VWRgbuRvDqyDX4ahbwuze8Px7SzhQHR2Wav14
MIME-Version: 1.0
X-Received: by 10.221.21.201 with SMTP id qt9mr15540568vcb.39.1407028472825;
	Sat, 02 Aug 2014 18:14:32 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Sat, 2 Aug 2014 18:14:32 -0700 (PDT)
In-Reply-To: <53DCE6F5.7010809@msgid.tls.msk.ru>
References: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
	<53DCE6F5.7010809@msgid.tls.msk.ru>
Date: Sun, 3 Aug 2014 11:14:32 +1000
X-Google-Sender-Auth: 90JIVqeN88FNZ1rn_u4j_xg6rlQ
Message-ID: <CAEgOgz71+Eg6KhyAtHmaKv=3Ko-uT2iUjwJT=MAwvf-ewiFLgA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.182
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
X-List-Received-Date: Sun, 03 Aug 2014 01:14:43 -0000

On Sat, Aug 2, 2014 at 11:26 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 31.07.2014 04:31, Peter Crosthwaite wrote:
>> To avoid callsites with optional output having to NULL guard.
>
> Isn't it a bit backwards?  If we don't need output, maybe we should
> not call hexdump in the first place?
>

Well my thinking is a NULL File * is a good way to "don't need output"
and then it means then the multiple callsites can avoid:


if (fp) {


Note that many of the exitinst



> Thanks,
>
> /mjt
>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> ---
>> Noting in-tree is affected by this yet, but I though I'd get this
>> out of the way straight-up rather than elongate other series.
>>
>>  util/hexdump.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/util/hexdump.c b/util/hexdump.c
>> index 969b340..b607236 100644
>> --- a/util/hexdump.c
>> +++ b/util/hexdump.c
>> @@ -19,6 +19,9 @@ void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
>>  {
>>      unsigned int b;
>>
>> +    if (!fp) {
>> +        return;
>> +    }
>>      for (b = 0; b < size; b++) {
>>          if ((b % 16) == 0) {
>>              fprintf(fp, "%s: %04x:", prefix, b);
>>
>
>

