Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eALHh-0000NT-OW
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 15:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eALHf-0000Mf-JZ
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 15:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eALHe-00070C-U8
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 15:36:11 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:53556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eALHe-0006zv-Mn
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 15:36:10 -0400
Received: by mail-wm0-x244.google.com with SMTP id r196so1108446wmf.2
	for <qemu-trivial@nongnu.org>; Thu, 02 Nov 2017 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VGbN3zKSOiXTLnWJEb1pnoODoHxP7g+f7cUICIwmsP8=;
	b=iDOX2WWpcSf1KpNkIPEoe1YP02x5EcRDlNAPOrNavYSc4vHuONF9/l4SpXonZErccF
	bVogcPByyjl5rWafFcTu8SpM0Ju5uPQdPFPrVYxEd/7OkdxR+abxNLB2nDAgQ4J/VZ9J
	nC8vR1u5iE3O70xk2xBGHBHklJANRVoEkdX88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VGbN3zKSOiXTLnWJEb1pnoODoHxP7g+f7cUICIwmsP8=;
	b=MqXO+/2IJzx++5ZLUQa4bUoGfThS85KCL2s+oWyhscwVlwGwkV45npSSmK65JJuhzn
	XzxEVnGfFqhGS7VgfrbNrZmi9u8tDkhOsUSyKNJg5W6gt5QRP1uSZ41O4tazVxb8gUr9
	PCLUmDbUCnb3fmJVPz94L84RMH9BTWerHX4WpI7SAx6wwM+vRFo8FNzMFOSZ4AipzWwD
	dXcPFgylzVaoqv+Ig9kvbv6hHTDpFXQ3FNXzFZirXJZCQeg+t83X2LhOa15NaLxIcFzI
	kW9+PS3eWgHp3RbNXbPVaGS5C93TVLSKIYWPBKLjvt1bOp7tXAx9GR0TNRuQs3dz9UW3
	6zsA==
X-Gm-Message-State: AMCzsaVBMtKX4EhC+c7YzRK/t1bKFUmq9Mm21CXcfypJM2hOTHTS14GH
	yGbmbt3CJz0kap55zb5b7tF9XF+yCDo3iybjQaoHtA==
X-Google-Smtp-Source: ABhQp+TsYdG9LprPY9mdIReiSHyN1RdQ3wUB3kmSXADNwsMfspfVJpGNlYqfl+XszB+HWx+u8qc6HNZ+ZVHfGLYrmrg=
X-Received: by 10.28.46.136 with SMTP id u130mr2330654wmu.127.1509651369576;
	Thu, 02 Nov 2017 12:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 12:35:48 -0700 (PDT)
In-Reply-To: <2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
	<2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 19:35:48 +0000
Message-ID: <CAFEAcA-r-KxNDkHFJEdQDVnNXf4N-8zptjQK9a-uPixnSMsg+w@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Zach Riggle <zachriggle@gmail.com>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Thu, 02 Nov 2017 19:36:12 -0000

On 28 October 2017 at 06:14, Eric Blake <eblake@redhat.com> wrote:
> By definition, in linux-user, we ARE using glibc; therefore, you are
> free to use all GNU extensions.

Don't we also support musl libc? I forget...

thanks
-- PMM

