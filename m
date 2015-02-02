Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIIrU-000363-1N
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 10:24:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIrM-00034Z-Ip
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 10:24:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIrI-0001jV-2p
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 10:24:20 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:56666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIrH-0001jP-Qz
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 10:24:15 -0500
Received: by mail-la0-f52.google.com with SMTP id ge10so41973227lab.11
	for <qemu-trivial@nongnu.org>; Mon, 02 Feb 2015 07:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cuZrTCHdmJhjPv7AvGhiOXsVPnvzr2hWW7JVfEnaUb8=;
	b=kGpP01ikDuZPUAgRMccl4CmtkQaPpaHR12ALOS29vBZ/ANQB5OFY9ZVRimnmqvoKoR
	Bii+wPP4VpQPwvkcEvPlxY/qaZoZFIyDTxVgb9FFvZxHY3OwtPI56hrLbgbmexAxLGPi
	hHXx+84mOhpn2YKh7UtEhGjWFCpZOmk/w+letcZPAETIXuVkvYFN5iAuWUiMzGKoUNKS
	24BA+pDMcPwWhi8xqoxkX3/KUkrNIjeyvh8pE3eokPUE+3qUefFRfv0drOdfMHu9n2eT
	HqLG8kW0ja+Ti6Qd4xpW96BW738prIxsNCfo00qqmyZeNvHSVC3xORV+Al1jTQ3tLW+p
	lbeA==
X-Gm-Message-State: ALoCoQm0mXduHAUgORMZfsU3neIgadyu7Eh3ofn/rNC6bhxawn50vRhx2WguKijchhf2o//hswyw
X-Received: by 10.152.2.41 with SMTP id 9mr1208132lar.59.1422890655105; Mon,
	02 Feb 2015 07:24:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Mon, 2 Feb 2015 07:23:54 -0800 (PST)
In-Reply-To: <54CF8735.3080806@partner.samsung.com>
References: <54CF8735.3080806@partner.samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Feb 2015 15:23:54 +0000
Message-ID: <CAFEAcA9BgWHqpVwLeeqLK8fD6VMWydgLJn597naeptzR9q+Hbg@mail.gmail.com>
To: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Slava Garbuzov <v.garbuzov@samsung.com>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>, Yury Gribov <y.gribov@samsung.com>
Subject: Re: [Qemu-trivial] [PATCH v2] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Mon, 02 Feb 2015 15:24:25 -0000

On 2 February 2015 at 14:18, Maxim Ostapenko
<m.ostapenko@partner.samsung.com> wrote:
> Thanks again,
>
> I've updated the patch. Is this correct now?

Yes, and you can have my
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(though I notice you ignored the bit about sending a separate
email, not a followup. Still, I expect that Riku or the -trivial
maintainers can fish it out manually.)

thanks
-- PMM

