Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWLe7-0004TX-Hq
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 08:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWLe5-0004S7-Sm
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:58:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWLe5-00066u-9V
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:58:33 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWLe5-00066h-3g
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:58:33 -0400
Received: by mail-oi0-x242.google.com with SMTP id d5-v6so6043708oib.5
	for <qemu-trivial@nongnu.org>; Fri, 22 Jun 2018 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tp4GuiiSdhrZ+TNz/ryEjLki4PTkRMh5taVpfPyvvyE=;
	b=PoKOWYxE6cHjf2HX2ibH9cxDYjm1f5idj3fS4cV1gtOuFUHIDX8cC1YHBvJSgTm0UZ
	kG6BmsQiID6wHNC1BS722Vl2UFSTurLktWdCmJm3y1EZ8rE0QPvaNvJx+wJUrqX5F3jg
	YMx99EXFQ2jbN5TdPU/LUC0mDfkmvBJdYg1K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tp4GuiiSdhrZ+TNz/ryEjLki4PTkRMh5taVpfPyvvyE=;
	b=bbevWuprxz+WfkKExBKVfR6yrzNKUeMZVERzAbXygrRkHbTRO+ftggeGaeDPGFq799
	oTDaALc2PWdGnacTo30kocWad9Cb1XFTXzlD/GpYXPmBlmH7pXN61mJE6YY9wmqVtaC0
	M/0459/ZYXcFGnapH/XlgtKfD4VKzRZt3jQlSeuvSK99Y3HWpkXb0UIi+wZ/aLbAQ2Zb
	hzsStkD1TCUYOx5jAYmLmI0aIqaxhaMw5Kw9bmY5MfSKDq0DjtPuWDewtSTmjtF43ulU
	zDkGxxsSRJeqHMgtVZclEbuyXA3zFhQLfdm9dk7Y8s96evh1QU6QJ47K4Nmd4VBjz6uH
	iX4Q==
X-Gm-Message-State: APt69E3D9/qf8wtdgdDUlw7xsGF+3cRfxZnobs8Rp4QaCKyorpIo//4P
	XkFRib1yo3dMnSNm3dB+w/nUzZVLoS7xyrMO3dG7Nw==
X-Google-Smtp-Source: ADUXVKIi8C4ypgWwmBL2RVYfb80SHuayMFl18sfVZQ5j2WJW8nhpNI6mcx5U0m1WM7NfMtsm90upTHdprfpzAaUV1YQ=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr841453oig.102.1529672312347; 
	Fri, 22 Jun 2018 05:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 05:58:12
	-0700 (PDT)
In-Reply-To: <CAFEAcA-xe-zX8_y3p_XKb2pHharJwwfL3ebtUU71E_EY+xvU3w@mail.gmail.com>
References: <20180426140253.3918-1-peter.maydell@linaro.org>
	<4f0eec20-64a6-fb8f-58ae-1fab9ef34f53@redhat.com>
	<CAFEAcA86RRfz-YQivsPDRqAbZqOtdNpRnnBeKC24B5yYzY1=zg@mail.gmail.com>
	<CAFEAcA-xe-zX8_y3p_XKb2pHharJwwfL3ebtUU71E_EY+xvU3w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 13:58:12 +0100
Message-ID: <CAFEAcA-+vOgGj_Mbow2H4c1NNdjSNXibMqSmFF8KibKBbDeRsg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Don't zero-initialize
 statics for serial_hds
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
X-List-Received-Date: Fri, 22 Jun 2018 12:58:34 -0000

On 11 June 2018 at 14:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping^2 for qemu-trivial?

Gave up and threw it into the latest target-arm pullreq :-)

thanks
-- PMM

