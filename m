Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQV2-0003tJ-N8
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQV0-0003p7-04
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:08:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQUz-00046G-7g
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:08:17 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:50605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQUz-00045l-1X
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:08:17 -0400
Received: by mail-wm0-x236.google.com with SMTP id b195so5270187wmb.5
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zI519BvzH7z8IavIaWwUez1LQDp49wS7Lmx1/VsoNps=;
	b=Gd1pMUzz5Xtb5u6EaxhHw6id7jQ+RVM1Jh3rshg3qW5Cr4b4gX0TF07doBZBwWwCSK
	uHiyyS2NFQbICj3EIkUAI2Ki6YR7GAMOZ6UG7sw4h9r1z7ew6BrKHZ3ZwnKMQrFsOqZC
	sh3fWkosk5J/kYDnTT2lln00Oux/KwNxY3urQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zI519BvzH7z8IavIaWwUez1LQDp49wS7Lmx1/VsoNps=;
	b=cXmOXTAoqmOIGSxaxmzeoJwcjs4moUDQ3eLkZC3Sa02I1Ksm5LxF2X6RC1VUcMgGGT
	TN/dJ/BIAwvjQJuA4gfC2Sakpe754iLFR2Nltjx79XxV+rIIOabC2PumkElSSrPj+q1Z
	jeTiik9DoRVPv24wzKAg4ZGE6jFfqPiCipGDjG6LOVk6L9WxWlEY3cY0P9VCvDWa/qo4
	VSWa9lg2yWaduGQGuO9dqBQUJe13NKYflzv4sAlRbkYZGEHkYpme8i1P0LQd8UhhyUs2
	dCLiLhlm+GHhAGd4F1KXOgNTrWvb+pTI9TLt3lN8quaTa1mUcsHg1zoGASTl0llkDFPJ
	v3KQ==
X-Gm-Message-State: AHPjjUg2FwsbvwEBtw8ncVFy4Y5GbfsQI7fpeCUy4tMjbFdcdJNz0xCt
	hidh1shUCjzCfp//vDh6zA4bKYQZNP5ApxZwnWa5Dw==
X-Google-Smtp-Source: AOwi7QAgsN3o8x9/uhhUa9JdLdCkyd1t2alubhFr3N9d/1TTU3wkWuxSQxs8RbgulzSoWWGgrMli/im+XAr6exyr8S4=
X-Received: by 10.28.103.195 with SMTP id b186mr4246012wmc.101.1506096496108; 
	Fri, 22 Sep 2017 09:08:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:07:55 -0700 (PDT)
In-Reply-To: <20170922154014.29350-3-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:07:55 +0100
Message-ID: <CAFEAcA8oovA56LwFtKoY1c-P93zxGoyH+vKAXF+hAK6r9bHxvg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Corey Minyard <minyard@acm.org>, 
	Balaton Zoltan <balaton@eik.bme.hu>, Alexander Graf <agraf@suse.de>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-trivial] [PATCH 02/34] hw: remove "qemu/osdep.h" from
 header files
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
X-List-Received-Date: Fri, 22 Sep 2017 16:08:19 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> while here, add entries for ppc4xx_i2c in MAINTAINERS
>
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

This is doing two things at once and would ideally be
two patches. Still,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

