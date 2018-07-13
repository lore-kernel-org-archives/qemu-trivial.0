Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdvSs-0006KX-6u
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jul 2018 06:38:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdvSp-0006I4-88
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 06:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdvSo-00071G-9Q
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 06:38:15 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdvSo-00070n-3Y
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 06:38:14 -0400
Received: by mail-oi0-x242.google.com with SMTP id s198-v6so61376908oih.11
	for <qemu-trivial@nongnu.org>; Fri, 13 Jul 2018 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bx5oBCDuo9d20WhCrgH1rX4pOxyhcrGjxr0DNZL9sLQ=;
	b=CJCyXbiiK6l9HePnSYcQuscQf7TqZ1SBgwXbD8sIadLiSjdXPMHze5FZ+JPqQmdR4Q
	ojV24PlE7eanKYuXsEUkkx6wMEtpFh+kP7JwQb6xNbKSugc/JahGwlpmJ0cUwRYaE+Rk
	QemXYPgK6dx8XhzNSKKeluZByfkI/+C+5965U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bx5oBCDuo9d20WhCrgH1rX4pOxyhcrGjxr0DNZL9sLQ=;
	b=MJGAYlunjTyDIgdvRN34tY5vWUIU7m02/oOuYtzUrh/FoCJ00tfrZU5Jfx63R1trjk
	0jTnq0t7QZMTuQYW20N9q3NmgH9ZdujGdcC8BdYKfgmQeCsThmnwbgkQeXTyD6w0XsJP
	Gw1Z6zfETb6G926Avhj2rlHoI7gJGrtXzQhJaho46khezFxOR9CiVB1R4B8tYH6/vw4I
	qaOVXqzEErQxRm0HXKkTKE/Ai5AnGYt5K7Ep+mL46U/qHuYaawjeXpEzqn9HYJtK38Aq
	d5LWG969is8wwXbUqfEm1eKBZdNQBLo1swcBP5DZykuavxyObufOu5Cs6Rk6BSuGMd8n
	S2MA==
X-Gm-Message-State: AOUpUlHkScRRnOnIquB7EYaq8GF1V2lxs4x9m1UAEWXNUqCQGJQAf/JW
	/TRtRIbD+RQ0kI8sRU+Y/uxj+I0KQyC/RSPZsfD+CVSe
X-Google-Smtp-Source: AAOMgpdc4WVIoNUYCJurKytFOFwrtdsHw9S7v+VvQ6C8n9Zl8DwIdn8hsDR/0eOAKMrW26kBElnLA5cGsVv2JyeZh24=
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr5824658oia.164.1531478293393; 
	Fri, 13 Jul 2018 03:38:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 03:37:52
	-0700 (PDT)
In-Reply-To: <CAFEAcA-D_Kw33EeMrCg4k=B0yLB8U_X92OC09BQ1JKH4UiYUNQ@mail.gmail.com>
References: <20180712200152.28569-1-sw@weilnetz.de>
	<CAFEAcA-D_Kw33EeMrCg4k=B0yLB8U_X92OC09BQ1JKH4UiYUNQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jul 2018 11:37:52 +0100
Message-ID: <CAFEAcA8eEMH6dT_+w+u9woFr9oovFA3NuU4L475qFQ=O2q1kfQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix some typos (most
 found by codespell)
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
X-List-Received-Date: Fri, 13 Jul 2018 10:38:16 -0000

On 12 July 2018 at 21:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 July 2018 at 21:01, Stefan Weil <sw@weilnetz.de> wrote:
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  docs/COLO-FT.txt                     | 2 +-
>>  docs/config/mach-virt-graphical.cfg  | 2 +-
>>  docs/config/mach-virt-serial.cfg     | 2 +-
>>  docs/config/q35-emulated.cfg         | 2 +-
>>  docs/config/q35-virtio-graphical.cfg | 2 +-
>>  docs/config/q35-virtio-serial.cfg    | 2 +-
>>  docs/interop/vhost-user.txt          | 4 ++--
>>  docs/replay.txt                      | 2 +-
>>  docs/specs/tpm.txt                   | 2 +-
>>  9 files changed, 10 insertions(+), 10 deletions(-)
>
> Hi. A bunch of these are fixed by this patch posted last month
> https://patchwork.kernel.org/patch/10459487/

I've now applied that patch to master, so if you rebase this
I think the remaining changes left in this patch will be

docs/COLO-FT.txt                     | 2 +-
docs/interop/vhost-user.txt          | 4 ++--
docs/replay.txt                      | 2 +-

thanks
-- PMM

