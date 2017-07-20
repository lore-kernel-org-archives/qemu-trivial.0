Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGA0-0002WV-4u
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 14:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYG9x-0002V7-QP
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYG9x-0002a2-1D
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:26:49 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dYG9r-0002Wf-2o; Thu, 20 Jul 2017 14:26:43 -0400
Received: by mail-qt0-x244.google.com with SMTP id l55so4466077qtl.3;
	Thu, 20 Jul 2017 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AzmOMwf/m/HSLrJrSthAbVxEWurrxRNkZDLK7BIO2FY=;
	b=rsVjGcfvLRz4Mfpa9m1U7A+no/iSR7y9gMXnV42b9FWVpufLM/paOspFhNs5WzQJeB
	QDMMTJtmOuoHB7LwBsmw7JqSITo8kAMsg5ldyHdu5Kz54U6HDpPimfI1F0tAp9x2VZqa
	oHU15OLXpXMb4hi1ahH4J4gUKyGiVVoJCpwr1+ngRm88cozOr3I/K+93d2ovh1tKJRZg
	SOQGXgdkF9/GK4YQSyfrVibltPVr6+Bf7nUlU8EnArnY5avrY3fOjzAKYK8T0QSLkpHT
	RAISzOapCp9M8ZEVH95M22pt3zurpUaUEfIRpXVelS1138Y+VKTrcrViScBhrdscLFEE
	fGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AzmOMwf/m/HSLrJrSthAbVxEWurrxRNkZDLK7BIO2FY=;
	b=KUwr3ebZAnTy9GtWgzZNQL8MA9Gv3gSW5oO+4ji65I5EpoBYuGoUvk3ucOxNFt6t4q
	5m3wh302IMsMcclXuyKm9OnA7pqId74a4bPxql3aCVg4vPoVhoXiZEdSJTIv9wxetJWU
	koQtlaUFdr8SDBB+N+fdK/IIr+h/ZuOcFNW1YozeS7Zn+mU4xoZ5R9fGvUXPVWsl3DkM
	DHoc4M2RDeNwJRQg5B8XccjYW42fBgMnV+vMofVInikFgLILEIJZKcIO94fN37ioMfZX
	BSVTCRYnUEcFqeqmH8+TRglu5qsU5RTT/zEeEaNTg1J0KBQThHzD+quJGJLJUWs5WNnL
	ayqA==
X-Gm-Message-State: AIVw112FNRLDt56POU3wQHRTnw4i4Y/oebAuD04/2Q+LPusQ6hnyWOGN
	U8FQg1wykaNy5Xn64xU=
X-Received: by 10.237.57.163 with SMTP id m32mr6214386qte.117.1500575201803;
	Thu, 20 Jul 2017 11:26:41 -0700 (PDT)
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
	by smtp.googlemail.com with ESMTPSA id
	r58sm2212092qtc.42.2017.07.20.11.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 11:26:40 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Alexander Graf <agraf@suse.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
Date: Thu, 20 Jul 2017 08:26:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 18:26:50 -0000

On 07/20/2017 06:31 AM, Peter Maydell wrote:
> gdbstub.c:914:13: warning: array subscript has type 'char'
> 
> This reflects the fact that toupper() and tolower() give
> undefined behaviour if they are passed a value that isn't
> a valid 'unsigned char' or EOF.

Not saying we shouldn't use qemu_tolower etc, but this statement is not true at 
all.  Officially, the argument to toupper and tolower is type int.

This sounds like a bug in NetBSD -- though it may not even be that, as they may 
have done something clever and put the symbol in the middle of the data.  A 
trick that worked before compiler warnings got smarter.

Anyway, should we poison the iso name so this doesn't creep in again?

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

