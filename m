Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etCwN-0005uT-NI
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 08:47:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCwI-0005qQ-07
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCwC-0001eA-6B
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:47:34 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etCwC-0001dZ-1c
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:47:28 -0500
Received: by mail-oi0-x242.google.com with SMTP id e9so8199728oii.0
	for <qemu-trivial@nongnu.org>; Tue, 06 Mar 2018 05:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xJBR2iKIs2NlQeD+LKBxLjmqWO5RKixcHM+lBZaIZ0s=;
	b=CtBHfBwvv73iQfQhkUlN7fe1OZCr2NicLCKxoK5HY36jtRLfddx3dl4oBssq6WzI5n
	zAK/n3n+2d8H+/dRI94JGp8rbYim/M++WtPk40LiODGk8jzzfTdGR+Zk6CQqAH4qj+9P
	wf06z4pM2I6VNk+TyX9qrDT4kQXDvt6jIOsKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xJBR2iKIs2NlQeD+LKBxLjmqWO5RKixcHM+lBZaIZ0s=;
	b=cFmEllDpR078kCIaD2xbGMxEvOOLKs+5KSYfv1lZ4ZEwffbSlF9BL7vG/zrUaqrj9v
	cnJNoKkzpvznhIDJyaQWFoANMVa2TRfyKssL5DU2+2fd8Xhss10RMz3XaTAfgERcgO2P
	sUge6626rJvt5A7kqLZUhRMAJ98bQDHQSYtaPq8Nkh3hm8S7gPP59vMGAZlJVQO+ufNU
	eVlMVY97wP7Uy3/u8YtdYNTKBxWQ9fgtwdBDjmmiDS+TIAMexHNEvzI6TK9f634GaEkP
	QqxrURDcmJHMlm4STO0+dfQAqQJFGlbhYNR7YrFQ66NJIdNZXrbTSTITLBhVs8m7aM+H
	01+Q==
X-Gm-Message-State: AElRT7FxQGwYR+M++73Cf5Lp81NUPgucoA0ZXBOa6aS8U8mWIJZPFcpE
	PL8RB6xSEErc4Zc45dzrnhmp/E0Mj8rXqtiwwipAAw==
X-Google-Smtp-Source: AG47ELtsnL7+iA7m08l5PIqRJx0Igee54HDqGk8ExZvwQp/8a/OZR89WlxGzL/esM+IJGXpIikS/6FZxokjv4ScZ140=
X-Received: by 10.202.61.198 with SMTP id k189mr11882940oia.252.1520344047269; 
	Tue, 06 Mar 2018 05:47:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 05:47:06 -0800 (PST)
In-Reply-To: <20180306134317.836-1-berrange@redhat.com>
References: <20180306134317.836-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 13:47:06 +0000
Message-ID: <CAFEAcA84nJvwBZhrkZdoHjLerD7_ixfXf8HqiXE9aZnvGe=+WQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH v2] misc: don't use hwaddr as a type in
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
X-List-Received-Date: Tue, 06 Mar 2018 13:47:38 -0000

On 6 March 2018 at 13:43, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> Use types that are defined by QEMU in trace events caused build failures
> for the UST trace backend:
>
>   In file included from trace-ust-all.c:13:0:
>   trace-ust-all.h:11844:206: error: unknown type name =E2=80=98hwaddr=E2=
=80=99
>
> It only knows about C built-in types, and any types that are pulled in
> from includs of qemu-common.h and lttng/tracepoint.h. This does not
> include the 'hwaddr' type, so replace it with a uint64_t which is what
> exec/hwaddr.h defines 'hwaddr' as. This fixes the build failure
> introduced by
>
>   commit 9eb8040c2d2b38e1a40bb6129b1b668fa178fcab
>   Author: Peter Maydell <peter.maydell@linaro.org>
>   Date:   Fri Mar 2 10:45:39 2018 +0000
>
>     hw/misc/tz-ppc: Model TrustZone peripheral protection controller
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll apply this to master, since it will fix the travis build.

thanks
-- PMM

