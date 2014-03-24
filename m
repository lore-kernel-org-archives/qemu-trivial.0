Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS9ws-0004h8-C7
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 14:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS9wk-0004UM-PC
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 14:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS9wd-0000w3-Ay
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 14:50:06 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:44436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS9wd-0000vb-3H
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 14:49:59 -0400
Received: by mail-lb0-f173.google.com with SMTP id p9so3944956lbv.4
	for <qemu-trivial@nongnu.org>; Mon, 24 Mar 2014 11:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=m3wqOBYBmjXleo0i8jdlX8b9Ur8zDWe05MCl/Ny1lwc=;
	b=R5zkIBhFACspAhUGMyAUInuad6mhTVGV3Ofv/swBD2CWXxbG7Md9kMdSCpj1Lqk8Zn
	mzFOz1f4SrVXi4iiNqosSed443whXP/owqU0DgpUYsHSgLoMvzQtV8SKaUEoGW8Mn+aU
	YYMlA2S+axNV5ICW6fxVgpCPdUlkx5XfDCFKHLwRAi7HkefAr7bn6SzN7eLsZj1Fvmo3
	GzR1xMUPD/G4+fvdmAMpu9txZy8lyEZRyQg/ajyIRnYIZma6hN3VOi8qVE7kXUpOlw0Q
	h0KtGRr7brADosabdHtvTwfx1h4czFqIym3sAl0X404M1Ns557/6oM+6wg+aRJy8ipyS
	lbDg==
X-Gm-Message-State: ALoCoQm/cjfh/17Z7DIQVAA7telh3jL6ec7H33/VUlhopcvaDkwY2dzDuKO/c2b7oaquI14eS5PD
X-Received: by 10.152.1.8 with SMTP id 8mr46447405lai.1.1395686997982; Mon, 24
	Mar 2014 11:49:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 24 Mar 2014 11:49:37 -0700 (PDT)
In-Reply-To: <1395437377-5779-1-git-send-email-rjones@redhat.com>
References: <1395437377-5779-1-git-send-email-rjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Mar 2014 18:49:37 +0000
Message-ID: <CAFEAcA9JMZH04t__XDPZQJ+9Tv14wQ2ZVic=-bQ9H1FqayvggA@mail.gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, samuel.thibault@gnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] backends/baum.c: Fix
 compilation when SDL is not available.
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
X-List-Received-Date: Mon, 24 Mar 2014 18:50:13 -0000

On 21 March 2014 21:29, Richard W.M. Jones <rjones@redhat.com> wrote:
> backends/baum.c: In function =E2=80=98chr_baum_init=E2=80=99:
> backends/baum.c:569:64: error: missing binary operator before token "("
>  #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
>                                                                 ^
> backends/baum.c:598:64: error: missing binary operator before token "("
>  #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
>
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Applied to master as a buildfix.

thanks
-- PMM

