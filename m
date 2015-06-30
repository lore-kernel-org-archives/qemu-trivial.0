Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z9rdw-0005UY-M6
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2015 05:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z9rdu-0005UF-AA
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 05:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z9rdq-0002ZK-3D
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 05:15:50 -0400
Received: from mail-vn0-f54.google.com ([209.85.216.54]:44975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z9rdp-0002Yo-On
	for qemu-trivial@nongnu.org; Tue, 30 Jun 2015 05:15:46 -0400
Received: by vnbf1 with SMTP id f1so575067vnb.11
	for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2015 02:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b3JH0FtkR6SDqx2q7QLbPImAtGuIR7XsqqneyjwSJ68=;
	b=mYj7EJvidxdduKT+dqYPlZBf9PQrFLi2rwIQCtyuwEbWHV+mksUOnD5tCGMz5YWf4t
	1QIM6YUr/zIdC8vkcFRW0ANwSJBj/nMW78zR8kdM4k8x+UNixq5bUZvK5Pk/z/5Pe5lP
	K2JWwyMq5p8RLq7/VERr2hjHpAkY9bgnSNeyalFWNQ4uiFTgPL7eO3f4qXM2gvxYRudf
	8yCD5QuTSVSQacrn+WQCzoWojvu2Cz7IlAGv5gWrq+UL+XUFAc3qyZxmYASKRNn7yKPs
	6X0EpSpiWaOkRjQ+K3ItNrhMJieHQBOMEomW4jEdMbclX35qPaX9UTlguXviS9jNxyOr
	Nn4w==
X-Gm-Message-State: ALoCoQk+faAjfs67voPGcX7rO4QDoV8lpe9hMmxqcWtwzZ18q0kHWqz8cn3UZjYhIDTIWkC05ahR
X-Received: by 10.52.167.105 with SMTP id zn9mr18852731vdb.83.1435655745249;
	Tue, 30 Jun 2015 02:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 30 Jun 2015 02:15:25 -0700 (PDT)
In-Reply-To: <1435655374-20741-1-git-send-email-kraxel@redhat.com>
References: <1435655374-20741-1-git-send-email-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2015 10:15:25 +0100
Message-ID: <CAFEAcA8iq5Q84NH59zjS67O93Vq7a1u=9iyoVXB-GeuxA4BVag@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move QemuOpts from
	qemu/option.h to qemu/typedefs.h
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
X-List-Received-Date: Tue, 30 Jun 2015 09:15:51 -0000

On 30 June 2015 at 10:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/qemu/option.h   | 2 +-
>  include/qemu/typedefs.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

I don't object necessarily, but it would be nice if the
commit message said what the rationale for the change was...

thanks
-- PMM

