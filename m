Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TE1Kj-00088e-GJ
	for mharc-qemu-trivial@gnu.org; Tue, 18 Sep 2012 13:11:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TE1Kd-00085N-1k
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 13:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TE1Kc-0007lY-15
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 13:11:30 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:50042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TE1Kb-0007lN-Qh
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 13:11:29 -0400
Received: by pbbrp12 with SMTP id rp12so432093pbb.4
	for <qemu-trivial@nongnu.org>; Tue, 18 Sep 2012 10:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=GCJqQ+ZEajObwWFMkZbMWerbxANzi2M/DHg92cAa5zM=;
	b=a+QgDLGnxl7urH1wIgr7w3MoLACkhs1ZipVz8EHx7XAbQ0dqOSrHtu8aV1uD3owxfE
	4lS9hqvFtjGAMkzRtFCFWDK7jGwJMhKOPHGmU+6s+hJf9rUQk/DktOo3uncZve02jRo+
	fnEizmvS6pHPnv7r/fcwBzHQAX7NTw7aBhSZoNRUK5OMh1JhTp9tkNO6HogoB6w1LqYc
	imsOC+FuPF7KwjFR81z0vWiIp4GnrlaosjQr7QYY6LgOFme4pA6kNlDn085WSH1pEIad
	hoJmKxwjD05EHvdFOneldAnJJ+P8MAqaHUyo4X4W3srIX7o9ZqHumCasmkm/eZHgvn1k
	JZ/A==
MIME-Version: 1.0
Received: by 10.68.138.163 with SMTP id qr3mr560508pbb.161.1347988289008; Tue,
	18 Sep 2012 10:11:29 -0700 (PDT)
Received: by 10.66.88.66 with HTTP; Tue, 18 Sep 2012 10:11:28 -0700 (PDT)
In-Reply-To: <5058A6ED.4040902@weilnetz.de>
References: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
	<5058A6ED.4040902@weilnetz.de>
Date: Tue, 18 Sep 2012 18:11:28 +0100
Message-ID: <CAFEAcA_EoxhN7VPJ9kCP=-E=DHa1=kRUkM07g4Rb__LJqq5Ggg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnwAvRkz2s82um77XhfBvS9TLiI7FAO1ShyJKGLtacRw2l2B/7n9C8i7gGKrmtcg6K4mue3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pflash_cfi0[12]: Use
	host-utils.h ctz32()
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
X-List-Received-Date: Tue, 18 Sep 2012 17:11:35 -0000

On 18 September 2012 17:53, Stefan Weil <sw@weilnetz.de> wrote:
> What about moving the ctz32 function (or even all of host-utils.h) to
> bitops.h?

I guess that would make some sense, though I'm not generally
a huge fan of shuffling code around.

(bitops.h and host-utils.h are not under the same license terms,
which might complicate things slightly.)

-- PMM

