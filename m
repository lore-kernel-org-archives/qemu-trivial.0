Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqJ2V-0000BL-JU
	for mharc-qemu-trivial@gnu.org; Tue, 21 Mar 2017 08:37:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cqJ2T-000073-6z
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 08:37:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cqJ2R-0005Us-TV
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 08:37:25 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:34480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cqJ2R-0005R4-MX
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 08:37:23 -0400
Received: by mail-wr0-x235.google.com with SMTP id l37so111223357wrc.1
	for <qemu-trivial@nongnu.org>; Tue, 21 Mar 2017 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0lIleCEwL9DYoMevttRZYo3f6qcybHwfytjuAoKnBN0=;
	b=bfyiVm7IXId/o/QpnqBuLWbMRdeWASjlTuyyZ0/l8R0oAGj7BVulJzk4u84+dwN7AR
	5BV8Ngs2C4VWNVz6F19pQkuTchx0hcYW18l/szOzQjkonXZ41HZ/Yp8blv5A8T8H/wtV
	0ur+QeD6fyTUgGHo/vS2UQZ4fZ/0Ou5qyrkac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0lIleCEwL9DYoMevttRZYo3f6qcybHwfytjuAoKnBN0=;
	b=dQg9NAp0gEsglDgY6sIGGx/w5K1BMKyXO/hw5P+uT03qSE7JB8A/sKxCgxE0lgu7fL
	ED6YCFxWBwfAVroYr/4pY5VmDas3OiZQQUzjo238rCauvrkhrDXR9SW1INUYM4OnpiSu
	YzzWiZJ/0L2nFqzKWcMrtY22H9aqt0tw7Ay1E5faS8yCFbBCzuhwgwIp5G6eKTdxYZw0
	Y6tQTV5mBNmUrkBTF1PCR0JrYUsD2YoU35l1Pp/ei4RMENR0nIxgc6VyA/h9YdU9SWRC
	IttTJXLOkzhFbenjTHysjtRl2bYRDqlwy+7MRVJdqGjSSd1LJ/XbMD7ZF5z+tnwpo6qc
	Ft2Q==
X-Gm-Message-State: AFeK/H1Jk3jeAFGy/YOVAPqo/6VbjwVvzBDo6WrtNzR/MOf95bRqphprEZrsqCwy0ZSBsXittscRCs5ypALisms8
X-Received: by 10.223.152.215 with SMTP id w81mr33730260wrb.151.1490099842530; 
	Tue, 21 Mar 2017 05:37:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 21 Mar 2017 05:37:01 -0700 (PDT)
In-Reply-To: <20170316111416.25587-1-vfeenstr@redhat.com>
References: <20170316111416.25587-1-vfeenstr@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2017 12:37:01 +0000
Message-ID: <CAFEAcA-bu9noosLApv83U2WAs27q4Kx2zVv_xpZtWjL=64VSdA@mail.gmail.com>
To: "Vinzenz 'evilissimo' Feenstra" <vfeenstr@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] checkpatch: Supress warning
 in function pointer typedefs
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
X-List-Received-Date: Tue, 21 Mar 2017 12:37:26 -0000

On 16 March 2017 at 11:14, Vinzenz 'evilissimo' Feenstra
<vfeenstr@redhat.com> wrote:
> From: Vinzenz Feenstra <vfeenstr@redhat.com>
>
> When importing dynamically functions via `GetProcAddress` in windows
> related code, it is quite common to make a typedef for the resulting
> function pointer. When the function to be imported, has a stdcall
> calling convention, usually the `WINAPI` macro is used. This patch adds an
> exception in the checkpatch.pl script to allow the calling convention
> specification in function pointer typedefs, to be `WINAPI`.
>
> Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>

Could you provide an example of the kind of source line that provokes
the incorrect warning and the checkpatch output that results,
please?

thanks
-- PMM

