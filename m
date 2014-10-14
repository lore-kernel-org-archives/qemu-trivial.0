Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xe90S-0006gn-Aj
	for mharc-qemu-trivial@gnu.org; Tue, 14 Oct 2014 16:47:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xe90H-0006ge-Ci
	for qemu-trivial@nongnu.org; Tue, 14 Oct 2014 16:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xe908-00020J-9k
	for qemu-trivial@nongnu.org; Tue, 14 Oct 2014 16:47:33 -0400
Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236]:62973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Xe907-00020E-PX; Tue, 14 Oct 2014 16:47:24 -0400
Received: by mail-pd0-f182.google.com with SMTP id y10so7994670pdj.41
	for <multiple recipients>; Tue, 14 Oct 2014 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=CPSGWxcftp5TqFHGrd5wViQpwRzbqWdVp8D6PC3Lcu8=;
	b=cBEyIs+UDit+3xVNdhyHMtYLNJ4WPSiKLXK8xJv/49xvpTw4FJe9sCQjsHOlcNiS/O
	mBuOvrIglqY0qclGSrZUDNJeHVZQR9QGQKjvvwkxq5GhtDU4Ev1WBusweuLalOGybRi1
	9kcMmt+C4MXcs0skWCyoZtPflc/8SXZwvqC9wOyLNCxSqRT2MfYxaPj07ACOQZsMZlbM
	yAmomMoPVacGYtOs4MX0SvjaveykaalxNfn2rz401aoZAZbDDete+Ma5DLs1wu7XC4LU
	XLr2bZ/xoyfFgYoPVB1M60DEA4peq1p4Ugr0MhyI6CTINgcsbHchhiXJKvA/Iq/dxVVg
	uKug==
X-Received: by 10.70.5.194 with SMTP id u2mr7915661pdu.34.1413319640848;
	Tue, 14 Oct 2014 13:47:20 -0700 (PDT)
Received: from [192.168.1.103] ([223.72.65.33])
	by mx.google.com with ESMTPSA id
	g13sm15184452pat.45.2014.10.14.13.47.17 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 14 Oct 2014 13:47:19 -0700 (PDT)
Message-ID: <543D8BCB.2020109@gmail.com>
Date: Wed, 15 Oct 2014 04:47:07 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <5439399D.4020004@gmail.com> <54393AF0.1010708@gmail.com>
	<CAFEAcA_c7FE93J_7ZTqZaMG3V6Xx+EW6kAYF6XBqO9YL28+1mg@mail.gmail.com>
	<543D807A.6000704@msgid.tls.msk.ru>
In-Reply-To: <543D807A.6000704@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
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
X-List-Received-Date: Tue, 14 Oct 2014 20:47:42 -0000

On 10/15/2014 03:58 AM, Michael Tokarev wrote:
> On 11.10.2014 23:25, Peter Maydell wrote:
>> On 11 October 2014 15:13, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>
>> MJT: please don't put this in -trivial, it will clash with
>> the update to libvixl 1.6 currently on the list.
> 
> Actually I'd not put that to anywhere anyway.  Because to me,
> *especially* in a case like this when the code is imported from
> some other place and will be updated later (so we should not
> modify it), this issue can be more easily dealt with externally,
> by adding a compiler option in a Makefile.  Provided, ofcourse,
> that it is not fixed upstream properly to start with - and if
> it is (and this is the very sane way to go really, to fix it
> upstream), that fix can be pulled to qemu as well, so no
> clashes with further upstream changes will happen.
> 
> And aso because really, this prob should be fixed properly, not
> worked around like this..
> 

Within qemu, what you said sounds reasonable, but if we consider both
libvixl and qemu together, for me, I'like to fix it in related source
code.

Maybe I need send the related patch to libvixl firstly, then Cc to qemu.
If the patch can not pass libvixl's checking, but qemu still need, we
have to do in the way like what you said above.

By the way, originally, I misunderstood "Makefile.objs" under libvixl:
I thought they belong to libvixl, but in fact, they belong to qemu.

> []
>> Some other approaches to this that would confine the
>> fix to the makefiles rather than requiring us to modify
>> the vixl source itself:
>>   a) add a -Wno- option for the affected .o files
>>   b) use -isystem rather than -I to include the libvixl
>>      directory on the include path
>>
>> (a)'s probably better I guess.
> 
> That's what I'm after too (after trying to fix it properly).
> And no, at this time I dont know how gcc5 handles this.
> 

At present, I have sent the related information to gcc upstream mailing
list for gcc5, we are just discussing about it.

 - Some gcc members stick to what gcc5 has done is correct (need still
   report warning).

 - But for me, I am just trying to get another gcc members' confirmation.
   I am not quite familiar with C++, for me it is a complex language, so
   I need additional confirmation by another gcc members, at least.


Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

