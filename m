Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjrpy-0000P6-Bm
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:21:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrpv-0000NO-T4
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrpv-0002o3-23
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:51 -0500
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:33791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjrpu-0002no-Ro
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:50 -0500
Received: by mail-wr0-x235.google.com with SMTP id u48so79212126wrc.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EW4NqT9ssprt4zIU5N2oBdiD6zhZ6fYLCr3oCk90ev0=;
	b=PFnK+y3Rxvcty/QA9+PBjNQlwF0ptE3NjwknXALP6LeTNMCucyIXN+i5RAZwjqkxCs
	SMZW7mVo+Nfd7tukqwntRUFVB8O4dn8odZJazZ47vvl20923E1YQ1oYFjOO2bmhx1NGj
	R/IrHk3lDW40HEJjYkC3YFXLkxb5YOOr5ZK/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EW4NqT9ssprt4zIU5N2oBdiD6zhZ6fYLCr3oCk90ev0=;
	b=NyT2l+i8BJob7dI1liP7NqgxBp9chL5+x91wnmvGOQFAN/tblxCBXXpfvnzzj0vd7o
	Q4DRAe8Ac3+fiBiImt26vnvobh6Iapmlnb9sUo/SYvNS4z7LocMe51qxWqgo6hsjwHaj
	wVarcgVWsHFArvhpnJb17RV/1LVYdUMpLE5QZ3G91ctWUbJ06zk+h1SBNNiOP14x5KHJ
	myXtSsBd2vJ3hqC8zKlw+smOzjpzViUTjjtIn+NCgUXvvzJj2bDOydYMAIB65Hupmjqr
	xgijAqvndp77J1bUk0qSdIYKZI39fVaW15OAhWDfHQQZ/Onbuee+2nTyz5joq2ctE78v
	k1MA==
X-Gm-Message-State: AMke39msdXghG9IeFwTnD/8HqiwWlxJxIcMsKeoJgxDkHrlti1lrjDaf9TMItvf9JgpbCecBeqFjEHFtIVgJZ4KL
X-Received: by 10.223.169.45 with SMTP id u42mr3712830wrc.187.1488565309827;
	Fri, 03 Mar 2017 10:21:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:21:29 -0800 (PST)
In-Reply-To: <b71d924c9affac516da84f9eff5668e3a65f1c3c.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<b71d924c9affac516da84f9eff5668e3a65f1c3c.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:21:29 +0000
Message-ID: <CAFEAcA_s5dM9fdVw_LwCXQmLYgX44su1gi5idyOuVVzUOhVnnw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [PATCH v3 03/13] sm501: Add missing arbitration
 control register
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
X-List-Received-Date: Fri, 03 Mar 2017 18:21:53 -0000

On 3 December 2016 at 15:32, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

