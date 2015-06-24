Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7YTS-0007ph-3p
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 20:23:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YTO-0007pJ-SA
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:23:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YTI-0004fK-Vg
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:23:26 -0400
Received: from mail-yh0-f48.google.com ([209.85.213.48]:35251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YTI-0004fA-S2
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:23:20 -0400
Received: by yhak3 with SMTP id k3so10629825yha.2
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 17:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=9CxrETWrpr+biacPkbXaNpjAjfK/XKkeun6ddZWb2I4=;
	b=BW9uuK/6SMjhUhHoSHVp1L/4LtBtb/FsPdIP1lWwvsMqxCOTjy8XqnASerskhlbgxn
	cdlm7TqOaZMtM4e6qcrm3hu49aQuMJelVb54Y13A5rQBc3n0w+C+wa73UakHKhQd7fIF
	7xwx9Qv/plcCWQeerDNFM8amfHt8P84kwdOh5SsZtIqeculC+39F1YSeFW2+pjqg51ks
	zVqhdiexbltZalizRgUtKTtLVA6lKorrWGsFPT2N6+a8gpbzCNoZehB0bkTMnCti1/cm
	+3DuDu+CEeB1tW6EsZFLxEvHCZb5GYv9DLd/2P3ADmQNSr+5vyoMX0pOsdxwwEn2p8Sr
	/gsQ==
X-Gm-Message-State: ALoCoQnch1a0Vz8+FrldHr7l+D070wCBEFkK2jccwD8ZDn1F5CfaGfUI2s+Mboa2j3X5Pr+29qCx
MIME-Version: 1.0
X-Received: by 10.170.43.193 with SMTP id 184mr535736ykl.119.1435105400389;
	Tue, 23 Jun 2015 17:23:20 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.50.201 with HTTP; Tue, 23 Jun 2015 17:23:20 -0700 (PDT)
In-Reply-To: <5589F7F1.5080900@vivier.eu>
References: <1435104444-2550-1-git-send-email-laurent@vivier.eu>
	<CAEgOgz7wZFZcwU=TeM+Y9wZGM3G9fJcBn336L2Udm9uHQp-GhA@mail.gmail.com>
	<5589F7F1.5080900@vivier.eu>
Date: Tue, 23 Jun 2015 17:23:20 -0700
X-Google-Sender-Auth: UHdvDpPkIekUq_FqfXmMEVT40ZU
Message-ID: <CAEgOgz6zLvjSpc9Z7mWKuTNQqjjMuZbLkaNJwPfSBeoi-RXu0A@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: remove useless file
	m68k-qreg.h
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
X-List-Received-Date: Wed, 24 Jun 2015 00:23:27 -0000

On Tue, Jun 23, 2015 at 5:21 PM, Laurent Vivier <laurent@vivier.eu> wrote:
>
>
> Le 24/06/2015 02:19, Peter Crosthwaite a =C3=A9crit :
>> On Tue, Jun 23, 2015 at 5:07 PM, Laurent Vivier <laurent@vivier.eu> wrot=
e:
>>> Unused since:
>>>
>>>     commit e1f3808e03f73e7a7fa966afbed2455dd052202e
>>>     Author: pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
>>>     Date:   Sat May 24 22:29:16 2008 +0000
>>>
>>>         Convert m68k target to TCG.
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>
>> You should cc qemu-trivial on dead-code deletions and the like. This
>> is also a patch queue in its own right so there is no need to identify
>> m68k owner for this.
>
> OK, thank you. Should I resend them ?
>

No should be ok, I think the maintainer can handle it via
after-the-fact CCs. I have ccd this one just now.

Regards,
Peter


> Laurent
>

