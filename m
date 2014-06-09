Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wu0qo-0001rB-DM
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jun 2014 10:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wu0qi-0001mQ-As
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 10:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wu0qa-0001lw-Fk
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 10:47:00 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:64466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wu0qa-0001ld-82
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 10:46:52 -0400
Received: by mail-lb0-f180.google.com with SMTP id p9so3136434lbv.11
	for <qemu-trivial@nongnu.org>; Mon, 09 Jun 2014 07:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BngKVABuBFRyuOBnu5Vu9/L2h1bx7AnxS1QEfxU4Dqk=;
	b=EinWJrYI53Z+rtnkGMOVwF7nq6XeR5gTmEnXsuqbEM93zOt87LvVkPCgwz3HzHhN0r
	iLWU8MUqWXejcyEuj3RUxi15llsGSJAB3OAem9KYVnoGp7YVDxOlqkkFINm97YNY8+UI
	FtJ0EAm7VTZr3AzJ6njYmRAcFwpK3ZU8xVoUym+TEpicKBMx/dgbNSDKtKYW05DyIwl8
	WuBAr12aCmGttXNwBQULX98fIUbmz22kuSKcidsPwLiPiU5oXIODMV/wo5EZd6vSZwFT
	qd1Z4szSrMUdooy9ZMHIYymlCmL+8VTjVH/Qf9OtG3MidKnGby8YHBYZljPjoZn1/5Pc
	EQ1w==
X-Gm-Message-State: ALoCoQnrmWmU6n89I9nbrCgKSRd8s1l1wgHQKHG1o4UBJM5kp49Q415ZaUlwKV7X6UxaiE2tthaN
X-Received: by 10.112.160.105 with SMTP id xj9mr17083966lbb.2.1402325211154;
	Mon, 09 Jun 2014 07:46:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 9 Jun 2014 07:46:31 -0700 (PDT)
In-Reply-To: <CAFEAcA8o-1gY5xnJdCEhhfkxfYEv7AkHEXs05746EMj0zna+ow@mail.gmail.com>
References: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
	<539449AE.4090909@msgid.tls.msk.ru>
	<CAFEAcA8o-1gY5xnJdCEhhfkxfYEv7AkHEXs05746EMj0zna+ow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jun 2014 15:46:31 +0100
Message-ID: <CAFEAcA9O_DTieAc8jOUYANZDXyf-hUjOcVwCfTMrUkF1DA5aoQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/net/eepro100: Implement read-only
 bits in MDI registers
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
X-List-Received-Date: Mon, 09 Jun 2014 14:47:04 -0000

On 8 June 2014 13:27, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 June 2014 12:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 07.06.2014 20:52, Peter Maydell wrote:
>>> Although we defined an eepro100_mdi_mask[] array indicating which bits
>>> in the registers are read-only, we weren't actually doing anything with
>>> it. Make the MDI register-read code use it rather than manually making
>>> registers 2 and 3 totally read-only and the rest totally read-write.
>>
>> s/register-read/register-write/ -- can be fixed when applying.
>>
>> I'm not sure this is "trivial enough", because the side effect is
>> not obvious, at least not to someone not familiar with eepro100
>> registers and their usage.
>
> Mmm, but do you want to suggest a better queue? I did check
> that Linux could still boot and talk to the network via an eepro100.

Stefan has agreed to take this through the net queue;
I'll resend with the commit message errors you noted fixed.

thanks
-- PMM

