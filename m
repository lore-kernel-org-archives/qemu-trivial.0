Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIdMR-0006qX-57
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 09:22:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIdMN-0006jk-02
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 09:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIdMM-0003TF-5Q
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 09:22:14 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aIdML-0003T1-VP
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 09:22:14 -0500
Received: by mail-vk0-x232.google.com with SMTP id i129so86619946vkb.0
	for <qemu-trivial@nongnu.org>; Mon, 11 Jan 2016 06:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l6zAX3m9fv298diI77rPErpEeQAQS6P/izegRVmOWvo=;
	b=KdZBzFkMcbIC7Sh8Zka8FUkOiMz06Se+UzfriE2a6nMGYWVegCYbJEoSfxKAZJ6cVS
	OUIwbAhTqIzk1BkAlgEmY7CZSutsXc6v6wfkSH05PaCQpaCzC9HmOUxetgVh5bt2UUgP
	mEuimZeHUJmae9h1M7RVddGlT8UumpEN74bVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l6zAX3m9fv298diI77rPErpEeQAQS6P/izegRVmOWvo=;
	b=M4IU6h8GzJW4E7kdU/93tfoy0kWDXzIkmQdX9bdTdmFv3+edamZuidikbp0/UOr6TK
	K2WE+B+eqR3aMXgkYv8TGoKA5G5acjA8j/JRrH2uaAj0o0F3ir+HqZrb9fNhVWbdT808
	L6cO1gzvnj8DUDJyt30RfhPLGF8j+36868R1MndnwN/l1wEjI8bb5hA3cQSDvUzIofGV
	02gQKeHoQltR4dcLlp+77UPimI7dQSeUsdiDI6bDmv0kqacn7GWu+qa4kB26De5oOAuP
	4WREiV7JtZ3cErO8zW3dkxVrFP+AfRGlHOVRf9lOuHpC1pnp5GPGAsE5NcLN5aKn6BPA
	jWgw==
X-Gm-Message-State: ALoCoQmNSCf0Ahj/IU2/l5DRlvPWje5rD6ldpRWIExYMbyplfVmchTubArTH//NutOemB2xf2Ed+JNwSf9wOlUzK2bfebp5y0ygOmeaoJV0rtvHZKTUqc5U=
X-Received: by 10.31.180.145 with SMTP id d139mr79154791vkf.83.1452522133675; 
	Mon, 11 Jan 2016 06:22:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 11 Jan 2016 06:21:54 -0800 (PST)
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2016 14:21:54 +0000
Message-ID: <CAFEAcA8S6Xb7baXOw3rRK4Q7KhBcCwdVdvJLABujNVBdcQdZ=w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/19] Trivial patches for
	2016-01-11
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
X-List-Received-Date: Mon, 11 Jan 2016 14:22:16 -0000

On 11 January 2016 at 08:41, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is the first trivial-patches pull request for 2016 year, and
> the first one for qemu 2.6 series.  With some old stuff in there,
> collecting missing patches since Nov-2015.
>
> There's nothing exciting in there, except of a possible fun patch
> enabling sigaltstack syscall.
>
> Please consider applying/pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 6bb9ead762bf749af11ea225fc2a74db1b93c105:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-ui-20160108-1' into staging (2016-01-08 12:50:19 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-01-11
>
> for you to fetch changes up to fe02fc5209d497d011b2b4b09395e2503d9dedc6:
>
>   hw/s390x: Remove superfluous return statements (2016-01-11 11:39:28 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-01-11
>

Applied, thanks.

-- PMM

