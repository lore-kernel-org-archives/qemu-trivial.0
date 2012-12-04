Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tfx4r-0004M8-5a
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 13:18:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx4h-0004Gt-PG
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx4b-0003rE-5G
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:18:31 -0500
Received: from mail-da0-f45.google.com ([209.85.210.45]:38024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx4a-0003qt-W3
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:18:25 -0500
Received: by mail-da0-f45.google.com with SMTP id w4so1749023dam.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Dec 2012 10:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=qDpsQeGoEme9kziYa9FlVRHmuAGhxAyzUmItTG1/cl8=;
	b=EtBOawsQSb8MZQPhAoeuSLLOh9vI5oIFb7cGGQkMpJKcWKeEriT4goKyo7zKch3csG
	yeHSn2ceRjLV5oCCVbxYBdpez0JaS68MBHQ2LOMQRj2SEwX5kXtor5szvgVj1g3G0ovE
	xapFDjE+FKcmFGExa5rRu7Fo8CyN8o26ZjQ6rb+x58A3Al60qxDujELxWGwTz8WymHcV
	aT2hXC8L6eW4hIMbFPRgTnnfPSBUyft2x+fL/+HKPHedSCMsMxfcejYCtkPwDwZh/XpQ
	kLXXvzOfACwSYWv1koLlJmXcC9y33z8Ek1m+fccWj2mk67V56B69qeszbc9+NOQy7iyx
	KZeg==
MIME-Version: 1.0
Received: by 10.68.129.233 with SMTP id nz9mr40217775pbb.139.1354645104151;
	Tue, 04 Dec 2012 10:18:24 -0800 (PST)
Received: by 10.66.16.137 with HTTP; Tue, 4 Dec 2012 10:18:24 -0800 (PST)
In-Reply-To: <6e3d31ea164ba3e26312398c7382f247023654bb.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
	<6e3d31ea164ba3e26312398c7382f247023654bb.1354600680.git.peter.crosthwaite@xilinx.com>
Date: Tue, 4 Dec 2012 18:18:24 +0000
Message-ID: <CAFEAcA-0PLCrwu0ZMTpECJLz3vGCUJeyRa97oNNc+OebTJmLyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlwmbpN9sB5fiGUVY8woUzAEBYa+bZ/PKV8FS1ahUmNuk9fqUhY4HDzetvvtX43PiS4kKhV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 1/4] pflash_cfi01: qemu_log_mask
	"unimplemented" msg
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
X-List-Received-Date: Tue, 04 Dec 2012 18:18:40 -0000

On 4 December 2012 06:04, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> This printf is informing the user of unimplemented functionality. It should be
> re-directed to qemu_log(LOG_UNIMP, ...) accordingly.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'm going to assume this series will go through -trivial
rather than arm-devs.

-- PMM

