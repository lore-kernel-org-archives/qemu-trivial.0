Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irNHE-0001KZ-IT
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2020 09:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irNHA-0001FD-FU
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 09:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irNH9-0001Kq-1k
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 09:34:36 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irNH8-0001KS-RL
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 09:34:34 -0500
Received: by mail-ot1-x344.google.com with SMTP id 66so12771223otd.9
 for <qemu-trivial@nongnu.org>; Tue, 14 Jan 2020 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=68x5fGdYRuVUFFZrHLBJIc1CCJV6qhXM/idrV/WYra0=;
 b=j4Bj0bVl7xvE+WKBd6sL9msQgvhwSawHzJjCVnBbEBRTAGYIYOuEf/4G69tRlPmuHB
 OiAhFnKQ1sXfuquJA+BUzT//pihzMBSsUtdjNwD48JG4ezbfws3ooXaBbYNW04b1N71r
 5PqtdrGDIKsBLbUTHD+WlIVVVUdpvzJCgh9IANqEWsE7jVjzYJcRhgFUUre62AiAuFdh
 X/AC+TDS9rjiOTObqrmtXj5kOc5FFmkKyiZ5JScOtOpYuP/bQCvDCO0N2Pd4OoUQN0Jc
 LiUDTxsACihTH9ryFb9j+zIN4VuNzof4l02DRqWFF/XpLO9q42uvS6uBI72PWv3WMRg9
 yyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=68x5fGdYRuVUFFZrHLBJIc1CCJV6qhXM/idrV/WYra0=;
 b=DKuTu/Skj1wEAFvmiF37qs6QkCrf5hGS9h90wGOPdsiWtI5gVYob8bwIZrETzWgX30
 /k+DnoozI8LPnF3mKSPSmrbkJEr3eFdAaG+uas+NQ1gGZmN8macQ3A5D7ArSPujqcQ6Q
 pIGfvP+VEFMY2FahHPHRX/wFf2ruXbQQvIH9YpfGanP3vgn6GkX9vx9NKKT5aY+Dbuly
 O+zT1NstWlmNimiidTN84OVxYq5o5wt0yRbvssfuTC1yPn1YwdjghJoivqDJjmGYDL1g
 ss9kpDJJRrKaXW2fQyrHOKQx9cj/InU5ZBUUlIn5qUXnsvr3gO5HgD1in/8FgWAPuAvG
 Wutw==
X-Gm-Message-State: APjAAAW2y++F4tVjp1aU6Ee3usdfQ2Qy0E1uqGkCxBsWvh7+GnKFBPUm
 bdZWlfD7nDUcswFZ0jov+1qzqiVyOG8Cypq+q64TGA==
X-Google-Smtp-Source: APXvYqzcg3GSuP0RcXGnLLGPGyqrDFaAGEfpT/USvqFkj3CPvq12kQesWVO5NE5sBK2chBzJTeYaSg4dF/0jFbFHCMs=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr17415349ota.232.1579012473658; 
 Tue, 14 Jan 2020 06:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20190828093447.12441-1-thuth@redhat.com>
In-Reply-To: <20190828093447.12441-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 14:34:22 +0000
Message-ID: <CAFEAcA_Y83T1n6q6sJoc9JSDGGqtGbnaAJuavuBon5rTepxw=Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-doc: Do not hard-code the name of the
 QEMU binary
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Miroslav Rezanina <mrezanin@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 14:34:38 -0000

On Wed, 28 Aug 2019 at 10:37, Thomas Huth <thuth@redhat.com> wrote:
>
> In our documentation, we use a mix of "$QEMU", "qemu-system-i386" and
> "qemu-system-x86_64" when we give examples to the users how to run
> QEMU. Some more consistency would be good here. Also some distributions
> use different names for the QEMU binary (e.g. "qemu-kvm" in RHEL), so
> providing more flexibility here would also be good. Thus let's define
> some variables for the names of the QEMU command and use those in the
> documentation instead: @value{qemu_system} for generic examples, and
> @value{qemu_system_x86} for examples that only work with the x86
> binaries.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/qemu-block-drivers.texi |  72 ++++++++++----------
>  docs/qemu-cpu-models.texi    |  10 +--
>  qemu-doc.texi                |  81 +++++++++++-----------
>  qemu-options.hx              | 128 +++++++++++++++++------------------
>  4 files changed, 149 insertions(+), 142 deletions(-)
>
> diff --git a/docs/qemu-block-drivers.texi b/docs/qemu-block-drivers.texi
> index c02547e28c..2c7ea49c32 100644
> --- a/docs/qemu-block-drivers.texi
> +++ b/docs/qemu-block-drivers.texi
> @@ -2,6 +2,8 @@
>  QEMU block driver reference manual
>  @c man end
>
> +@set qemu_system qemu-system-x86_64
> +
>  @c man begin DESCRIPTION
>
>  @node disk_images_formats
> @@ -405,7 +407,7 @@ QEMU can automatically create a virtual FAT disk image from a
>  directory tree. In order to use it, just type:
>
>  @example
> -qemu-system-i386 linux.img -hdb fat:/my_directory
> +@value{qemu_system} linux.img -hdb fat:/my_directory
>  @end example

Do you use the ability to change the text being substituted
here downstream ? If so, heads-up that I'm working on a
conversion of this texi file to rst. I'll put in a
similar rst substitution-reference, which will look like
this:

.. |qemu_system| replace:: qemu-system-x86_64

but you'll need to update your downstream processes if
you're changing the value in the texi currently.

thanks
-- PMM

