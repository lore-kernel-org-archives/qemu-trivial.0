Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buM7l-0004cz-Rt
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 12:11:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buM7j-0004bU-Ta
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buM7f-0004yq-T5
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:11:19 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buM7f-0004ye-G3
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:11:15 -0400
Received: by mail-vk0-x235.google.com with SMTP id 192so49766812vkl.2
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TpAerp+yOYqWRQTAdCApHTmezR9mzxrUCCGn4wR/5GM=;
	b=awJE75ZRxBUvY5uJUxNNUpYBQQgrqsQRpyPDKCIhQTCD1O0DPcmk8JYZJyuaDjdRPL
	DoB/uox5ITmNrjWVZBA5+2eg2WeETAeEcQ1LWib6P64BGz01lv9gzqxWk3IL3J7/Wrc2
	MY1sltz0hJ0HF52F2sfHAsVGHfCr8sM/D7uq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TpAerp+yOYqWRQTAdCApHTmezR9mzxrUCCGn4wR/5GM=;
	b=bfojPKCAdYxgqNNUypK2qLrDU09v7KPfG2w7FgtDqZfmRgmAoNx0CKLysTY8H4q/MN
	ZTGv38eezIgz7QvZ4fxjEGxQCGAUJ+7SlmjBszgfoIPMvDKfYvhBpFVuwloSn25LNGwi
	LcWTLDU0LTMr/TzMGgW1uPgTOnqx/sEwb1TsTNScKnUjGAXMYZCDV/oTe+F/JBhDsvdc
	md7Sxs1r5C+UyS8ZpmXZVRQXfES2RX4Hz1BMDYuFu0K/dvIJaThjqZ4UHPTjTRTW+U7M
	cLrpeToiidfDe/+/enYd4mT3/0SvB87xY/Cgctz6gvMD3F7zFVAcfk//HNS6H0Y4BU5+
	C8kA==
X-Gm-Message-State: AA6/9RmlESAohLiTEsv2hGR+qyn262Li3cqnJkM9pbDfNgQ9su2n4wVpZ2HsnDI8EumY79edEkFpO1ETQHdny5Vf
X-Received: by 10.31.210.130 with SMTP id j124mr1109039vkg.17.1476288675081;
	Wed, 12 Oct 2016 09:11:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 09:10:54 -0700 (PDT)
In-Reply-To: <1476286424-9744-1-git-send-email-thuth@redhat.com>
References: <1476286424-9744-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 17:10:54 +0100
Message-ID: <CAFEAcA9c0hRHNr-fvqUWhpqRLKLAfOzwf8By5Q7v-0twTcQ_Tg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/tpm/tpm_passthrough:
 Simplify if-statements a little bit
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
X-List-Received-Date: Wed, 12 Oct 2016 16:11:21 -0000

On 12 October 2016 at 16:33, Thomas Huth <thuth@redhat.com> wrote:
> The condition  '!A || (A && B)' is equivalent to '!A || B'
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

