Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZGOBd-0003NR-IZ
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jul 2015 05:13:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZGOBb-0003N3-QG
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 05:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZGOBW-000266-Sj
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 05:13:35 -0400
Received: from mail-vn0-f52.google.com ([209.85.216.52]:33091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZGOBW-00025v-PA
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 05:13:30 -0400
Received: by vnav141 with SMTP id v141so8518882vna.0
	for <qemu-trivial@nongnu.org>; Sat, 18 Jul 2015 02:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8gl/Br9eXuL0Ufe6r83Qc98oEI8fZn/l/QthHCsFMcA=;
	b=EUaAAoJtFx6+7UK9tc8UjxcX7hE4HYFDA6NPlGB6RvHtOD0M8pNQbp+WFunyJvBP/3
	CbFkIsSPEr/eAACp0uaaqPqj8BWhchyWkJpNoCjaOeL4eV2OBxyok/jAwp/QTqV4uHL0
	/LSkUSbNMVmg8YMTHrQ80CagLdlDypbEkyon4dWzsWY7NNG2Cafq3tCN9OEAZZEa4RcU
	XzhnMuYEqOsEsmjWrvMYDcWHHbU4eGPk4Wsy7XBd7Nfvveq2EXKzsXXYN2C5+X+2Orov
	PhgtZId4xK3PG0poVr4hcLVaO+O2Tb6wzPxqtgI4gn02Edbf42pwOfzjgUV7xAUYDStE
	mDWA==
X-Gm-Message-State: ALoCoQkjEA1cntyHFseiXzUAjvJ/KlDEHwySThMdPWMBU6DHBCqVShiSaUeuyYjjwAg6diNRTkc8
X-Received: by 10.52.142.101 with SMTP id rv5mr21877728vdb.41.1437210810440;
	Sat, 18 Jul 2015 02:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Sat, 18 Jul 2015 02:13:11 -0700 (PDT)
In-Reply-To: <1437208027-14584-1-git-send-email-sw@weilnetz.de>
References: <1437208027-14584-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2015 10:13:11 +0100
Message-ID: <CAFEAcA9UhSNVMQ0KDRmQH6pjo=eYRHC+BACCvdoaSGePFH6asQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for-2.4] disas/arm-a64: Add missing
	compiler attribute GCC_FMT_ATTR
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
X-List-Received-Date: Sat, 18 Jul 2015 09:13:36 -0000

On 18 July 2015 at 09:27, Stefan Weil <sw@weilnetz.de> wrote:
> Type fprintf_function which fits here was defined with this attribute.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This is an optional trivial patch for 2.4 which fixes compiler warnings
> in my build environment (with -Wextra).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

No objection if you want to put it in 2.4, though I'm a bit
surprised that missing GCC_FMT_ATTR provokes warnings.
The cleanup is nice anyway.

thanks
-- PMM

