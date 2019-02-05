Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr0V3-0002xo-Nb
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 08:10:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0V0-0002sS-TR
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0Tn-0004ij-GP
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:09:36 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr0Tn-0004eu-Ay
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 08:09:35 -0500
Received: by mail-ot1-x343.google.com with SMTP id i20so5590205otl.0
	for <qemu-trivial@nongnu.org>; Tue, 05 Feb 2019 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y7bvlR0OPUQvpwDi78s+Y1BnOKRmObf0M4vBSCVIPCg=;
	b=QAf4j/jGytcvPJRQR1B9+wBP3PdCquUHgTO3YN13FqwQgDyqrLmAEiy3qCDh0Dr/G8
	oGnAin2hpwSU2Zk4da1GKDgdZYryBEVTi/M1X3ZsIOVf9PPGacB9ODHduvfSgH9w5bP0
	vZ6fR3CnUQedP4CddyTT26SaA2yDUhNjkRpvp3qc8XWwPPHP4gYPDi9WdDEqAIBlnWOn
	+LCGC01+i5sjUF6GWkhKS/42UH9LDLhDkK8jpTzRUVE3SenKeCYMmb7uz4Wn838j1u/5
	gonXt2UCmdJW4P69tbQbCc7GLc/kar1pZJIoLDYelO5SIy0M8G3T2+s80wr1d+Qx79bF
	6GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y7bvlR0OPUQvpwDi78s+Y1BnOKRmObf0M4vBSCVIPCg=;
	b=i039dBJp86IsiarNiB1/c9boHKi1gwueHER7SGlJSZ+eMIRis0gJwhZE98MrGME0Qk
	318nxpFukK2AZpB4m+tBDV80al1ncvBhS+wUBHGMtoC9P+rbmrXadCot+I5xXGLvLJ5R
	4oo6OtGFClMZz6W/fGrkuPpefQhCQZ9tEHh8sjOcUjJlp4ffg31RWbs1KR7+O0GKO6qI
	TcCJVdsvEB5DHh0tP7uvgrMgDp5CusoZq2URpT+Mlv4BF+WrotExqxQY2+BncpoChCM5
	TEHk0o03tQQNyEDA5IwMxhfBybq62E/hidlnBihv21HgmX3o7v/hiIQ+hEHhBb6PC6yL
	bI4Q==
X-Gm-Message-State: AHQUAuYh5woPBSoGBz20zJp/Om0dReV8NJ/qANAzosuVbWxceSeJaUiJ
	LJGDABOSTRzYvm3QSc/a/yUoflbDhA5/DkC9eizgGQ==
X-Google-Smtp-Source: AHgI3IY7Pz+OcCRTMQpqNEmhGhBp9yiyiG/PwHulARtO/0DDdLLohA1jtdBE+LpJu/gD459+eo4dk5catAxcLOq3gTk=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr2588483otc.238.1549372163149; 
	Tue, 05 Feb 2019 05:09:23 -0800 (PST)
MIME-Version: 1.0
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 13:09:10 +0000
Message-ID: <CAFEAcA9PKSW92GJO1KcBEQcbGY7TB4pqaW8qSe9j6JJZ7Z2MKA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH] hw/cpu/cluster: Mark the cpu-cluster
 device with user_creatable = false
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
X-List-Received-Date: Tue, 05 Feb 2019 13:10:51 -0000

On Tue, 5 Feb 2019 at 12:58, Thomas Huth <thuth@redhat.com> wrote:
>
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
>
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
>
> Since this is an internal device only, mark it with user_creatable = false.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo cpu_cluster_type_info = {
> --


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Would it be possible to add a 'make check' test that every device
we claim to be user-creatable can be created without crashing ?

thanks
-- PMM

