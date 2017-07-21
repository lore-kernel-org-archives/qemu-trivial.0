Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYV6K-0007ON-St
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 06:24:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYV6I-0007Lx-2H
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYV6H-0000xb-BN
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:24:02 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:36188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYV6H-0000v8-4n
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:24:01 -0400
Received: by mail-wm0-x233.google.com with SMTP id w191so4821166wmw.1
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nRBBAMEi79iIRyM6iArh+8VpRF7fGXEwvC4cJHaspJs=;
	b=j/FWiuJF8pCeQlF2HXOGh0qJNHAH8QTu2pV8VqaPCbZv3WrCCh1wNbgg7hURVvmFY6
	dyEkoKDIyqXfr1QGFqkF6RKe1s0fCPMYBKn15uNSgkFoWcb4DDMBUI4va4gkURPF/rzl
	zlf1vQt5wOfKxxg3Frbr16oajo63NCmy3O6/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nRBBAMEi79iIRyM6iArh+8VpRF7fGXEwvC4cJHaspJs=;
	b=Or9c1KAGYOcvocN94p7FZga0Wnif/JLWO59iN6Q7NCL+vrQFE1OSOs7aBiTdsTnC/1
	AetL0rTSqwOodDHsRLT7cWfpKx2mddzOItoJwlPMUmIVcWTgspPOPPkhBE2j41TrfJyx
	OKUkMsXSiZgQTpjgKHVt1ec1y+kT4LOcyFffLnyqD1+SRIOK9BBOfzScgXTBCMhz27dT
	y4p7gzQAv5kiRWczIswb9pOH1GacBQka9FRYQudNE173v56tYzpxjHb+988hNShWupd6
	Qg+gbl2znFJLp6fd7b+be2vLtJMmFdx03NGOdSDOo6uwdqol8rgtxoNdGsLcMxbgWlX5
	ujGg==
X-Gm-Message-State: AIVw112WK6vZ9hAqBtUJ6tTo+tG6kzmXBBAPUTGE1wQCWYAirJa/yU0r
	++YIs6YzaDet2jTkYIvnRUMP81uR5Yew
X-Received: by 10.28.198.206 with SMTP id w197mr4221215wmf.86.1500632640116;
	Fri, 21 Jul 2017 03:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 03:23:39 -0700 (PDT)
In-Reply-To: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 11:23:39 +0100
Message-ID: <CAFEAcA8zVjRNtvu7HiBy_8u+7NTXjWh3aT6Fx=+D4OSNSe9KPg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>, 
	Kamil Rytarowski <kamil@netbsd.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Fri, 21 Jul 2017 10:24:03 -0000

On 20 July 2017 at 17:31, Peter Maydell <peter.maydell@linaro.org> wrote:
> On NetBSD, where tolower() and toupper() are implemented using an
> array lookup, the compiler warns if you pass a plain 'char'
> to these functions:
>
> gdbstub.c:914:13: warning: array subscript has type 'char'
>
> This reflects the fact that toupper() and tolower() give
> undefined behaviour if they are passed a value that isn't
> a valid 'unsigned char' or EOF.
>
> We have qemu_tolower() and qemu_toupper() to avoid this problem;
> use them.
>
> (The use in scsi-generic.c does not trigger the warning because
> it passes a uint8_t; we switch it anyway, for consistency.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to master; thanks all for fast reviews/acks.

-- PMM

