Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTkQ8-0000yw-5U
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 04:49:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTkQ5-0000yK-Lf
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 04:49:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTkQ4-000216-UA
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 04:49:21 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTkQ4-0001zo-Ft
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 04:49:20 -0400
Received: by mail-oi0-x241.google.com with SMTP id 14-v6so8174685oie.3
	for <qemu-trivial@nongnu.org>; Fri, 15 Jun 2018 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5y9aZixVdX8RqCiz4LLP3aZI6FGvrnYgaHxTVvVEVCU=;
	b=KqDVaP6ZEDqFWes6lwoUiEPD4LAWDqaTLNWWteREYohr06JooIs2JhPM6v3BubPIbW
	C3aZJPULqxhMT35zZ+eh5nF29/9bZYUHl0qEd2PteWWazi59VQGmFRLE1XkpcLq+3g5X
	NMwddWwKtOxlFTGH7qpR/FGhGSCbccbvfytec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5y9aZixVdX8RqCiz4LLP3aZI6FGvrnYgaHxTVvVEVCU=;
	b=BYUJbJbGyg2mLZHEkAsyqr3BHNwyN5cIV/3CwQxlzIhb7AQNVMS2RincBgZUG2a9TO
	gOaLBDtuiQdK2PtjnoKux6eePUX9kaqLkVvJzFoOuSkUVFWjZibJ7UeJz4NOe/vZ3aMX
	lKaAE1Uxv0XvnJnGBBFuPtuEVG9RkPT0IK4do6/UvQn+Ku0BdObRL79GM7FRknSYCz7V
	aVKDv5D5q3KX+xl0Ar6Oa0Qbw6ZGNvTtPVKoXYAoYLO3EJGbgYzP1FgSbXXh4hE5bIwF
	2WXqm0tTnDd1p4X2cP6LlcETwHcCeTU9zx7x3ZfHCoDsOZcabRlHG3PxM0e+x0hqw8wk
	i7VA==
X-Gm-Message-State: APt69E1YnuZ8Q1+1Jbry5PISMVWtJMLAtYR8jrju8atpTnPiDlSKItyU
	0WbV8LvjRafiPwzBhgXxtAJ9TL+PL9aUv+G4xNc3xQ==
X-Google-Smtp-Source: ADUXVKJmUNdfA5LmEOzwaxt2i9iXqdrk0+p8PmDpaP28+T/SNFk9A37pCe4mKPy7HjJIa/WpKvOMGi/AzqcKl2s7gYI=
X-Received: by 2002:aca:4ad2:: with SMTP id
	x201-v6mr353446oia.11.1529052559555; 
	Fri, 15 Jun 2018 01:49:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 01:48:59
	-0700 (PDT)
In-Reply-To: <ddf0a4cf-2286-9d3d-ea18-f61865f40fa9@redhat.com>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
	<CAFEAcA-vZH0KUxi+iYP3eYzXeHxNTotNwCMhEPcGhOLksbG71A@mail.gmail.com>
	<f9beda14-7c4a-8f89-baf1-5a79e847c4ac@redhat.com>
	<CAFEAcA_egToeW7ksTncbFCsW6uTh1FcPSgW6gx+VnjvQpqwWsw@mail.gmail.com>
	<ba6b4e80-c31a-6033-ea59-b4c4f1923be7@redhat.com>
	<ddf0a4cf-2286-9d3d-ea18-f61865f40fa9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 09:48:59 +0100
Message-ID: <CAFEAcA9ODGbSvZARP8hYhwFRbhNg13+Eq02s64a1Y=LO_DJCVw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kevin Wolf <kwolf@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Fri, 15 Jun 2018 08:49:22 -0000

On 15 June 2018 at 05:43, Thomas Huth <thuth@redhat.com> wrote:
> On 14.06.2018 22:11, John Snow wrote:
>> Do you have a proposed standard / do we have some consensus on which
>> generator tool or doc format we'd most like to see in QEMU? I could put
>> in some elbow grease to shine up the block layer if so...
>
> I remember that some years ago, somebody (I forgot who it was, sorry)
> once told me that we should use the same format in QEMU as in glib, i.e.
> GTK-Doc. But citing the GTK-Doc homepage: "For a more polished
> general-purpose documentation tool you may want to look at Doxygen" - so
> maybe that's the better choice instead.

The last round of email threads on this basically concluded that
we should use sphinx, which is what the kernel uses. So kernel-doc
comment format, and rst for standalone docs files. Some tidying
up of our current doc comments would be required (which are a bit
of a mishmash of styles plus syntax errors because we've never
done any kind of processing of them to keep us from making mistakes).

thanks
-- PMM

