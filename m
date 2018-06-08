Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKLb-0003C9-A5
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 12:34:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <patryk@fala.ehost.pl>) id 1fRJnZ-0004dn-2u
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 11:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <patryk@fala.ehost.pl>) id 1fRJnQ-0007Ff-Oe
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 11:59:33 -0400
Received: from s16.ehost.pl ([193.143.77.16]:37718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <patryk@fala.ehost.pl>)
	id 1fRJnQ-0006aI-Ai; Fri, 08 Jun 2018 11:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fala.ehost.pl; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JIxvO3jXKd7CNYYADpyCazRC15NrEFAiOdCl5zogOG4=;
	b=DL9aK2Lsyi39gTKSZkgcvdm2QJ
	BDXOU3OKrn1+wm93KaNr9m94YzZx/s2S+RW6Ub6L7Un+NTG2cTaYHtJ6GkSPf0slUowj/U1ojRGvV
	izY9RbhCtAeg7Oz7gOtrI6MnfcDsKxB/5KPISG5nZWeEXnPEPFZrS7y3mgQ9gO/toMbc462/GzzyG
	52gS+dZD631WNvwVCGzsryOtprieYEfh2U9eRRktM6Dy0I1Ong3gvt0n/VrFb4NbCfFeW0Nuoth6I
	0nSgUoTlf3RPn9cmB9spGLJHBB/x3YBkiZj98CVIZWLwq2LrtCNzx5NYqxaHdms8cz/gRYhz3fSA3
	U8VIxY2Q==;
Received: from aaya136.neoplus.adsl.tpnet.pl ([83.6.112.136]:34930
	helo=[192.168.2.118])
	by s16.ehost.pl with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.89_1) (envelope-from <patryk@fala.ehost.pl>)
	id 1fRJmf-00036u-Vh; Fri, 08 Jun 2018 17:58:38 +0200
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180607210818.12727-1-f4bug@amsat.org>
	<9abdaa17-d6d1-0c34-2a20-43078b487bef@redhat.com>
	<CAFEAcA-QYnWOo2Hqdr-3tKDDxWDnR+tF4snd15Y1P6md04CogA@mail.gmail.com>
From: Patryk Olszewski <patryk@fala.ehost.pl>
Message-ID: <2b3eb485-701e-21cd-f66c-897df470a4e4@fala.ehost.pl>
Date: Fri, 8 Jun 2018 17:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-QYnWOo2Hqdr-3tKDDxWDnR+tF4snd15Y1P6md04CogA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - s16.ehost.pl
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fala.ehost.pl
X-Get-Message-Sender-Via: s16.ehost.pl: authenticated_id: patryk@fala.ehost.pl
X-Authenticated-Sender: s16.ehost.pl: patryk@fala.ehost.pl
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (barebone)
	[generic] [fuzzy]
X-Received-From: 193.143.77.16
X-Mailman-Approved-At: Fri, 08 Jun 2018 12:34:42 -0400
Subject: Re: [Qemu-trivial] [PATCH] chardev: Restore CR,LF on stdio
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
X-List-Received-Date: Fri, 08 Jun 2018 15:59:35 -0000

W dniu 08.06.2018 o 17:25, Peter Maydell pisze:
> On 8 June 2018 at 06:47, Thomas Huth <thuth@redhat.com> wrote:
>> On 07.06.2018 23:08, Philippe Mathieu-Daudé wrote:
>>> Remove the 'stair-step output' on stdio.
>>>
>>> This partially reverts commit 12fb0ac05, which was correct
>>> on the mailing list but got corrupted by the maintainer :p
>>>
>>> Introduced-by: 3b876140-c035-dd39-75d0-d54c48128fac@redhat.com
>>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> See:
>>> http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg06202.html (bug)
>>> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01309.html (report)
>>>
>>> Peter, Can this enters directly as bug-fix?
>>>
>>>  chardev/char-stdio.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
>>> index d83e60e787..96375f2ab8 100644
>>> --- a/chardev/char-stdio.c
>>> +++ b/chardev/char-stdio.c
>>> @@ -59,7 +59,7 @@ static void qemu_chr_set_echo_stdio(Chardev *chr, bool echo)
>>>      if (!echo) {
>>>          tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP
>>>                           | INLCR | IGNCR | ICRNL | IXON);
>>> -        tty.c_oflag &= ~OPOST;
>>> +        tty.c_oflag |= OPOST;
>>>          tty.c_lflag &= ~(ECHO | ECHONL | ICANON | IEXTEN);
>>>          tty.c_cflag &= ~(CSIZE | PARENB);
>>>          tty.c_cflag |= CS8;
>>>
>> I think this is the right way to go.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Applied to master, thanks.
>
> -- PMM
>
I actually think it would be better to set c_oflag to (OPOST | ONLCR) to
avoid any problems in the future. At this point it is assumed that ONLCR
is set.


