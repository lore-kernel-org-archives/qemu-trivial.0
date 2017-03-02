Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXcQ-0000Yn-Tu
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:46:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXcO-0000XY-H9
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXcN-00046J-Px
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:46:32 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:33581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjXcN-00045g-Jc
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:46:31 -0500
Received: by mail-wr0-x22e.google.com with SMTP id u48so61130237wrc.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WclwDlyT1thJiLsGt+YPOaP91lxjN467XCUsg5IpvDg=;
	b=j7Lw9h4q11H8wac/OSx/1WQ6JuwXvgLBKxrR5FMYs+kx5Wv8MtSqjwn2QOzMzIR3q6
	etW4E4HYs91AWqJulzo6FYVDPxlaiGIEkJjyXSe8JjjxRDvCyl9dBldag1GzXR3A0e0d
	YAFI7Kgs5l1Iyw/0hIQqASj1jtgIQQiPlholg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WclwDlyT1thJiLsGt+YPOaP91lxjN467XCUsg5IpvDg=;
	b=PVjvXLHAxkj8oqbxNU42XHlRMX+zvC6KHWdCzkk5sQ1IMYmNQterhxpQa940f4JKdS
	TEHwtI+Embg8mPA/g/PqxWhcuPVFeciVSHOQzXCCI6dDKctlw9R2KJj2w1AHqeGYD0Qj
	YqnjoVX3aeotS9x6DrJjq2XLuQ9+yTF/z5FmbJKxsARb9fy7XfE9ZKowFnEZ1MOs2U2g
	5b9H+xgDuE7CzIuZ7DAWBelj8j0KgYJXQcSbT9bUSx8xhn+OyN86C0hWM9ST5q5t70vL
	u2kzlAUawcKmiGP4rftj/NFDSCMUV/r6Bp9yBumwJylNnFY3OMMcq6PLui2s3hg19fmj
	cMRQ==
X-Gm-Message-State: AMke39nfd1XaoAW/66QvYySHgXorQQmQG5mpeBSYRQgniY0IyTpsXlbu6NjltoIei6ZRXR7AjSgDlStfLcVFWcOJ
X-Received: by 10.223.152.215 with SMTP id w81mr15431400wrb.151.1488487590577; 
	Thu, 02 Mar 2017 12:46:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:46:10 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703022113370.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<ae7dc986dd60d4a4baef3d4aef31e10b281e85a7.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA-7AiUb6pMdVf5kRY3eg2Teqw4TOhWt9RNqVjcfvDRx+g@mail.gmail.com>
	<alpine.BSF.2.20.1703022113370.83701@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:46:10 +0000
Message-ID: <CAFEAcA9VQWC3Qqosm6EnoBK_Z-z33rVNyDUi=JkkHKWW2=Dvjw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 10/14] sm501: Add support
 for panel layer
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
X-List-Received-Date: Thu, 02 Mar 2017 20:46:33 -0000

On 2 March 2017 at 20:15, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>
>> This is another refactoring that's unrelated to adding panel
>> layer support, right? (It's just changing from having src and
>> offset updated at the end of the loop to dropping src and having offset
>> be updated in the for()).
>
>
> It's a clean up getting rid of the unneded src pointer. Should I move it to
> the cleanup patch or is it OK to leave it here?

I've reviewed it now, so you can leave it. It would have
been better in its own patch, though. (The general principle
is that each patch should do only one thing, and it should do
all of that one thing, and the one thing should be fairly
small and easy to understand.)

thanks
-- PMM

