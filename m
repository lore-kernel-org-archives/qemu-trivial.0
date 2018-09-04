Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fx8gZ-0004iI-B1
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2018 06:35:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fx8gX-0004h4-D7
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 06:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fx8gW-0008MS-Hx
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 06:35:49 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fx8gV-0008Lx-TZ
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 06:35:48 -0400
Received: by mail-oi0-x244.google.com with SMTP id p84-v6so5759452oic.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Sep 2018 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=skPj+kOPHHEF2Q3FELCaWbRokbHSOYcYQtgY/rWS254=;
	b=Uu4TWg+u6u7LNfMfQT8vF0Tphfv/8+O6ABjwjl2hwpP6Xv23NHdT1qqcScT+eRtqgT
	fjkt5SmNHv9OlxUuKeYQnMlj13pfa1rGgpgJc8SMBKbXpjiSZ/tHSABr1w9owoxFPOMr
	Gqo/gCyb8/Kf867m0LL9ncTjWWB2m+3U25iT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=skPj+kOPHHEF2Q3FELCaWbRokbHSOYcYQtgY/rWS254=;
	b=kRFxzOSA/yjcMkV1v27fFu+I1CE/97MZArmNV+/0CGSI6yOK/7BOKmgX06ZAfFxdGf
	KhZS2Pir2aKYMz4o1ZFCOI5qh+JCfDk3bj+8buCxmzMgmoJaJzYlxFesqaSZX+IykjZn
	Se6cVFwfg1mEySO8hJMwmgTq+Vq3fL6VoWxqsZ1XhN6tHH+x3MXejCrgWv5XQ6wTi+Jx
	+2l42hUxsGow7pMwSjY6cae7e77WFIz9hxJuXQXGsY7aiVX7pMmPprYwbjCYgVMrtp7c
	BdUjHbjxOO+HyGn/08WmUH+DXFX0KyLcafM3QFYXPhkmNFkcGhihCBac4Mn1sNgNsRNh
	FgEg==
X-Gm-Message-State: APzg51BFDItFCalpcyDhZEpSbD6UA4iF+JFVY61H1EtYcEiZqfUWExn6
	NIEnJKTTJkWTpK4kV0tTaMUA+J/QVfoBSgnrix4KqQ==
X-Google-Smtp-Source: ANB0VdaQcG2zTyA2MrXaQh26ZFySTEIpBYMHLq2Nap6Yw1131v1TeY1yjXFzsOExuAzoWULuC4jECjri8NSuY0dcBVY=
X-Received: by 2002:aca:e594:: with SMTP id
	c142-v6mr22083231oih.337.1536057347039; 
	Tue, 04 Sep 2018 03:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:41ca:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 03:35:26 -0700 (PDT)
In-Reply-To: <1536044538-22507-1-git-send-email-thuth@redhat.com>
References: <1536044538-22507-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Sep 2018 11:35:26 +0100
Message-ID: <CAFEAcA8uVksn0w5Z6WBS8jXc8KtZjMgNuTk+TOPtsVgnXK4C0A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Save
 PKG_CONFIG_LIBDIR and WINDRES in config.status
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
X-List-Received-Date: Tue, 04 Sep 2018 10:35:50 -0000

On 4 September 2018 at 08:02, Thomas Huth <thuth@redhat.com> wrote:
> When cross-compiling QEMU for a target that significantly differs from
> the host, the current information in config.status is not enough to
> properly re-create the configuration. For example when I try to test
> my build with the mingw32 cross-compiler, I regularly get this error
> after the build system tried to re-create the configuration with the
> config.status file:
>
> ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
>        You probably need to set PKG_CONFIG_LIBDIR
>        to point to the right pkg-config files for your
>        build target
>RAND
> A similar problem exists for the "windres" tool, where you have to
> set the WINDRES variable in case it has a different name.
> So let's fix these issues by storing the configuration for theseq
> variables in the config.status file, too.

This is also true if the user set CC or RANLIB or any of a bunch
of other environment variables that configure uses. If we're going
to store those settings in config.status we should consistently
do it for all environment variables we care about, I think.

What does autoconf do for the equivalent situation?

thanks
-- PMM

