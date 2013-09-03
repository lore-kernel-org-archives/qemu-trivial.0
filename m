Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGmIG-0000HJ-Aj
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 04:49:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmI9-0000EZ-5r
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmI3-0006OP-RE
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:48:53 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmI3-0006O8-Ju
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 04:48:47 -0400
Received: by mail-lb0-f172.google.com with SMTP id x18so4778158lbi.3
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 01:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Qe73eBSVOpxVDFNW2yaaSPwKfCkTkj+xPtv+OzEmza8=;
	b=XZ5EZtQC+wgeQbTw/yNpLlUfdw22tmB8roNza7peAEe4QB7izCsflRdpVI+D3gz86g
	xxUv8M8gfdK5rahlbxXQkgW7JZf3dvQeR3UnVxUyeQwhysQ8kjwfIzwrUrVfYO04/Zjy
	wb4cNEMdohNWKbQ2CYuTK2ku3OQS0LmZyH6SFcWflbICCxLNPKjRymi35jTO9o/p2jAa
	awpSM86/7OukBlzsec1PicTe8Hf7NiwPnqdrsJGgQGv2ye/yk/L/N0tgaCyAzTKLbRYy
	6+sfdyYX5EG1sXOEdXfSEFe4KFG0EbEKMTQWSFFqB+OJ/mlIK9kzUDWPU7cSnunJJZ+8
	W9fg==
X-Gm-Message-State: ALoCoQkt4tbG95uTLjRYMBfKk4JwDBCcWZ8Nu2GAyXbyHayaztUXhoGftokKL4a0Npup+Et09DdO
X-Received: by 10.152.228.130 with SMTP id si2mr1025063lac.32.1378198125796;
	Tue, 03 Sep 2013 01:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 3 Sep 2013 01:48:25 -0700 (PDT)
In-Reply-To: <52259F6E.3000205@suse.de>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2013 09:48:25 +0100
Message-ID: <CAFEAcA-oVhBNN3UkKHf2OogGwkUdqrJQBk51r+MDguxAFRGjyQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Tue, 03 Sep 2013 08:48:58 -0000

On 3 September 2013 09:35, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> I also don't understand why qemu-trivial is suddenly picking up Stefan's
> arm translation patch, it used to be for unmaintained areas only. But
> arm is not my problem.

Yeah, I wasn't expecting that either. But I'd reviewed it and it
wasn't a big change that was likely to conflict with anything else
in my queue, so I didn't feel like making a fuss about it.

-- PMM

