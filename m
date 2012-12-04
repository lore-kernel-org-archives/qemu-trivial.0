Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tfx6G-00068W-CU
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 13:20:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx66-0005tp-NA
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx60-00047d-RN
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:19:58 -0500
Received: from mail-pa0-f45.google.com ([209.85.220.45]:43085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx60-00047R-Kv
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:19:52 -0500
Received: by mail-pa0-f45.google.com with SMTP id bg2so2730439pad.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Dec 2012 10:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=x7uOe6xXyPoXneB8zrdxrmFoZCxQC5kMw3nOCMQM7uo=;
	b=A4i5qPx1s1EMRmATsnj05IqgsihVyT6ZmZQeH7cEFFfhfi3r9l8u4/9pAjBz1szayp
	PqgCQXcRiUdnmv8WnXtXuH4LeV6bPl53Q6wqalCAlm5Vdmyqh4zh1/cS4DBri9IV6Ta6
	mwseCN9VIP6KMApVNe+3iJWu1cJB3+fcrDQcLkqT19ei110b+67lcxvpgxk3KQOEK7SR
	piWCJ+NUAQVaGIr9u5D28MZ6bRYeo+lcEoOxif9j0EAgUZdlmBV8dGFSKlXk99h0PkcW
	e1cArmy7C9c1TokPs7xTM+QgANNfP/A328n4YcKsFY5MISb3KK/ZAeA5ViI+Qfmcz23R
	mhtg==
MIME-Version: 1.0
Received: by 10.68.235.208 with SMTP id uo16mr40475308pbc.65.1354645191965;
	Tue, 04 Dec 2012 10:19:51 -0800 (PST)
Received: by 10.66.16.137 with HTTP; Tue, 4 Dec 2012 10:19:51 -0800 (PST)
In-Reply-To: <bf5f902df566826015586252b67754889111c27b.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
	<bf5f902df566826015586252b67754889111c27b.1354600680.git.peter.crosthwaite@xilinx.com>
Date: Tue, 4 Dec 2012 18:19:51 +0000
Message-ID: <CAFEAcA_TQX4n6hpcDOXXuUGdLRkZd5Qp+fuk2HhRgyiyZKOkyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkmAJ7Us1UQvNmmzBoeEbHK0UcHyku8gWjkIz8X66/UvXtbkwbkIsANgGraL34j1FB7eXbq
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 3/4] zynq_slcr: Compile time warning
	fixes.
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
X-List-Received-Date: Tue, 04 Dec 2012 18:20:07 -0000

On 4 December 2012 06:04, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> Few warnings when compiled with debug printfs enabled. Fixed all.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

