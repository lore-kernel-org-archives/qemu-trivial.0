Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Usa5S-0007sF-5H
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 10:55:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Usa5P-0007qH-3A
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Usa5M-0007Oy-R4
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:55:42 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:52345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Usa5M-0007Oj-G3
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:55:40 -0400
Received: by mail-lb0-f181.google.com with SMTP id w10so1075548lbi.40
	for <qemu-trivial@nongnu.org>; Fri, 28 Jun 2013 07:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ydlRNI+F6WOOgTCMAgoUd3zrGMVBFg6EQ5+uP+9rPbU=;
	b=m2kQ7a4fdgINMhPCoO2SZ1CGEaoXBe4rhXIFXBSIb6xnvVYpADnvRA6fEmTztgk9aL
	9SF6IGIS6GnDcwJvF96AqdKeNlOMcUFStAoluyw8n3BDcXVM8O5ch45xiTIeRXinHCAf
	oWhkfdK5TLEzyv94jHjWJ13JjwVIIkGFkym4KiWTyeYjWoGjUYCLtE1meIsGL0SbtjIZ
	OFmt1DWPUzwZ2xElyK+p/Y3YNCtC0QJ6+M2xD+67Vt1ZF18Awz83ovyvL5wxwZVN3mrf
	ExtdzhWVxi2Vu1bU2a+k92GDeC+wVEMmsr3l2dqLn7hv3/2384o3WLm4ooN3mls2y+qZ
	pcPg==
X-Received: by 10.112.135.99 with SMTP id pr3mr6590533lbb.23.1372431339397;
	Fri, 28 Jun 2013 07:55:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Fri, 28 Jun 2013 07:55:19 -0700 (PDT)
In-Reply-To: <51CDA1E7.9000100@redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
	<51CDA1E7.9000100@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jun 2013 15:55:19 +0100
Message-ID: <CAFEAcA-8n0GEYd3Rif-XGaPaC1vwKk_eYJKu2Z8VMyKp-0-nfw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnwhMCvPJVGivZnW25WifCifCsvFCIm9JgeB+dzsYvtuFIxsV7lBHQmIA/q7KPeIPfRUHYG
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 14:55:44 -0000

On 28 June 2013 15:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 28/06/2013 15:05, Peter Maydell ha scritto:
>> I don't understand what you mean by "no need for it". We are
>> already multithreaded in system mode, so this is simply
>> making FreeBSD do the same thing as Linux.
>
> cpu_single_env is protected by the BQL unless you're running on KVM.

That doesn't make it magically not a per-thread variable.

-- PMM

