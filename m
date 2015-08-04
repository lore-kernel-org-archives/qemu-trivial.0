Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMhhZ-0007EM-Pm
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 15:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMhhX-0007B5-IR
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 15:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ZMhhW-0001NG-Gr
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 15:16:39 -0400
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:35783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ZMhhS-0001LS-26; Tue, 04 Aug 2015 15:16:34 -0400
Received: by qgal6 with SMTP id l6so4134703qga.2;
	Tue, 04 Aug 2015 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=u+geJwdZQUF3+VppUjaccomcCspo31HX/lf8QYwurVg=;
	b=kpeoZ3Gigt/naTv04XurdKVkVL4ELKuwQtEyWJbCCFzTU9OhpOQNyomW7nnhOSP98a
	9C+/wxmvYluG2PTRMCMRJjAOiI9WSmX18IN/7cY97yEf5qT01ril1oqBTy6etS23TmFN
	EI9D8yLgi5E/lmDnOUi1+NgRIoUQ/zPDh/6Hzl++3KOybBjar+G1eX9qpk3+uZOrN18Q
	y+ZSF7yCeOlJRzBbp6+lrqZsijA5O/bFZwkD1KhEUBLNzlWJCz8+Iqm7KdN/n+4SZDkx
	fArJF/+GauzCgPDySgoQRWcYazwFAtJUwIeqclv001XM9V579XULz7idJqGitpN93TNu
	nZZQ==
X-Received: by 10.140.41.9 with SMTP id y9mr9354375qgy.28.1438715793671;
	Tue, 04 Aug 2015 12:16:33 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	z76sm136624qge.22.2015.08.04.12.16.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 12:16:32 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net> <87d1z3klyh.fsf@linaro.org>
	<55C0FFE2.5010502@twiddle.net> <87a8u6lvm3.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <55C10F8D.3030400@twiddle.net>
Date: Tue, 4 Aug 2015 12:16:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87a8u6lvm3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 03/11] qemu-log: correct
 help text for -d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 19:16:40 -0000

On 08/04/2015 12:08 PM, Alex Bennée wrote:
>>> Would that make sense as a debug option or should we have a specific set
>>> of TCG options to alter its behaviour?
>>
>>
>> That's what I'm saying -- probably a separate debug option is better.
> 
> Sorry I meant should we add it to -d (as in -d nochain) or have some tcg
> opts (--tcg nochain,blah)

I was suggesting the former: -d nochain.


r~


