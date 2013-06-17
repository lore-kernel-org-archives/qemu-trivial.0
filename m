Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8G-00021b-IG
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UoiZA-0002Me-UP
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 19:10:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UoiZA-0000o0-5j
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 19:10:28 -0400
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e]:48176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UoiZ9-0000ns-VB
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 19:10:28 -0400
Received: by mail-la0-f46.google.com with SMTP id eg20so2982221lab.19
	for <qemu-trivial@nongnu.org>; Mon, 17 Jun 2013 16:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=w6mWx17t6s8bmq7oKt0CLO0wpkp+b/7fAegJeIirSCY=;
	b=FYjD1BG2mgLaGIdOhHZ3CAP/v5X74/qQwopQmGQxNyZ5Ge6Zt3///elaTg1qKbcOOn
	ntKesqSFNWh4Wrt80LBWUDla3ddG4/ZvQGJiXxSdn7jlDK1k5havxuHQgdRJwIufnH4C
	Z+TjII/t194v5H+W8rS5IU/gM6fDX9qhT47e+o+Hcw1zAu1yHsc3jmb8pUBxhj1t1N+t
	Dmry+E5B7VyZJhyH71E6v4ON9mh1OT0Wk6puRx9Ped4NM60oAsrxcO2ZJmu7C5Wgqzjb
	fAhf+gYZffJLkkoI9Jf+/2+Tg09dTYvC42U0BoFZeBnPhOXQ7MJZnD6jsBWDUCQA+nGM
	txjQ==
X-Received: by 10.152.22.232 with SMTP id h8mr4635935laf.37.1371510626947;
	Mon, 17 Jun 2013 16:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Mon, 17 Jun 2013 16:10:06 -0700 (PDT)
In-Reply-To: <1371510546-28585-1-git-send-email-afaerber@suse.de>
References: <1371510546-28585-1-git-send-email-afaerber@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2013 00:10:06 +0100
Message-ID: <CAFEAcA9DdczMS-skHxVdUOO4F3KkLeF7pMqxjuQGhrKnBgBg=A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkAdgATtr1KuUyO1e8TTm4Qrc1fuCLsJjFvnPn6fEkxur2EZWTb+rH/ml2o13QLx2DX1my2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22e
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:10 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix "ERROR: ERROR: " for
	missing/incompatible DTC
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
X-List-Received-Date: Mon, 17 Jun 2013 23:10:30 -0000

On 18 June 2013 00:09, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> error_exit already prepends "ERROR: ", so no need to print it manually.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

