Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fhXVY-0001tc-RH
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2018 05:52:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhXVX-0001tM-6m
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2018 05:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhXVW-0002xa-K6
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2018 05:51:59 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fhXVW-0002x1-DW
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2018 05:51:58 -0400
Received: by mail-oi0-x244.google.com with SMTP id b15-v6so30425oib.10
	for <qemu-trivial@nongnu.org>; Mon, 23 Jul 2018 02:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fzzqgaD/aMzPp34DfJ1hNhz4lI8zgvYgBThSISbDhh0=;
	b=eGcDwPnSaiQ9VZ1yJQ6WgVfBPFNJ4+L9MZGmtKx5LQOpj9EayZ6Toav4yWABG+/ORL
	hcl19kWFL5PfHwRNkf9+qqi/Hdz1k0SAF1HMz/qiDDxyJOPICp+rXUmsiNRDP7S5WOnT
	3pW5AVomqoHjQ0fh+CwWOFiG01NS8aSDA+UXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fzzqgaD/aMzPp34DfJ1hNhz4lI8zgvYgBThSISbDhh0=;
	b=CvVdIl5KRSywPAFTTuQL8c9yogFXVw7oXBGewOvI7flOMO/qbkRyIwO5L8/jbclu5Z
	O3ewVhMFrvI/qvx1V58Ci9pZ/4Bimc4Hvg55CwcYqLnqY8K2VJW/w+Q4QI8SJQWTDR7e
	pNO8pqNm6mDfuAlO83yqMeiytQ+JuVdbO6omFUvfEubHXj7jR6t2YeZqVnEKM4p4sC+N
	kIkgKihYZe9GmYs55gxQRk9eytkTsEehLR5EEgqSuu6H6fSx+tCtNiz1X6Xhin6tfWT0
	oJ0kjpv6bZdLiM5BKJZut+uVEutTLFr6JSBsCpCiM3ISKmIxA3Bcb8VDjgdscV/0gnhY
	D3gw==
X-Gm-Message-State: AOUpUlFraLGwoHCSE2E8smlISuufAYfXKVJCyG7cjmrq2VnZS2RVhTCG
	NlxqaZFNl0P2kf9RH4Bt48WUrbSgXiKXNyNjyHMcWQ==
X-Google-Smtp-Source: AAOMgpejRnDK8hO9cLcbldDstiKGkcVsS4VX6xb3Gn5nOq3+nK+pDPOeVT0tHAtOiaMkEFOI5Fz7UffU7NrfzwVk7TY=
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr7185112oia.164.1532339516324; 
	Mon, 23 Jul 2018 02:51:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 02:51:36
	-0700 (PDT)
In-Reply-To: <20180720212509.18339-1-sw@weilnetz.de>
References: <20180720212509.18339-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jul 2018 10:51:36 +0100
Message-ID: <CAFEAcA-ML2PVG6y4OESWBt-Ac2uNwvPK8Ucb5ggxJ4vcQ=ZYGA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alexander Shopov <ash@kambanaria.org>, Kevin Wolf <kwolf@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?B?w4Frb3MgS292w6Fjcw==?= <akoskovacs@gmx.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozancag@gmail.com>, 
	Fam Zheng <famz@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [PATCH v2 for-3.0] po: Don't include comments
 with location
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
X-List-Received-Date: Mon, 23 Jul 2018 09:52:00 -0000

On 20 July 2018 at 22:25, Stefan Weil <sw@weilnetz.de> wrote:
> Those comments change often when ui/gtk.c is changed and are not
> really useful.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> CC'ing all translators because of the new string which still needs
> translations.
>
> v2: Only automatically created content, no new German translation.
>

Applied to master, thanks.

-- PMM

