Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axObQ-00047V-S3
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 20:54:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axObJ-0003w3-FQ
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOb7-0006IF-VM
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:54:04 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axOb6-0006DB-Nx
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:53:57 -0400
Received: by mail-vk0-x230.google.com with SMTP id b189so5856677vkh.2
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 17:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8wIS/zvs6gCkyt+HmTBVieOiYAm9vtyNoNZhnA1N+Sk=;
	b=L4Dj6uovsKI0Z2ddNgjqZwPqp8M6u03j5N55w0UqZkCy2yjheZN5PgeaEyr7fqB5fk
	XEyIJXqSOcXGb29/QoGQ6zc52JAnCoyX90/zpgy34MgKbJS6uNV3jZI1s2Rl2ZfiBCmg
	EcDeM1R1NIf7hgoEJApUxhZtP/ItMUzSKpEe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8wIS/zvs6gCkyt+HmTBVieOiYAm9vtyNoNZhnA1N+Sk=;
	b=HG+x7QnTn/2CQOTqhbbDznj6G2+VF/5FlyiUyqgBO672hq0LeLDhbfExgcdV65HRoH
	wcJcs99e6nWokBlM5tbfIoLh5XCacxc2LMeJ7B+YZ+DKOP9xty3K5iRWAYY6ZXQ5kWPt
	DakkQVwop1dn3wg0g9Fjj+kKxV1W4yG6JW39kZfxOg0vzcoSSctQtZMaH31yATzgXJUc
	Kqrna0i6+qWFoIdcnen5NoeWrrUkBN4hz258moi+ctKjaOYVGC9J6J+RjN9rzX892xB7
	GZedz5HaNte20BtsN86xrYMAOGXGfLBHg5V98YHA4/NsCdOQoaWmhKOoxdvkS/N5Kswm
	wVHg==
X-Gm-Message-State: AOPr4FXBjoBJ4mPYqdHUzvDFgYz2Pla1jCk7ayVBbdf+wvnKMgE6a0oLPa/RA/qZqszVtJMAlpXqukiXehDzIOPj
X-Received: by 10.176.6.100 with SMTP id f91mr20375006uaf.38.1462236814626;
	Mon, 02 May 2016 17:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 17:53:15 -0700 (PDT)
In-Reply-To: <1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 01:53:15 +0100
Message-ID: <CAFEAcA-mDkoHwdz3+A7=pwSRNkPMCKgC6j0utHzQFs2VaqG6hA@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Use libtool instead of
 ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 00:54:15 -0000

On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>
> Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails
> to build for a few reasons.

I guess this is a new-in-ElCapitan thing? I run Yosemite, which is
fine.

thanks
-- PMM

