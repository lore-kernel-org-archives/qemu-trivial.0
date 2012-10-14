Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUuT-0007MT-Ln
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:35:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUuQ-0007F4-9N
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUuO-0007GO-BC
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:35:38 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:62449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUuO-0007GD-6n
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:35:36 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6879436iea.4
	for <qemu-trivial@nongnu.org>; Sun, 14 Oct 2012 13:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=7g5XoSG/JhfSRQxIMg0CSL4CudbY2mtZvYVTL/vxIdo=;
	b=lupaMRtWqs3/pUuEf2Twj4HPL1LUgJ74AD+YLfrh44Dmyk7Co9ruOHoyQV6YFrFbmv
	fMP0p4PWi86ySzAMOzRp66IVNA31zdGkH/dD73MVjaWviWgREY5EKfGna4+J4IKLZYZc
	US58i1n0hWT3hpo85QwuKsMRMaoERT+ykUHky5kCNkhGzIHPDM3qjqXR2hXfUY0Qdcap
	EGkiv/wVCrysc8p1ra9shHor833FKY0i+yAeW65k7PFHStSacRpcLdQkSjUJSmxZ/BAa
	G9qk43Iu0eMN4IoWeMhCJ+d7P+nq68m5ak0eMqhCpJCw4xiuQgKTTP2RB1NZTe3oqwwl
	xMzg==
MIME-Version: 1.0
Received: by 10.50.47.227 with SMTP id g3mr5554292ign.5.1350246935622; Sun, 14
	Oct 2012 13:35:35 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Sun, 14 Oct 2012 13:35:35 -0700 (PDT)
In-Reply-To: <CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
	<CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
Date: Sun, 14 Oct 2012 21:35:35 +0100
Message-ID: <CAFEAcA-f_+CJgKBqW3mGbzDjK2xbBssef=0geyE-kxMZLiK-Og@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnbdNCHgcShbVPEcQtoXGZyAxXOtoGknReGbZz0fq2xfdqXZzF82kv841qPJBQBd58Myd/P
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
X-List-Received-Date: Sun, 14 Oct 2012 20:35:39 -0000

On 14 October 2012 21:33, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Please don't delete this function, it is the public facing interface
>> for allowing board models to attach NAND devices to the GPMC. This
>> might not be used by anything currently in mainline, but it is used
>> by the omap3 beagle and overo board models in qemu-linaro (and which
>> I will upstream eventually, honest).
>
> It could be re-added with the boards, or just disabled now with #if 0/#endif.

It could be, but why do either of these things when the least-effort
least-change move is to just do nothing?

>> In general anything in linux-user/arm/nwfpe is legacy code which
>> it's scarcely worth the effort of touching or reviewing.
>
> Adding 'static' should be only beneficial.

Except that it's taken you time to write these patches and it
will take me time to review them.

-- PMM

