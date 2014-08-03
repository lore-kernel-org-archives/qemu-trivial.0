Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDkH0-0006m4-Ov
	for mharc-qemu-trivial@gnu.org; Sat, 02 Aug 2014 21:07:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XDkGq-0006l3-BZ
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XDkGh-0005rw-Ax
	for qemu-trivial@nongnu.org; Sat, 02 Aug 2014 21:07:32 -0400
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:35110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XDkGh-0005rN-28; Sat, 02 Aug 2014 21:07:23 -0400
Received: by mail-pa0-f49.google.com with SMTP id hz1so7918856pad.22
	for <multiple recipients>; Sat, 02 Aug 2014 18:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zojPLN8QknXkFYyqtwotRfpqgdrBlWwWFUlkHQIvbUg=;
	b=urPbGe2T6XfvFh+mOMZHW1CM7yeAIRgJDbXlugJ/sGJNEUSzHHPBj3ojRmJaQIJATQ
	46PkFyel9jItWxOm/gnvKf8AQ/mzkvuhjGbmr/rf0jHKJ9NqX8iG8P2a+SNL+Mul5Wn0
	eXqDANIENwSgti8tut6VP1GZwvQBu1v0rWju3kRCWnCVGSk9B+9G62JmmfUiscVJDPqh
	QTB1nkriMZ6IksZqzpEQP+ikJjjoHbStvQHcJLfWJ1syimD6EccJAJauEdZwXIKCuNo2
	w0xHa+J2JkuoSeSzYI4TTZdzU66wIyhxYZCFGCnO2xPrUEr8ePri9SEN98PaBkPcVNxI
	n10A==
X-Received: by 10.68.232.34 with SMTP id tl2mr15450429pbc.81.1407028041219;
	Sat, 02 Aug 2014 18:07:21 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	kt2sm12965606pbc.83.2014.08.02.18.07.18 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Aug 2014 18:07:20 -0700 (PDT)
Message-ID: <53DD8B44.7000206@gmail.com>
Date: Sun, 03 Aug 2014 09:07:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Kevin Wolf <kwolf@redhat.com>, 
	stefanha@redhat.com
References: <53B90C35.6070501@gmail.com> <53DCE92F.3060507@msgid.tls.msk.ru>
In-Reply-To: <53DCE92F.3060507@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH-trivial] qemu-img: Check getchar() return
 value in read_password() for WIN32
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
X-List-Received-Date: Sun, 03 Aug 2014 01:07:41 -0000



On 08/02/2014 09:35 PM, Michael Tokarev wrote:
> 06.07.2014 12:43, Chen Gang wrote:
>> getchar() is a standard c library function which may return with failure
>> (e.g. -1), so like another platforms, also need check it under WIN32.
> 
> Applied to -trivial queue, with a slight modification:
> 

Thanks, and I shall continue to make another patches for qemu within
this month.

>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -185,15 +185,21 @@ static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
>>  static int read_password(char *buf, int buf_size)
>>  {
>>      int c, i;
>> +
>>      printf("Password: ");
>>      fflush(stdout);
>>      i = 0;
>>      for(;;) {
>>          c = getchar();
>> -        if (c == '\n')
>> +        if (c < 0) {
>> +            buf[i] = '\0';
>> +            return -1;
>> +        } else if (c == '\n') {
>>              break;
>> -        if (i < (buf_size - 1))
>> +        }
>> +        if (i < (buf_size - 1)) {
> 
> I've added an 'else' there and merged with the previous line,
> to match with the above code which is being added.
> 

OK, thanks.

>>              buf[i++] = c;
>> +        }
>>      }
>>      buf[i] = '\0';
>>      return 0;
> 
> Thanks,
> 
> /mjt
> 

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

