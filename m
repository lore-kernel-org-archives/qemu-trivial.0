Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8vt4-0004DG-Ic
	for mharc-qemu-trivial@gnu.org; Sat, 17 Mar 2012 11:49:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8vt1-00048r-MW
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 11:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8vsy-0006JW-Eh
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 11:49:43 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:46065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8vsy-0006J6-AC
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 11:49:40 -0400
Received: by iafj26 with SMTP id j26so7933296iaf.4
	for <qemu-trivial@nongnu.org>; Sat, 17 Mar 2012 08:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=fe/5yisOD8ujxAehtXgxaPP08jyCu4diFpcsSiNqAhw=;
	b=ByyA9ITJX25bx1gqH+oPdYeSn+OzLtbIZeKno8bKhKum37SEeV126TBn49+auldZq9
	bJBU/fIcZCKGo/aW5BUdv61MxZ0VSTxOz7Cllc2Vo2JAq9D8UGuhIxRx9s9NFv10VHB7
	qwWp8FcvOjG/afpDqvNaeqCCrch366ZlQDzn9FaqM1XLd+nhzw/5KlTzL8CVF7ABH4tl
	sSyScj4tGdBuKYhZP5PPLJF89JXvZdsZkAw4Cs1XbEIh7IZ+pZHq5A/fc348ekKxun0y
	hp7f+8NkljEMtf+ar4NTz5N0/MypeM5dCYVkeCTsH2mGzFnPdlGLN/xlVGiXX33nimdQ
	WMOw==
MIME-Version: 1.0
Received: by 10.42.131.10 with SMTP id x10mr3670944ics.17.1331999378167; Sat,
	17 Mar 2012 08:49:38 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Sat, 17 Mar 2012 08:49:38 -0700 (PDT)
In-Reply-To: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
References: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
Date: Sat, 17 Mar 2012 15:49:38 +0000
Message-ID: <CAFEAcA89CWS=+N1JPXo=o-sR9sAxBg4X+AZGb47UdzdWCTjy2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmucKYMkKecrwbp5FXyFFIoEp9qUouTO5ixr8Y4WSHAS5zlXYOy/Y0b6LwRIpf7icgKXW2R
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Fix creation of
 symbolic links for MinGW toolchain
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
X-List-Received-Date: Sat, 17 Mar 2012 15:49:45 -0000

On 17 March 2012 15:31, Stefan Weil <sw@weilnetz.de> wrote:
> Macro symlink is also used with directories. To remove them on w32
> hosts, a recursive rm is needed.

Where do we symlink directories? (I exclude the setting up
of the linux headers because that will only happen on Linux
hosts where we know we have working symlinks.)

-- PMM

