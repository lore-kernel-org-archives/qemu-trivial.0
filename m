Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tfx5M-00053l-Fy
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 13:19:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx5H-000522-L7
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx5G-0003yX-39
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:19:07 -0500
Received: from mail-da0-f45.google.com ([209.85.210.45]:38207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx5F-0003y9-TJ
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:19:06 -0500
Received: by mail-da0-f45.google.com with SMTP id w4so1749228dam.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Dec 2012 10:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=VE1Y4xDODo/QL2uuKfeb+8jceM93uATZukyBlV30G5o=;
	b=mxtrSX+9RzUJaDVGPKPLICyfM+F3ryDCBw1qjIm2im42g90GCF6Y2475J33GV5Z0t0
	Yfj/ba2ELLz/4eouRJsaztxUNWqOPjKDWXMisW0nAm0nCdqKxiTOwaDnQS5IJceH/pRW
	TQfVH32pr8QmnxdZ5EVF75kco+WzulNUNIbK4+t5UqYavmxMPVh0B3zy4+5Ms71sNZlV
	WGiNMRtN44N+RK4KZGLxxxzYv7XWih5aBfBlNUWrGPc8Y/8hkEynvNNa34cMzIMtR1rI
	oJRykstZclcYXJ0h74f4+4WNo+cJT9EZGrKqCQIFWpzEORWgMWJlJU6HTBS3HNykDe87
	HPNQ==
MIME-Version: 1.0
Received: by 10.69.0.10 with SMTP id au10mr41313657pbd.18.1354645145327; Tue,
	04 Dec 2012 10:19:05 -0800 (PST)
Received: by 10.66.16.137 with HTTP; Tue, 4 Dec 2012 10:19:05 -0800 (PST)
In-Reply-To: <1406c119ace82fb9e443122c8a99ae278bd373dc.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
	<1406c119ace82fb9e443122c8a99ae278bd373dc.1354600680.git.peter.crosthwaite@xilinx.com>
Date: Tue, 4 Dec 2012 18:19:05 +0000
Message-ID: <CAFEAcA_L4OtjRC5dxE--i98GQhz0sxDOAGXHhZXKJoMmsMcgUQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl83PTfScW30Bp2vMZWSn5ODCf092K43gJZT1XFG5b2a+R+ymYX66jEM0KGOMhvVvqrxBJr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 2/4] pflash_cfi0x: Send debug messages
	to stderr
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
X-List-Received-Date: Tue, 04 Dec 2012 18:19:11 -0000

On 4 December 2012 06:04, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> These debug info messages should go to stderr rather than stdout.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

