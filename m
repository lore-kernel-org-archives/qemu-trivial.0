Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fxAC3-0000Lt-6V
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2018 08:12:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fxAC1-0000Fe-QN
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 08:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fxAC1-0001XM-1t
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 08:12:25 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:32966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fxAC0-0001WN-R5
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 08:12:24 -0400
Received: by mail-oi0-x243.google.com with SMTP id 8-v6so6260029oip.0
	for <qemu-trivial@nongnu.org>; Tue, 04 Sep 2018 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P5M7N3LnwdNgAmjS7+kWEzud0PUkGIurGOMl+nJDxKA=;
	b=Jw+jNGytF5kaII0lwbWc1Z53Bhb0pUMHWH9WXq2+E7KjLrBeQHoK1UBMuI8kWC0sLd
	LcWNX1tQLclv769vNJTxE0bd1KOeIgEnqt3C4FYC/pm6BPlGQqeTCYtgY3nRgywbaeWt
	UQ4Tcl/taNswsTZMbMci342nl7NDzqlu7ma2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P5M7N3LnwdNgAmjS7+kWEzud0PUkGIurGOMl+nJDxKA=;
	b=NaXWIPg1dV8rgaslKQNx5TrpaGNkYarT6m7f7nbiHFw1zthBtIiR0DNHb8P3qK32Ue
	dFmRhiFIvAINEbURMw6qahLBjI2oVZta3AGjmAk99jroVkftDo5UPzg47p4Z0pZIEVTJ
	aq5gLpSlkVZ43NQMVMaYnapUV53tYhL4RkH7+4XmuB3yPPRNBH5FcAjOYR/wPgGqyig4
	P/Q+2UJlV4Yvpq56cnTHlx5B8Lw1n/0Z9hum3oO65JxQcj5SDlKv6P0B8vmYFm6ovLPU
	ZmWWt/W9/RTJ0Sk2mXJrxGRqq9dfwQzzJr+fslLKWjhWXTBgsXAT24U3VvxWBpCt7AZj
	cwnA==
X-Gm-Message-State: APzg51BdVQqU60+kHSDqSv2UWTPpbBz648+7ab/elhUoOdAYuJd4W4dk
	F41ZQbALgVXGwzrJO52WuJyffHeU371pvIZOEblRtA==
X-Google-Smtp-Source: ANB0VdYs1gvbhGlvVgeos82r1XpWxX0RY6hTbLU6F0biTHNAeF/MyV10uwFmdpgcGBntCdNXvKu22GK5tpOjzG2vxZc=
X-Received: by 2002:aca:7513:: with SMTP id
	q19-v6mr23099910oic.13.1536063143105; 
	Tue, 04 Sep 2018 05:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:41ca:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 05:12:02 -0700 (PDT)
In-Reply-To: <ed01225b-b948-9429-a2d7-f9a5095499de@redhat.com>
References: <1536044538-22507-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8uVksn0w5Z6WBS8jXc8KtZjMgNuTk+TOPtsVgnXK4C0A@mail.gmail.com>
	<ed01225b-b948-9429-a2d7-f9a5095499de@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Sep 2018 13:12:02 +0100
Message-ID: <CAFEAcA9xt9+pnt4MSuuvzhCWv3-bpata6BG0RiD86Joo3zH4dA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
X-List-Received-Date: Tue, 04 Sep 2018 12:12:26 -0000

On 4 September 2018 at 11:53, Thomas Huth <thuth@redhat.com> wrote:
> But still, I think at least the PKG_CONFIG_LIBDIR part could be useful,
> since the same problem e.g. also occurs when trying do a 32-bit build on
> a 64-bit host, i.e. when running configure with "--extra-cflags=-m32".
> Or is there also another configure switch that can help to get
> PKG_CONFIG_LIBDIR right here?

Personally I think the neatest way to handle 32-bit-build-on-64-bit-host
is to treat it like any other non-native build, ie have the distro
ship compiler, pkg-config, etc so that --cross-prefix=i686-linux-gnu-
works :-)

thanks
-- PMM

