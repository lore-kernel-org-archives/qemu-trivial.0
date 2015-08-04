Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMc3q-0002O8-2S
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 09:15:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMc3l-0002Bs-Fw
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 09:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMc3f-0007zM-AY
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 09:15:12 -0400
Received: from mail-vk0-f51.google.com ([209.85.213.51]:36371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZMc3f-0007y9-2P
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 09:15:07 -0400
Received: by vkci6 with SMTP id i6so3352951vkc.3
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 06:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=RXV74LVAPVG48X1mTQe4TakLwFpyfgslOSCuB0ePXhA=;
	b=ZLy+wy/bT8g+QgquVOCEE7hjWcikpklhJ6YLjZCp0+pu7NISZpvqixCjuZ1TQfNSn8
	N8azLRc+XALEix65m+Fvq09FxLqurUzwW2npsBQ7YIzOGbGjEiKwg9jO+3tLRmbV0gDm
	eIqNo2fYAK1ahUXQ2HkTdE71swIswMNz6EAtVFtRuHR3BjGp1YRPgsh7h2i7GuEax52L
	RGg1BKrKPPQw2mhMSiJqr7rEoESAjg4Wp6CraQE3Q9kai9MCcK4atK16l0xh02SG+ysd
	DJlnsjgPGmmfUJx+OfUTL1tu0JNPTTbj+XZFG6DZQXxPnpLp5x95hICw2shbWRmDR4Gp
	Xiog==
X-Gm-Message-State: ALoCoQms0GhgF/NUeHrmr9GX6CT8K7ux/Z97suT/R94JtpEDRtUe639u1LxHAuYJbmYGkYjYOH83
X-Received: by 10.52.166.18 with SMTP id zc18mr4541732vdb.41.1438694106586;
	Tue, 04 Aug 2015 06:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 4 Aug 2015 06:14:47 -0700 (PDT)
In-Reply-To: <20150804124658.GC6574@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
	<CAFEAcA8--05_aOX7eYPmVhPa51G7Ba=WU-18o0uVWbL+f8DrFw@mail.gmail.com>
	<20150804124658.GC6574@aurel32.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2015 14:14:47 +0100
Message-ID: <CAFEAcA_8QL2n2pKprmvx=kWEVquQHfcJwX9TTJVRcTL5eAJu=A@mail.gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
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
X-List-Received-Date: Tue, 04 Aug 2015 13:15:14 -0000

On 4 August 2015 at 13:46, Aurelien Jarno <aurelien@aurel32.net> wrote:
> On 2015-08-04 13:40, Peter Maydell wrote:
>> On 3 August 2015 at 10:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>> >  gcc_flags=3D"-Wold-style-declaration -Wold-style-definition -Wtype-li=
mits"
>> > -gcc_flags=3D"-Wformat-security -Wformat-y2k -Winit-self -Wignored-qua=
lifiers $gcc_flags"
>> > +gcc_flags=3D"-Wformat-security -Wno-format-y2k -Winit-self -Wignored-=
qualifiers $gcc_flags"
>>
>> Why do we need this warning switch change?
>
> Some locales might have the year on 2 digits only, so this triggers a
> warning. That's also a reason I suggested to use a fixed date format.

Agreed -- we don't want locale-specific log formats.

thanks
-- PMM

