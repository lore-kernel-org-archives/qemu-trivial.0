Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XeLE3-0005IU-On
	for mharc-qemu-trivial@gnu.org; Wed, 15 Oct 2014 05:50:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XeLDw-0005Cu-FP
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XeLDr-0007Ei-JR
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:50:28 -0400
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e]:48195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XeLDh-0007Ct-QK; Wed, 15 Oct 2014 05:50:13 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so964852pdi.33
	for <multiple recipients>; Wed, 15 Oct 2014 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+HImlVne5J5Kud5W2nXxGFlNPyCncZfxv1TKE3xIY1A=;
	b=Ww6uWiidX46NW7YtjUGDFchshl6LmGBRCUsm9saXpN/ftDPNRLZgT/AciTuP+mu9T1
	X3H4jWFAUP/iObW+lAzG6cRkDvDylSlE7e4tFKtIJbIMsqkxClViybu1nyLRQ/aZWMpJ
	Qq8bo6RISaNJPa2ft4sbc7zR5jwRGlcgPc0DMTmEI73e290RaqJpq73HhEd8g5ckGlX0
	+s/8DmUK9gWd8AJy4i2uLXEmzjcOLF/2YCEt7pd7IIm0+3U/OtVdDmFpRgJqLC8lpFkr
	CgOYsubx1WT3Y8n0IiGi7yFvkAHRaLeYyXtqWk53MAWsywIGkLf9wwix57jREQVmfE4L
	0PuQ==
X-Received: by 10.66.237.98 with SMTP id vb2mr1048035pac.144.1413366612649;
	Wed, 15 Oct 2014 02:50:12 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([124.126.239.21])
	by mx.google.com with ESMTPSA id
	j11sm16556864pdk.76.2014.10.15.02.50.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Oct 2014 02:50:11 -0700 (PDT)
Message-ID: <543E44AF.6070800@gmail.com>
Date: Wed, 15 Oct 2014 17:55:59 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <5439399D.4020004@gmail.com> <54393AF0.1010708@gmail.com>
	<CAFEAcA_c7FE93J_7ZTqZaMG3V6Xx+EW6kAYF6XBqO9YL28+1mg@mail.gmail.com>
	<543D807A.6000704@msgid.tls.msk.ru> <543D8BCB.2020109@gmail.com>
In-Reply-To: <543D8BCB.2020109@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Wakely <jwakely.gcc@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH v2] libvixl: a64: Skip
 "-Wunused-variable" for gcc 5.0.0 or higher
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
X-List-Received-Date: Wed, 15 Oct 2014 09:50:33 -0000

On 10/15/14 4:47, Chen Gang wrote:
> On 10/15/2014 03:58 AM, Michael Tokarev wrote:
>>
>> That's what I'm after too (after trying to fix it properly).
>> And no, at this time I dont know how gcc5 handles this.
>>
> 
> At present, I have sent the related information to gcc upstream mailing
> list for gcc5, we are just discussing about it.
> 
>  - Some gcc members stick to what gcc5 has done is correct (need still
>    report warning).
> 
>  - But for me, I am just trying to get another gcc members' confirmation.
>    I am not quite familiar with C++, for me it is a complex language, so
>    I need additional confirmation by another gcc members, at least.
> 

After consult the gcc related members, we are sure what gcc has done is
correct, and need process this warning in our qemu or 'libvixl'.

The related mail is below:


-------- Forwarded Message --------
Subject: Re: [Consult] g++: About "-Wunused-variable" for constant variable in header file
Date: Wed, 15 Oct 2014 10:18:44 +0100
From: Jonathan Wakely <jwakely.gcc@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
CC: gcc-help <gcc-help@gcc.gnu.org>, Jeff Law <law@redhat.com>, Peter Maydell <peter.maydell@linaro.org>

On 14 October 2014 22:57, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> Hello All:
>
> At present, I met one warning issue about gcc 5.0.0.
>
>  - For "const float a = 3.4 - 2.1 / 3;", if it is unused, gcc5 will not
>    report warning.

Because there is no cost to initializing the variable.

>  - "const char n() {return 1;}; const a = n();", if 'a' is unused, gcc5
>    will report warning.

Because it requires dynamic initialization, running a function at
startup, which has a cost. If you don't use the variable then you
might not want to run the initialization code at startup, so you get a
warning.

> For gcc old version (e.g. gcc4), it will not report warning. Is it the
> new feature for gcc5, or just a gcc5's bug?

I think this behaviour is intended and is not a bug.




-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

