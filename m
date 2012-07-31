Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDvf-0006No-Mh
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:00:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDvc-0006MW-Dp
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDvZ-0004Jp-Kb
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:00:08 -0400
Received: from mail-gg0-f173.google.com ([209.85.161.173]:59674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDvZ-0004C3-H9
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:00:05 -0400
Received: by ggnp1 with SMTP id p1so5946796ggn.4
	for <qemu-trivial@nongnu.org>; Tue, 31 Jul 2012 08:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=rv7fqZdwTuWSoon0qsRImgMn/JXOvPJTWfCqJU2Hyac=;
	b=eEmKm0WhiPyxZVZiVE67jLrd98H3+MaCV2DEIIxT0xJA4tZYF0Qb0CqJ+rgXXMQ4JD
	qo8NJz69g7FeauQYzNKSwH/CFeUfOzv5OcfcluTGX72yBpbouVhovtpA21aRBlQOb3fi
	8x8ab3/bBPmU2sqZLp3WHyhrhTaOd2BDXqh3Yer6gUebWyn0WYSruAyf32YlvFiHtMwK
	BCX6o5HSQ6TeL5kNKSGs1WQ8Nu5wVBESG7wLQc8QglYz0qmWr/KpDIbNqRgZEuHY5v0R
	n7pI2vT7yOWktbu1YmiBkVkgBNmQY8hZO4neAWatwBrRla9JKtJE3JGxJXMcwbPKluDq
	Afwg==
MIME-Version: 1.0
Received: by 10.50.36.227 with SMTP id t3mr2355054igj.13.1343746801628; Tue,
	31 Jul 2012 08:00:01 -0700 (PDT)
Received: by 10.50.94.202 with HTTP; Tue, 31 Jul 2012 08:00:01 -0700 (PDT)
In-Reply-To: <20120731143834.GJ2475@redhat.com>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	<87k3xk577l.fsf@blackfin.pond.sub.org>
	<20120731143834.GJ2475@redhat.com>
Date: Tue, 31 Jul 2012 16:00:01 +0100
Message-ID: <CAFEAcA9+32Y+q7p5H7JPvOucVU-3_s94wT7JtX0nz7e60tbTPA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnz8VU3zEBGJcjrWrIlBRNDmek6WPKYy5zhz5mXc8myM3urfblaxHoUrnrQZo30KD0L9u1A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: patches@linaro.org, qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
 list of directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 15:00:10 -0000

On 31 July 2012 15:38, Daniel P. Berrange <berrange@redhat.com> wrote:
> Isn't using 'find' somewhat overkill here really. QEMU only creates
> .o and .d files in 2 levels of directory, so sure we can just avoid
> find entirely
>
>   rm -f *.[od] */*.[od]

That's exactly the bug this change is addressing (in a more
general way than a couple of the proposed point fixes). There
are subdirectories of hw/, so for instance we have a hw/usb/bus.o
which your rm would not delete.

-- PMM

