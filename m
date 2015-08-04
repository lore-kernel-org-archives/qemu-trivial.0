Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbX5-0003gn-Gn
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:41:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMbWz-0003fE-TO
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMbWt-0000T4-Pb
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:41:21 -0400
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMbWt-0000Ss-LH
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:41:15 -0400
Received: by vkci6 with SMTP id i6so2985081vkc.3
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 05:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=VnM4Y1m1x2szIqYlVfGURSvZdc2N+hwmOOsgcfHundI=;
	b=K7Hql2j7n41Hwq+lBDaiOFlvx2afRqu2SysaIgPa2VcwMIewJVWhTVNlc7iiq2AS2w
	3kHpFrQe6bV1cb26IhSds6izcqX2UVGKsihAwbQLItX1Vljs2LSbQLVHVBGQ/aa2yAzE
	KDJ4wj6gfDZ5xB4XaRoycPIWT05DeaDV49YUAWK28Fjk00YMNsxJoCdAYjxLA58+vMZB
	iNonLtlZToAqT3qoIPma/CUJqtL8Nsj/eVrCSUIvLYlPKDyrL6QJoy4nxb2E54c1EGE7
	XGaChWHh4zqO1HGVfbv0LCk5VTMIA0g1TJRc03x9cHVQ/l8E6KiBoeP4QB5aTRCEtlNv
	o2kQ==
X-Gm-Message-State: ALoCoQl6BzWyBW1qrBwhvKAM7rJyo1OTL1OJVLV5bQDgwY8q3XcYXlzijWPj9pi//cDiCrBbiMhy
X-Received: by 10.52.135.4 with SMTP id po4mr4673096vdb.78.1438692075032; Tue,
	04 Aug 2015 05:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 4 Aug 2015 05:40:55 -0700 (PDT)
In-Reply-To: <1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2015 13:40:55 +0100
Message-ID: <CAFEAcA8--05_aOX7eYPmVhPa51G7Ba=WU-18o0uVWbL+f8DrFw@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 10/11] vl.c: log system
	invocation when enabled
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
X-List-Received-Date: Tue, 04 Aug 2015 12:41:24 -0000

On 3 August 2015 at 10:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> This makes it a little easier to remember how you generated that 100Mb
> trace log you saved for a future date.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  configure |  2 +-
>  vl.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 704b34c..9cc6a48 100755
> --- a/configure
> +++ b/configure
> @@ -1445,7 +1445,7 @@ else
>  fi
>
>  gcc_flags=3D"-Wold-style-declaration -Wold-style-definition -Wtype-limit=
s"
> -gcc_flags=3D"-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualif=
iers $gcc_flags"
> +gcc_flags=3D"-Wformat-security -Wno-format-y2k -Winit-self -Wignored-qua=
lifiers $gcc_flags"

Why do we need this warning switch change?

thanks
-- PMM

