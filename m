Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W352S-0004vQ-2J
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 09:32:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>) id 1W34JO-0006oV-CB
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 08:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>) id 1W34JL-0005uf-HK
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 08:45:46 -0500
Received: from mail-qa0-x236.google.com ([2607:f8b0:400d:c00::236]:53838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>)
	id 1W34JH-0005tL-KE; Tue, 14 Jan 2014 08:45:39 -0500
Received: by mail-qa0-f54.google.com with SMTP id i13so2734353qae.41
	for <multiple recipients>; Tue, 14 Jan 2014 05:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w5fOnyj23vclBT71rkMOICAvcUkfiNsaO61xrVrBoVY=;
	b=xQx6O/9kAZ/YcIdXEMPFjYBbQIc+pvZr3IkVHCCkcBQPxF03DuUR10yrgxZ+UQWi3s
	vqVI02trRTWGSiVrads0IKDpTm+D/sTVKBsVIUl36K8liUgUVnbqlUzzMvCM2WP8u7yk
	dEHG04lVwdR2+yb0w0kZVKQYuokpHc2DYqwT6AAj4cusMnGFaDnenTtJCb3XB/RSrlEW
	KfuJsguRGmvfCw9r9/tCyndWeeltgDIDbUlFvgOUBQh3k0YCRJKdi3PSzDWHXiCSsK0L
	rEXYGD6cOrUkR9oWUzjIGKiqy76sXfa9UF+/0q8Izfpd9uDS2Sy74T/EtL4A0l4vxpXk
	DJvw==
X-Received: by 10.224.20.9 with SMTP id d9mr2924330qab.100.1389707138957; Tue,
	14 Jan 2014 05:45:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.236.16 with HTTP; Tue, 14 Jan 2014 05:45:18 -0800 (PST)
In-Reply-To: <CAFEAcA_W7MXEPT7p8M0oqPkHsBe4ZZKcmS5B-r6L1Z-NABUHAw@mail.gmail.com>
References: <1386322527-23148-1-git-send-email-kraxel@redhat.com>
	<1386322527-23148-9-git-send-email-kraxel@redhat.com>
	<20131209233334.GC27737@otherpad.lan.raisama.net>
	<CAFEAcA_W7MXEPT7p8M0oqPkHsBe4ZZKcmS5B-r6L1Z-NABUHAw@mail.gmail.com>
From: William Dauchy <wdauchy@gmail.com>
Date: Tue, 14 Jan 2014 14:45:18 +0100
Message-ID: <CAJ75kXYr4Vbq1C0tA+xOvm=815iYjCm-2eNdx=XaD8=tDbc8sw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::236
X-Mailman-Approved-At: Tue, 14 Jan 2014 09:32:18 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add bios-256k.bin to BLOBS
	on Makefile
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
X-List-Received-Date: Tue, 14 Jan 2014 13:45:47 -0000

On Mon, Jan 6, 2014 at 2:13 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping -- who's going to take this patch? Maybe it should
> go via -trivial?

+1 still waiting for this merge

-- 
William

