Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNV8M-0005Ou-5A
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:50:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNV8J-0005It-B4
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNV8I-0002xg-He
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:49:59 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:52597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNV8G-0002xG-I7; Sun, 14 Oct 2012 16:49:56 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6887693iea.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xwtwFlOAxyhHyUNaHleB9jRFmoyU22zpPmR3af5uKkQ=;
	b=IfB+kLcpcM3IpCq3BbtYmvv7mPHhy2NYm2Mqaj2nf7eD2MpvzdC+4NoEDpBc+M/eHa
	6Js+9PlPB9moVBKrO+mfoUse6g5SHkxCT/wi+RW7hWvRpFr2jj5VcCtx1hui/NKzmVPE
	oZva9XHxtH/7miTLe9pi/OcYRtylJRIpAk1Mwoe85ByQJXO9Vl5mblZ15OkDQGBFmybD
	eDxrnnLrH/YuQcs0JagjawkPuWZ90CSw0eH+lgDzkFt+/iWdkMAEAzZ8PUyn1+jzGsir
	fibhWCCd3OsEOFHgvn74afPkSMUZSs9W5O1O1OCdFkzdiCB5YqZRbntO9SPjDqTnElth
	CJaQ==
Received: by 10.50.213.73 with SMTP id nq9mr7260439igc.27.1350247795901; Sun,
	14 Oct 2012 13:49:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Sun, 14 Oct 2012 13:49:35 -0700 (PDT)
In-Reply-To: <CAFEAcA-f_+CJgKBqW3mGbzDjK2xbBssef=0geyE-kxMZLiK-Og@mail.gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
	<CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
	<CAFEAcA-f_+CJgKBqW3mGbzDjK2xbBssef=0geyE-kxMZLiK-Og@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 14 Oct 2012 20:49:35 +0000
Message-ID: <CAAu8pHtR-jNTnEY0iwEJdihXO8FxKXWcTcnPGQssNJg5jtsBcw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 10/11] arm: add missing static and remove
	unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:50:00 -0000

On Sun, Oct 14, 2012 at 8:35 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 October 2012 21:33, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Please don't delete this function, it is the public facing interface
>>> for allowing board models to attach NAND devices to the GPMC. This
>>> might not be used by anything currently in mainline, but it is used
>>> by the omap3 beagle and overo board models in qemu-linaro (and which
>>> I will upstream eventually, honest).
>>
>> It could be re-added with the boards, or just disabled now with #if 0/#endif.
>
> It could be, but why do either of these things when the least-effort
> least-change move is to just do nothing?

Actually it's not least effort, since now I have to edit the patch.
I'm not sure what would be least effort, nobody does anything? ;-)

>
>>> In general anything in linux-user/arm/nwfpe is legacy code which
>>> it's scarcely worth the effort of touching or reviewing.
>>
>> Adding 'static' should be only beneficial.
>
> Except that it's taken you time to write these patches and it
> will take me time to review them.

Yes, the benefit may come to the users who may get a slightly faster
emulator. We, the developers, get the benefit from different things,
like technical excellence or something else.

>
> -- PMM

