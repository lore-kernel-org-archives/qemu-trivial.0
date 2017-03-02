Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjXgI-0001t9-Mm
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:50:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXgG-0001ro-I4
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjXgF-00069N-Pv
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:32 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:35229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjXgF-00069B-Jv
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:50:31 -0500
Received: by mail-wm0-x231.google.com with SMTP id v186so1138335wmd.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zqZLV3sgrIXTko/roodUZKEQooNEGuIWFHnYXV65HcY=;
	b=Od5SVqQooEhlEjogwbopGHtYY4FzXodZhHuU3rZbZq068lWXlKqrJi/GZog6HuOI+1
	eyEVfGHGjb7F9aWUnYJVG8ah5Cia0Ma5kwK4VPP2uI29ZdRkCU5gOs5hQDDhheyT9AAm
	W+h1YUrxa8ajECy29ulP56U9R0iGjfWPzDnOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zqZLV3sgrIXTko/roodUZKEQooNEGuIWFHnYXV65HcY=;
	b=Kf2RKNDxS/2m6RS9gwwGr8z/NCfSft7suD2sYKNjvAn4DQ9OdWFpWdZWr14KYtv2aF
	zVkT+sk3xJhLh41q8IG101/2/jS8TMErpLBpLFdTTCYSleyfOUrkdkwJE5WH21Vac4i7
	diBl0y1Ym5rcJNh54Dy3t+ftRPyFmVEoZdQy8h56GC8zbuF2MXLljbFFIUGn7IF7WYBH
	iS8UrMyCycEltwM+OXN+WC8qOnSrXdfHsQDE/WCwsDhQB7S/nzDRK+1IhVVGFC3IGEOO
	XQCx7aAmT9HH9GVKRnZcxTVZc8CvuoxmEHuNXUPgZrE32hTFwsVh67pBc/iSKJQNWAxv
	+3jQ==
X-Gm-Message-State: AMke39mtnDIyI6Cm30x60O7sPQ0QFjMYOfE33S9mD11vjyPK4T6NF7NKmnGCuSq+KVDCOTO1EFTnncpn9QRZKt8I
X-Received: by 10.28.55.199 with SMTP id e190mr161124wma.92.1488487830511;
	Thu, 02 Mar 2017 12:50:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:50:10 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1703022121300.83701@zero.eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<db1b69270ca4d2335e6fb2455ee56552373757fc.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA_kzNEfkg56CFE=x-GqQTV-fpXjGXxvwoPoZS1HNVTnww@mail.gmail.com>
	<alpine.BSF.2.20.1703022121300.83701@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:50:10 +0000
Message-ID: <CAFEAcA-5AySwmSb6zk5UWnefOeLHNoqDeawLXbP3UL-0PhVxbg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/14] sm501: Implement
 reading 2D engine registers
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
X-List-Received-Date: Thu, 02 Mar 2017 20:50:33 -0000

On 2 March 2017 at 20:22, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Thu, 2 Mar 2017, Peter Maydell wrote:
>>
>> On 25 February 2017 at 21:47, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>> Clients normally only write to these registers, nothing is known to
>>> ever read them but they are documented as read/write so allow clients
>>> to also read the values.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/display/sm501.c | 57
>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 57 insertions(+)
>>
>>
>> Oh, the read code is in a separate patch? Please put all the handling
>> for a particular register in the same patch. If you think the
>> resulting patch is too long you can split it into several patches
>> each of which handles a group of registers if you like (but it
>> probably isn't necessary).
>
>
> So is it OK to squash this in the previous patch adding write and make the
> two a single patch?

Yes please.

thanks
-- PMM

