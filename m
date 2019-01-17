Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkASU-0000BK-Ez
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 11:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkASS-00009b-Ld
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkASL-0002VH-BQ
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:23:52 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkASK-0002NY-1Z
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:23:49 -0500
Received: by mail-ot1-x334.google.com with SMTP id s5so11616395oth.7
	for <qemu-trivial@nongnu.org>; Thu, 17 Jan 2019 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uR/O6HLu417PeAk/X4AuBpuYJUsBdJhrHhPZhbkaRKQ=;
	b=iux2fjVLPiq0FCUgXHx8ArUJJUQm1ibdiY3YbYZiOjj+GDowYc7PEtbFatOmyd2cEg
	DwNkN1DsqPcYT0tDBRhY3t/PG6vcNYeEYeyObFpblDslAkAbf1F+yarbX/gGYsqE/o6m
	z7Xopi3x3UroOVhW2TMXSn/Yh2c6nyoaydaPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uR/O6HLu417PeAk/X4AuBpuYJUsBdJhrHhPZhbkaRKQ=;
	b=rIQrARh7bYsWUFXjM7/jWyO6heZpRzDrjAxg/l5WDaj0QJ43Oa3J7n9YSmGy8xxQhW
	0Azx2rnCePmVuvd0yev/m7GEvelx89KyFqHusSm6eqe65MF1ByQ5mCwAAcA++3qFpsqE
	r4p+6G81ZqQ9CAk5hA4B/EXd3WxeNW8UElNACdyK/TTw9op+FR0rT2YB4zQ9mLZ+sehi
	g65GeeVrF4YMrZXwoof9lgiKpb432TwCfsYtW5BLcOQ1GduzghE4sJtqv1SVoQfMnVoa
	HY1RMRft8cqlxInceJi46d766PgYKLDq/arPVoeNvj452airI5VhunuwxMgS4GYxTVU0
	h7vg==
X-Gm-Message-State: AJcUukfOnnu6q0thynzktRp36VcK+kfZTo+asJ425OhoEqK5l9coazIX
	g17bBjPmWdHYcV4gDrBJpUgjjD8t4dic6qn/Hog1zg==
X-Google-Smtp-Source: ALg8bN7/0jyhFKeGEsVI7zl3mRj9R8E6k9mAL+DoKD7sR5mf1GccacydxIMS84/5/UV5aJqXL5z01gF0/wmyEONDP9Y=
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr8819491otn.352.1547742222596; 
	Thu, 17 Jan 2019 08:23:42 -0800 (PST)
MIME-Version: 1.0
References: <20190117161355.18204-1-philmd@redhat.com>
In-Reply-To: <20190117161355.18204-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jan 2019 16:23:30 +0000
Message-ID: <CAFEAcA84VVc399dv3HT7PYBCPA6CvyL8jp+MtytAEbTVK9QtNg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Fix utf-8
 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 16:23:57 -0000

On Thu, 17 Jan 2019 at 16:15, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Patch incorrectly applied as 15ffb43cbf4.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Paolo can this be a patchew bug?

Putting a suitable check into checkpatch would probably
be a good idea.

thanks
-- PMM

