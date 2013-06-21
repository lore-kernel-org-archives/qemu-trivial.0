Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq31u-00042P-8D
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 11:13:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uq31r-00041k-9i
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 11:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uq31q-0001ND-0k
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 11:13:35 -0400
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c]:41220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uq31p-0001N3-Pz
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 11:13:33 -0400
Received: by mail-la0-f44.google.com with SMTP id er20so7441493lab.3
	for <qemu-trivial@nongnu.org>; Fri, 21 Jun 2013 08:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kSjKsQzsegzD3eh7BCyfTIL8RTp3zS3LaxuwXtiIYd4=;
	b=VvKPd4zShNS+FLLp3wdQ6H2DftKj9sPFDzrq+exaoJFOmntV5fWBu8WcL484Y2aIdY
	ZzPxIp3Wh08ldnK/gWgcMczvJvnobS5I0f8SbpvrT+MAjTM31gHqtCxtigd4t7+1gjUk
	Jzf2WIHr9RgvBcpHsK27+dThGzh6XpkZUI1EOGdcUTqiKxwEEc8qMVaWJJmLU4vsx3/e
	cn5+TQwYnfBnSj5oWgCYgwV1Sn0oJXY7YwY3peT+kVjOOCaQUvmfUX0BBSq4mkBgm476
	QlGHW11tm9XvWS3myTIfJOhazExmoQjyHgFhnGgDehzkWCGlqu1edfSQMMyIGVmu7/D8
	vtkg==
X-Received: by 10.112.144.34 with SMTP id sj2mr2915006lbb.10.1371827612229;
	Fri, 21 Jun 2013 08:13:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Fri, 21 Jun 2013 08:13:12 -0700 (PDT)
In-Reply-To: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
References: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2013 16:13:12 +0100
Message-ID: <CAFEAcA9gHFn2_2RHizhHWUzN+B_GvJz_M+H6wbWibL9WfdWV0Q@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlca0QtTK4c3FySdGUSa5JxqmDF49r7yMZy1XOEjdH/CVvcDjvFvF0N92kfF8cAyWGkq4iD
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22c
Cc: qemu-trivial@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add
 signed*signed check to [u]int128_t test
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
X-List-Received-Date: Fri, 21 Jun 2013 15:13:37 -0000

On 21 June 2013 14:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> clang 3.8 with -fsanitize=undefined will fail to link code containing an
> int128_t * int128_t multiply (http://llvm.org/bugs/show_bug.cgi?id=16404)
> so add this to our configure test for whether [u]int128_t are usable.

I meant "clang 3.3" here -- can this be fixed when the patch
is committed to -trivial or do you want a respin?

thanks
-- PMM

