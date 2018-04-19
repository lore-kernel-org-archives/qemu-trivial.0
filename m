Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f95LU-0005on-KQ
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 04:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f95LS-0005l2-5L
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 04:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f95LQ-0002RP-VO
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 04:55:10 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:33309)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f95LQ-0002Pm-NJ
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 04:55:08 -0400
Received: by mail-ot0-x22f.google.com with SMTP id w2-v6so5028145otj.0
	for <qemu-trivial@nongnu.org>; Thu, 19 Apr 2018 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=03lCIwlRsaDZ5D8Pc67hJYdp7B7SO/suTuYXNWq8hVA=;
	b=L3u4S5parE4jXag9eHe4Haj3R8/frkI4XGA83WdfDUdDUSxlai6pFNFbqOzp+GQVeo
	Z1+HvSMWpwaw6BBkk43TqUeAV8QoK4TNYVoOw0yuqLNxrN74sSgDxsr8RYD1pCb+KecB
	J2WtElnWqhUrlAGZV/VQsoBne//xPVI1BZ98g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=03lCIwlRsaDZ5D8Pc67hJYdp7B7SO/suTuYXNWq8hVA=;
	b=ILMdZ36rcXo0wGQwOezSY6Xw1+/IqVestNUNKvX4NjxOGlkKHH3A4mVMuQvfWIBwvR
	7B060+8bmNn3dq6XwdFWFr5+yuj4WWKc8hUQHLo/OJ6hega6t4RsV2uZ8ZYuZQnzRJC5
	w0UGWvSOZgU84nnwzAf6HGO79OF/aTkeVipAjSVVhNlM5a8wpCCt9+v9wwXJt+HD9SUl
	RQwYa6XRbkEfp1AkY6j4dj3ksNOdW5KSMbgVkhhC5zoSNawM+XtyJlOtQ06U6ccUC1SL
	qE7N+HAJ9FK8tXQBwUXvR2wKjlwjtTFM1sm7GsAZNsQCj/e4bE2I+lZ7bXzd5BTgOXIt
	9+3Q==
X-Gm-Message-State: ALQs6tCcABKP1BCuXbknhZ1hnzBxrRe9xNaTjfM06/xgQu8AOuysy8jD
	Krn4dTWo49o8GRBKfh3KfWOime+LW6iXxXk3ZbGAuQ==
X-Google-Smtp-Source: AIpwx4//IdYf8qrw/Gvrke6KD9WB0cXDjsqwpMC3FOHfyOWM3z3gwdX752MHEuArWKJz+WxwJpVLo8wypAWBTiJhq/s=
X-Received: by 2002:a9d:1b46:: with SMTP id
	l64-v6mr3608612otl.316.1524128107913; 
	Thu, 19 Apr 2018 01:55:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 19 Apr 2018 01:54:47
	-0700 (PDT)
In-Reply-To: <20180419075958.GD10259@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
	<20180418125545.GN27579@redhat.com> <87sh7rvf27.fsf@dusky.pond.sub.org>
	<20180419093024.27c77433.olaf@aepfle.de>
	<20180419075958.GD10259@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Apr 2018 09:54:47 +0100
Message-ID: <CAFEAcA9UYM3hifEbs_sp9jcFkwu5sSSXaLq9CLWuhNbV67+MBQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, 
	Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Thu, 19 Apr 2018 08:55:11 -0000

On 19 April 2018 at 08:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
> I wouldn't say people don't care about SLE11 (or other similarly old dist=
ros
> like RHEL-6). Rather the view in libvirt was that if a user is stuck on s=
uch
> an old distro, they are likely doing that because they want the stability
> inherant in running fixed software versions for years. IOW it is unlikely
> that they want the stability of an old distro, combined with cutting edge
> libvirt and/or QEMU.

Well, it depends. You might be stuck with an old distro because
some software you want to run depends on it, but also want to run
newer versions of some programs like QEMU. If you're in that
boat you can probably live with having to also compile a newer
version of glib to go with your newer QEMU, though. I think the
policy as outlined in that libvirt page seems a good one (it's
basically a codification of what we've been doing already), with
a few tweaks -- I think we still believe we support some older
OSX releases, and would want to mention NetBSD/OpenBSD I guess.

thanks
-- PMM

