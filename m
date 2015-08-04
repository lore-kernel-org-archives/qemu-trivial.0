Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMdti-0005I2-1E
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 11:12:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdtd-0005Gj-0e
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdtW-0005EF-4D
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:12:52 -0400
Received: from mail-wi0-f170.google.com ([209.85.212.170]:33807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdtV-0005E2-VH
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:12:46 -0400
Received: by wibud3 with SMTP id ud3so181703818wib.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 08:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=MWX4aPaM+KdPaLvY2D2xTmY8KWIRGLNbxfTT3Br9Zv0=;
	b=NOwumCv7wVpAVt/YDZjyonYliJb4U8XHy505fOm9DSKNM46cMOpXaksNbU/CM/c+gd
	CjgT3jnHEszGQCeOz30FCS15qSYV42NqFaZxRvtSWpN3f6HwMpPyoGLS7CEw38JQluY2
	dWx1D9+uoO3l4g7zDXS8ltXM4StpVq/3l2pb6J6PT0CWZLCyzJ97zJAHWETlOTCMYtRF
	/SYMRxEBDRPqxxtyqkyxzyFsjOzq4HmeshuyViEYTqPc5JXwEM1d6HQ9++Qie7y9+P/E
	lmeMfobO9LBQrL8j+W1it/QIVYRupbKq7BOAYDwb7ELFKAxFEK0BjUlmLkK+WMtX++51
	/3DQ==
X-Gm-Message-State: ALoCoQllq7WvucRyLLVl9i6OJMVlPmT1x2bqutd5X1RbEpO4UB9P+Juzgn85F9o6MYmOJQUGlTyX
X-Received: by 10.180.36.3 with SMTP id m3mr47318715wij.60.1438701165444;
	Tue, 04 Aug 2015 08:12:45 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	uc16sm2886480wib.8.2015.08.04.08.12.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 08:12:44 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3FE753E0557;
	Tue,  4 Aug 2015 16:12:43 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
	<CAFEAcA8--05_aOX7eYPmVhPa51G7Ba=WU-18o0uVWbL+f8DrFw@mail.gmail.com>
	<20150804124658.GC6574@aurel32.net>
	<CAFEAcA_8QL2n2pKprmvx=kWEVquQHfcJwX9TTJVRcTL5eAJu=A@mail.gmail.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA_8QL2n2pKprmvx=kWEVquQHfcJwX9TTJVRcTL5eAJu=A@mail.gmail.com>
Date: Tue, 04 Aug 2015 16:12:43 +0100
Message-ID: <87fv3zkrys.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.170
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
X-List-Received-Date: Tue, 04 Aug 2015 15:12:54 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On 4 August 2015 at 13:46, Aurelien Jarno <aurelien@aurel32.net> wrote:
>> On 2015-08-04 13:40, Peter Maydell wrote:
>>> On 3 August 2015 at 10:14, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> >  gcc_flags="-Wold-style-declaration -Wold-style-definition -Wtype-limits"
>>> > -gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
>>> > +gcc_flags="-Wformat-security -Wno-format-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
>>>
>>> Why do we need this warning switch change?
>>
>> Some locales might have the year on 2 digits only, so this triggers a
>> warning. That's also a reason I suggested to use a fixed date format.
>
> Agreed -- we don't want locale-specific log formats.

Is is worth pulling out the standard log date fmt into a #define somewhere?
>
> thanks
> -- PMM

-- 
Alex Bennée

