Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJ0zO-0000PM-7X
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2016 12:08:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0zL-0000Lz-Gu
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0zJ-0000Sd-M6
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:08:18 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35631)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0zJ-0000SO-HV
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:08:17 -0400
Received: by mail-vk0-x22e.google.com with SMTP id u68so116398859vkf.2
	for <qemu-trivial@nongnu.org>; Fri, 01 Jul 2016 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A+ysyCrT9jzeaMVz7yC9LuB2nJccB5qQTLwvp3xiTqg=;
	b=J7CfNJSghJWK/jc+FWBeExIDdoc/XouC8yvKbXqfLn3K4X99vHWz3GDrIjFjwtIOg1
	NCTNXlIM/IY+v8l5UXaI39gTGXW85lfrMMnuYbYTN8v1vkCOHUaVAamv/IdlWquD4exK
	1ULKF+w9z2oKeMdgoGdNq+cJu4Za47LR060aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A+ysyCrT9jzeaMVz7yC9LuB2nJccB5qQTLwvp3xiTqg=;
	b=DMi09pYlYN9XidXhwl3pRWDAiWnKnhJ+z1Sducmtnpn7GJWigBFz/zf3B20C2YkIi4
	Xf0dO2xLM2BxM5k/8Prfp/hB/UkOuEjxqUehTYtbx22ObXuYBm7eHAH2fON/Al2emA/w
	5LItsKtOeelocAJgol6+NQZkBkHibSlEG/gkC50JO55dQGCgFOjgWI4JI3Lxtz1JDzBh
	2F9xP8st+SWZeQrstuI1UU03O1xHiXiUAuz2ifzVyxDlgdhx5VuUX/LcCmV+mV0b6pZ1
	14XgrRGmBA9DjDSu3ZCLt/G9zKl2+jnSpPddSwrkge0n7mHAQqNvDkddY/23Z8vmBrSi
	smCA==
X-Gm-Message-State: ALyK8tLVrPPDhLHnPhH97zbPQIX5yFRXeTZu19Y6O+oFqs5pgt0aYM9fcpb2OqCaLhB5R6BQnMgfE/ca8a+Z2ShG
X-Received: by 10.31.21.143 with SMTP id 137mr9603896vkv.108.1467389297149;
	Fri, 01 Jul 2016 09:08:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 09:07:57 -0700 (PDT)
In-Reply-To: <20160626082331.39187-1-ash@kambanaria.org>
References: <20160626082331.39187-1-ash@kambanaria.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 17:07:57 +0100
Message-ID: <CAFEAcA9E=HgAcYTGyeRWJy4DfnZZNVn7fyjP5w-q_Y4eZwi=ew@mail.gmail.com>
To: Alexander Shopov <ash@kambanaria.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	al_shopov@yahoo.com, 
	=?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>, 
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-trivial] [PATCH L10N v3 0/1] Added Bulgarian translation
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
X-List-Received-Date: Fri, 01 Jul 2016 16:08:20 -0000

On 26 June 2016 at 09:23, Alexander Shopov <ash@kambanaria.org> wrote:
> Hello,
> I am sending Bulgarian transation of qemu gtk interface for the 3rd time.
> Bulgarian is a South Slavic language spoken in Bulgaria - SE Europe. It is
> written in Cyrillic alphabet.
> I am Alexander Shopov - coordinator of the Bulgarian GNOME translation
> project.
> I am cc-ing to trivial patches as from dev point this is trivial.
> Sending also to trivial reviewers, committers to po/ dir, some
> active committers as this is the third sending and I have received neither
> any comments nor has it been merged. Probably these just get overlooked in
> the grand stream of other patches.

Applied, thanks. Sorry your earlier submissions got lost...

-- PMM

