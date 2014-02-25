Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIDGk-0005h7-7b
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 03:21:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WIDGa-0005VY-3o
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:21:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WIDGR-0002Qs-Lz
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:21:28 -0500
Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234]:57177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WIDG8-0002JM-HS; Tue, 25 Feb 2014 03:21:00 -0500
Received: by mail-qa0-f52.google.com with SMTP id j15so51696qaq.11
	for <multiple recipients>; Tue, 25 Feb 2014 00:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aH+vve0ehNaKljYvHi5GaB7S5D2xBG47hZYnGH5bBA8=;
	b=sMXQtv+2DxNw9DJRgLHAxfoDRKUeF3ZqVA8ylXdFiUHQys5BxTDsXV7+BE4mjxhUPh
	Tof//yYzwC11rGG3yNywdXWABGj7FBYmFmOcvJK4t0LpObTVfl68GlyJVbWL+rNlS0uv
	aPh/8aN+kPkflafXo/8yrjRaD3pEDr8W7PozEIlPwya6wcW4uQ8XZKIjz/EgEUOedFRR
	FOChk3/u68QCIMyAayi36aukmhchK1cDYMqYxWT3rZSvqX+1PJjRx+vel6a/QNoIgq4z
	hUKVWBVMwAWiY3UUjXQiw32UzY+4EE2juLoeml1eu6HEYLUc1VlYTncpW0nVHM8Brykv
	J43Q==
X-Received: by 10.140.27.179 with SMTP id 48mr33870612qgx.18.1393316459583;
	Tue, 25 Feb 2014 00:20:59 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id r13sm57337573qan.7.2014.02.25.00.20.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 00:20:58 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <530C5265.4040900@redhat.com>
Date: Tue, 25 Feb 2014 09:20:53 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1393174935-11750-1-git-send-email-sw@weilnetz.de>
	<530C2AE2.1010003@weilnetz.de>
In-Reply-To: <530C2AE2.1010003@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::234
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 0/9] w32: Reduce dependency on Windows API
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
X-List-Received-Date: Tue, 25 Feb 2014 08:21:36 -0000

Il 25/02/2014 06:32, Stefan Weil ha scritto:
> Am 23.02.2014 18:02, schrieb Stefan Weil:
>> Today, most .o files depend on windows.h when QEMU is built with MinGW or
>> MinGW-w64 (32 and 64 bit builds). These patches reduce the number of such
>> files from more than 1800 to less than 180. They also allow removing some
>> hacks which were needed because of conflicts with windows.h. A nasty
>> compiler warning is fixed, too.
>>
>> The modifications were tested with MinGW (32 bit native) and MinGW-w64
>> (32 and 64 bit cross).
>>
>> Regards
>> Stefan W.
>>
>> [PATCH 1/9] util/iov: Use qemu/sockets.h instead of conditional code
>> [PATCH 2/9] exec: Remove unneeded include files
>> [PATCH 3/9] qemu-img: Remove unneeded include files
>> [PATCH 4/9] qga: Remove unneeded include file
>> [PATCH 5/9] vl: Remove unneeded include file
>> [PATCH 6/9] w32: Add and use intermediate include file for windows.h
>> [PATCH 7/9] w32: Move inline function from header file to C source
>> [PATCH 8/9] w32: Reduce dependencies in sysemu/os-win32.h
>> [PATCH 9/9] w32: Replace Windows specific data types in common
>>
>
> This patch series needs at least one more iteration with a v2.
>
> Patches 1-5 can be applied independently of the rest and are trivial, so
> maybe they can be applied by qemu-trivial, or I can send a pull request
> for only those patches as soon as they were reviewed. That would reduce
> the size of my v2 patch set.

Patches 1-5 are

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks for all the effort you put in janitorial work, it's as thankless 
as it's useful!

Paolo


