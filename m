Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRnra-00011I-L3
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 19:37:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRnrX-0000nL-Ps
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 19:37:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRnrW-0003ZE-Uw
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 19:37:55 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRnrW-0003YX-NS
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 19:37:54 -0500
Received: by mail-ot1-x342.google.com with SMTP id t5so22032734otk.1
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 16:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2f0x3Q5YfJ2JTpmrIJ3hHsSksi6u1ZbQDGAAsHK6rKw=;
	b=V8OAUY8+ZCCeNDJD1KJ36MW+6mRFYM3dGRkU1K5nZFMba1ccshrH52DUNKCRG5zdD5
	j+pjFU7GDCs+R58Bjvcnx2XIv7KdyLb4Mw7k+CkN/IuSNDHuWQIrGhiVgQW4FM/sQWW7
	kNS3ZBSNjko71qxmFnaEZ++lrKaRbCHS7wrrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2f0x3Q5YfJ2JTpmrIJ3hHsSksi6u1ZbQDGAAsHK6rKw=;
	b=GnI/FOWcOu8A1WP6OWoTEYfHj5TTbg3caAjzfmJkOEwHX+sZqf0EzTe7NrJuQ7o/DQ
	cE+B8zNI7FCMRpqAaXaA2q5XlQ510GJdxVq/HCjPOuKT7EKdRglt+vPPETvtPomcCQim
	nmRKs6GArot1quR3XLZyEI2DOTQtu3OspiGNt9hDsmh5Bhvl55pOdNXyuJZWIGCzGZXy
	KO4u8ZvzQMa544I6i6kSdSWoX3hYum2iqYgaXS+DGOo6zsK7DmA0hXPJZ3s2+CkB87Nc
	x6i663YOfqmj80VX3863S5ZEU7gO1DFwz7vDCZst2H0sACURskzSp0PwJPPNJH9Ox7jd
	s/KQ==
X-Gm-Message-State: AA+aEWZwRBp2rXWLHAxYasv4tBSXZEfsKL+gLJKxhIXzSTHglmTKzYej
	RtAR5ikKhVzVSTYy35X2fWUpNj/85AYmnW7D+YeC/A==
X-Google-Smtp-Source: AFSGD/UIp7Zk0dBJLuU7PG74acpgB6KguQJDz8vl2Js++uZq6kFWe2+BkocnOorc96ODuDOijayr8x6+6k8zCYItSao=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr20548822oth.317.1543365473974; 
	Tue, 27 Nov 2018 16:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20181127184929.20065-1-jsnow@redhat.com>
In-Reply-To: <20181127184929.20065-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Nov 2018 00:37:42 +0000
Message-ID: <CAFEAcA8Rn7MyFCPYCthLG_3YXGBLV_duQ961i4Ew_8dRL+E8tA@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH] scsi: Address spurious clang warning
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
X-List-Received-Date: Wed, 28 Nov 2018 00:37:56 -0000

On Tue, 27 Nov 2018 at 18:49, John Snow <jsnow@redhat.com> wrote:
>
> Some versions of Clang prior to 6.0 (and some builds of clang after,
> such as 6.0.1-2.fc28) fail to recognize { 0 } as a valid initializer
> for a struct with subobjects when -Wmissing-braces is enabled.
>
> https://bugs.llvm.org/show_bug.cgi?id=21689 and
> https://reviews.llvm.org/rL314499 suggests this should be fixed in 6.0,
> but it might not be the case for older versions or downstream versions.
>
> For now, follow the precedent of ebf2a499 and replace the standard { 0 }
> with the accepted { } to silence this warning and allow the build to
> work under clang 6.0.1-2.fc28, and builds prior to 6.0.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Applied to master as a build fix for rc3, thanks.

-- PMM

