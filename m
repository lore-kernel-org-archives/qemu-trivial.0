Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aT9QS-0000E3-VL
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 09:37:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aT9QR-0000B9-6y
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:37:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aT9QQ-0007QS-As
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:37:55 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aT9QJ-0007Pw-3j; Tue, 09 Feb 2016 09:37:47 -0500
Received: by mail-wm0-x22d.google.com with SMTP id 128so199156322wmz.1;
	Tue, 09 Feb 2016 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=641Fyw/hkXMfv1Td34Vayp+mzCMeKcZOYOcEzikrvHs=;
	b=YxUJlhoCJL+FSa/nqG4UHlJQuFtsLpg6AJBIV6h03t0MSJPjBYIwGUXmZfpR9bEMV7
	6IY1K8qfM6ppuJXQE9Afd9ynmGsuO/6WSP4165rGPAXXyZ4oTHIrpwfgHeGU+h1VE1MO
	Y0vxapOO4zfhJAfijTeK24LZJHgPJGNTNXjBMWmofcln+QgzVDvdc+BvsZD8g8r4aZzK
	cs+zouZzsKlqdcL4SxjYcJMbzsm8/JzYYM7LyQSzgcGEwyQTtSBiABMAWy7BDEd6XsJQ
	bCS3tB7L52kTe5oWHuX6yYABE+J04WlN/vKx7SD2JTUK+Jzw+PLA1Zy9buv1pSh3RJAT
	aA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=641Fyw/hkXMfv1Td34Vayp+mzCMeKcZOYOcEzikrvHs=;
	b=fIsdFDPqCfphONC9cgb+XI6EWteg+8FWxsFLJScBfOylwT1EhqPSl+nUZSuXdswY+H
	KfCo3QnsDKzJQ5WUabkIu4clK+WY9JngETLieC/z1leNBUtshF3OQZX5dmcwHznDJ1/4
	RyJgk16imXKclBsrubsIC81YkgrNc2uJfg4sCds13JZx+7HbLur2joe3KDW2eZakTYCK
	hcPNo10IEb21pnWydNLXDX+rttmO9aiVM9lW6PC342WwpEL53V7vKDqfhiaX9Nvbf+6P
	esn5iuLauRK/3m8015VDePdahxUO0mxf4/w0C3geVVjc7YQVwMcuKHPsx2SuWvx5B6Lo
	usOA==
X-Gm-Message-State: AG10YOSkC3HTknHGCSNwwmaMTSZZHFvdI8w8IVEQEoX5NhLtlqbmOU3ou24wfVkEf4hPMw==
X-Received: by 10.194.23.232 with SMTP id p8mr39803591wjf.80.1455028666540;
	Tue, 09 Feb 2016 06:37:46 -0800 (PST)
Received: from [192.168.10.165] (94-39-141-130.adsl-ull.clienti.tiscali.it.
	[94.39.141.130]) by smtp.googlemail.com with ESMTPSA id
	67sm17993338wmp.20.2016.02.09.06.37.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 06:37:45 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
	<20160209142120.GM24614@redhat.com>
	<CAFEAcA8QG_WagW_5GzuBkyLnuL3v2XX9KkEdiTicLYnWW4UroA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56B9F9B8.4000403@redhat.com>
Date: Tue, 9 Feb 2016 15:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8QG_WagW_5GzuBkyLnuL3v2XX9KkEdiTicLYnWW4UroA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] w32: include winsock2.h before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 14:37:56 -0000



On 09/02/2016 15:28, Peter Maydell wrote:
> On 9 February 2016 at 14:21, Daniel P. Berrange <berrange@redhat.com> wrote:
>> > On Tue, Feb 09, 2016 at 03:16:57PM +0100, Paolo Bonzini wrote:
>> > include/qemu/sockets.h also has windows.h included before winsock2.h
>> >
>> > Presumably it didn't cause a failure for you because everything using
>> > sockets.h already pulls in osdep.h. A reason to prune sockets.h
>> > headers perhaps.
> More generally we could prune anything including windows.h manually
> (there are a dozen or so .c and .h files doing that currently).

I honestly do not have time to work on this. :(

Paolo

