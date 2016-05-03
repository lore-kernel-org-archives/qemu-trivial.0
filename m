Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axP8l-0002vT-OV
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 21:28:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axP8e-0002i7-8h
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axP8O-0005EP-TU
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:28:30 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axP8N-0005Aa-Mt
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:28:20 -0400
Received: by mail-vk0-x22f.google.com with SMTP id c189so6488733vkb.3
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lPxfzfJT1zjTVJZ9wmpbAS0HIpjpSux8z0AKZSGd084=;
	b=jH0V75dIPZS9EabtodVJzVSU/agJ5sNuw+uaDtl2h+4CCA5TZBvMmS67tHJYwJI/BX
	RNDlCieM6PbOmOSdFoTkxsyFtRXmvQYhOSoG1lhEPePGdFeZK9i7+zVwZKLCTjPbYhzy
	WEjqD18tHhn1YgHLpAc3BvyGo08k9avLTvJa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lPxfzfJT1zjTVJZ9wmpbAS0HIpjpSux8z0AKZSGd084=;
	b=gX+rS3/0qDIIg+BNb8WrJBLkvDGFZvzXHFG3I9jLXZOimmi/1x4qHS4uRMQT8zu7We
	j+aOmEIkfdAgXnJQQ0/hb9ACCN2giBZsKlfYsiEREsVdbMGj4yscv+URt7zFldkrKRXq
	RCdvCj81AC0VAvdjQgoQ8phoarYz6CYvfYYCyNWRVBet+S4uiU6TWuuDWmSe54eJRdI6
	zmClZ/w8iRUrCgP69HdmUrER3JVWnV3AYyzzgsIJ2TZrfuBJXbNwEr7WZWbHRRHVV/zV
	BHZEqPz4M5KVNqEL5lKTKFoT1yYOoRRE0rRivC7t2qpRf84zEWigz4xsAKJqkhxf5BX1
	2cjg==
X-Gm-Message-State: AOPr4FUXUINbiJ/gbq6DKW77PjQ/oP+MhnDBqTvYjn6K5/kGhgPrAipTAkEE62WIcu5qj+ptORWqbGAZW+fQMl5t
X-Received: by 10.176.68.162 with SMTP id n31mr22215913uan.26.1462238877710;
	Mon, 02 May 2016 18:27:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 18:27:38 -0700 (PDT)
In-Reply-To: <CAF4BF-RzconSOm++Ey79FO2wm2JSK=PYV5UNnnjZvEyOkf3tgA@mail.gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-3-git-send-email-chrisfriedt@gmail.com>
	<CAFEAcA8TjtF=+DY=kDRvK205VGuVPmc3AumvF8QiS0rqX1RiGA@mail.gmail.com>
	<CAF4BF-RUvQyy2RJ+=+9mBM-k81Hgixpu2_0r9X1o=fAiVi4f_w@mail.gmail.com>
	<CAFEAcA_kViE8oaiPE9SNGSXBRo4vocKuZXQuruyRULrjy9id4A@mail.gmail.com>
	<CAF4BF-RzconSOm++Ey79FO2wm2JSK=PYV5UNnnjZvEyOkf3tgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 02:27:38 +0100
Message-ID: <CAFEAcA811Utp-C1SMA+TfXEJ7TPc8oL0hsVq0BjNo98DhX76Gg@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, G 3 <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Remove unnecessary
 CONFIG_EVENTFD preprocessor conditional to satisfy link
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
X-List-Received-Date: Tue, 03 May 2016 01:28:42 -0000

On 3 May 2016 at 02:25, Christopher Friedt <chrisfriedt@gmail.com> wrote:
> Ack - too late! I manually removed all of the *-softmmu/ directories
> after doing a make clean, because they were still hanging around.
> Rebuilding worked fine without PATCH 2/2.

Oh well. If blowing away the build dirs fixed it then it seems
pretty likely that the makefile bug is what you were running into.

thanks
-- PMM

