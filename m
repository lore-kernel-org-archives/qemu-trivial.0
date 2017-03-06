Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckpFC-0001aN-5T
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 04:47:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpF9-0001Z1-St
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:47:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpF6-0003QX-Pt
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:47:49 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpF6-0003Nv-Jh
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:47:48 -0500
Received: by mail-wm0-x230.google.com with SMTP id n11so59391822wma.0
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 01:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BUkRBPOLjojXBBMLTHC2TrjB6kbN8rnperrlwPhrSM8=;
	b=GTjkkYucGkdtnp1mgCXahjhutZNUQDPtvxsLmK16kEIuuH2M+MYTg2NLAfIOMpihu+
	tokPUCE4AUd861Llqhteq8rfuiqF2Kl+7rEv91ZwtH73fnS5uPTXjrz3jfwRFcX3gew+
	AP4qrz4kDp+FP65Vza9+hsqBvyOSIUElpBfsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BUkRBPOLjojXBBMLTHC2TrjB6kbN8rnperrlwPhrSM8=;
	b=L5ijzdc2rd9nGhTt6mjWSNDD0g7Ep8q4AE4d56WBmdOKvJ3jqOEhG9VmgFEcplWMyt
	x/4zx6RClSeiJ4TqC+GOUpboJ8ZD3S/DgtxtyzRDvH0Ghvq9f3QL3a9FlDZHKLy5Y2qw
	KmQRZkeenTzb5nAsN54XFb94A+gyz1SsL8oivWrVIPbwzGTJB8XIkm5DsiPkobWpzbsR
	yjWdec1UxnJLLUiszl2Ian0KbcwXH5gN1+mYzAfvyM8TvwIAQgs+RxbeIS7bOhALCzoE
	zCsIcnzqRiFKFi+bVDu6rZtvG68UfKVX7UZoFxzVQp/nwwu9fgN7GM4Ct1h4NUH4mYdW
	UesQ==
X-Gm-Message-State: AMke39kD7kAb1vuW37WKFg7iUqZrgOJYbH6kAlp9Z0tIZg6EpRsdlaX1IYFavIqYQfkWlQYWyy4MjGyPK3BwagbJ
X-Received: by 10.28.172.68 with SMTP id v65mr12226776wme.111.1488793665276;
	Mon, 06 Mar 2017 01:47:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 01:47:24 -0800 (PST)
In-Reply-To: <d5475df8-290b-07d4-d177-979d78850615@redhat.com>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
	<d5475df8-290b-07d4-d177-979d78850615@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 09:47:24 +0000
Message-ID: <CAFEAcA90FRxghG0ZdH7H9y2bDk2U9XO1TUJgx0MN+N=7LzO5pQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 13/13] ppc: Add SM501
 device in config for ppc and ppcemb targets
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
X-List-Received-Date: Mon, 06 Mar 2017 09:47:53 -0000

On 6 March 2017 at 07:00, Thomas Huth <thuth@redhat.com> wrote:
> Note: In case you respin the series, you might want to add this
> CONFIG_SM501 to ppc64-softmmu.mak, too, since it is a superset of the
> 32-bit config (i.e. it can also emulate the 32-bit embedded chips).

Yes, definitely do this please.
(Missed this because ARM's 64-bit default config includes the
32-bit one rather than duplicating its contents.)


thanks
-- PMM

