Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUDbQ-0003H9-RV
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 06:04:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUDbK-0003FR-I9
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:04:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUDbJ-0005Tf-5c
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:03:58 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:43088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUDbI-0005TJ-VJ
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:03:57 -0400
Received: by mail-lb0-f175.google.com with SMTP id o10so5417671lbi.20
	for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2013 03:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=HBrvEttUwPitms2+cqMuumH9b794zF2Eeeo3jL9vbJo=;
	b=pgG2LxwTlhBNew+sCYLelGve9b/dzkdHh9NkgKi+y1imuXmN4owdLfMnXGdMm9ccyc
	bmgMKaeOx16NjVwTyCvAC8+YVW+VoPDttsDAHeiVDYOVFFct/LgAOD6MXaHZOgm/DpkC
	edTCNkbNGiixHDG/KaJaN1/I6+lh9sGUTu6OsAmIX5DN6+PvrYofuP5Ao6qQGuPQXv3o
	ZqVPqq5MpEMGgTdyCvyRpWRWRye7FOap2QRziumtXlM0tKSnonLkT5XW2nD1lCZwoGff
	rbQ0FsDWBM99B+MVIaTFnwFpRtOL9P6z6gxkmDop+bFTOPOPh2WKXlspmjGD6zGTUO7u
	M4+g==
X-Received: by 10.112.161.38 with SMTP id xp6mr12855656lbb.32.1366625035171;
	Mon, 22 Apr 2013 03:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Mon, 22 Apr 2013 03:03:35 -0700 (PDT)
In-Reply-To: <51750A76.6080504@ozlabs.ru>
References: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA9szMz8X-XfehpR4CZrJ5SaQpPeRHD-5Auja=WMk=GxQg@mail.gmail.com>
	<51750A76.6080504@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2013 11:03:35 +0100
Message-ID: <CAFEAcA8JWnpUb=L97H2qo82H+11oCEvYctUvuYU377xW7BU=Sw@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkzv55xHip7sfNDvY37EbokemqlBVwmN1tesoDMoAGelVXtqP8t0EplS3nhmGrmdDkb+R97
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate-all: fix compiler
 warning and linked error
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
X-List-Received-Date: Mon, 22 Apr 2013 10:04:03 -0000

On 22 April 2013 11:01, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> On 04/22/2013 07:00 PM, Peter Maydell wrote:
>> NB that this compile failure only happens if you configure
>> with --enable-profiler.
>
>
> I also thought I can enable/disable it via ./configure but in fact I cannot:
>
> alexey@ka1:~/pcipassthru/qemu-impreza$ ./configure --help | grep prof
> alexey@ka1:~/pcipassthru/qemu-impreza$

--enable-profiler exists but it is undocumented (ie not mentioned
in the --help text). In fact I have no idea how you tripped over
this missing include if you don't know about --enable-profiler,
since configure's default is to not enable this code.

thanks
-- PMM

