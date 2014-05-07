Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi6Hf-0004Lm-PS
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 14:09:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wi6HU-0004Af-WB
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 14:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wi6HJ-0008OO-8K
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 14:09:24 -0400
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235]:61409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Wi6HJ-0008Nc-1m; Wed, 07 May 2014 14:09:13 -0400
Received: by mail-ee0-f53.google.com with SMTP id c13so1001369eek.12
	for <multiple recipients>; Wed, 07 May 2014 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wrsc63Yv33yj98/bvrBEJIIuMXywXwqNx0zDM6+1KPI=;
	b=kJ29icSTX23TsJmHrDk48rAiiaCiKEwGUiQJLw39mmUX5Fuf7MMJlcl+0s/jjC7MxK
	CYbcvokxHZaJDPVDNawvQwPVbRAQ7+zZHri73bi3gGPoUHIinqJMlrTfz8Ufp1zvBDUN
	pZS5Ffphpr1YUAr28PWhBMU+sin17wSN2OMsVjvv6VNz1zbRQLk6qmiCRVtaYg5c3sFb
	BuZzmHupv7443xvdutD/kVEg4qFfLK4T0k1gfpzP500/KRRGO8MWE1sfSsHchrXB3zes
	USnp3ktzSus/TWbMKJMkC2CkB+kYNjycqv1wjSxn/BOOqj+ODd/58iIA560RflbIws0a
	fGHQ==
X-Received: by 10.14.109.201 with SMTP id s49mr17452186eeg.88.1399486151887;
	Wed, 07 May 2014 11:09:11 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58])
	by mx.google.com with ESMTPSA id u1sm47906648eex.31.2014.05.07.11.09.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 11:09:10 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <536A76C4.2080606@redhat.com>
Date: Wed, 07 May 2014 20:09:08 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL 00/22] Trivial patches for 2014-05-05
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
X-List-Received-Date: Wed, 07 May 2014 18:09:34 -0000

Il 07/05/2014 14:50, Peter Maydell ha scritto:
> git bisect says it's this makefile change.
>
> I think the problem here is that the rune for applying obj-specific
> CFLAGS is only in the Rules.make line for %.o: %.c, and not in
> the lines for building a .o file from a .cc, .cpp or .m file. That
> should probably be fixed.

I thought I had said I would include it together with other build 
patches... Michael, can you remove it from qemu-trivial?  It's not like 
soft freeze is tomorrow.

Paolo

