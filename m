Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpHZM-0000sX-O7
	for mharc-qemu-trivial@gnu.org; Thu, 31 Jan 2019 14:00:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpHZI-0000qi-7f
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 14:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpHZ9-0007Xt-MP
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 14:00:01 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpHZ6-0007PP-Cb
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2019 13:59:58 -0500
Received: by mail-oi1-x242.google.com with SMTP id x23so3684232oix.3
	for <qemu-trivial@nongnu.org>; Thu, 31 Jan 2019 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PfdaAYuNXtEuyTP0JVl7OMJNcZc3fau15KRPdm9LSt8=;
	b=Stm43Q6XPMXAuKd5grCDIUtmVh3d+rdhoA6oG7JV87LxZ1gXl9YdpqsOsCiv1d5g60
	hW46yFC9NSKBJIsuOUqtGWeIksHIQCzUw9MuHazv0XDfXZGTvvTrY7sVObp7fTK/AVdr
	TJM7fm77BP5JWUqwfgmns2s/Lh7G8HFMo9Zsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PfdaAYuNXtEuyTP0JVl7OMJNcZc3fau15KRPdm9LSt8=;
	b=sBG1fzwvIBFpYtfGYIcAg+GY87GwQ5jHJINpY+Pha3V1JIvU9qx9hIWeWc5T5KioGI
	+6MOPEKVSIBlzHkwj/c4U4d/PwkXcEXNACFvdN0qt9dGmQLcaiWUUSBRZV7kpFrrEjWw
	bX7F1sDduMeYIEc7yTdrRxn39DxlxFAbEFEb37K0pZeE0JLH5cjb3BXe2Ac6d5RJyUgl
	5OStJ66ouHN7UNIN+VbDPfpRQ6hkU6mX15O8FkIw6OJ5MJC+3CBitXmsF9EDcxbXufiB
	nbdwf54+9eqYUTnx1u29j2+CxmGVsTGcpNVJc7GKom6XbwZPivp5PERTZLU5NgS7dkeZ
	EiVw==
X-Gm-Message-State: AHQUAubjw/GSw2TijCUWL+mdOmQ6Gfjg6j311+KFsfSRtbDbfZgsWx0V
	b3FJtHM93U+6hwbErotj2fM25I6mGwzki/+xago8xA==
X-Google-Smtp-Source: ALg8bN6wGMl4ywu/bI3yquoVR5AmfY8k2WgMb4rbaXwwcDMdrAmOtfCy3q6krI93ytiDun8hiqP48Iqj9MyCOFA4ZLA=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr16491516oif.25.1548961186419;
	Thu, 31 Jan 2019 10:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20190130132214.25493-1-laurent@vivier.eu>
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 18:59:35 +0000
Message-ID: <CAFEAcA-n+j53k-SqX_w22vDY2L=AAQWFoLzR2XqWo-AjzBDAFQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	David Hildenbrand <david@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Jiri Slaby <jslaby@suse.cz>,
	Qemu-block <qemu-block@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-s390x <qemu-s390x@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Thu, 31 Jan 2019 19:00:10 -0000

On Wed, 30 Jan 2019 at 13:30, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit b4fbe1f65a4769c09e6bf2d79fc84360f840f40e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190129' into staging (2019-01-29 12:00:19 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 95b3c9cfd5eaaa4a2a4afa1eaf09612a94ade1da:
>
>   virtio-blk: remove duplicate definition of VirtIOBlock *s pointer (2019-01-30 14:20:18 +0100)
>
> ----------------------------------------------------------------
> - add device category (edu, i8042, sd memory card)
> - code clean-up
> - LGPL information clean-up
> - fix typo (acpi)
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

