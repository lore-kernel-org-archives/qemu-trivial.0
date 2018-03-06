Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etCrd-0001bL-Np
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 08:42:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCrY-0001X5-0l
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:42:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCrT-0005vJ-IB
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:42:40 -0500
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:35055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etCrT-0005uo-C8
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:42:35 -0500
Received: by mail-oi0-x230.google.com with SMTP id x10so14831054oig.2
	for <qemu-trivial@nongnu.org>; Tue, 06 Mar 2018 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4AvVM++ss1U0arS1XqkAcP3ss4yoDmi/wd8POPd+h50=;
	b=ERu5DHYQNDYhKsf2/H25M4Gp00njQ4EB8/hZ28xunJkm5O+OiCqAuzGdld/iruUI1T
	GDIYijW1CyDCt/8WGBHkrR/CVB1mXCBpQmjgMW/5hBNOnnXsBV1nynz5VD1tdoVFQd6Z
	yoohr5T3UUFAoWC5yLapAnmnjFl+jmG5MUZQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4AvVM++ss1U0arS1XqkAcP3ss4yoDmi/wd8POPd+h50=;
	b=VsBECsiIR5c1TWtcpRHFm8HE6HxsiTiK55A73QhbWZGcgJBMDLCEOoifcgFNDH9KUz
	GVKnu3VDUMycQawGwuLUN5Iwvlf/YOMSHfgW47aCtRc0FTy1D2Gah6TM6bMFBXcErL2H
	ioEZHHsutAKKN7dC3CsAq6+rFMz0ZAg3stWSQBLUsEOsQDYC9Rb4QuSkLPPcJaxU9Nvj
	WRTTfZEo3obmo8LcBF9MfTIDQkqQA719dFJwJW1SABL2IK8/ztFRdNwrAPhJR9dLX0C+
	QYVtsbyfrE2NbZgYeSmvCkD7TVPfMQvdBmKjd8uB3XbZckZnwZ5pqNqJ029e5fll+12j
	At4w==
X-Gm-Message-State: APf1xPB8QceZmElVKgXzfbw9ZhOUOYlQYNvBF7vV+DYC3adLYXFZ8w6y
	fyTuPjy8EDVeMPVol30YeTsWAQqzi0DvnCdiVHznPg7n
X-Google-Smtp-Source: AG47ELs8onq/zI2ZCEyDi1U6fDW6L3tOuE9YaKkDe1M8kHgZ4oc12eewAaCn42IlH5xlNb3zM+pSgADUPSHndiBnAO4=
X-Received: by 10.202.95.68 with SMTP id t65mr12290956oib.102.1520343754540;
	Tue, 06 Mar 2018 05:42:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 05:42:14 -0800 (PST)
In-Reply-To: <20180306133842.GH6163@redhat.com>
References: <20180306132430.32110-1-berrange@redhat.com>
	<CAFEAcA95xt-9MJHcRC7WovEB3W259_eFD7Q8v_pG5rGh3L7oCg@mail.gmail.com>
	<20180306133842.GH6163@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 13:42:14 +0000
Message-ID: <CAFEAcA98ZTXqXqtHFOaEvwCbO=206u3jNjN2MDq31m4d=bwkOA@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-trivial] [PATCH] misc: don't use hwaddr as a type in
 trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 13:42:44 -0000

On 6 March 2018 at 13:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Tue, Mar 06, 2018 at 01:33:42PM +0000, Peter Maydell wrote:
>> If the type isn't "hwaddr" then HWADDR_PRIx is the wrong
>> format string macro -- those should change to PRIx64.
>
> Eeek, that HWADDR_PRIx macro is used throughout this file, sometimes
> even with uint32_t as the arg !

Mmm, it's used where PRIx64 should be, but I think only for uint64_t
arguments; I can't see a uint32_t one. hw/ide/trace-events also has
a couple of HWADDR_PRIx uses.

thanks
-- PMM

