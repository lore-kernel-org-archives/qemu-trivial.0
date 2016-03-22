Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiPSe-0007UG-Do
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 12:47:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiPSc-0007U4-9v
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiPSb-0001Bo-Fm
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:47:14 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiPSb-0001BT-7B
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:47:13 -0400
Received: by mail-vk0-x235.google.com with SMTP id z68so27168238vkg.3
	for <qemu-trivial@nongnu.org>; Tue, 22 Mar 2016 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aZXm4ObO7rIox98A5rajwe8g+ZRFWQFeVMy+ms82mgo=;
	b=gg83FFrNr7/IZfi6x6ccHJTURLQ9wGcaQE8PlvhyMC9Hubeh9dHvWjJXFa/dRN7/AX
	jY08TrVudOyM0a3CYHyJe/Wj2ZzEnLA3+JKY6kV3BCurRvLRhLWUKoX56xiZHeoH+D+2
	oSxhrG31htIwYgJD3nUgYSV6KOZoW73o0Dpvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aZXm4ObO7rIox98A5rajwe8g+ZRFWQFeVMy+ms82mgo=;
	b=DO/nRJoI05F3UtTNLrP+1E9gh1vGRULgH3mnZySfc41wApblbKSoqTNFaSNTitQcrF
	tBjy3PhxTf5uVss+N38nw9TGdV0fBWv+LWmjdCyEvthZV48NZXrwu0ybi/ymJuc65Ae8
	fFgIl2hLmIfdqy+f0HZ101yr8pVN7Eml0oYwpD66jd4cUXw4KUHs537fnv2dBoJBLrQ6
	me2QEPiBCfUR+4j2N2paDNWLj16MFR2tssCAL/rkMLYWplZ/WWNDZ5VrbLbE2+g2BxiK
	Jq8g2Obcfrzs3jljM1OGQ1w9pkMYKyiezYn376zKZU0aQF6TA1yMhJyb/SJO6+hkAMm/
	c7sQ==
X-Gm-Message-State: AD7BkJJjFqSqf+gbczSbntd9xxshSKCv3a8VM3lRSoSKam8gojrfTNPI5G1EpS7IgAtJI4OuV3/Y+ZTb2G2E5ktV
X-Received: by 10.31.47.207 with SMTP id v198mr36515805vkv.6.1458665232713;
	Tue, 22 Mar 2016 09:47:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 22 Mar 2016 09:46:53 -0700 (PDT)
In-Reply-To: <CAE_WKMyzdUMEaxiqT2+gkPoxEY6Z3ZOsbHBcvhyWkC-_mfXdSg@mail.gmail.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
	<CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
	<56F16D42.1030108@redhat.com>
	<CAE_WKMyzdUMEaxiqT2+gkPoxEY6Z3ZOsbHBcvhyWkC-_mfXdSg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2016 16:46:53 +0000
Message-ID: <CAFEAcA8pR=5tr2zw7zGO1eD0Uka2oELr3rkrf_zzn-pVTqCYJw@mail.gmail.com>
To: haris iqbal <haris.phnx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Changed malloc() to g_malloc() at places
 where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 16:47:15 -0000

On 22 March 2016 at 16:15, haris iqbal <haris.phnx@gmail.com> wrote:
> One more question. About tracking down g_free(). I thought of
> submitting for linux-user/qemu.h first. As it is done in a function
> called lock_user(), which is called by many other functions (around
> 144, too many to be checked manually). The interesting part is, the
> free is done by a pair function called unlock_user(). I just want to
> ask if all those lock_user() calls has a matching unlock_user() call
> to free() the malloc(), or there is a hidden free somewhere else also?
> This would save a lot of time. Thanks.

lock_user and unlock_user should always match. (In particular
lock_user will only malloc if DEBUG_REMAP is defined, which it
is not by default, so callers can't be free()ing by mistake.)

thanks
-- PMM

