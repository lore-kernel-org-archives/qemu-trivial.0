Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fs50g-0001Ri-Td
	for mharc-qemu-trivial@gnu.org; Tue, 21 Aug 2018 07:39:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs50f-0001QF-2Y
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 07:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs50e-0003Ro-Be
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 07:39:41 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fs50e-0003RG-4J
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 07:39:40 -0400
Received: by mail-oi0-x242.google.com with SMTP id c190-v6so2468531oig.6
	for <qemu-trivial@nongnu.org>; Tue, 21 Aug 2018 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I3HGHQ4azk6TXlLEvGOeGunxZTU8PgWjo/C7p9rHa74=;
	b=JE1tzkzWDR186Sa1uKu+QxGmP9fit1Chfg6Ry2IAYmaOZsq5AFwMsqovGAFYEFQeck
	dvFGPoP9aqi4aPI/Assytnq9AQff6o9oDN8RFWi96tadRs/WDiG1DTZFfX2s+Y9veFxF
	lrTcb8OhXnRvkZthPAzIaTGhB169BMxiA/PG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I3HGHQ4azk6TXlLEvGOeGunxZTU8PgWjo/C7p9rHa74=;
	b=HVlp62SRoobXvX1IsjGrwtWzSLTMarRxw4y+i9pvjIRh3mN0Mv6ZD2D/6dgciHzK3Y
	9jE64VahfLpJSOxaBKjkI8LNgUlX7mgf/AnVKHo1+W+Gc/JITZcoZRMbh0A5EE0KJPaw
	WkhtBXAgoUiR2Gw1cogmu6Gui4Zp/STB4/bTL+nbhWa/dvtdSjiKAP3j/Ttn3yUNNV5B
	YjiOp/Z+VuJpFDJkf8F961lBka1UTJtZGk3/MFmp4QZ7Qc3ajKRn3lWPSYOwBnORvkQA
	fL2/Cuw/zW2/Do9QRB3QjBoKs08xoUcr1ZjX4JVBi2bLI8cERIJGw9r0QO8gl6btZHRb
	Prgw==
X-Gm-Message-State: AOUpUlE0Zv57mmLwMDpzL4FFY5TzFd10OdFXDTDnPS/CMRkpFvcVjn5u
	+2BMjpLVZFJVHvcbMZsEDmMtqEaxPWYjrjfSfzTneg==
X-Google-Smtp-Source: AA+uWPw2cmurryy1V4i89dks+aDLhx5SgycG2CmFVNU48ZzRJYrfjct0xgXIqJDiGbM4AiCs1eZ/2qlEWXv3me5ksFA=
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr16524188oie.28.1534851579538; 
	Tue, 21 Aug 2018 04:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 21 Aug 2018 04:39:19
	-0700 (PDT)
In-Reply-To: <5adf2f78-0e4f-7c02-a5df-a2770ab4920d@isystem.si>
References: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
	<CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com>
	<5adf2f78-0e4f-7c02-a5df-a2770ab4920d@isystem.si>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Aug 2018 12:39:19 +0100
Message-ID: <CAFEAcA__5+nCEbb9-B+fWKhB3c=HP_5N7tnw7i1uvD7rWPY0uw@mail.gmail.com>
To: Marko Klopcic <marko.klopcic@isystem.si>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] arm: fix reset operation on
 netduino2 board.
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
X-List-Received-Date: Tue, 21 Aug 2018 11:39:41 -0000

On 21 August 2018 at 12:37, Marko Klopcic <marko.klopcic@isystem.si> wrote:
> Thanks for the review. I agree that this fix is more a workaround, but it is
> local to
> the only currently existing board with STM32 (AFAIK), so I couldn't break
> other targets.
> I'll try to implement one of your proposals.

It's a pretty nasty issue to try to fix. You might want to
send a proposed design for a fix to the mailing list before
you write too much code...

thanks
-- PMM

