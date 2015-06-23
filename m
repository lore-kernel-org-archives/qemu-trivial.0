Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Rnw-000136-DQ
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:16:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7Rnr-00012f-Hw
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7Rng-00070l-Oh
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:16:07 -0400
Received: from mail-vn0-f45.google.com ([209.85.216.45]:34830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7Rng-00070a-Jx
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:15:56 -0400
Received: by vnbg129 with SMTP id g129so2564855vnb.2
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 10:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=OuNMau9QOy/hml2C+aRAep6TrMX+UlRzwLQncLIDq0M=;
	b=cRGevlUdVSKBb3tYVOG+O9B8eBMoILtzQmP9nacJCwY2J42goNOsnEnAPDcTI3N9hj
	cvkfU3OWu1DXl5O/qvJFXoP9AtWqjKRoZqzVj37xauHKjpSNeXKnKYEwHHOUFOjvtQ7x
	kbSYW9QUwqgMvfRXqPtOMASEknKlhQfRFQyDnIGxFoVTCBR3sWjOSgq9ahT8rQoUeQMV
	YZ97Pxgm2Nmk+G7nbKrVALIhrGrrl/Ljzc5XTlcAoqwYbeedLyEl2zIZRqKigdJwzaAS
	mLaK5LHy8c8thz9BKq2boOFKQIFNeudFQJCSqnphdiTYugB0YBH9jmcO8lNu4G8PkNEO
	jrkw==
X-Gm-Message-State: ALoCoQluvsfdWGxfNdZnte4qgRaI36YMuwUtOi80jFycpTtPo8n/F/MlxLumFtrDPzj1uLBvNGoS
X-Received: by 10.52.114.163 with SMTP id jh3mr32764811vdb.93.1435079756095;
	Tue, 23 Jun 2015 10:15:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 23 Jun 2015 10:15:36 -0700 (PDT)
In-Reply-To: <55899291.306@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
	<55899291.306@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2015 18:15:36 +0100
Message-ID: <CAFEAcA9f=Joj8M+saF-LdrAEpXZu_ZeCm+8sjXzPPDFbU1vuWg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Wolfgang Bumiller <w.bumiller@proxmox.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL 00/21] Trivial patches for 2015-06-22
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
X-List-Received-Date: Tue, 23 Jun 2015 17:16:11 -0000

On 23 June 2015 at 18:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 22.06.2015 19:02, Peter Maydell wrote:
>> Fails to build on Windows:
>>
>> util/qemu-sockets.c: In function =E2=80=98inet_parse_connect_opts=E2=80=
=99:
>> util/qemu-sockets.c:338: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclared=
 (first use in this function)
>
> Hmm.  Does WIN really have no AI_V4MAPPED?  Does it have getaddrinfo
> in the first place?  If yes, it should have AI_V4MAPPED too.
>
> I added a conditional #define AI_V4MAPPED to 0 at the top of this
> file, the same way AI_ADDRCONFIG is handled.

https://msdn.microsoft.com/en-us/library/windows/desktop/ms738520%28v=3Dvs.=
85%29.aspx
says AI_V4MAPPED is supported on Windows Vista and later. Likely
this compile error is elderly-mingw again (though I haven't
checked with a newer one to see if it's correctly reflecting
the Windows SDK addition to the headers).

(Similarly, AI_V4MAPPED in glibc is only present from 2.3.3 and up.)

>> (Also I had to resolve a conflict in configure, so if you rebase
>> on current master you'll save me having to do it twice...)
>
> Immediately before sending the pull request, I did a rebase and rebuild.
> Apparently you pulled some other change before trying to pull this.
> I usually rebase right before sending the request.  Just did the
> rebase again, and fixed he conflict with guest-agent-msi change.

Yeah, this kind of thing just happens from bad luck sometimes
(I process pull requests oldest-first and they take a few hours
to complete). I would just have resolved the conflict locally if
there hadn't been the other problem too.

thanks
-- PMM

